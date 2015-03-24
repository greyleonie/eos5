package com.talent.dao.student;

import com.talent.dao.BaseDAO;
import com.talent.hibernate.ClassVO;

import org.hibernate.Session;
import org.hibernate.Query;

import java.util.ArrayList;
import java.util.Iterator;


public class StudentDAO extends BaseDAO{

  public   String getClassNameByUserId(Integer userId){
    String className="";
    Session session=null;
    try{
      session=this.beginTransaction();
      if (userId != null && !userId.equals("")) {
        String sql="select c.className from Student s,ClassVO c where s.classId=c.classId and s.studentId=:studentID";
        Query q=session.createQuery(sql);

        q.setString("studentID",userId.toString());
        Iterator itr=q.iterate();
        while(itr.hasNext()){
          className=(String)itr.next();
        }
      }
    }catch(Exception e){
      System.out.println("====getClassName============error:"+e);
    }
    return className;
  }
  
  public ArrayList getClassNameIsHistoryByUserId(Integer userId){
      ArrayList list1 = new ArrayList();
      ClassVO classes = new ClassVO();
      Session session=null;
      try{
        session=this.beginTransaction();
        if (userId != null && !userId.equals("")) {
          String sql="select c from Student s,ClassVO c where s.classId=c.classId and s.studentId=:studentID ";
          Query q=session.createQuery(sql);

          q.setString("studentID",userId.toString());
          Iterator itr=q.iterate();
          while(itr.hasNext()){
            classes = (ClassVO)itr.next();
            String className = classes.getClassName();
            Integer is =classes.getIsHistoryClass();
            ClassVO c = new ClassVO(className,is);
            list1.add(c);
          }
        }
      }catch(Exception e){
        System.out.println("====getClassName============error:"+e);
      }
      return list1;
    }
  
  public   String getClassNameByUserId1(Integer userId){
      String className="";
      Session session=null;
      try{
        session=this.beginTransaction();
        if (userId != null && !userId.equals("")) {
          String sql="select c.className from Student s,ClassVO c where s.classId=c.classId and s.studentId=:studentID and c.isHistoryClass=0";
          Query q=session.createQuery(sql);

          q.setString("studentID",userId.toString());
          Iterator itr=q.iterate();
          while(itr.hasNext()){
            className=(String)itr.next();
          }
        }
      }catch(Exception e){
        System.out.println("====getClassName============error:"+e);
      }
      return className;
    }

  public   Integer getClassIdByUserId(Integer userId){
    Integer classId=null;
    Session session=null;
    try{
      session=this.beginTransaction();
      if (userId != null && !userId.equals("")) {
        String sql="select c.classId from Student s,ClassVO c where s.classId=c.classId and s.studentId=:studentID";
        Query q=session.createQuery(sql);

        q.setString("studentID",userId.toString());
        Iterator itr=q.iterate();
        while(itr.hasNext()){
          classId=(Integer)itr.next();
        }
      }
    }catch(Exception e){
      System.out.println("====classId============error:"+e);
    }
    return classId;
  }
  public Integer getClassIdByUserId1(Integer userId){
      Integer classId = null;
      Session session = null;
      try{
	  session = this.beginTransaction();
	  if(userId != null&& !userId.equals("")){
	      String sql="select c.classId from Student s,ClassVO c where s.classId=c.classId and s.studentId=:studentID";
	      Query q = session.createQuery(sql);
	      q.setString("studentID", userId.toString());
	      Iterator itr = q.iterate();
	      while(itr.hasNext()){
		  classId=(Integer)itr.next();
	      }
	  }
      }
      catch(Exception e){
	  System.out.println("======classId============error:"+e);
      }
      return classId;
  }

  public static void main(String args[]){
   Integer i=new  Integer(13523);
   StudentDAO dao=new StudentDAO();
   String className=dao.getClassNameByUserId(i);
    System.out.println("====getClassName============className:"+className);
  }

}
