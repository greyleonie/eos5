package talent.core;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

import org.w3c.dom.*;

import com.primeton.tp.common.xml.XmlUtil;
import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-6-20
 * @class_displayName StatisStudent
 */

public class StatisStudent {

	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_StatisStudentByOrgan
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc=""
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc=""
	 */
	public static int BL_StatisStudentByOrgan(Document doc, BizContext param)
		throws Exception {
		String sqlWhere = (String) param.getParaObjectAt(0);
		Node param1 = (Node) param.getParaObjectAt(1);



		
		//生成list
		PersistenceBroker db = param.getDBBroker();  //得到数据库连接
		HashMap outMap = (HashMap) StatisStudentByOrgan(db,sqlWhere);
		Set keySet = outMap.keySet();
		Iterator it = keySet.iterator();
		while(it.hasNext()){
			String key = (String) it.next();
			String Num = (String)outMap.get(key);
			Element NumElement = doc.createElement("DutyLevel"+key);
		    XmlUtil.setNodeValue(NumElement,Num);
			param1.appendChild(NumElement);
			
			
		}
		return 1;
		
		
		
		
	}
	
	public static HashMap StatisStudentByOrgan(PersistenceBroker db,String sqlWhere){
		
			
			String sql2 = "select * from (select e.operatorName as StudentName,s.WorkingOrgan,s.Duty,s.DutyLevel,c.ClassName,"+
			"c.BeginTime ,c.EndTime "+
			" from student s left join class c on s.classid = c.classid"+
			" left join eosoperator e on s.studentid = e.operatorid) as a"+
			"  where "+
			sqlWhere;
			HashMap retMap = new HashMap();
			String sql = "select businID  from BNDICT_T_Dictionary where busintypeid = 'dx_dutylevel'";  
			ArrayList inList = new ArrayList();
			Connection cn = null;
			Statement st = null;
			Statement st2 = null;
			ResultSet rs = null;
			ResultSet rs2 = null;
			try{	
				
				cn = db.getConnection();
				st = cn.createStatement();
				st2 = cn.createStatement();
			    rs = st.executeQuery(sql);
			    rs2 = st2.executeQuery(sql2);
			    while(rs2 !=null && rs2.next()){
					String dutyLevel = rs2.getInt(4)+"";
					inList.add(dutyLevel);
			    }
			    
			    
			   int total = inList.size();
				while(rs !=null && rs.next()){
						String businID = rs.getInt(1)+"";
						int num =0;

							
				   Iterator it = inList.iterator();
					while(it.hasNext()){
					String dutyLevel = (String) it.next();
					if(businID.equals(dutyLevel)){
						num++;
					}
				}
				total -=num;
				retMap.put(businID+"",num+"");		
				}
				
				 //将为NULL 的加到 ‘其它’项 中
				String num15 = (String)retMap.get("15");
				if(num15!=null && !"".equals(num15)){
					total += Integer.parseInt(num15);
				}
			  retMap.put("15",total+"");
			}catch(Exception e){
				System.out.println("--------------error:"+e);
				
			}finally{
				try{
					if(rs!=null) rs.close();
					if(rs2!=null) rs2.close();
					if(st!=null) st.close();
					if(st2!=null) st2.close();
					if(cn!=null) cn.close();
					
				}catch(Exception ep){
					ep.printStackTrace();
					
				}
			}
			return retMap;


	}

}

