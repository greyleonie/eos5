package com.talent.web.action;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.talent.common.Pagination;
import com.talent.dao.oa.WorkArrangeDAO;
import com.talent.hibernate.Eosoperator;
import com.talent.hibernate.WorkArrange;
import com.talent.hibernate.WorkArrangeReplay;
import com.talent.web.form.WorkArrangeForm;

// 工作安排
public class WorkArrangeAction extends DispatchAction {
	//显示所有工作安排
	 public ActionForward arrangeList(ActionMapping mapping, ActionForm form,
             HttpServletRequest request,
             HttpServletResponse response) throws Exception {
		 if(request.getSession().getAttribute("user")==null){
			 return mapping.findForward("indexPage");
		 }
		 Eosoperator eosoperator=(Eosoperator) request.getSession().getAttribute("user");
		 WorkArrangeForm arrangeForm=(WorkArrangeForm) form;
		 arrangeForm.setTeacherID(eosoperator.getOperatorId()+"");
		 Pagination pagination=arrangeForm.getPagination();
	     pagination.doPage(request); //处理分页属性
		 WorkArrangeDAO arrangeDAO=new WorkArrangeDAO();
		 List arrangeList=arrangeDAO.getAllWorkArrangeWithPage(arrangeForm);
		 request.setAttribute("arrangeList", arrangeList);
		  return mapping.findForward("arrangeList");
     }
	 public ActionForward arrangeView(ActionMapping mapping, ActionForm form,
             HttpServletRequest request,
             HttpServletResponse response) throws Exception {
		 if(request.getSession().getAttribute("user")==null){
			 return mapping.findForward("indexPage");
		 }
		 Eosoperator eosoperator=(Eosoperator) request.getSession().getAttribute("user");
		 WorkArrangeForm arrangeForm=(WorkArrangeForm) form;
		 arrangeForm.setTeacherID(eosoperator.getOperatorId()+"");
		 String arrangeID = request.getParameter("arrangeID");
		 arrangeForm.setArrangeID(arrangeID);
		 WorkArrangeDAO arrangeDAO=new WorkArrangeDAO();
		 WorkArrange arrange=arrangeDAO.viewWorkArrangeByID(arrangeForm);
		 WorkArrangeReplay replay=arrangeDAO.viewArrangeReplayByID(arrangeID);
		 request.setAttribute("replay", replay);
		 request.setAttribute("arrange", arrange);
		 return mapping.findForward("arrangeView");
     }
	 
	 public ActionForward replyDo(ActionMapping mapping, ActionForm form,
             HttpServletRequest request,
             HttpServletResponse response) throws Exception {
		 if(request.getSession().getAttribute("user")==null){
			 return mapping.findForward("indexPage");
		 }
		 Eosoperator eosoperator=(Eosoperator) request.getSession().getAttribute("user");
		 WorkArrangeForm arrangeForm=(WorkArrangeForm) form;
		 arrangeForm.setTeacherID(eosoperator.getOperatorId()+"");
		 WorkArrangeDAO arrangeDAO=new WorkArrangeDAO();
		 arrangeDAO.insertArrangeReply(arrangeForm);
		 return mapping.findForward("success");
     }
}
