package com.talent.common;

import java.util.Iterator;
import java.util.List;

import com.talent.common.HibernateSessionFactory;
import org.hibernate.Query;
import org.hibernate.Session;

public class WebPrimary  {
	
	public static int getPrimaryTemp(String tableName,String marked) {
		int i = 0;
		String sqlstr = "select max(" + marked + ") as AA from " + tableName;
		Session session=HibernateSessionFactory.currentSession();
		System.out.println("####################�õ������������ֵsql�����" + sqlstr);
		Query query=session.createSQLQuery(sqlstr);
		List list = query.list();
		Iterator it = list.iterator();
		if(it.hasNext()){
			if (it.next() != null)
			{
			   i = ((Integer)it.next()).intValue();
			} else {
			   i = 0;
			}
		}
		HibernateSessionFactory.closeSession();
		return i+1;
		
	}
	
	
}
