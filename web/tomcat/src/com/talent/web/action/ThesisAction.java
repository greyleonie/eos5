package com.talent.web.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.DynaActionForm;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.upload.FormFile;
import org.hibernate.Hibernate;


import com.mchange.v2.beans.BeansUtils;
import com.talent.common.CommonConstants;
import com.talent.common.Pagination;
import com.talent.common.TalentFunction;
import com.talent.common.file.FileManage;
import com.talent.dao.student.ClassDAO;
import com.talent.dao.student.ScoreTypeDAO;
import com.talent.dao.student.StudentDAO;
import com.talent.dao.student.ThesisDAO;
import com.talent.dao.teach.TeachingPlanUnitDAO;
import com.talent.hibernate.ClassVO;
import com.talent.hibernate.Eosoperator;
import com.talent.hibernate.ScoreType;
import com.talent.hibernate.TeachingPlanUnit;
import com.talent.hibernate.Thesis;
import com.talent.web.form.ThesisForm;

// 论文
public class ThesisAction extends DispatchAction {
	
	
	//教师批改论文
	 public ActionForward thesisList(ActionMapping mapping, ActionForm form,
             HttpServletRequest request,
             HttpServletResponse response) throws Exception {
		 if(request.getSession().getAttribute("user")==null){
			 return mapping.findForward("indexPage");
		 }
		 Eosoperator eosoperator=(Eosoperator) request.getSession().getAttribute("user");
		 ThesisForm thesisForm=(ThesisForm) form;
		 HttpSession session = request.getSession(true);
		 thesisForm.setTeacherId(eosoperator.getOperatorId());
		 Pagination pagination=thesisForm.getPagination();
	     pagination.doPage(request); //处理分页属性
		 ClassDAO classDAO=new ClassDAO();
		 ThesisDAO thesisDAO=new ThesisDAO();
		 List classList=classDAO.getClassList();
		 List thesisList=thesisDAO.getThesisListByPage(thesisForm);
		 request.setAttribute("classList", classList);
		 request.setAttribute("thesisList", thesisList);
		 //thesisForm.setClassList(classList);
		  return mapping.findForward("thesisList");
     }
	 
	 //查看论文内容
	 public ActionForward viewThesisContent(ActionMapping mapping, ActionForm form,
             HttpServletRequest request,
             HttpServletResponse response) throws Exception {
		 ThesisForm thesisForm=(ThesisForm) form;
		 ThesisDAO thesisDAO=new ThesisDAO();
		 Thesis thesis=thesisDAO.loadThesis(thesisForm.getThesisId());
		 Blob content = thesis.getThesisContent();
         FileManage.downloadFile(request, response, content, thesis.getThesisTitle(), thesis.getContentType());

		 
		 return null;
	 }
	 
	 //	进入批改论文
	 public ActionForward gradeThesis(ActionMapping mapping, ActionForm form,
             HttpServletRequest request,
             HttpServletResponse response) throws Exception {
		 
		 ThesisForm thesisForm=(ThesisForm) form;
		 ThesisDAO thesisDAO=new ThesisDAO();
		 Thesis thesis=thesisDAO.loadThesisExt(thesisForm.getThesisId());
		 ScoreTypeDAO scoreTypeDAO=new ScoreTypeDAO();
		 List scoreTypeList = scoreTypeDAO.getScoreTypeList();
		 request.setAttribute("thesis", thesis);
		 request.setAttribute("scoreTypeList", scoreTypeList);
         return mapping.findForward("gradeThesis");
	 }
	 //执行批改论文
	 public ActionForward gradeThesisDo(ActionMapping mapping, ActionForm form,
             HttpServletRequest request,
             HttpServletResponse response) throws Exception {
		 ThesisForm thesisForm=(ThesisForm) form;
		 ThesisDAO thesisDAO=new ThesisDAO();
		 thesisDAO.gradeThesis(thesisForm);
		 return thesisList(mapping, form, request, response);
	 }
	 
     //	学员上传论文列表
	 public ActionForward listThesis(ActionMapping mapping, ActionForm form,
             HttpServletRequest request,
             HttpServletResponse response) throws Exception {
		 if(request.getSession().getAttribute("user")==null){
			 return mapping.findForward("indexPage");
		 }
		 Date now = new Date();
		 ThesisDAO thesisDAO=new ThesisDAO();
		 StudentDAO studentDAO=new StudentDAO();
		 ClassDAO classDAO = new ClassDAO();
		 Eosoperator eosoperator=(Eosoperator) request.getSession().getAttribute("user");
		 Integer userId = eosoperator.getOperatorId();
		 Integer classId = studentDAO.getClassIdByUserId(userId);
		 ClassVO classVo = classDAO.findClassByClassID(classId);
		 if (classVo.getThesisDeadline() != null && classVo.getThesisDeadline().before(now)) 
		     request.setAttribute("isBeforeDeadline", "1");
		 else 
		     request.setAttribute("isBeforeDeadline", "0");
		 ThesisForm thesisForm=(ThesisForm) form;
		 HttpSession session = request.getSession(true);
		 thesisForm.setTeacherId(eosoperator.getOperatorId());
		 thesisForm.setClassId(classId);
		 Pagination pagination=thesisForm.getPagination();
	         pagination.doPage(request); //处理分页属性/
	         pagination.setRowsPerPage(20);
		 List thesisList=thesisDAO.getThesisListByClass(eosoperator.getOperatorName(),thesisForm);
		 request.setAttribute("thesisList", thesisList);
		  
		 return mapping.findForward("listThesis");
     }
	 
	 //进入上传文件
	 public ActionForward uploadThesis(ActionMapping mapping, ActionForm form,
             HttpServletRequest request,
             HttpServletResponse response) throws Exception {
		 if(request.getSession().getAttribute("user")==null){
			 return mapping.findForward("indexPage");
		 }
		 Eosoperator eosoperator=(Eosoperator) request.getSession().getAttribute("user");
		 ThesisForm thesisForm=(ThesisForm) form;
		 TeachingPlanUnitDAO planDAO=new TeachingPlanUnitDAO();
		 TeachingPlanUnit planUnit=planDAO.findLunwenUnitByStudentId(eosoperator.getOperatorId());
		 if(planUnit==null){
			 request.setAttribute(CommonConstants.MessageStr, "该班级没有论文科目！");
			 return mapping.findForward("messagePage");
		 }
		 ThesisDAO thesisDAO=new ThesisDAO();
		 Thesis thesis=thesisDAO.findThesisByStudentId(eosoperator.getOperatorId(), planUnit.getUnitId());
		 if(thesis==null){
			 thesis=new Thesis();
			 thesis.setTeachingGroupId(planUnit.getUnitId());
			 thesis.setStudentId(eosoperator.getOperatorId());
		 }
		 else {
			 if(TalentFunction.getInt(thesis.getState())==1){ //已否批改
				 request.setAttribute(CommonConstants.MessageStr, "您的文章已批改，不能再上传了！");
				 return mapping.findForward("messagePage");
			 }
		 }
		 saveToken(request); 
		 request.setAttribute("thesis",thesis );
		 return mapping.findForward("uploadThesis");
	 }
	 
	 //	执行上传文件
	 public ActionForward uploadThesisDo(ActionMapping mapping, ActionForm form,
             HttpServletRequest request,
             HttpServletResponse response) throws Exception {
		 ThesisForm thesisForm=(ThesisForm) form;
		 ThesisDAO thesisDAO = new ThesisDAO();
		 if (!isTokenValid(request)) {
			 saveToken(request); 
			 System.out.println("请勿重复提交");
			} else {
				resetToken(request); 

			 thesisDAO.uploadThesis(thesisForm);
			}

		
		 
		 
		 return listThesis(mapping, form, request, response);
	 }
}
