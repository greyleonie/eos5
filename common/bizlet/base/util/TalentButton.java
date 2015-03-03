/*
 * 创建日期 2006-1-14
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
package base.util;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.taglib.html.SubmitTag;




import javax.servlet.jsp.JspException;
import javax.servlet.http.HttpSession;
import org.apache.struts.util.ResponseUtils;
import java.util.HashMap;

/**
 * @author Administrator
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class TalentButton extends SubmitTag {
	
	private String operation = null;//权限，书定格式为ModuleID.OperationType
	private String type = null;//submit or button
	private boolean hasPermission = true;

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
	
	public TalentButton() {
		
	}
	
	public int doStartTag()  throws JspException{
	    this.text = null;
	    RightParse rightParse = new RightParse();
		hasPermission = rightParse.parse(operation,this.pageContext.getSession());
		if(hasPermission)
			return (EVAL_BODY_TAG);
		else
			return 0;
	  }
	
	public int doEndTag() throws JspException{
		
		//this.setDisabled(!hasPermission);
		if (!hasPermission)
			return 0;
		
		String label = value;
	      if ((label == null) && (text != null))
	          label = text;
	      if ((label == null) || (label.length() < 1))
	          label = "Submit";
	      StringBuffer results = new StringBuffer();
	      if("button".equalsIgnoreCase(type))
	         results.append("<input type=\"button\"");
	      else
	        results.append("<input type=\"submit\"");
	      if (property != null) {
	          results.append(" name=\"");
	          results.append(property);

	          if( indexed )
	              prepareIndex( results, null );
	          results.append("\"");
	      }

	      if (accesskey != null) {
	          results.append(" accesskey=\"");
	          results.append(accesskey);
	          results.append("\"");
	      }
	      if (tabindex != null) {
	          results.append(" tabindex=\"");
	          results.append(tabindex);
	          results.append("\"");
	      }
	      results.append(" value=\"");
	      results.append(label);
	      results.append("\"");

	      results.append(prepareEventHandlers());
	      results.append(prepareStyles());
	      results.append(">");
	      ResponseUtils.write(pageContext, results.toString());
		
		return (EVAL_PAGE);
		
	}
}
