package talent.core;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.w3c.dom.*;

import com.primeton.tp.common.xml.XmlUtil;
import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-1-19
 * @class_displayName JudgeContainOrgId
 */

public class JudgeContainOrgId {

	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_isContainOrgId
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="userId"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="连接起来的部门id"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="最后返回是否包含的标记"
	 */
	public static int BL_isContainOrgId(Document doc, BizContext param)
		throws Exception {
		String operatorId = (String) param.getParaObjectAt(0);
		String orgIds = (String) param.getParaObjectAt(1);
		Node remark = (Node) param.getParaObjectAt(2);
		PersistenceBroker db = param.getDBBroker();
		String value=JudgeContainOrgId.judgeContainOrgId(db,operatorId,orgIds);
	    XmlUtil.setNodeValue(remark,value);
		return 1;
	
	}
	
	public static String judgeContainOrgId(PersistenceBroker db,String operatorId,String orgIds){
		String remark="0";
		orgIds=","+orgIds+",";
		
		if(orgIds.equals("")){
			return remark;
			}
		
		    Connection cn = null;
			Statement st = null;
			ResultSet rs = null;
			String sql="select g.orgID from EOSOperator o join EOSORG_T_EmpOrgRef r on o.operatorID=r.operatorID "+
                       "join EOSORG_T_Organization g on g.orgID=r.orgID where r.operatorID ="+operatorId;
		    int index=-1;
			try{
			String orgId="";
			int org=-202;
			cn=db.getConnection();
		    st=cn.createStatement();
		    rs=st.executeQuery(sql);
		   while(rs.next()){
		   	org=rs.getInt("orgID");
		   }
		   //System.out.println("==================org:"+org+"====orgIds:"+orgIds);	 
		   orgId=","+(new Integer(org)).toString()+",";
		   index=orgIds.indexOf(orgId);
		   if(index>-1){
		   	remark="1";
		   }
		   
		}catch(Exception e){
		  System.out.println("==================判断是否包含本部门id"+e);	
		}finally{
			try{
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				if(cn!=null) cn.close();
				
			}catch(Exception ep){
				ep.printStackTrace();
				
			}
		}
		return remark;
		
	}

}