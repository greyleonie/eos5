package com.talent.web.action;

import org.apache.struts.actions.DispatchAction;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForm;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import com.talent.dao.CourseDAO;
import com.talent.hibernate.Eosoperator;

import java.util.ArrayList;
import java.util.Calendar;

import com.talent.web.form.CourseForm;

public class CourseAction extends DispatchAction {
	public ActionForward currentCourse(ActionMapping map, ActionForm form,
			HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		Calendar calendar = Calendar.getInstance();
		int toyear = calendar.get(Calendar.YEAR);
		int tomonth = calendar.get(Calendar.MONTH)+1;
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();
		Document document = builder.newDocument();
		String year =  req.getParameter("year");
		//System.out.println(year);
	
		if (year == null)
			year = new Integer(toyear).toString();
		String month = req.getParameter("month");
		if (month == null) month = new Integer(tomonth).toString();
		Eosoperator user = (Eosoperator) req.getSession().getAttribute("user");
		CourseDAO dao = new CourseDAO();
		Element courseDom = dao.currentDateCourse(document,user,year,month);
		
		NodeList list = courseDom.getElementsByTagName("calendarCourse");
		for(int i=0;i<list.getLength();i++){
		   Element ee = (Element)list.item(i);
		   //System.out.println(ee.getElementsByTagName("courseRoom").item(0).getNodeValue());
		}
		
		//calendarCourse.getElementsByTagName("courseId").item(0).getFirstChild().getNodeValue()
		
		req.setAttribute("courseDom", courseDom);
		return map.findForward("currentCourse");
	}
	
	
}
