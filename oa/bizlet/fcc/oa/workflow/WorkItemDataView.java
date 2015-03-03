package fcc.oa.workflow;


import java.util.*;
import java.text.*;
import java.util.Comparator;

import javax.servlet.jsp.tagext.TagSupport;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

import org.w3c.*;
import org.w3c.dom.*;

import com.primeton.tp.core.prservice.context.RequestContext;


/**
 * @author Administrator
 *
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
public class WorkItemDataView extends TagSupport {
	
	private String dom;
	
	
	private String name;
	
	private String wfnode;
	private String list;
	

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
	public static void main(String[] args) {
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
	
	
	public int doStartTag() throws JspException{
		if(dom == null || "".equals(dom)) dom = "reqContext";
		RequestContext context = (RequestContext) pageContext.getAttribute(dom);
		if(context == null)
            context = (RequestContext)pageContext.getRequest().getAttribute(dom);
		if(context == null)
            context = (RequestContext)pageContext.getSession().getAttribute(dom);
		
		try{
			Node wfdataNode = context.getEntity(this.list);
			int length = wfdataNode.getChildNodes().getLength();
			//System.out.print("^^^^^^^^^^node length" + length);
			NodeList nodeList = wfdataNode.getChildNodes();
			
			List wflist = new ArrayList();//�������л�������
			
			for(int i = 0; i < length; i++) {
				Element ele = (Element) nodeList.item(i);
				String dataID = ele.getElementsByTagName("dataID").item(0).getFirstChild().getNodeValue();
				String elementKey = ele.getElementsByTagName("elementKey").item(0).getFirstChild().getNodeValue();
				String elementValue = "";
				if (ele.getElementsByTagName("elementValue").item(0).getFirstChild() != null)
				    elementValue = ele.getElementsByTagName("elementValue").item(0).getFirstChild().getNodeValue();
				String processInstID = ele.getElementsByTagName("processInstID").item(0).getFirstChild().getNodeValue();
				String archiveID = ele.getElementsByTagName("archiveID").item(0).getFirstChild().getNodeValue();
				String activityDefID = ele.getElementsByTagName("activityDefID").item(0).getFirstChild().getNodeValue();
				String userID = ele.getElementsByTagName("userID").item(0).getFirstChild().getNodeValue();
				String userName = ele.getElementsByTagName("userName").item(0).getFirstChild().getNodeValue();
				String userDate = ele.getElementsByTagName("userDate").item(0).getFirstChild().getNodeValue();
				String workItemName = ele.getElementsByTagName("workItemName").item(0).getFirstChild().getNodeValue();
				
				FlowData flowData = new FlowData(dataID,elementKey,elementValue,processInstID,archiveID,activityDefID,userID,userName,userDate,workItemName);
				wflist.add(flowData);
			}//for
			
			
			
			//String wfCurrentNode = context.getEntityValue(this.domwfnode);//����Ŀǰ���ڵĽڵ�λ��
			List selfDatas = processData(wflist);//��ǰ���ڻ�������
			System.out.print("^^^^^^^^^^wflist result sort selfDatas map length=" + selfDatas.size());
			
			StringBuffer lastresult = new StringBuffer();
			for(int i = 0; i < selfDatas.size(); i++) {
				FlowData flowData = (FlowData) selfDatas.get(i);
				lastresult.append("<div style='font-size:12px'>");
				if (!this.name.equalsIgnoreCase("others"))
				   lastresult.append(flowData.getElementValue() + " [" + flowData.getUserName() + "��" + flowData.getUserDate() + "����]");
				else
					lastresult.append(flowData.getElementValue() + " [" + flowData.getUserName() + "��" + flowData.getUserDate() + "����<"+flowData.getWorkItemName()+">����]");
				lastresult.append("</div>");
			
			}
			
			
			this.pageContext.getOut().write(lastresult.toString());
			this.pageContext.getOut().flush();
			
			
			
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		
		
		return TagSupport.SKIP_BODY;
	}
}
