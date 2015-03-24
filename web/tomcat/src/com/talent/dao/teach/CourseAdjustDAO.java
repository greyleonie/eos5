/**
 * 
 */
package com.talent.dao.teach;


import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.talent.common.CommonBiz;
import com.talent.common.Pagination;
import com.talent.dao.BaseDAO;
import com.talent.dao.EosoperatorDAO;
import com.talent.hibernate.CourseAdjust;
import com.talent.hibernate.Student;
import com.talent.web.form.CourseAdjustForm;


/**
 * @title 
 * @description
 * @author 闁跨喐鏋婚幏鐑芥晸閺夋媽顔愰幏锟� * @addtime 2007-3-6
 */

public class CourseAdjustDAO extends BaseDAO {

	
	/**
	 * 闁跨喐鏋婚幏鐑芥晸閻偄搴滈幏鐑芥晸閺傘倖瀚归柨鐔惰寧閸栤剝瀚归惄顕�晸閺傘倖瀚归柨鐔峰建绾板瀚归柨鐔告灮閹凤拷
	 * @param studentId
	 * @return
	 */
	public ArrayList getAllAdjustByPage(CourseAdjustForm form,String studentId){
		ArrayList list=new ArrayList();
		Session session=null;
	
		Pagination pagination=form.getPagination();
		try{
			session=this.beginTransaction();
			
			 String hql="from CourseAdjust t where 1=1";	
			
			if(form.getClassId()!=null&&!(form.getClassId().equals("-1"))){ //闁跨喐纾ョ痪褔鏁撻弬銈嗗鐠囥垽鏁撻弬銈嗗闁跨噦鎷�
				hql+=" and t.classId = "+form.getClassId();
			}else{
				 com.talent.dao.student.StudentDAO studentDao=new com.talent.dao.student.StudentDAO();
				 Integer classId=studentDao.getClassIdByUserId(new Integer(studentId));
				 if(classId!=null&&!classId.equals(""))
				 {
					 hql+="and t.classId="+classId+"";
				 }
			}
			
			if(form.getStartTime()!=null&&!(form.getStartTime().equals(""))){ //时锟斤拷锟窖拷锟斤拷
				hql+=" and t.adjustTime >= '"+form.getStartTime()+"'";
			}
			if(form.getEndTime()!=null&&!(form.getEndTime().equals(""))){ //时锟斤拷锟窖拷锟斤拷
				hql+=" and t.adjustTime <= '"+form.getEndTime()+"'";
			}
			 //闁跨喐鏋婚幏鐤嚄闁跨喐鏋婚幏鐑芥晸閺傘倖瀚�
	    	Query q=session.createQuery("select count(*) " +hql);
	    	Iterator itr=q.iterate();
	    	if(itr.hasNext())
	    		pagination.setTotalCount(( (Integer)itr.next()).intValue());
	    
	    	//闁跨喐鏋婚幏鐤嚄List
	    	hql +=" order by t.adjustId DESC ";
			Query query = session.createQuery(" select t   "  +hql);
		    query.setFirstResult((pagination.getCurrentPage()-1)*pagination.getRowsPerPage());
		    query.setMaxResults(pagination.getRowsPerPage());
		    
		    Iterator it=query.iterate();
		    while(it.hasNext()){
		    	CourseAdjust adjust=(CourseAdjust) it.next();
		    	//闁跨喐鏋婚幏鐑芥晸閺傘倖瀚归柨鐔告灮閹凤拷
		    	adjust.setAdjusterName(CommonBiz.id2name(session, "Eosoperator", "operatorId", "operatorName", adjust.getAdjuster()+""));
		    	//闁跨喐鏋婚幏宄扮础闁跨喐鏋婚幏閿嬫闁跨喐鏋婚幏锟�		    	adjust.setClassId(adjust.getClassId());
		    	adjust.setTzDate(getDate(adjust.getAdjustTime()));
		    	adjust.setTzTime(getTime(adjust.getAdjustTime()));
		    	adjust.setFbDate(getDate(adjust.getNoticeTime()));
		    	//闁跨喐鏋婚幏鐑芥晸閺傘倖瀚瑰锟�		    	adjust.setFbMethod(getSendMethod(adjust.getNoticeMethod()));
		    	list.add(adjust);
		    }
		   
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			this.endTransaction();
		}
		return list;
	}
	
	public ArrayList getAdjustByPage(CourseAdjustForm form,String studentId){
		ArrayList list=new ArrayList();
		Session session=null;
	
		Pagination pagination=form.getPagination();
		try{
			session=this.beginTransaction();
			
			 String hql="from Course a,CourseAdjust b where Datediff(DAY,b.adjustTime,GETDATE())>=0 and Datediff(DAY,b.adjustTime,GETDATE())<7 and a.courseId=b.courseId and (a.teachers='"+studentId+"'or a.tutors like '"+studentId+",%' or a.tutors like '%,"+studentId+",%' or a.tutors like '%,"+studentId+"'or a.attenders='"+studentId+"')";		
			 //闁跨喐鏋婚幏鐤嚄闁跨喐鏋婚幏鐑芥晸閺傘倖瀚�
	    	
	    	//闁跨喐鏋婚幏鐤嚄List
	    	hql +=" order by b.adjustId DESC ";
			Query query = session.createQuery(" select b   "  +hql);
		    query.setFirstResult((pagination.getCurrentPage()-1)*pagination.getRowsPerPage());
		    query.setMaxResults(pagination.getRowsPerPage());
		    
		    Iterator it=query.iterate();
		    while(it.hasNext()){
		    	CourseAdjust adjust=(CourseAdjust) it.next();
		    	//闁跨喐鏋婚幏鐑芥晸閺傘倖瀚归柨鐔告灮閹凤拷
		    	adjust.setAdjusterName(CommonBiz.id2name(session, "Eosoperator", "operatorId", "operatorName", adjust.getAdjuster()+""));
		    	//闁跨喐鏋婚幏宄扮础闁跨喐鏋婚幏閿嬫闁跨喐鏋婚幏锟�		    	adjust.setClassId(adjust.getClassId());
		    	adjust.setTzDate(getDate(adjust.getAdjustTime()));
		    	adjust.setTzTime(getTime(adjust.getAdjustTime()));
		    	adjust.setFbDate(getDate(adjust.getNoticeTime()));
		    	//闁跨喐鏋婚幏鐑芥晸閺傘倖瀚瑰锟�		    	adjust.setFbMethod(getSendMethod(adjust.getNoticeMethod()));
		    	list.add(adjust);
		    }
		   
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			this.endTransaction();
		}
		return list;
	}
	
	
	
	
	public String getDate(Date date){
		String str = "";
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
		if(date !=null){
			str = format.format(date);
		}
		return str;
		
	}
	public String getTime(Date date){
		String str = "";
		SimpleDateFormat format = new SimpleDateFormat("HH:mm"); 
		if(date !=null){
			str = format.format(date);
		}
		return str;
		
	}
	public String getSendMethod(String noticemethod){
		String retStr = "";
		if(noticemethod!=null && !"".equalsIgnoreCase(noticemethod)){
			String[] str = noticemethod.split(",");
			for(int i=0;i<str.length;i++){
				int methodId = Integer.parseInt(str[i]);
				switch (methodId){
					case 0 : 
						if(retStr ==""){
						retStr="闁跨喐鏋婚幏鐑芥晸閺傘倖瀚�";
						}else{
							retStr+=",闁跨喐鏋婚幏鐑芥晸閺傘倖瀚�";
						}
					    break;
					case 1 :
						if(retStr ==""){
							retStr="闁跨喐鏋婚幏鐑芥晸閺傘倖瀚�";
							}else{
								retStr+=",闁跨喐鏋婚幏鐑芥晸閺傘倖瀚";
							}
						    break;
					default :
						if(retStr ==""){
							retStr="闁跨喐鏋婚幏鐑芥晸閺傘倖瀚";
							}else{
								retStr+=",闁跨喐鏋婚幏鐑芥晸閺傘倖瀚";
							}
						    break;
				}
				
			}
		}
		return retStr;
		
	}	
	
	
}
