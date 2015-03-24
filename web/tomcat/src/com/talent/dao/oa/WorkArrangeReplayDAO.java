/**
 * 
 */
package com.talent.dao.oa;


import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;

import org.hibernate.Query;
import org.hibernate.Session;

import com.talent.common.CommonBiz;
import com.talent.common.Pagination;
import com.talent.dao.BaseDAO;
import com.talent.dao.EosoperatorDAO;
import com.talent.hibernate.CourseAdjust;
import com.talent.web.form.CourseAdjustForm;


/**
 * @title 
 * @description
 * @author ���ܶ�
 * @addtime 2007-3-6
 */

public class WorkArrangeReplayDAO extends BaseDAO {

	
	/**
	 * ����ð����Ŀ�Ŀ���е���
	 * @param studentId
	 * @return
	 */
	public ArrayList getAllAdjustByPage(CourseAdjustForm form){
		ArrayList list=new ArrayList();
		Session session=null;
		Pagination pagination=form.getPagination();
		try{
			session=this.beginTransaction();
			String hql="from CourseAdjust t where 1=1";
			if(form.getClassId()!=null&&!(form.getClassId().equals("-1"))){ //�༶��ѯ����
				hql+=" and t.classId = "+form.getClassId();
			}
			
			if(form.getStartTime()!=null&&!(form.getStartTime().equals(""))){ //ʱ���ѯ����
				hql+=" and t.adjustTime >= '"+form.getStartTime()+"'";
			}
			if(form.getEndTime()!=null&&!(form.getEndTime().equals(""))){ //ʱ���ѯ����
				hql+=" and t.adjustTime <= '"+form.getEndTime()+"'";
			}
			 //��ѯ����
	    	Query q=session.createQuery("select count(*) " +hql);
	    	Iterator itr=q.iterate();
	    	if(itr.hasNext())
	    		pagination.setTotalCount(( (Integer)itr.next()).intValue());
	    
	    	//��ѯList
	    	hql +=" order by t.adjustId DESC ";
			Query query = session.createQuery(" select t   "  +hql);
		    query.setFirstResult((pagination.getCurrentPage()-1)*pagination.getRowsPerPage());
		    query.setMaxResults(pagination.getRowsPerPage());
		    
		    Iterator it=query.iterate();
		    while(it.hasNext()){
		    	CourseAdjust adjust=(CourseAdjust) it.next();
		    	//������
		    	adjust.setAdjusterName(CommonBiz.id2name(session, "Eosoperator", "operatorId", "operatorName", adjust.getAdjuster()+""));
		    	//��ʽ��ʱ��
		    	adjust.setTzDate(getDate(adjust.getAdjustTime()));
		    	adjust.setTzTime(getTime(adjust.getAdjustTime()));
		    	adjust.setFbDate(getDate(adjust.getNoticeTime()));
		    	//������ʽ
		    	adjust.setFbMethod(getSendMethod(adjust.getNoticeMethod()));
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
						retStr="����";
						}else{
							retStr+=",����";
						}
					    break;
					case 1 :
						if(retStr ==""){
							retStr="����";
							}else{
								retStr+=",����";
							}
						    break;
					default :
						if(retStr ==""){
							retStr="����";
							}else{
								retStr+=",����";
							}
						    break;
				}
				
			}
		}
		return retStr;
		
	}	
	
	
}
