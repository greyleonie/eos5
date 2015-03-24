package com.talent.web.action;

import java.util.List;

import org.apache.struts.actions.DispatchAction;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForm;

import com.talent.dao.classNew.NewDAO;


import com.talent.web.form.CourseAdjustForm;
import com.talent.web.form.NewsForm;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ClassNewsAction extends DispatchAction {
	List newList=null;
	public ActionForward classNew(ActionMapping map, ActionForm form,
			HttpServletRequest req, HttpServletResponse res) throws Exception {
		 NewsForm newsForm=(NewsForm) form;
		NewDAO news=new NewDAO();
		String cote="";
		String gCoute="";
		cote=req.getParameter("cote");
		
		if(cote.equals("1")){
			gCoute="校园新闻";
			
		}else if(cote.equals("2")){
			gCoute="校院通知";
		}else if(cote.equals("3")){
			gCoute="会议公告";
		}else if(cote.equals("4")){
			gCoute="部门公告";
		}
		newList=news.getClassList(newsForm,gCoute);
		req.setAttribute("gCoute", gCoute);	
		req.setAttribute("cote", cote);
		req.setAttribute("newList", newList);
		return map.findForward("viewNews");
	}
	public ActionForward showNew(ActionMapping map, ActionForm form,
			HttpServletRequest req, HttpServletResponse res) throws Exception {
		NewsForm newsForm=(NewsForm) form;
		NewDAO news=new NewDAO();
		String id=req.getParameter("newsId");
		newList=news.getOneList(id);
		req.setAttribute("newList", newList);
		return map.findForward("showNews");
	}
	public ActionForward allNew(ActionMapping map, ActionForm form,
			HttpServletRequest req, HttpServletResponse res) throws Exception {
		NewsForm newsForm=(NewsForm) form;
		NewDAO news=new NewDAO();	
		newList=news.getNewList();
		
		req.setAttribute("newList", newList);
		return map.findForward("allNews");
	}
}
