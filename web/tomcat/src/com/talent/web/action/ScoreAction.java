package com.talent.web.action;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.talent.dao.ICCard.StudentlaterLogsDAO;
import com.talent.dao.student.ScoreDAO;
import com.talent.hibernate.Eosoperator;
import com.talent.hibernate.StudentlaterLogs;

public class ScoreAction extends DispatchAction {

	public ActionForward viewScore(ActionMapping mapping, ActionForm form,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {
		if(request.getSession().getAttribute("user")==null){
			 return mapping.findForward("indexPage");
		}
		Eosoperator eosoperator=(Eosoperator) request.getSession().getAttribute("user");
		System.out.println(eosoperator.getOperatorId());
		ScoreDAO scoreDAO=new ScoreDAO();
		List scoreList = scoreDAO.getScoreListByStudentId(eosoperator.getOperatorId());
		request.setAttribute("scoreList", scoreList);//³É¼¨
		StudentlaterLogsDAO logsDAO=new StudentlaterLogsDAO();
		HashMap map=logsDAO.getKqStatByStudentId(eosoperator.getOperatorId());
		request.setAttribute("kqMap", map);//¿¼ÇÚ
		return mapping.findForward("viewScore");
	}
}
