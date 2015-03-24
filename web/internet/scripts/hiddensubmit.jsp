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
		out.print("<root><data><return><code>-99001</code><message>�û�δ��½�����ӳ�ʱ!</message></return><timeoutPage>" + s + "</timeoutPage></data></root>");
		return;
	}

	String bizAction = request.getParameter("bizAction");

//	��μ���
	if ((bizAction == null) || (bizAction.length() < 1)) {
		out.println("<root><data><return><code>-99005</code><message>ҵ���߼����ƴ���</message></return></data></root>");
		return;
	}
	bizAction = bizAction.trim();
	int f1 =0;
	if ((f1 = bizAction.indexOf(".")) == -1) {
		out.println("<root><data><return><code>-99005</code><message>ҵ���߼����ƴ���</message></return></data></root>");
		return;	
	}
//	����
	String pkgName = bizAction.substring(0,f1);
	if ((pkgName == null) || (pkgName.trim().length() < 1)) {
		out.println("<root><data><return><code>-99005</code><message>ҵ���߼����ƴ���</message></return></data></root>");
		return;
	}
	pkgName = pkgName.trim();
//	ҵ���߼���
	String bizName = bizAction.substring(f1+1,bizAction.length());
	if ((bizName == null) || (bizName.trim().length() < 1)) {
		out.println("<root><data><return><code>-99005</code><message>ҵ���߼����ƴ���</message></return></data></root>");
		return;
	}
	bizName = bizName.trim();

//	����һ�������߼������ʵ��
	ProcessCaller processCaller = null;
	try {
		processCaller = (ProcessCaller)BizServiceCallerFactory.newInstance(pkgName,"0");//����Ϊ"����"��"UNITID"
	} catch (Exception e) {
		out.println("<root><data><return><code>-99004</code><message>ʵ���������߼�����ʱʧ�ܣ�</message></return></data></root>");
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
			out.print("<root><data><return><code>-99003</code><message>�������������XML�ṹ</message></return></data></root>");
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
			out.print("<root><data><return><code>-99003</code><message>�������������XML�淶���޷�����Document</message></return></data></root>");
			return;
		}
	}
	SessionContext sessioncontext = (SessionContext)request.getSession().getAttribute("sessionContext");
	Node node = sessioncontext.getSessionEntity();
	try {
		XmlUtil.removeNode(inDom.getDocumentElement(), "/root/data/SessionEntity");
	} catch (Exception e) {
		e.printStackTrace();
		out.print("<root><data><return><code>-99003</code><message>�������������XML�淶���޷�����Document</message></return></data></root>");
		return;
	}
	Node node1 = inDom.getElementsByTagName("data").item(0);
	Node node2 = inDom.importNode(node.cloneNode(true), true);
	node1.appendChild(node2);
	
//	System.out.println(bizAction);
//	System.out.println(XmlUtil.node2String(inDom));
	try {
		Document doc = processCaller.implement(bizName,inDom);//����Ϊ"ҵ���߼���"��"Dom��ʽ���������"
		Element retCode = doc.createElement("retCode");
		XmlUtil.setNodeValue(retCode, "1");
		doc.getDocumentElement().appendChild(retCode);
		out.println( XmlUtil.node2String(doc));
	} catch (Exception ex) {
		ex.printStackTrace();
		out.println("<root><data><return><code>-99002</code><message>�����߼�" + bizAction + "ʱʧ�ܣ����ܸ��߼����벻��ȷ�����ȵ��Ը��߼���</message></return></data></root>");
	} finally {
		inDom = null;
	}
%>