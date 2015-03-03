/*
 * �������� 2006-1-16
 *
 * TODO Ҫ���Ĵ����ɵ��ļ���ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
package base.util;

import java.net.*;
import java.util.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

import org.apache.struts.taglib.html.LinkTag;
import org.apache.struts.util.*;

import com.primeton.tp.core.prservice.context.RequestContext;




/**
 * @author Administrator
 *
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
public class TalentLink extends LinkTag{
	private String operation;//Ȩ�ޣ��鶨��ʽΪModuleID.OperationType
	private boolean disableView;//��û��Ȩ��ʱ���ǲ�����ʾ
	private boolean hasPermission;
	private boolean prefix;
	
	private String paramjs;//js���в���
	private String domname;//DOM������ҳ���ڵ�����
	
	/**
	 * @return ���� domname��
	 */
	public String getDomname() {
		return domname;
	}
	/**
	 * @param domname Ҫ���õ� domname��
	 */
	public void setDomname(String domname) {
		this.domname = domname;
	}
	/**
	 * @return ���� paramjs��
	 */
	public String getParamjs() {
		return paramjs;
	}
	/**
	 * @param paramjs Ҫ���õ� paramjs��
	 */
	public void setParamjs(String paramjs) {
		this.paramjs = paramjs;
	}
	public TalentLink() {
		operation=null;
	    disableView=true;
	    hasPermission=false;
	    prefix=true;
	}
	
	/**
	 * @return ���� disableView��
	 */
	public boolean isDisableView() {
		return disableView;
	}
	/**
	 * @param disableView Ҫ���õ� disableView��
	 */
	public void setDisableView(boolean disableView) {
		this.disableView = disableView;
	}
	/**
	 * @return ���� hasPermission��
	 */
	public boolean isHasPermission() {
		return hasPermission;
	}
	/**
	 * @param hasPermission Ҫ���õ� hasPermission��
	 */
	public void setHasPermission(boolean hasPermission) {
		this.hasPermission = hasPermission;
	}
	/**
	 * @return ���� operation��
	 */
	public String getOperation() {
		return operation;
	}
	/**
	 * @param operation Ҫ���õ� operation��
	 */
	public void setOperation(String operation) {
		this.operation = operation;
	}
	/**
	 * @return ���� prefix��
	 */
	public boolean isPrefix() {
		return prefix;
	}
	/**
	 * @param prefix Ҫ���õ� prefix��
	 */
	public void setPrefix(boolean prefix) {
		this.prefix = prefix;
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
	      
	      if(paramjs!=null&&domname!=null) {
	      	RequestContext context = (RequestContext)pageContext.getAttribute(domname);
			if(context == null)
	            context = (RequestContext)pageContext.getRequest().getAttribute(domname);
			if(context == null)
	            context = (RequestContext)pageContext.getSession().getAttribute(domname);
			 
			if(context == null) throw new JspException("context can not find");
			
			
			String[] pjsArray = paramjs.split(",");
			for(int i = 0; i < pjsArray.length; i++) {
				String[] temp = pjsArray[i].split("=");
				String tempName = temp[0];
				String tempPath = temp[1];
				results.append(" " + tempName + "=\"");
				results.append(context.getProperty(tempPath));
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
