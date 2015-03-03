/*
 * �������� 2006-1-16
 *
 * TODO Ҫ���Ĵ����ɵ��ļ���ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
package base.util;

import java.util.*;

import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * @author Administrator
 *
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
public class TalentModule extends TagSupport {
	private String moduleID;
	
	public TalentModule() {
		moduleID = "";
	}

	
	
	
	/**
	 * @return ���� moduleID��
	 */
	public String getModuleID() {
		return moduleID;
	}
	/**
	 * @param moduleID Ҫ���õ� moduleID��
	 */
	public void setModuleID(String moduleID) {
		this.moduleID = moduleID;
	}
	public int doStartTag() throws JspException {
		boolean  hasPermission = false;
		HashMap rightMap = (HashMap) this.pageContext.getSession().getAttribute("userPermissions");
		if(rightMap.get(moduleID)!=null&&!"".equals(rightMap.get(moduleID)))
		     hasPermission = true;
		if(hasPermission)
		     return TagSupport.EVAL_BODY_INCLUDE;
		return TagSupport.SKIP_BODY;
		
		
	}
	
	public int doEndTag()  throws JspException{
	      return 6;
	  }
	
	
}
