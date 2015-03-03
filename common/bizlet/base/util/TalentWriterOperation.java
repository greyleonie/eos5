/*
 * 创建日期 2006-1-16
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
package base.util;

import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.struts.util.ResponseUtils;

/**
 * @author Administrator
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class TalentWriterOperation extends TagSupport{
	String operation = null;
	
	/**
	 * @return 返回 operation。
	 */
	public String getOperation() {
		return operation;
	}
	/**
	 * @param operation 要设置的 operation。
	 */
	public void setOperation(String operation) {
		this.operation = operation;
	}
	public TalentWriterOperation() {
		
	}
	
	public int doStartTag() throws JspException {
		boolean hasPermission = false;
		
		try{
			hasPermission = new RightParse().parse(this.operation,this.pageContext.getSession());
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		String result = "false";
		if(hasPermission) result = "true";
		ResponseUtils.write(this.pageContext,result);
		return TagSupport.SKIP_BODY;
	}
	
	

}
