/*
 * 创建日期 2006-1-16
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
package base.util;

import java.util.*;

import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * @author Administrator
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class TalentModule extends TagSupport {
	private String moduleID;
	
	public TalentModule() {
		moduleID = "";
	}

	
	
	
	/**
	 * @return 返回 moduleID。
	 */
	public String getModuleID() {
		return moduleID;
	}
	/**
	 * @param moduleID 要设置的 moduleID。
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
