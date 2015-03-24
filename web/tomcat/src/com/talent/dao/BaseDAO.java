package com.talent.dao;

import org.hibernate.*;

import com.talent.common.HibernateSessionFactory;


public abstract class BaseDAO {

  private Session session;
  private Transaction transaction;
  protected boolean _ST ;

  public Session beginTransaction()  {
	  try{
    session = HibernateSessionFactory.currentSession();
    transaction = session.beginTransaction();
    _ST = true;
	  }catch (Exception e) {
		e.printStackTrace();
	}
    return session;  
  }

  public void endTransaction(boolean commit)  {
	  try{
    if (commit) {
      transaction.commit();
    }
    else {

      transaction.rollback();
    }
    if(session!=null)
		 HibernateSessionFactory.closeSession();
	  }catch (Exception e) {
		e.printStackTrace();
	}
  }
  
  public void endTransaction() throws HibernateException {
	 
	 if(!transaction.wasCommitted()){
		 if (_ST) 
			 transaction.commit();
		 else 
			 transaction.rollback();
	    
	 }
	 if(session!=null)
		 HibernateSessionFactory.closeSession();
	 if(session==null)
	    {
	    	System.out.println("");
	    }
  }
   
}