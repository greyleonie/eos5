<%@page language="java" contentType="text/xml; charset=GBK"%><%@page import="java.util.*,org.w3c.dom.*,com.primeton.tp.web.driver.webdriver.*,com.primeton.tp.common.crypto.EOSCipherTool,com.primeton.tp.common.xml.XmlUtil,com.primeton.tp.core.api.BizServiceCallerFactory,com.primeton.tp.core.bizservice.*,com.primeton.tp.core.prservice.context.*"%><%!
	public static Document getRequestDom(HttpServletRequest req) throws Exception {
		RequestContext reqContext = new RequestContext();
		Element data = reqContext.getDocument().createElement("data");
		reqContext.getDocument().getDocumentElement().appendChild(data);
		Enumeration names = req.getParameterNames();
		do
		{
			if (!names.hasMoreElements())
				break;
			String name = (String)names.nextElement();
			if (name != null && !"".equals(name) && !name.equalsIgnoreCase("Submit") && !name.equalsIgnoreCase("bizAction"))
			{
				String values[] = req.getParameterValues(name);
				int index;
				if ((index = name.indexOf("hciPasswordType")) >= 0)
				{
					EOSCipherTool cipher = new EOSCipherTool();
					name = name.substring("hciPasswordType".length() + index);
					values[0] = cipher.encrypt(values[0]);
				}
				if (values.length == 0)
					reqContext.setEntityValue2(name, "");
				else
				if (values.length <= 1)
					reqContext.setEntityValue2(name, values[0]);
				else
					reqContext.setEntityValues(name, values);
			}
		} while (true);
		return reqContext.getDocument();

	}
%><%

	request.setCharacterEncoding("UTF-8");
	boolean flag = SessionChecker.isValid(request.getSession());
	if (!flag)
	{
		String s = SessionChecker.getTimeoutPage();
		out.print("<root><data><return><code>-99001</code><message>用户未登陆或连接超时!</message></return><timeoutPage>" + s + "</timeoutPage></data></root>");
		return;
	}

	String bizAction = request.getParameter("bizAction");

//	入参检验
	if ((bizAction == null) || (bizAction.length() < 1)) {
		out.println("<root><data><return><code>-99005</code><message>业务逻辑名称错误！</message></return></data></root>");
		return;
	}
	bizAction = bizAction.trim();
	int f1 =0;
	if ((f1 = bizAction.indexOf(".")) == -1) {
		out.println("<root><data><return><code>-99005</code><message>业务逻辑名称错误！</message></return></data></root>");
		return;	
	}
//	包名
	String pkgName = bizAction.substring(0,f1);
	if ((pkgName == null) || (pkgName.trim().length() < 1)) {
		out.println("<root><data><return><code>-99005</code><message>业务逻辑名称错误！</message></return></data></root>");
		return;
	}
	pkgName = pkgName.trim();
//	业务逻辑名
	String bizName = bizAction.substring(f1+1,bizAction.length());
	if ((bizName == null) || (bizName.trim().length() < 1)) {
		out.println("<root><data><return><code>-99005</code><message>业务逻辑名称错误！</message></return></data></root>");
		return;
	}
	bizName = bizName.trim();

//	创建一个调用逻辑代理的实例
	ProcessCaller processCaller = null;
	try {
		processCaller = (ProcessCaller)BizServiceCallerFactory.newInstance(pkgName,"0");//参数为"包名"和"UNITID"
	} catch (Exception e) {
		out.println("<root><data><return><code>-99004</code><message>实例化调用逻辑代理时失败！</message></return></data></root>");
		return;
	}
	
	String inputType = request.getParameter("bizActionInputDataType");
	Document inDom = null;
	if (inputType != null && inputType.equalsIgnoreCase("xml")) {
		String values[] = request.getParameterValues("bizActionInputData");
		String xmlString = "<?xml version=\"1.0\" encoding=\"GBK\"?><root><data/></root>";
		if (values != null && !values[0].equals("")) {
			xmlString = "<?xml version=\"1.0\" encoding=\"GBK\"?>" + values[0];
		}
		try {
			inDom = XmlUtil.parseString(xmlString);
		} catch (Exception e) {
			e.printStackTrace();
			out.print("<root><data><return><code>-99003</code><message>输入参数不符合XML结构</message></return></data></root>");
			return;
		}
	}else {
		try {
			RequestContext reqContext = (RequestContext)request.getAttribute("reqContext");
			if (reqContext == null)
				inDom = getRequestDom(request);
			else
				inDom = reqContext.getDocument();
		} catch (Exception e) {
			e.printStackTrace();
			out.print("<root><data><return><code>-99003</code><message>输入参数不符合XML规范，无法产生Document</message></return></data></root>");
			return;
		}
	}
	SessionContext sessioncontext = (SessionContext)request.getSession().getAttribute("sessionContext");
	Node node = sessioncontext.getSessionEntity();
	try {
		XmlUtil.removeNode(inDom.getDocumentElement(), "/root/data/SessionEntity");
	} catch (Exception e) {
		e.printStackTrace();
		out.print("<root><data><return><code>-99003</code><message>输入参数不符合XML规范，无法产生Document</message></return></data></root>");
		return;
	}
	Node node1 = inDom.getElementsByTagName("data").item(0);
	Node node2 = inDom.importNode(node.cloneNode(true), true);
	node1.appendChild(node2);
	
//	System.out.println(bizAction);
//	System.out.println(XmlUtil.node2String(inDom));
	try {
		Document doc = processCaller.implement(bizName,inDom);//参数为"业务逻辑名"和"Dom格式的输入参数"
		Element retCode = doc.createElement("retCode");
		XmlUtil.setNodeValue(retCode, "1");
		doc.getDocumentElement().appendChild(retCode);
		out.println( XmlUtil.node2String(doc));
	} catch (Exception ex) {
		ex.printStackTrace();
		out.println("<root><data><return><code>-99002</code><message>调用逻辑" + bizAction + "时失败！可能该逻辑代码不正确，请先调试该逻辑。</message></return></data></root>");
	} finally {
		inDom = null;
	}
%>