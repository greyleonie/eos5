package com.talent.dao.student;

import com.talent.dao.BaseDAO;
import com.talent.web.form.SignForm;
import org.hibernate.Session;

public class SignDAO extends BaseDAO {

 public boolean saveSignInfo(SignForm signForm){
  Session session=null;
   boolean result=true;
   try{
     session=this.beginTransaction();
     session.save(signForm);
     this.endTransaction();

   }catch(Exception e){
    result=false;
    System.out.println("======SignDAO=============error:"+e);
  }
  finally{
    return result;
  }
 }

}
