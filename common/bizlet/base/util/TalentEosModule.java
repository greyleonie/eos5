/*
 * �������� 2006-2-14
 *
 * TODO Ҫ���Ĵ����ɵ��ļ���ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
package base.util;

import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.TagSupport;

import java.util.*;

import org.apache.commons.logging.*;

import com.primeton.tp.core.prservice.context.RequestContext;


/**
 * @author Administrator
 *
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
public class TalentEosModule extends TagSupport {
	
	public TalentEosModule() {
		this.id = "";
		this.property = "";
	
	}
	
	public int doStartTag() throws JspException {
		boolean  hasPermission = false;
		HashMap rightMap = (HashMap) this.pageContext.getSession().getAttribute("userPermissions");
		
		RequestContext context = (RequestContext)pageContext.getAttribute(id);
		 if(context == null)
            context = (RequestContext)pageContext.getRequest().getAttribute(id);
		 if(context == null)
            context = (RequestContext)pageContext.getSession().getAttribute(id);
		 
		 if(context == null) throw new JspException("context can not find");
		 
		 Object value = null;
		 value = context.getProperty(property);
		 
		 if(value == null) value = "";
		 
		 String moduleID = value.toString();
		 fccLog.info("############################module id is " + moduleID);
		 if(rightMap.get(moduleID)!=null&&!"".equals(rightMap.get(moduleID)))
		     hasPermission = true;
		if(hasPermission)
		     return TagSupport.EVAL_BODY_INCLUDE;
		return TagSupport.SKIP_BODY;
		 
		
	
	
	}
	
	
	public int doEndTag()  throws JspException{
	      return 6;
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
	private String id;
	private String property;
	private Log fccLog = LogFactory.getLog(TalentEosModule.class);
	
	
	
	

}
