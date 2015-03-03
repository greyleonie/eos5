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
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
public class WorkItemInput extends TagSupport {
	
	
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
	private String property;
	private String value;
	private String maxlength;
	
	
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
			
			String value = 	this.value;
			String property = 	context.getEntityValue(this.property);
			if(value == null )
				value = TalentFunctions.getAvailStr(property);
			String name = this.name;
			if(name == null )
				name = TalentFunctions.getAvailStr(this.property);
			String wfCurrentNode = context.getEntityValue(this.domwfnode);//����Ŀǰ���ڵĽڵ�λ��
			String wfnode = 	this.wfnode;	//����������������̽ڵ�
			boolean cando = false ;
			if(wfnode!=null){
				if(wfnode.equalsIgnoreCase("all"))
					cando = true ;
				else{
					String wfnodes[] = wfnode.split(";");
					for(int i=0;i<wfnodes.length;i++){
						if(wfCurrentNode.equalsIgnoreCase(wfnodes[i])){
							cando = true;
							break;
						}
					}
				}
			}
				//-----------------------process data start------------------------------------------------
				
			StringBuffer lastresult = new StringBuffer();
			if(cando) {
					
					if(this.type.equalsIgnoreCase("text")) {
						StringBuffer result = new StringBuffer();
						result.append("<input type=\"text\" name=\"" + name + "\" ");
						result.append(this.handleAll() + " ");
						result.append("value=\"" + value + "\" >");
						lastresult.append(result.toString());
						
					}else if(this.type.equalsIgnoreCase("textarea")) {
						StringBuffer result = new StringBuffer();
						result.append("<textarea name=\"" + name + "\"  ");
						result.append(this.handleAll() + " >");
						result.append(value);
						result.append("</textarea>");
						lastresult.append(result.toString());
						
					
					}
					
				
				}
			else{
				lastresult.append(value);
			}
				this.pageContext.getOut().write(lastresult.toString());
				this.pageContext.getOut().flush();
				//-----------------------process data start------------------------------------------------
				
	
			
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
			if(flowData.getElementKey().equalsIgnoreCase(this.name) && flowData.getActivityDefID().equalsIgnoreCase(this.wfnode)) {
				result.add(flowData);
			
			}
		
		}
		
		
		
		//�����Ȱ���ǰ������ں�����
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
	 * @return ���� accesskey��
	 */
	public String getAccesskey() {
		return accesskey;
	}
	/**
	 * @param accesskey Ҫ���õ� accesskey��
	 */
	public void setAccesskey(String accesskey) {
		this.accesskey = accesskey;
	}
	/**
	 * @return ���� attributestext��
	 */
	public String getAttributestext() {
		return attributestext;
	}
	/**
	 * @param attributestext Ҫ���õ� attributestext��
	 */
	public void setAttributestext(String attributestext) {
		this.attributestext = attributestext;
	}
	/**
	 * @return ���� classname��
	 */
	public String getClassname() {
		return classname;
	}
	/**
	 * @param classname Ҫ���õ� classname��
	 */
	public void setClassname(String classname) {
		this.classname = classname;
	}
	/**
	 * @return ���� dir��
	 */
	public String getDir() {
		return dir;
	}
	/**
	 * @param dir Ҫ���õ� dir��
	 */
	public void setDir(String dir) {
		this.dir = dir;
	}
	/**
	 * @return ���� domwfnode��
	 */
	public String getDomwfnode() {
		return domwfnode;
	}
	/**
	 * @param domwfnode Ҫ���õ� domwfnode��
	 */
	public void setDomwfnode(String domwfnode) {
		this.domwfnode = domwfnode;
	}
	/**
	 * @return ���� id��
	 */
	public String getId() {
		return id;
	}
	/**
	 * @param id Ҫ���õ� id��
	 */
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * @return ���� lang��
	 */
	public String getLang() {
		return lang;
	}
	/**
	 * @param lang Ҫ���õ� lang��
	 */
	public void setLang(String lang) {
		this.lang = lang;
	}
	/**
	 * @return ���� list��
	 */
	public String getList() {
		return list;
	}
	/**
	 * @param list Ҫ���õ� list��
	 */
	public void setList(String list) {
		this.list = list;
	}
	/**
	 * @return ���� name��
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name Ҫ���õ� name��
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return ���� onblur��
	 */
	public String getOnblur() {
		return onblur;
	}
	/**
	 * @param onblur Ҫ���õ� onblur��
	 */
	public void setOnblur(String onblur) {
		this.onblur = onblur;
	}
	/**
	 * @return ���� oncblclick��
	 */
	public String getOncblclick() {
		return ondblclick;
	}
	/**
	 * @param oncblclick Ҫ���õ� oncblclick��
	 */
	public void setOncblclick(String oncblclick) {
		this.ondblclick = oncblclick;
	}
	/**
	 * @return ���� onchange��
	 */
	public String getOnchange() {
		return onchange;
	}
	/**
	 * @param onchange Ҫ���õ� onchange��
	 */
	public void setOnchange(String onchange) {
		this.onchange = onchange;
	}
	/**
	 * @return ���� onclick��
	 */
	public String getOnclick() {
		return onclick;
	}
	/**
	 * @param onclick Ҫ���õ� onclick��
	 */
	public void setOnclick(String onclick) {
		this.onclick = onclick;
	}
	/**
	 * @return ���� onfocus��
	 */
	public String getOnfocus() {
		return onfocus;
	}
	/**
	 * @param onfocus Ҫ���õ� onfocus��
	 */
	public void setOnfocus(String onfocus) {
		this.onfocus = onfocus;
	}
	/**
	 * @return ���� onkeydown��
	 */
	public String getOnkeydown() {
		return onkeydown;
	}
	/**
	 * @param onkeydown Ҫ���õ� onkeydown��
	 */
	public void setOnkeydown(String onkeydown) {
		this.onkeydown = onkeydown;
	}
	/**
	 * @return ���� onkeypress��
	 */
	public String getOnkeypress() {
		return onkeypress;
	}
	/**
	 * @param onkeypress Ҫ���õ� onkeypress��
	 */
	public void setOnkeypress(String onkeypress) {
		this.onkeypress = onkeypress;
	}
	/**
	 * @return ���� onkeyup��
	 */
	public String getOnkeyup() {
		return onkeyup;
	}
	/**
	 * @param onkeyup Ҫ���õ� onkeyup��
	 */
	public void setOnkeyup(String onkeyup) {
		this.onkeyup = onkeyup;
	}
	/**
	 * @return ���� onmousedown��
	 */
	public String getOnmousedown() {
		return onmousedown;
	}
	/**
	 * @param onmousedown Ҫ���õ� onmousedown��
	 */
	public void setOnmousedown(String onmousedown) {
		this.onmousedown = onmousedown;
	}
	/**
	 * @return ���� onmousemove��
	 */
	public String getOnmousemove() {
		return onmousemove;
	}
	/**
	 * @param onmousemove Ҫ���õ� onmousemove��
	 */
	public void setOnmousemove(String onmousemove) {
		this.onmousemove = onmousemove;
	}
	/**
	 * @return ���� onmouseout��
	 */
	public String getOnmouseout() {
		return onmouseout;
	}
	/**
	 * @param onmouseout Ҫ���õ� onmouseout��
	 */
	public void setOnmouseout(String onmouseout) {
		this.onmouseout = onmouseout;
	}
	/**
	 * @return ���� onmouseover��
	 */
	public String getOnmouseover() {
		return onmouseover;
	}
	/**
	 * @param onmouseover Ҫ���õ� onmouseover��
	 */
	public void setOnmouseover(String onmouseover) {
		this.onmouseover = onmouseover;
	}
	/**
	 * @return ���� onmouseup��
	 */
	public String getOnmouseup() {
		return onmouseup;
	}
	/**
	 * @param onmouseup Ҫ���õ� onmouseup��
	 */
	public void setOnmouseup(String onmouseup) {
		this.onmouseup = onmouseup;
	}
	/**
	 * @return ���� onselect��
	 */
	public String getOnselect() {
		return onselect;
	}
	/**
	 * @param onselect Ҫ���õ� onselect��
	 */
	public void setOnselect(String onselect) {
		this.onselect = onselect;
	}
	/**
	 * @return ���� readonly��
	 */
	public String getReadonly() {
		return readonly;
	}
	/**
	 * @param readonly Ҫ���õ� readonly��
	 */
	public void setReadonly(String readonly) {
		this.readonly = readonly;
	}
	/**
	 * @return ���� size��
	 */
	public String getSize() {
		return size;
	}
	/**
	 * @param size Ҫ���õ� size��
	 */
	public void setSize(String size) {
		this.size = size;
	}
	/**
	 * @return ���� style��
	 */
	public String getStyle() {
		return style;
	}
	/**
	 * @param style Ҫ���õ� style��
	 */
	public void setStyle(String style) {
		this.style = style;
	}
	/**
	 * @return ���� tabindex��
	 */
	public String getTabindex() {
		return tabindex;
	}
	/**
	 * @param tabindex Ҫ���õ� tabindex��
	 */
	public void setTabindex(String tabindex) {
		this.tabindex = tabindex;
	}
	/**
	 * @return ���� title��
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * @param title Ҫ���õ� title��
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * @return ���� type��
	 */
	public String getType() {
		return type;
	}
	/**
	 * @param type Ҫ���õ� type��
	 */
	public void setType(String type) {
		this.type = type;
	}
	/**
	 * @return ���� wfnode��
	 */
	public String getWfnode() {
		return wfnode;
	}
	/**
	 * @param wfnode Ҫ���õ� wfnode��
	 */
	public void setWfnode(String wfnode) {
		this.wfnode = wfnode;
	}
	/**
	 * @return ���� wrap��
	 */
	public String getWrap() {
		return wrap;
	}
	/**
	 * @param wrap Ҫ���õ� wrap��
	 */
	public void setWrap(String wrap) {
		this.wrap = wrap;
	}
	/**
	 * @return ���� dom��
	 */
	public String getDom() {
		return dom;
	}
	/**
	 * @param dom Ҫ���õ� dom��
	 */
	public void setDom(String dom) {
		this.dom = dom;
	}
	/**
	 * @return ���� cols��
	 */
	public String getCols() {
		return cols;
	}
	/**
	 * @param cols Ҫ���õ� cols��
	 */
	public void setCols(String cols) {
		this.cols = cols;
	}
	/**
	 * @return ���� ondblclick��
	 */
	public String getOndblclick() {
		return ondblclick;
	}
	/**
	 * @param ondblclick Ҫ���õ� ondblclick��
	 */
	public void setOndblclick(String ondblclick) {
		this.ondblclick = ondblclick;
	}
	/**
	 * @return ���� rows��
	 */
	public String getRows() {
		return rows;
	}
	/**
	 * @param rows Ҫ���õ� rows��
	 */
	public void setRows(String rows) {
		this.rows = rows;
	}
	
	/**
	 * @return ���� maxlength��
	 */
	public String getMaxlength() {
		return maxlength;
	}
	/**
	 * @param maxlength Ҫ���õ� maxlength��
	 */
	public void setMaxlength(String maxlength) {
		this.maxlength = maxlength;
	}
	/**
	 * @return ���� property��
	 */
	public String getProperty() {
		return property;
	}
	/**
	 * @param property Ҫ���õ� property��
	 */
	public void setProperty(String property) {
		this.property = property;
	}
	/**
	 * @return ���� value��
	 */
	public String getValue() {
		return value;
	}
	/**
	 * @param value Ҫ���õ� value��
	 */
	public void setValue(String value) {
		this.value = value;
	}
}




