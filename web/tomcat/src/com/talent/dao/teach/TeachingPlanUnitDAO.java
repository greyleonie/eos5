/**
 * 
 */
package com.talent.dao.teach;


import java.util.Iterator;

import org.hibernate.Query;
import org.hibernate.Session;

import com.talent.dao.BaseDAO;
import com.talent.hibernate.TeachingPlanUnit;

/**
 * @title 
 * @description
 * @author 陈绍栋
 * @addtime 2007-3-6
 */

public class TeachingPlanUnitDAO extends BaseDAO {

	
	/**
	 * 根据studentId查出该班论文科目
	 * @param studentId
	 * @return
	 */
	public TeachingPlanUnit findLunwenUnitByStudentId(Integer studentId){
		TeachingPlanUnit planUnit=null;
		Session session=null;
		try{
			session=this.beginTransaction();
			String hql="select t  from TeachingPlanUnit t ,Student s where t.scoringMethod=2 and t.classId=s.classId and s.studentId=:studentId";
			Query query=session.createQuery(hql);
			query.setString("studentId", studentId.toString());
			Iterator it=query.iterate();
			if(it.hasNext()){
				planUnit=(TeachingPlanUnit) it.next();
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			this.endTransaction();
		}
		return planUnit;
	}
	
}
