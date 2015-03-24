package com.talent.dao.student;

import java.io.File;
import java.io.FileOutputStream;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.sql.Timestamp;



import org.apache.struts.upload.FormFile;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;

import com.talent.common.CommonBiz;
import com.talent.common.Pagination;
import com.talent.common.TalentFunction;
import com.talent.dao.BaseDAO;
import com.talent.hibernate.TeachingPlanUnit;
import com.talent.hibernate.Thesis;
import com.talent.web.form.ThesisForm;

public class ThesisDAO extends BaseDAO {
	
	public List getThesisListByPage(ThesisForm form){
		List list=new ArrayList();
		Session session=null;
		Pagination pagination=form.getPagination();
		try{
			session=this.beginTransaction();
			String hql="from Thesis t , Eosoperator e   , Student s ,ClassVO c where t.studentId=s.studentId and e.operatorId=t.studentId and s.classId=c.classId";
			if(form.getClassId()!=null&&form.getClassId().intValue()!=-1){
				hql+=" and s.classId = "+form.getClassId();
			}
			if(form.getState()!=null&&form.getState().intValue()!=-1)
				hql+=" and t.state = "+form.getState();
			if(form.getTeacherId()!=null)
				hql+=" and t.teacherId = "+form.getTeacherId();
			 //查询总数
	    	Query q=session.createQuery("select count(t.thesisId) " +hql);
	    	Iterator itr=q.iterate();
	    	if(itr.hasNext())
	    		pagination.setTotalCount(( (Integer)itr.next()).intValue());
	    
			String sql="select t.thesisId,t.studentId,t.thesisTitle,t.commitTime,t.score,t.teacherId,t.gradeDate,t.remark,t.contentType," +
					"t.teachingGroupId,t.opinion,t.isGood,t.summary,t.iscooperate,t.cooperators,t.state," +
					"e.operatorName as studentName " +hql+" order by t.thesisId desc";
			Query query = session.createQuery(" select t ,e.operatorName,c.className "  +hql+" order by t.thesisId desc");
		    query.setFirstResult((pagination.getCurrentPage()-1)*pagination.getRowsPerPage());
		    query.setMaxResults(pagination.getRowsPerPage());
		    
		    Iterator it=query.iterate();
		    while(it.hasNext()){
		    	Object object[]=(Object[]) it.next();
		    	Thesis thesis=(Thesis) object[0];
		    	thesis.setStudentName(TalentFunction.getAvailStr(object[1]));
		    	thesis.setClassName(TalentFunction.getAvailStr(object[2]));
		    	list.add(thesis);
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
	
	public List getThesisListByClass(String userName, ThesisForm form){
		List list=new ArrayList();
		Session session=null;
		Pagination pagination=form.getPagination();
		try{
			session=this.beginTransaction();
			//String hql="from Thesis t , Eosoperator e , Student s ,ClassVO c where t.studentId=s.studentId and e.operatorId=t.studentId and s.classId=c.classId";
			String hql = "from Student s inner join Eosoperator e on s.studentId=e.operatorId inner join Class c on s.classId=c.classId left join Thesis t on t.studentId=s.studentId";
			if(form.getClassId()!=null&&form.getClassId().intValue()!=-1){
				hql+=" where s.classId = "+form.getClassId();
			}
			 //查询总数
	    	Query q=session.createSQLQuery("select count(s.studentId) " +hql);
	    	List counts = q.list();
	    	if(counts.size()>0)
	    		pagination.setTotalCount(( (Integer)counts.get(0)).intValue());
	    
			String sql="select t.thesisId,t.studentId,t.thesisTitle,t.commitTime,t.score,t.teacherId,t.gradeDate,t.remark,t.contentType," +
					"t.teachingGroupId,t.opinion,t.isGood,t.summary,t.iscooperate,t.cooperators,t.state," +
					"e.operatorName as studentName " +hql+" order by t.thesisId desc";
			System.out.println("select t.StudentID ,e.operatorName ,c.className ,t.ThesisID ,t.ThesisTitle "  +hql+" order by s.studentId desc");
			Query query = session.createSQLQuery("select t.StudentID ,e.operatorName ,c.className ,t.ThesisID ,t.ThesisTitle, t.CommitTime "  +hql+" order by s.studentId");
		    query.setFirstResult((pagination.getCurrentPage()-1)*pagination.getRowsPerPage());
		    query.setMaxResults(pagination.getRowsPerPage());
		    
		    List it=query.list();
		    for (int i=0;i<it.size();i++){
		    	Object object[]=(Object[]) it.get(i);
		    	Thesis thesis=new Thesis();
		    	thesis.setStudentId((Integer)object[0]);
		    	thesis.setStudentName(TalentFunction.getAvailStr(object[1]));
		    	thesis.setClassName(TalentFunction.getAvailStr(object[2]));
		    	if (object[3] != null) thesis.setThesisId((Integer)object[3]);
		    	if (object[4] != null) thesis.setThesisTitle(TalentFunction.getAvailStr(object[4]));
		    	if (object[5] != null) thesis.setCommitTime((Date)object[5]);
		    	if (thesis.getStudentName().equals(userName)) thesis.setState(new Integer(1)); else thesis.setState(new Integer(0));
		    	list.add(thesis);
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

	public Thesis loadThesis(Integer thesisId){
		Thesis thesis=null;
		Session session=null;
		try{
			session=this.beginTransaction();
			thesis=(Thesis) session.load(Thesis.class,thesisId);
			if(thesis!=null)
				if(!Hibernate.isInitialized(thesis)) 
					Hibernate.initialize(thesis); 
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			this.endTransaction();
		}
		return thesis;
	}
	
	public Thesis loadThesisExt(Integer thesisId){
		Thesis thesis=null;
		Session session=null;
		try{
			session=this.beginTransaction();
			String hql="select t ,e.operatorName,s.studentNo, c.className  from Thesis t , Eosoperator e   , Student s ,ClassVO c " +
					"where t.studentId=s.studentId and e.operatorId=t.studentId and s.classId=c.classId and t.thesisId = :thesisId";
			Query query =session.createQuery(hql);
			query.setString("thesisId", thesisId.toString());
			Iterator it=query.iterate();
		    if(it.hasNext()){
		    	Object object[]=(Object[]) it.next();
		    	thesis=(Thesis) object[0];
		    	thesis.setStudentName(TalentFunction.getAvailStr(object[1]));
		    	thesis.setStudentNo(TalentFunction.getAvailStr(object[2]));
		    	thesis.setClassName(TalentFunction.getAvailStr(object[3]));
		    	if(thesis.getTeachingGroupId()!=null){
		    		try{
			    		TeachingPlanUnit planUnit=(TeachingPlanUnit) session.load(TeachingPlanUnit.class, thesis.getTeachingGroupId());
			    		if(planUnit!=null&&planUnit.getUnitName()!=null)
			    			thesis.setUnitTitle(planUnit.getUnitName());
		    		}
		    		catch(Exception ex){
		    			
		    		}
		    	}
		    	if(TalentFunction.getAvailStr(thesis.getIscooperate()).equals("1")){
		    		thesis.setCooperatorsName(CommonBiz.id2name(session, "Eosoperator", "operatorId", "operatorName", thesis.getCooperators()));
		    	}
		    		
		    }
				
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			this.endTransaction();
		}
		return thesis;
	}
	
	
	public void gradeThesis(ThesisForm form){
		Session session=null;
		try{
			session=this.beginTransaction();
			Thesis thesis=(Thesis) session.load(Thesis.class, form.getThesisId());
			thesis.setScore(form.getScore());
			thesis.setIsGood(form.getIsGood());
			thesis.setSummary(form.getSummary());
			thesis.setState(new Integer(1));
			thesis.setGradeDate(new Date());
			session.update(thesis);
		}
		catch (Exception e) {
			//e.printStackTrace();
		}
		finally{
			this.endTransaction();
		}	
			
	}
	
	public Thesis findThesisByStudentId(Integer studentId,Integer teachingGroupId){
		Thesis thesis=null;
		Session session=null;
		try{
			session=this.beginTransaction();
			String hql=" from Thesis t where t.studentId=:studentId and t.teachingGroupId=:teachingGroupId";
			Query query=session.createQuery(hql);
			query.setString("studentId", studentId.toString());
			query.setString("teachingGroupId", teachingGroupId.toString());
			Iterator it=query.iterate();
			if(it.hasNext()){
				thesis=(Thesis) it.next();
			}
			if(thesis!=null)
				if(!Hibernate.isInitialized(thesis)) 
					Hibernate.initialize(thesis); 
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			this.endTransaction();
		}	
		return thesis;
	}
	
	public boolean  uploadThesis(ThesisForm form){
		boolean boo=true;
		Session session=null;
		try{
			session=this.beginTransaction();
			FormFile   file=(FormFile)form.getFile1();   
	         if(file!=null)   
	         {     
	              byte[]   content1   =   file.getFileData(); 
	              Blob blob=Hibernate.createBlob(content1);
	              Thesis thesis=null;
	              if(TalentFunction.getInt(form.getThesisId())!=0){
	            	  thesis=(Thesis)session.load(Thesis.class,form.getThesisId());
	              }
	              else{
	            	  thesis=new Thesis();
	            	  thesis.setStudentId(form.getStudentId());
	            	  thesis.setTeachingGroupId(form.getTeachingGroupId());
		              thesis.setState(new Integer(0));
		              thesis.setIscooperate(new Integer(0));
	              }
	              thesis.setThesisTitle(form.getThesisTitle());
	              thesis.setThesisContent(blob);
	              thesis.setCommitTime(new Date());
	              thesis.setOpinion(form.getOpinion());
	              thesis.setRemark(form.getRemark());
	              thesis.setContentType(file.getContentType());
	              session.saveOrUpdate(thesis);

	              
	         }
	         else
	        	 boo=false;
			
		}
		catch (Exception e) {
			e.printStackTrace();
			boo=false;
		}
		finally{
			this.endTransaction();
		}	
		return boo;
	}
	
}
