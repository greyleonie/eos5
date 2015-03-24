package com.talent.web.action;

import org.apache.struts.actions.DispatchAction;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.talent.common.Pagination;
import com.talent.dao.student.ClassDAO;
import com.talent.dao.student.StudentDAO;
import com.talent.dao.teach.CourseAdjustDAO;
import com.talent.hibernate.Eosoperator;

import java.util.List;

import com.talent.web.form.CourseAdjustForm;


public class CourseAdjustAction extends DispatchAction{
  public ActionForward courseAdjust(ActionMapping mapping,ActionForm form,HttpServletRequest request,
		  	HttpServletResponse response){
		 if(request.getSession().getAttribute("user")==null){
			 return mapping.findForward("indexPage");
		 }
		 CourseAdjustForm adjustForm=(CourseAdjustForm) form;
		 Eosoperator eosoperator=(Eosoperator) request.getSession().getAttribute("user");
			System.out.println(eosoperator.getOperatorId());
		 String pd=request.getParameter("pd");
	     
		 String studentId=eosoperator.getOperatorId().toString();
		
		 Pagination pagination=adjustForm.getPagination();
	     pagination.doPage(request); //锟斤拷锟斤拷锟揭筹拷锟斤拷锟�
		 ClassDAO classDAO=new ClassDAO();
		 StudentDAO studentDAO= new StudentDAO();
		 Integer classId;
		 if(adjustForm.getClassId()!=null&&!(adjustForm.getClassId().equals("-1"))){
			 classId=new Integer(adjustForm.getClassId());
		 }else{
		 classId=studentDAO.getClassIdByUserId(new Integer(studentId));
		 }
		 CourseAdjustDAO adjustDAO=new CourseAdjustDAO();
		 List classList=classDAO.getClassList();
		 List adjustList=null;
		 if(classId==null){
			 classId=new Integer("0");
		 }
		 if(pd!=null&&pd.equals("Y")){
			 adjustList=adjustDAO.getAdjustByPage(adjustForm,studentId);
		 }else
		 {
			adjustList=adjustDAO.getAllAdjustByPage(adjustForm,studentId);
		 }
		 request.setAttribute("pd", pd);
		 request.setAttribute("classId", classId);
		 request.setAttribute("classList", classList);
		 request.setAttribute("adjustList", adjustList);
		 return mapping.findForward("viewAllAdjust");
  }
}
