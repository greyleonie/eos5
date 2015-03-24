package com.talent.dao.student;


import java.util.Iterator;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import com.talent.dao.BaseDAO;
import com.talent.hibernate.ClassVO;
import com.talent.hibernate.Thesis;


public class ClassDAO extends BaseDAO {
	
	public  List getClassList(){
		List list=null;
		Session session=null;
		try{
			session=this.beginTransaction();
			String hql="from ClassVO c where c.enable=1 order by c.isHistoryClass asc,c.classId desc";
			Query query=session.createQuery(hql);
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
	
	public ClassVO findClassByClassID(Integer classId){
	        ClassVO classVo=null;
		Session session=null;
		try{
			session=this.beginTransaction();
			String hql=" from ClassVO t where t.classId=:classId";
			Query query=session.createQuery(hql);
			query.setString("classId", classId.toString());
			Iterator it=query.iterate();
			if(it.hasNext()){
			    classVo=(ClassVO) it.next();
			}
			if(classVo!=null)
				if(!Hibernate.isInitialized(classVo)) 
					Hibernate.initialize(classVo);
			//System.out.println("==================CLASSID" + classVo.getThesisDeadline() + "=================");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			this.endTransaction();
		}	
		return classVo;
	}

}
