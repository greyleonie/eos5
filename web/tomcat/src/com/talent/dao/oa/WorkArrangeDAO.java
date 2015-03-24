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
import com.talent.common.TalentFunction;
import com.talent.common.WebPrimary;
import com.talent.dao.BaseDAO;
import com.talent.hibernate.WorkArrange;
import com.talent.hibernate.WorkArrangeReplay;
import com.talent.web.form.WorkArrangeForm;


/**
 * @title 
 * @description
 * @author 陈绍栋
 * @addtime 2007-3-6
 */

public class WorkArrangeDAO extends BaseDAO {

	
	/**
	 * 查看当前用户所有工作安排
	 * @param studentId
	 * @return
	 */
	public ArrayList getAllWorkArrangeWithPage(WorkArrangeForm form){
		ArrayList list=new ArrayList();
		Session session=null;
		Pagination pagination=form.getPagination();
		String curUserId = form.getTeacherID();
		try{
			session=this.beginTransaction();
			String hql="from WorkArrange t where 1=1";
			if(form.getTeacherID()!=null){ //班级查询条件
				hql+=" and (t.beArrangedIds like '"+form.getTeacherID()+
				"' or t.beArrangedIds like '"+form.getTeacherID()+
				",%' or t.beArrangedIds like '%,"+form.getTeacherID()+
				",%' or t.beArrangedIds like '%,"+form.getTeacherID()+"')";
			}

		
			 //查询总数
	    	Query q=session.createQuery("select count(*) " +hql);
	    	Iterator itr=q.iterate();
	    	if(itr.hasNext())
	    		pagination.setTotalCount(( (Integer)itr.next()).intValue());
	    
	    	//查询List
	    	hql +=" order by t.arrangeId DESC ";
			Query query = session.createQuery(" select t   "  +hql);
		    query.setFirstResult((pagination.getCurrentPage()-1)*pagination.getRowsPerPage());
		    query.setMaxResults(pagination.getRowsPerPage());
		    
		    Iterator it=query.iterate();
		    while(it.hasNext()){
		    	WorkArrange arrange=(WorkArrange) it.next();
		    	//制定人
		    	arrange.setUserName(CommonBiz.id2name(session, "Eosoperator", "operatorId", "operatorName", arrange.getUserid()+""));
		    	//格式化时间
		    	arrange.setCalendarDate(getDate(arrange.getCalendar()));
		    	arrange.setType(isReaded(form.getTeacherID(),arrange.getHaveReadIds()));
		    	list.add(arrange);
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
	/**
	 * 查看当前用户具体一个工作安排
	 * @param studentId
	 * @return
	 */
	public WorkArrange viewWorkArrangeByID(WorkArrangeForm form){
		WorkArrange arrange=new WorkArrange();
		Session session=null;
		try{
			session=this.beginTransaction();
			String hql="from WorkArrange t where 1=1";
			String arrangeID = form.getArrangeID();

			
	    	hql +=" and t.arrangeId = "+arrangeID;
			Query query = session.createQuery(" select t   "  +hql);
		    Iterator it=query.iterate();
		    if(it.hasNext()){
		    	 arrange=(WorkArrange) it.next();
		    	//制定人
		    	arrange.setUserName(CommonBiz.id2name(session, "Eosoperator", "operatorId", "operatorName", arrange.getUserid()+""));
		    	//格式化时间
		    	arrange.setCalendarDate(getDate(arrange.getCalendar()));
		    	arrange.setType(isReaded(form.getTeacherID(),arrange.getHaveReadIds()));
		    }
		   
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			this.endTransaction();
		}
		return arrange;
	}
	/**
	 * 查看当前用户具体一个工作安排
	 * @param studentId
	 * @return
	 */
	public WorkArrangeReplay viewArrangeReplayByID(String arrangeID){
		WorkArrangeReplay replay=new WorkArrangeReplay();
		Session session=null;
		try{
			session=this.beginTransaction();
			String hql="from WorkArrangeReplay t where 1=1";
	    	hql +=" and t.arrangeId = "+arrangeID;
			Query query = session.createQuery(" select t   "  +hql);
		    Iterator it=query.iterate();
		    if(it.hasNext()){
		    	replay=(WorkArrangeReplay) it.next();
		    }
		   
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			this.endTransaction();
		}
		return replay;
	}
	/**
	 * 插入安排回复
	 * @param studentId
	 * @return
	 */
	public void insertArrangeReply(WorkArrangeForm form){
		WorkArrangeReplay replay=new WorkArrangeReplay();
		replay.setArrangeId(new Integer(form.getArrangeID()));
		replay.setReply(form.getReplyContent());
		replay.setUserid(new Integer(form.getTeacherID()));
		replay.setReplyTime(TalentFunction.getCurDate());
		replay.setReplayId(new Integer(WebPrimary.getPrimaryTemp("dx.WorkArrangeReplay", "ReplayID")));
		
		WorkArrange arrange= viewWorkArrangeByID(form);
		String ids= arrange.getHaveReadIds();
		if(ids == null || "".equals(ids)){
			ids=form.getTeacherID();
		}else{
			ids +=","+form.getTeacherID();
		}
		arrange.setHaveReadIds(ids);
		
		
		Session session=null;
		try{
			session=this.beginTransaction();
	    	session.save(replay);
	    	session.update(arrange);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			this.endTransaction();
		}
	}
	public String getDate(Date date){
		String str = "";
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
		if(date !=null){
			str = format.format(date);
		}
		return str;
		
	}
	/*
	 * 判断是否查看
	 */
	public String isReaded(String userID,String haveReadIDs){
		String str = "0";
		if(haveReadIDs ==null || "".equals(haveReadIDs)){
			return str;
		}
		String readID[] = haveReadIDs.split(",");
		for(int i=0;i<readID.length;i++){
			if(userID.equals(readID[i])){
				str ="1";
				break;
			}
		}
		return str;
		
	}

	
}
