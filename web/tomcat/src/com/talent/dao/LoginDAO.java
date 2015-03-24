/**
 * 
 */
package com.talent.dao;

import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;

import com.primeton.tp.common.crypto.EOSCipherTool;
import com.primeton.tp.common.crypto.EOSDigestTool;
import com.talent.common.HibernateSessionFactory;
import com.talent.hibernate.Eosoperator;

/**
 * @title 
 * @description
 * @author ���ܶ�
 * @addtime 2007-3-2
 */

public class LoginDAO extends BaseDAO{

		public ArrayList getUser(String userId,String password){
			ArrayList list = new ArrayList();
			Eosoperator user=null;
			Session session=null;
			try{
				session=this.beginTransaction();
				String hql="from Eosoperator e where e.userId = :userId and e.password = :password and e.status=1";
				Query query = session.createQuery(hql);
				query.setParameter("userId", userId);
				query.setParameter("password", getPassword(password));
				Iterator it=query.iterate();
				while(it.hasNext()){
					user=(Eosoperator) it.next();
					if(!Hibernate.isInitialized(user)) 
						Hibernate.initialize(user); 
					list.add(user);
				}
			}
			catch(Exception e){
				e.printStackTrace();
			}
			finally{
				this.endTransaction();
			}
			return list;
		}
		
		public Eosoperator getUserByOperatorID(String operatorId){
			Eosoperator user=null;
			Session session=null;
			try{
				session=this.beginTransaction();
				String hql="from Eosoperator e where e.operatorId = :operatorId and e.status=1";
				Query query = session.createQuery(hql);
				query.setString("operatorId", operatorId);
				Iterator it=query.iterate();
				if(it.hasNext()){
					user=(Eosoperator) it.next();
					if(!Hibernate.isInitialized(user)) 
						Hibernate.initialize(user); 
						
						
				}
			}
			catch(Exception e){
				e.printStackTrace();
			}
			finally{
				this.endTransaction();
			}
			return user;
		}
		
	 public static String 	getPassword(String password) throws Exception{
		 if(password!=null){
			 EOSCipherTool ecTool=new EOSCipherTool();
			 EOSDigestTool eosTool = new EOSDigestTool();
			 password=eosTool.digest(ecTool.encrypt(password));
		 }
		 return password;
	 }
	 
	 public boolean modPassword(String operatorId,String newpassword,String oldpassword){
			Session session=null;
			Eosoperator user=null;
			try{
				session=this.beginTransaction();
				String hql="from Eosoperator e where e.operatorId = :operatorId";
				Query query = session.createQuery(hql);
				query.setString("operatorId", operatorId);
				Iterator it=query.iterate();
				if(it.hasNext()){
					user=(Eosoperator) it.next();			
						if(user.getPassword().equals(oldpassword))
						{
							user.setPassword(newpassword);
							session.update(user);
							return true;
						}		
				}
			}
			catch(Exception e){
				e.printStackTrace();
			}
			finally{
				this.endTransaction();
			}
			return false;
		}
	 
}
