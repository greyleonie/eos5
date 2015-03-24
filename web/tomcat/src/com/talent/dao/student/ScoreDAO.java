package com.talent.dao.student;


import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.talent.dao.BaseDAO;

public class ScoreDAO extends BaseDAO{
	
	public  List getScoreListByStudentId(Integer studentId){
		List list=null;
		Session session=null;
		try{
			session=this.beginTransaction();
			String hql="from Score s where s.student.studentId=:studentId order by s.classSubject.subjectNo asc";
			Query query=session.createQuery(hql);
			//query.setFetchSize(0);
			//query.setMaxResults(10);
			query.setString("studentId", studentId.toString());
			list=query.list();
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			this.endTransaction();
		}
		return list;
	}

}
