package talent.core;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;

import org.w3c.dom.*;

import base.util.DBconnection;

import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;
/**
 * 一些常用的业务逻辑
 * @author Administrator
 * @version 1.0
 * @date 2007-3-9
 * @class_displayName CommomBiz
 */

public class CommomBiz {

	/**
	 * 生成黑名单
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_setBackList
	 */
	public static int BL_setBackList(Document doc, BizContext param)
		throws Exception {
		//PersistenceBroker db = param.getDBBroker();
		Connection conn = null;
		Statement st = null;
		ResultSet rs=null;
		ResultSet rs1=null;
		String ret = null;
		try{
			conn = new DBconnection().getEOSConnection();
			st=conn.createStatement();
			//String sql="select * from Configure where ConfigureName='BlackList'";
			String maxSql="select max(c.innercardid) from Card c";
			rs=st.executeQuery(maxSql);
			int cardcount=0;
			if(rs.next())
				 cardcount=TalentFunctions.getInt(rs.getString(1),0);
			if (cardcount <= 0) {
                return 0;
            }
//			初始化一个长度为Card数量的1/8的字节数组
            int[] cardarray = new int[(cardcount - 1) / 8 + 1];
            int arraynum = 0;
            int bit = 0;
            HashMap tempMap = new HashMap(); //数据库中对应 innerCardID 与 StateID的集合
            String cardSql="select * from Card order by innerCardID asc";
            rs1=st.executeQuery(cardSql);
            while(rs1.next()){
            	int StateID=rs1.getInt("StateID");
            	int innerCardID=rs1.getInt("innerCardID");
            	tempMap.put(String.valueOf(innerCardID),String.valueOf(StateID));
            }
            int count=0;
            while (count < cardcount) {
                arraynum = count / 8;
                bit = count % 8;
                Object stateID = tempMap.get(String.valueOf(count+1));  
                if(stateID==null || Integer.parseInt(stateID.toString())>2){
                	cardarray[arraynum] = cardarray[arraynum] | 1 << bit;
                	//不存在的卡或类型为3或4的为挂失和坏卡，其位置1
                }
                count++;
            }
            
            StringBuffer hexStr = new StringBuffer(); //将整型数组转换为十六进制字符串
            for (int i = 0; i <= (cardcount - 1) / 8; i++) {
                hexStr.append(CardDataConvert.criterionString(Integer
                        .toHexString(cardarray[i]), 2));
            }
            ret = hexStr.toString();
            System.out.println(ret);
            String updateSql="update Configure set ConfigureInfo='"+ret+"' ,updateTime = getdate()  where ConfigureName='BlackList'";
           // System.out.println(updateSql);
            
            st.executeUpdate(updateSql);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
				try{
					if(rs1!=null) rs1.close();
					if(rs!=null) rs.close();
					if(st!=null) st.close();
					if(conn!=null) conn.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
				
			}
		return 1;
	}

}