package com.talent.web.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.talent.dao.LoginDAO;
import com.talent.dao.student.StudentDAO;
import com.talent.hibernate.ClassVO;
import com.talent.hibernate.Eosoperator;
import com.talent.web.form.LoginForm;

public class LoginAction extends DispatchAction{
    public ActionForward login(ActionMapping mapping, ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {
		LoginForm actionForm=(LoginForm) form;
		LoginDAO loginDAO=new LoginDAO();
		ArrayList list=new ArrayList();
		String userName=actionForm.getUsername();
		String password=actionForm.getPassword();
		if(userName==null)userName="";
		if(password==null)password="";
		System.out.println("=======================userName:"+userName);		
		list=(ArrayList)loginDAO.getUser(userName, password);
		if(list==null || list.size() ==0){
			
			request.setAttribute("errorStr", "登录失败！用户名或密码有误！");
			return mapping.findForward("indexPage");
		}
		else if(list.size() ==1){
			Eosoperator user = (Eosoperator)list.get(0);
			if(user.getOperatorType()==null||user.getOperatorType().intValue()==2){
				
				request.setAttribute("errorStr", "您没有权限进入该系统！");
				return mapping.findForward("indexPage");
			}
			else{	
				request.getSession().setAttribute("user", user);
				return mapping.findForward("mainPage");
			}
		}else{
			
			Iterator it = list.iterator();
			ArrayList classList = new ArrayList();
			ClassVO classes = new ClassVO();
			while(it.hasNext()){
				HashMap map = new HashMap();
				Eosoperator user = (Eosoperator)it.next();
				StudentDAO studentDAO = new StudentDAO();
				ArrayList list1 =studentDAO.getClassNameIsHistoryByUserId(user.getOperatorId());
				Iterator it1 = list1.iterator();
				while(it1.hasNext()){
				    ClassVO s = (ClassVO)it1.next();
				    String className = s.getClassName();
				    Integer isHistoryClass = s.getIsHistoryClass();
				    int d = isHistoryClass.intValue();
				    map.put("className", className);
				    map.put("isHistoryClass", isHistoryClass);
				}
				map.put("operatorID", user.getOperatorId()+"");
				request.getSession().setAttribute("user", user);
				classList.add(map);
			}
			System.out.println("=============请您选择要进入的班级");
			request.setAttribute("errorStr", "请您选择要进入的班级 ......");
			request.setAttribute("classList", classList);
			return mapping.findForward("selectClassPage");
			
		}
	}
   
   
	
	public ActionForward selectClass(ActionMapping mapping, ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {
		LoginDAO loginDAO=new LoginDAO();
		String operatorId = (String)request.getParameter("operatorId");
		Eosoperator user = (Eosoperator)loginDAO.getUserByOperatorID(operatorId);
			if(user.getOperatorType()==null||user.getOperatorType().intValue()==2){
				request.setAttribute("errorStr", "你在此班级的权限已取消，请选择其它班级");
				return mapping.findForward("selectClassPage");
			}
			else{
				request.getSession().setAttribute("user", user);
				return mapping.findForward("mainPage");
			}
		
	}
	
	public ActionForward logout(ActionMapping mapping, ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {
		Eosoperator user=(Eosoperator) request.getSession().getAttribute("user");
		System.out.println(user.getPassword());
		request.getSession().removeAttribute("user");
		return mapping.findForward("indexPage"); 
	
	}
	
	public ActionForward modPassword(ActionMapping mapping, ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {
		String operatorId=request.getParameter("operatorId").toString();
		String newPassword=LoginDAO.getPassword(request.getParameter("newPassword"));
		String oldPassword=LoginDAO.getPassword(request.getParameter("oldPassword"));
		LoginDAO loginDAO=new LoginDAO();
		String meg="";
		if(!loginDAO.modPassword(operatorId, newPassword, oldPassword)){
			meg="密码修改失败!";
		}
		else{
			meg="密码修改成功，请牢记新密码！";
		}
		request.setAttribute("meg", meg);
		return new ActionForward("/modPasswordDo.jsp");
	}
}
