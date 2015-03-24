package com.talent.dao.student;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.talent.dao.BaseDAO;

public class ScoreTypeDAO extends BaseDAO {
	
	public  List getScoreTypeList(){
		List list=null;
		Session session=null;
		try{
			session=this.beginTransaction();
			String hql="from ScoreType s order by s.scoretypeid";
			//String hql="from ClassVO c";
			Query query=session.createQuery(hql);
			Iterator it= query.iterate();
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
