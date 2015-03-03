/*
 * 创建日期 2006-2-27
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
package base.util;

import java.net.*;
import java.util.*;

import javax.servlet.http.*;
import javax.servlet.jsp.*;

import org.apache.struts.taglib.html.LinkTag;
import org.apache.struts.util.*;

import org.apache.commons.logging.*;

import com.primeton.tp.core.prservice.context.RequestContext;

/**
 * @author Administrator
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class TalentLinkDom extends LinkTag {
	private String operation;//权限，书定格式为ModuleID.OperationType
	private boolean disableView;//当没有权限时，是不是显示
	private boolean hasPermission;
	private boolean prefix;
	private String domname;//从DOM中取数据DOM对象
	private String dompath;//DOM中的节点
	
	/**
	 * @return 返回 dompath。
	 */
	public String getDompath() {
		return dompath;
	}
	/**
	 * @param dompath 要设置的 dompath。
	 */
	public void setDompath(String dompath) {
		this.dompath = dompath;
	}
	/**
	 * @return 返回 disableView。
	 */
	public boolean isDisableView() {
		return disableView;
	}
	/**
	 * @param disableView 要设置的 disableView。
	 */
	public void setDisableView(boolean disableView) {
		this.disableView = disableView;
	}
	/**
	 * @return 返回 domname。
	 */
	public String getDomname() {
		return domname;
	}
	/**
	 * @param domname 要设置的 domname。
	 */
	public void setDomname(String domname) {
		this.domname = domname;
	}
	/**
	 * @return 返回 hasPermission。
	 */
	public boolean isHasPermission() {
		return hasPermission;
	}
	/**
	 * @param hasPermission 要设置的 hasPermission。
	 */
	public void setHasPermission(boolean hasPermission) {
		this.hasPermission = hasPermission;
	}
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
	 * @return 返回 prefix。
	 */
	public boolean isPrefix() {
		return prefix;
	}
	/**
	 * @param prefix 要设置的 prefix。
	 */
	public void setPrefix(boolean prefix) {
		this.prefix = prefix;
	}
	public TalentLinkDom() {
		operation=null;
	    disableView=true;
	    hasPermission=false;
	    prefix=true;
	}
	
	public int doStartTag() throws JspException {
	 	HttpSession session = pageContext.getSession();
	    if(session==null)
	      hasPermission = false;
	    else{
	      try {
	        hasPermission = new RightParse().parse(operation,session);
	      }
	      catch (Exception ex) {
	        ex.printStackTrace();
	        throw new JspException(ex);
	      }
	    }
	    
	    if(!hasPermission){
	        text = null;
	        return 2;
	     }
	    if (hasPermission && linkName != null) {
	        StringBuffer results = new StringBuffer("<a name=\"");
	        results.append(linkName);
	        results.append("\">");
	        ResponseUtils.write(pageContext, results.toString());
	        return 2;
	     }
	    
	    Map params = RequestUtils.computeParameters(pageContext, paramId, paramName,
                paramProperty, paramScope, name,
                property, scope, transaction);
	    
	    String url = null;
	    
	    try{
	    	url = RequestUtils.computeURL(pageContext, forward, href, page, params,
                    anchor, false);
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
	    
	    StringBuffer results = new StringBuffer("");
	    if (hasPermission) {
	      results.append("<a href=\"");
	      if(url!=null&&url.startsWith("/")&&prefix)
	        url = ((HttpServletRequest)pageContext.getRequest()).getContextPath()+url;
	      results.append(url);
	      results.append("\"");
	      if (target != null) {
	        results.append(" target=\"");
	        results.append(target);
	        results.append("\"");
	      }
	      
	      if(domname!=null&&dompath!=null) {
	      	RequestContext context = (RequestContext)pageContext.getAttribute(domname);
			if(context == null)
	            context = (RequestContext)pageContext.getRequest().getAttribute(domname);
			if(context == null)
	            context = (RequestContext)pageContext.getSession().getAttribute(domname);
			 
			if(context == null) throw new JspException("context can not find");
			 
			Object value = null;
			value = context.getProperty(dompath);
			if(value == null) value = "";
			String moduleID = value.toString();
			
			if(!"".equals(moduleID)) {
				results.append(" aid=\"");
		        results.append(moduleID);
		        results.append("\"");
			}
	      }
	      results.append(prepareStyles());
	      results.append(prepareEventHandlers());
	      results.append(">");
	    }
	    ResponseUtils.write(pageContext, results.toString());
	    text = null;
	    
	   return 2;
	 }
	
	public int doEndTag() throws JspException{
	    StringBuffer results = new StringBuffer();
	        if(text == null)
	          text=" ";
	        results.append(text);
	        if(hasPermission)
	            results.append("</a>");
	        ResponseUtils.write(pageContext, results.toString());
	        return 6;
	  }

}
