/*
 * �������� 2005-7-10
 *
 * TODO Ҫ���Ĵ����ɵ��ļ���ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
package talent.tool;

import com.primeton.tp.common.logger.Logger;
import com.primeton.tp.common.xml.XmlUtil;
import com.primeton.tp.core.prservice.context.RequestContext;
import java.util.Hashtable;
import javax.servlet.ServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.TagSupport;
import org.apache.struts.util.ResponseUtils;
import org.w3c.dom.*;

/**
 * @author Administrator
 *
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
public class FolderName extends TagSupport{
	/**
	 * @return ���� fid��
	 */
	public String getFid() {
		return fid;
	}
	/**
	 * @param fid Ҫ���õ� fid��
	 */
	public void setFid(String fid) {
		this.fid = fid;
	}
	protected String fid;
	private String id = "reqContext";

	
	public int doStartTag() throws JspException{
		String results = "";
		RequestContext dom = (RequestContext)this.pageContext.getAttribute(id);
		if(dom==null) dom = (RequestContext)this.pageContext.getRequest().getAttribute(id);
		if(dom==null){
			Logger.error(this,"FolderName.doStartTag error","can not find dom");
			return SKIP_BODY;
		}
		Node list = dom.getEntity("SessionEntity/list[@type='foldermanage']");
		if(list==null){
			Logger.error(this,"FolderName.doStartTag error","can not find list[@type='foldermanage'] node");
			return SKIP_BODY;
		}
		//Element foldermanage = (Element)list;
		int size = list.getChildNodes().getLength();
		NodeList allFolder = list.getChildNodes();
		for(int i=0;i<size;i++){
			String id = ((Element)allFolder.item(i)).getElementsByTagName("FolderId").item(0).getFirstChild().getNodeValue();
			String name = ((Element)allFolder.item(i)).getElementsByTagName("FolderName").item(0).getFirstChild().getNodeValue();
			if(id.equals(getFid())){
				results = name;
				break;
			}
		
		}//for
		
		ResponseUtils.write(this.pageContext,results);
	return SKIP_BODY;
	}
	
	


}
