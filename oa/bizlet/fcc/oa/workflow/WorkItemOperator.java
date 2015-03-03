package fcc.oa.workflow;

import javax.servlet.jsp.tagext.TagSupport;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import base.util.TalentContext;

/**
 * @author Administrator
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class WorkItemOperator extends TagSupport {
	
	private String rootDom = null;
	private String pageDom = null;
	private String rootPath = null;
	private String pagePath = null;
	
	
	public int doStartTag() throws JspException {
		if(pageDom == null || pagePath == null) return TagSupport.SKIP_BODY;
		if(rootDom == null ||"".equals(rootDom)) rootDom = "reqContext";
		//if(rootPath == null || "".equals(rootPath)) 
		rootPath = "SessionEntity/userName";
		
		String userIDs = TalentContext.getValue(this.pageContext,pageDom,pagePath);
		String currentUserID = TalentContext.getValue(this.pageContext,rootDom,rootPath);
		
		if(userIDs == null || "".equals(userIDs)) return TagSupport.SKIP_BODY;
		if(userIDs.indexOf(currentUserID) > -1) return TagSupport.EVAL_BODY_INCLUDE;
		
		return TagSupport.SKIP_BODY;
	}
	
	public boolean hasOperator(String userIDs,String currentUserID){
		String temp[] = currentUserID.split(",");
		for (int i = 0 ; i<temp.length; i++){
			if(temp[i]!=null)
				if(userIDs.indexOf(currentUserID)>=0)
					return true;
		}
		return false;
	}
	
	public int doEndTag()  throws JspException{
	      return TagSupport.EVAL_PAGE;
	  }
	
	

	public static void main(String[] args) {
	}
	/**
	 * @return 返回 pageDom。
	 */
	public String getPageDom() {
		return pageDom;
	}
	/**
	 * @param pageDom 要设置的 pageDom。
	 */
	public void setPageDom(String pageDom) {
		this.pageDom = pageDom;
	}
	/**
	 * @return 返回 pagePath。
	 */
	public String getPagePath() {
		return pagePath;
	}
	/**
	 * @param pagePath 要设置的 pagePath。
	 */
	public void setPagePath(String pagePath) {
		this.pagePath = pagePath;
	}
	/**
	 * @return 返回 rootDom。
	 */
	public String getRootDom() {
		return rootDom;
	}
	/**
	 * @param rootDom 要设置的 rootDom。
	 */
	public void setRootDom(String rootDom) {
		this.rootDom = rootDom;
	}
	/**
	 * @return 返回 rootPath。
	 */
	public String getRootPath() {
		return rootPath;
	}
	/**
	 * @param rootPath 要设置的 rootPath。
	 */
	public void setRootPath(String rootPath) {
		this.rootPath = rootPath;
	}
}
