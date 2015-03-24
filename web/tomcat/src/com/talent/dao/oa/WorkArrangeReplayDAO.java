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
 * @author 陈绍栋
 * @addtime 2007-3-6
 */

public class WorkArrangeReplayDAO extends BaseDAO {

	
	/**
	 * 查出该班论文科目所有调整
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
			if(form.getClassId()!=null&&!(form.getClassId().equals("-1"))){ //班级查询条件
				hql+=" and t.classId = "+form.getClassId();
			}
			
			if(form.getStartTime()!=null&&!(form.getStartTime().equals(""))){ //时间查询条件
				hql+=" and t.adjustTime >= '"+form.getStartTime()+"'";
			}
			if(form.getEndTime()!=null&&!(form.getEndTime().equals(""))){ //时间查询条件
				hql+=" and t.adjustTime <= '"+form.getEndTime()+"'";
			}
			 //查询总数
	    	Query q=session.createQuery("select count(*) " +hql);
	    	Iterator itr=q.iterate();
	    	if(itr.hasNext())
	    		pagination.setTotalCount(( (Integer)itr.next()).intValue());
	    
	    	//查询List
	    	hql +=" order by t.adjustId DESC ";
			Query query = session.createQuery(" select t   "  +hql);
		    query.setFirstResult((pagination.getCurrentPage()-1)*pagination.getRowsPerPage());
		    query.setMaxResults(pagination.getRowsPerPage());
		    
		    Iterator it=query.iterate();
		    while(it.hasNext()){
		    	CourseAdjust adjust=(CourseAdjust) it.next();
		    	//调整人
		    	adjust.setAdjusterName(CommonBiz.id2name(session, "Eosoperator", "operatorId", "operatorName", adjust.getAdjuster()+""));
		    	//格式化时间
		    	adjust.setTzDate(getDate(adjust.getAdjustTime()));
		    	adjust.setTzTime(getTime(adjust.getAdjustTime()));
		    	adjust.setFbDate(getDate(adjust.getNoticeTime()));
		    	//调整方式
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
						retStr="大屏";
						}else{
							retStr+=",大屏";
						}
					    break;
					case 1 :
						if(retStr ==""){
							retStr="外网";
							}else{
								retStr+=",外网";
							}
						    break;
					default :
						if(retStr ==""){
							retStr="短信";
							}else{
								retStr+=",短信";
							}
						    break;
				}
				
			}
		}
		return retStr;
		
	}	
	
	
}
