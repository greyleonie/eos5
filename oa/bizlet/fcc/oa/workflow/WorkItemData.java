package fcc.oa.workflow;

import java.util.*;
import java.text.*;
import java.util.Comparator;

import javax.servlet.jsp.tagext.TagSupport;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

import org.w3c.*;
import org.w3c.dom.*;

import talent.core.TalentFunctions;

import com.primeton.tp.core.prservice.context.RequestContext;

/**
 * @author Administrator
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class WorkItemData extends TagSupport {
	
	
	private String dom;
	
	
	private String name;
	private String id;
	private String wfnode;
	private String list;
	private String domwfnode;
	
	private String type;
	
	private String onblur = null;
	private String onchange = null;
	private String onclick = null;
	private String ondblclick = null;
	private String onfocus = null;
	private String onkeydown = null;
	private String onkeypress = null;
	private String onkeyup = null;
	private String onmousedown = null;
	private String onmousemove = null;
	private String onmouseout = null;
	private String onmouseover = null;
	private String onmouseup = null;
	private String onselect = null;
	
	
	private String style;
	private String classname;
	
	private String rows;
	private String cols;
	private String size;
	
	private String attributestext;
	
	private String readonly;
	private String tabindex;
	private String title;
	private String wrap;
	private String dir;
	private String lang;
	private String accesskey;
	
	

	
	
	public int doStartTag() throws JspException{
		if(dom == null || "".equals(dom)) dom = "reqContext";
		RequestContext context = (RequestContext) pageContext.getAttribute(dom);
		if(context == null)
            context = (RequestContext)pageContext.getRequest().getAttribute(dom);
		if(context == null)
            context = (RequestContext)pageContext.getSession().getAttribute(dom);
		
		try{
			Node wfdataNode = context.getEntity(this.list);
			if(wfdataNode!=null ){
				int length = wfdataNode.getChildNodes().getLength();
				//System.out.print("^^^^^^^^^^node length" + length);
				NodeList nodeList = wfdataNode.getChildNodes();
				
				List wflist = new ArrayList();//流程所有环节数据
				
				for(int i = 0; i < length; i++) {
					Element ele = (Element) nodeList.item(i);
					String dataID = TalentFunctions.getNodeValueByTagNameExcludeNull(ele,"dataID");
					String elementKey = TalentFunctions.getNodeValueByTagNameExcludeNull(ele,"elementKey");
					String elementValue = TalentFunctions.getNodeValueByTagNameExcludeNull(ele,"elementValue");
					String processInstID = TalentFunctions.getNodeValueByTagNameExcludeNull(ele,"processInstID");
					String archiveID = TalentFunctions.getNodeValueByTagNameExcludeNull(ele,"archiveID");
					String activityDefID = TalentFunctions.getNodeValueByTagNameExcludeNull(ele,"activityDefID");
					String userID = TalentFunctions.getNodeValueByTagNameExcludeNull(ele,"userID");
					String userName = TalentFunctions.getNodeValueByTagNameExcludeNull(ele,"userName");
					String userDate = TalentFunctions.getNodeValueByTagNameExcludeNull(ele,"userDate");
					String workItemName = ele.getElementsByTagName("workItemName").item(0).getFirstChild().getNodeValue();
					
					FlowData flowData = new FlowData(dataID,elementKey,elementValue,processInstID,archiveID,activityDefID,userID,userName,userDate,workItemName);
					wflist.add(flowData);
				}//for
				
				
				
				String wfCurrentNode = context.getEntityValue(this.domwfnode);//流程目前的在的节点位置
				List selfDatas = processData(wflist);//当前所在环节数据
				System.out.print("^^^^^^^^^^wflist result sort selfDatas map length=" + selfDatas.size());
				
				StringBuffer lastresult = new StringBuffer();
				for(int i = 0; i < selfDatas.size(); i++) {
					FlowData flowData = (FlowData) selfDatas.get(i);
					lastresult.append("<div style='font-size:12px'>");
					if (!this.name.equalsIgnoreCase("others"))
					   lastresult.append(flowData.getElementValue() + " [" + flowData.getUserName() + "于" + flowData.getUserDate() + "办理]");
					else
					   lastresult.append(flowData.getElementValue() + " [" + flowData.getUserName() + "于" + flowData.getUserDate() + "办理<"+flowData.getWorkItemName()+">工作]");
					lastresult.append("</div>");
				
				}
				
				//-----------------------process data start------------------------------------------------
				if(this.wfnode.indexOf(wfCurrentNode)>=0) {
					
					if(this.type.equalsIgnoreCase("text")) {
						StringBuffer result = new StringBuffer();
						result.append("<div>");
						result.append("<input type=\"text\" name=\"" + this.name + "\" wfnode=\"" + this.wfnode + "\" domwfnode=\"" + wfCurrentNode + "\" ");
						result.append(this.handleAll() + " ");
						//result.append("value=\"同意\"");
						//add do handle value
						if(selfDatas.size() > 0) {
							FlowData temp = (FlowData)selfDatas.get(selfDatas.size() -1);
							result.append(temp.getElementValue());
						}
						
						//add do handle value
						result.append("\" >");
						result.append("</div>");
						lastresult.append(result.toString());
						
						
					}else if(this.type.equalsIgnoreCase("textarea")) {
						StringBuffer result = new StringBuffer();
						result.append("<div>");
						result.append("<textarea name=\"" + this.name + "\" wfnode=\"" + this.wfnode + "\" domwfnode=\"" + wfCurrentNode + "\" ");
						result.append(this.handleAll() + " >");
						//add do handle value
						if(selfDatas.size() > 0) {
							FlowData temp = (FlowData)selfDatas.get(selfDatas.size() -1);
							result.append(temp.getElementValue());
						}
						//add do handle value
						//result.append("同意");
						result.append("</textarea>");
						result.append("</div>");
						lastresult.append(result.toString());
						
					
					}
					
				
				}
				this.pageContext.getOut().write(lastresult.toString());
				this.pageContext.getOut().flush();
				//-----------------------process data start------------------------------------------------
				
			}
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		
		
		return TagSupport.SKIP_BODY;
	}
	
	
	
	private String handleEvent() {
		String result = " ";
		StringBuffer cache = new StringBuffer();
		
		if(this.onblur!=null) cache.append(" onblur=\"" + onblur + "\"");
		if(this.onchange!=null) cache.append(" onchange=\"" + onchange + "\"");
		if(this.onclick!=null) cache.append(" onclick=\"" + onclick + "\"");
		if(this.ondblclick!=null) cache.append(" ondblclick=\"" + ondblclick + "\"");
		if(this.onfocus!=null) cache.append(" onfocus=\"" + onfocus + "\"");
		if(this.onkeydown!=null) cache.append(" onkeydown=\"" + onkeydown + "\"");
		if(this.onkeypress!=null) cache.append(" onkeypress=\"" + onkeypress + "\"");
		if(this.onkeyup!=null) cache.append(" onkeyup=\"" + onkeyup + "\"");
		if(this.onmousedown!=null) cache.append(" onmousedown=\"" + onmousedown + "\"");
		if(this.onmousemove!=null) cache.append(" onmousemove=\"" + onmousemove + "\"");
		if(this.onmouseout!=null) cache.append(" onmouseout=\"" + onmouseout + "\"");
		if(this.onmouseover!=null) cache.append(" onmouseover=\"" + onmouseover + "\"");
		if(this.onmouseup!=null) cache.append(" onmouseup=\"" + onmouseup + "\"");
		if(this.onselect!=null) cache.append(" onselect=\"" + onselect + "\"");
		
		result += cache.toString();
		
		return result;
	
	
	}
	
	private String handleType() {
		String result = " ";
		StringBuffer cache = new StringBuffer();
		if(this.type.equalsIgnoreCase("text")) {
			if(this.size!=null && !"".equals(this.size)) cache.append(" size=\"" + size + "\"");
		}else if(this.type.equalsIgnoreCase("textarea")) {
			if(this.rows!=null && !"".equalsIgnoreCase(this.rows)) cache.append(" rows=\"" + rows + "\"");
			if(this.cols!=null && !"".equalsIgnoreCase(this.cols)) cache.append(" cols=\"" + cols + "\"");
		}
		result += cache.toString();
		
		return result;
	
	}
	
	
	private String handleCss() {
		String result = " ";
		StringBuffer cache = new StringBuffer();
		
		if(this.style!=null &&!"".equalsIgnoreCase(this.style)) cache.append(" style=\"" + style + "\"");
		if(this.classname!=null &&!"".equalsIgnoreCase(this.classname)) cache.append(" class=\"" + classname + "\"");
		
		result += cache.toString();
		
		return result;
	
	}
	
	private String handleOther() {
		String result = " ";
		StringBuffer cache = new StringBuffer();
		
		if(this.id!=null &&!"".equalsIgnoreCase(this.id)) cache.append(" id=\"" + id + "\"");
		if(this.readonly!=null &&!"".equalsIgnoreCase(this.readonly)) cache.append(" readonly=\"" + readonly + "\"");
		if(this.tabindex!=null &&!"".equalsIgnoreCase(this.tabindex)) cache.append(" tabindex=\"" + tabindex + "\"");
		if(this.wrap!=null &&!"".equalsIgnoreCase(this.wrap)) cache.append(" wrap=\"" + wrap + "\"");
		if(this.title!=null &&!"".equalsIgnoreCase(this.title)) cache.append(" title=\"" + title + "\"");
		if(this.dir!=null &&!"".equalsIgnoreCase(this.dir)) cache.append(" dir=\"" + dir + "\"");
		if(this.lang!=null &&!"".equalsIgnoreCase(this.lang)) cache.append(" lang=\"" + lang + "\"");
		if(this.accesskey!=null &&!"".equalsIgnoreCase(this.accesskey)) cache.append(" accesskey=\"" + accesskey + "\"");
		
		result += cache.toString();
		
		return result;
	
	}
	
	
	private String handleAttributestext() {
		String result = " ";
		StringBuffer cache = new StringBuffer();
		
		if(this.attributestext!=null && !"".equalsIgnoreCase(this.attributestext)) {
			StringTokenizer st = new StringTokenizer(this.attributestext," ");
			while(st.hasMoreTokens()) {
				String temp = st.nextToken();
				cache.append(" " + temp);
			
			}
		
		}
		
		result += cache.toString();
		
		return result;
	
	}
	
	
	private String handleAll() {
		String result = " ";
		StringBuffer cache = new StringBuffer();
		
		cache.append(this.handleType());
		cache.append(this.handleCss());
		cache.append(this.handleOther());
		cache.append(this.handleAttributestext());
		cache.append(this.handleEvent());
		
		result += cache.toString();
		
		return result;
	
	}
	
	
	private List processData(List wflist) {
		List last = new ArrayList();
		List result = new ArrayList();
		
		for(int i = 0; i < wflist.size(); i++) {
			FlowData flowData = (FlowData) wflist.get(i);
			if(flowData.getElementKey().equalsIgnoreCase(this.name) && this.wfnode.indexOf(flowData.getActivityDefID())>=0) {
				result.add(flowData);
			
			}
		
		}
		
		
		
		//按照先办在前，后办在后排列
		if(result.size() > 0) {
			Collections.sort(result,new DataSort());
			
			last = processSameOperator(result);
			if(last.size() > 0) Collections.sort(last,new DataSort());
		
		}
		
		
		
		return last;
	
	
	}
	
	
	private List processSameOperator(List wflist) {
		Map map = new HashMap();
		for(int i = 0; i < wflist.size(); i++) {
			FlowData flowData = (FlowData) wflist.get(i);
			String operator = flowData.getUserID();
			map.put(operator,flowData);
			
			
			
		
		}
		
		List list = new ArrayList(map.values());
		
		return list;
		
		
	}
	
	
	
	public static void main(String[] args) {
		StringTokenizer st = new StringTokenizer("class='fcc' style='size:10px' disabled"," ");
		
		while(st.hasMoreTokens()) {
			String temp = st.nextToken();
			System.out.println(temp);
		
		}
	
	}
	
	
	
	
	/**
	 * @return 返回 accesskey。
	 */
	public String getAccesskey() {
		return accesskey;
	}
	/**
	 * @param accesskey 要设置的 accesskey。
	 */
	public void setAccesskey(String accesskey) {
		this.accesskey = accesskey;
	}
	/**
	 * @return 返回 attributestext。
	 */
	public String getAttributestext() {
		return attributestext;
	}
	/**
	 * @param attributestext 要设置的 attributestext。
	 */
	public void setAttributestext(String attributestext) {
		this.attributestext = attributestext;
	}
	/**
	 * @return 返回 classname。
	 */
	public String getClassname() {
		return classname;
	}
	/**
	 * @param classname 要设置的 classname。
	 */
	public void setClassname(String classname) {
		this.classname = classname;
	}
	/**
	 * @return 返回 dir。
	 */
	public String getDir() {
		return dir;
	}
	/**
	 * @param dir 要设置的 dir。
	 */
	public void setDir(String dir) {
		this.dir = dir;
	}
	/**
	 * @return 返回 domwfnode。
	 */
	public String getDomwfnode() {
		return domwfnode;
	}
	/**
	 * @param domwfnode 要设置的 domwfnode。
	 */
	public void setDomwfnode(String domwfnode) {
		this.domwfnode = domwfnode;
	}
	/**
	 * @return 返回 id。
	 */
	public String getId() {
		return id;
	}
	/**
	 * @param id 要设置的 id。
	 */
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * @return 返回 lang。
	 */
	public String getLang() {
		return lang;
	}
	/**
	 * @param lang 要设置的 lang。
	 */
	public void setLang(String lang) {
		this.lang = lang;
	}
	/**
	 * @return 返回 list。
	 */
	public String getList() {
		return list;
	}
	/**
	 * @param list 要设置的 list。
	 */
	public void setList(String list) {
		this.list = list;
	}
	/**
	 * @return 返回 name。
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name 要设置的 name。
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return 返回 onblur。
	 */
	public String getOnblur() {
		return onblur;
	}
	/**
	 * @param onblur 要设置的 onblur。
	 */
	public void setOnblur(String onblur) {
		this.onblur = onblur;
	}
	/**
	 * @return 返回 oncblclick。
	 */
	public String getOncblclick() {
		return ondblclick;
	}
	/**
	 * @param oncblclick 要设置的 oncblclick。
	 */
	public void setOncblclick(String oncblclick) {
		this.ondblclick = oncblclick;
	}
	/**
	 * @return 返回 onchange。
	 */
	public String getOnchange() {
		return onchange;
	}
	/**
	 * @param onchange 要设置的 onchange。
	 */
	public void setOnchange(String onchange) {
		this.onchange = onchange;
	}
	/**
	 * @return 返回 onclick。
	 */
	public String getOnclick() {
		return onclick;
	}
	/**
	 * @param onclick 要设置的 onclick。
	 */
	public void setOnclick(String onclick) {
		this.onclick = onclick;
	}
	/**
	 * @return 返回 onfocus。
	 */
	public String getOnfocus() {
		return onfocus;
	}
	/**
	 * @param onfocus 要设置的 onfocus。
	 */
	public void setOnfocus(String onfocus) {
		this.onfocus = onfocus;
	}
	/**
	 * @return 返回 onkeydown。
	 */
	public String getOnkeydown() {
		return onkeydown;
	}
	/**
	 * @param onkeydown 要设置的 onkeydown。
	 */
	public void setOnkeydown(String onkeydown) {
		this.onkeydown = onkeydown;
	}
	/**
	 * @return 返回 onkeypress。
	 */
	public String getOnkeypress() {
		return onkeypress;
	}
	/**
	 * @param onkeypress 要设置的 onkeypress。
	 */
	public void setOnkeypress(String onkeypress) {
		this.onkeypress = onkeypress;
	}
	/**
	 * @return 返回 onkeyup。
	 */
	public String getOnkeyup() {
		return onkeyup;
	}
	/**
	 * @param onkeyup 要设置的 onkeyup。
	 */
	public void setOnkeyup(String onkeyup) {
		this.onkeyup = onkeyup;
	}
	/**
	 * @return 返回 onmousedown。
	 */
	public String getOnmousedown() {
		return onmousedown;
	}
	/**
	 * @param onmousedown 要设置的 onmousedown。
	 */
	public void setOnmousedown(String onmousedown) {
		this.onmousedown = onmousedown;
	}
	/**
	 * @return 返回 onmousemove。
	 */
	public String getOnmousemove() {
		return onmousemove;
	}
	/**
	 * @param onmousemove 要设置的 onmousemove。
	 */
	public void setOnmousemove(String onmousemove) {
		this.onmousemove = onmousemove;
	}
	/**
	 * @return 返回 onmouseout。
	 */
	public String getOnmouseout() {
		return onmouseout;
	}
	/**
	 * @param onmouseout 要设置的 onmouseout。
	 */
	public void setOnmouseout(String onmouseout) {
		this.onmouseout = onmouseout;
	}
	/**
	 * @return 返回 onmouseover。
	 */
	public String getOnmouseover() {
		return onmouseover;
	}
	/**
	 * @param onmouseover 要设置的 onmouseover。
	 */
	public void setOnmouseover(String onmouseover) {
		this.onmouseover = onmouseover;
	}
	/**
	 * @return 返回 onmouseup。
	 */
	public String getOnmouseup() {
		return onmouseup;
	}
	/**
	 * @param onmouseup 要设置的 onmouseup。
	 */
	public void setOnmouseup(String onmouseup) {
		this.onmouseup = onmouseup;
	}
	/**
	 * @return 返回 onselect。
	 */
	public String getOnselect() {
		return onselect;
	}
	/**
	 * @param onselect 要设置的 onselect。
	 */
	public void setOnselect(String onselect) {
		this.onselect = onselect;
	}
	/**
	 * @return 返回 readonly。
	 */
	public String getReadonly() {
		return readonly;
	}
	/**
	 * @param readonly 要设置的 readonly。
	 */
	public void setReadonly(String readonly) {
		this.readonly = readonly;
	}
	/**
	 * @return 返回 size。
	 */
	public String getSize() {
		return size;
	}
	/**
	 * @param size 要设置的 size。
	 */
	public void setSize(String size) {
		this.size = size;
	}
	/**
	 * @return 返回 style。
	 */
	public String getStyle() {
		return style;
	}
	/**
	 * @param style 要设置的 style。
	 */
	public void setStyle(String style) {
		this.style = style;
	}
	/**
	 * @return 返回 tabindex。
	 */
	public String getTabindex() {
		return tabindex;
	}
	/**
	 * @param tabindex 要设置的 tabindex。
	 */
	public void setTabindex(String tabindex) {
		this.tabindex = tabindex;
	}
	/**
	 * @return 返回 title。
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * @param title 要设置的 title。
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * @return 返回 type。
	 */
	public String getType() {
		return type;
	}
	/**
	 * @param type 要设置的 type。
	 */
	public void setType(String type) {
		this.type = type;
	}
	/**
	 * @return 返回 wfnode。
	 */
	public String getWfnode() {
		return wfnode;
	}
	/**
	 * @param wfnode 要设置的 wfnode。
	 */
	public void setWfnode(String wfnode) {
		this.wfnode = wfnode;
	}
	/**
	 * @return 返回 wrap。
	 */
	public String getWrap() {
		return wrap;
	}
	/**
	 * @param wrap 要设置的 wrap。
	 */
	public void setWrap(String wrap) {
		this.wrap = wrap;
	}
	/**
	 * @return 返回 dom。
	 */
	public String getDom() {
		return dom;
	}
	/**
	 * @param dom 要设置的 dom。
	 */
	public void setDom(String dom) {
		this.dom = dom;
	}
	/**
	 * @return 返回 cols。
	 */
	public String getCols() {
		return cols;
	}
	/**
	 * @param cols 要设置的 cols。
	 */
	public void setCols(String cols) {
		this.cols = cols;
	}
	/**
	 * @return 返回 ondblclick。
	 */
	public String getOndblclick() {
		return ondblclick;
	}
	/**
	 * @param ondblclick 要设置的 ondblclick。
	 */
	public void setOndblclick(String ondblclick) {
		this.ondblclick = ondblclick;
	}
	/**
	 * @return 返回 rows。
	 */
	public String getRows() {
		return rows;
	}
	/**
	 * @param rows 要设置的 rows。
	 */
	public void setRows(String rows) {
		this.rows = rows;
	}
	
}


class DataSort implements Comparator {
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	
	public int compare(Object o1, Object o2) {
		FlowData c1 = (FlowData) o1;
		FlowData c2 = (FlowData) o2;
		
		String d1 = c1.getUserDate();
		String d2 = c2.getUserDate();
		
		try{
			
			Date date1 = sdf.parse(d1);
			Date date2 = sdf.parse(d2);
			
			if(date1.equals(date2)) return 0;
			if(date1.before(date2)) return -1;
			if(date1.after(date2)) return 1;
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		
		
		
		return 0;
	}


}

