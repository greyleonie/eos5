/*
 * 创建日期 2006-3-1
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
package base.util;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.http.*;

import com.primeton.tp.core.prservice.context.RequestContext;


/**
 * @author Administrator
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class TalentContext {
	
	
	public static String getValue(PageContext pageContext,String dom,String path) {
		String value = "";
		if(dom == null) dom = "reqContext";
		
		RequestContext context = (RequestContext) pageContext.getAttribute(dom);
		if(context == null)
            context = (RequestContext)pageContext.getRequest().getAttribute(dom);
		if(context == null)
            context = (RequestContext)pageContext.getSession().getAttribute(dom);
		
		value = context.getProperty(path);
		 
		return value;
		
	}
	
	
	public static Object getEntity(PageContext pageContext,String dom,String path) {
		if(dom == null) dom = "reqContext";
		
		RequestContext context = (RequestContext) pageContext.getAttribute(dom);
		if(context == null)
            context = (RequestContext)pageContext.getRequest().getAttribute(dom);
		if(context == null)
            context = (RequestContext)pageContext.getSession().getAttribute(dom);
		
		if(context!=null) return context.getEntity(path);
		
		return null;
		
	}

}
