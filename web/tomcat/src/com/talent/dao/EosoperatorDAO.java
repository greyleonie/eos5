/**
 * 
 */
package com.talent.dao;

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
 * @author ³ÂÉÜ¶°
 * @addtime 2007-3-2
 */

public class EosoperatorDAO extends BaseDAO{

		public  String getOperatorNameByID(String operatorId){
			String name = "";
			if(operatorId == null || "".equals(operatorId)){
				return name;	
			}
			Session session=null;
			try{
				session=this.beginTransaction();
				String hql="from Eosoperator e where e.operatorId = :operatorId ";
				Query query = session.createQuery(hql);
				query.setString("operatorId", operatorId);
				Iterator it=query.iterate();
				if(it.hasNext()){
					Eosoperator	user=(Eosoperator) it.next();
					name = user.getOperatorName();
				}
					
			}
			catch(Exception e){
				e.printStackTrace();
			}
			return name;
		}
	 
}
