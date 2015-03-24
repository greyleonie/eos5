/**
 * 
 */
package com.talent.common;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

/**
 * @title 一些常用的业务逻辑
 * @description
 * @author 陈绍栋
 * @addtime 2007-3-5
 */

public class CommonBiz {

	
	/**
	 * 将id转换为名称 如 12,23,43 -->  XXX,cccc,vvvv
	 * @param session
	 * @param tableClass 表对应类名
	 * @param idField  id字段
	 * @param nameField  名称字段
	 * @param idValue  id值
	 * @return
	 */
	public static String id2name(Session session,String tableClass,String idField,String nameField,String idValue){
		String names="";
		if(idValue!=null){
			String str="";
			String temps[]=idValue.split(",");
			for(int i=0;i<temps.length;i++){
				String temp=temps[i];
				if(TalentFunction.getInt(temp)!=0){
					if(i<temps.length-1)
						str+=" t."+idField+" = "+temp+" or ";
					else
						str+=" t."+idField+" = "+temp;
				}
			}
			if(!str.equals("")){
				String hql=" select t."+nameField+" from "+tableClass+" t where "+str;
				Query q=session.createQuery(hql);
				List list=q.list();
				for(int i=0;i<list.size();i++){
					String tempName=TalentFunction.getAvailStr(list.get(i));
					if(i<list.size()-1)
						names+=tempName+",";
					else
						names+=tempName;
				}
			}
			
		}
		
		return names;
	}
}
