/**
 * 
 */
package com.talent.dao.ICCard;

import java.util.HashMap;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.talent.common.TalentFunction;
import com.talent.dao.BaseDAO;

/**
 * @title 
 * @description
 * @author 陈绍栋
 * @addtime 2007-3-7
 */

public class StudentlaterLogsDAO extends BaseDAO{
 
	/**
	 * 获得学员的考勤统计
	 * @param studentId
	 * @return
	 */
	public HashMap getKqStatByStudentId(Integer studentId){
		HashMap map=new HashMap();
		Session session=null;
		try{
			session=this.beginTransaction();
			String hql="select count(s.studentlaterLogsId) ,s.state from StudentlaterLogs s where s.studentId=:studentId group by s.state";
			Query query=session.createQuery(hql);
			query.setString("studentId", studentId.toString());
			List list=query.list();
			for(int i=0;i<list.size();i++){
				Object obj[]=(Object[]) list.get(i);
				String key="count"+TalentFunction.getAvailStr(obj[1]);
				String value=TalentFunction.getAvailStr(obj[0]);
				map.put(key, value);
				
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			this.endTransaction();
		}
		
		return map;
	}
}
