package student.thesis;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;

import org.w3c.dom.*;

import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-1-24
 * @class_displayName ThesisManage
 */

public class ThesisManage {

	/**
	 * 检查文章上传时合写状态的合理性
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_checkThesisUpload
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="输入学生ID list"
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="输入文章 Thesis"
	 */
	public static int BL_checkThesisUpload(Document doc, BizContext param)
		throws Exception {
		Node param0 = (Node) param.getParaObjectAt(0);
		Node param1 = (Node) param.getParaObjectAt(1);
		
		int flag=1;
		
		NodeList list=param0.getChildNodes();
		Element temp=(Element) param1;
		String  TeachingGroupID=temp.getElementsByTagName("TeachingGroupID").item(0).getFirstChild().getNodeValue();
		String whereStr=" TeachingGroupID="+TeachingGroupID +" and Iscooperate=1 ";
		String studentIDs[] =new String [list.getLength()];
		for(int i=0;i<list.getLength();i++){
			Element element=(Element) list.item(i);
			studentIDs[i] = element.getElementsByTagName("StudentID").item(0).getFirstChild().getNodeValue();			
		}
		
		PersistenceBroker db = param.getDBBroker();
		Connection cn = null;
		Statement st = null;
		ResultSet rs=null;
		try{
			cn = db.getConnection();
			st = cn.createStatement();

			String sql="select distinct cooperators from Thesis where "+whereStr;
			rs=st.executeQuery(sql);
			while(rs.next()){
				String cooperators=rs.getString(1);
				if(cooperators!=null&&(!cooperators.equals(""))){
					String cotors[]=cooperators.split(",");
					if(!checkStudetnID(studentIDs,cotors)){
						flag=0;
						break;
					}
				}
			}
		}
		catch(Exception e){}
		finally{
			try{
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				if(cn!=null) cn.close();
				
			}catch(Exception e1) {
			}
		}
		return flag;
	}

	// 判断合写人合理性
	public static boolean checkStudetnID(String StudentID[],String cotors[]){
		boolean boo=false;
		HashMap map=new HashMap();
		for(int i=0;i<cotors.length;i++){
			map.put(cotors[i],cotors[i]);
		}
		
		int count=0;
		for(int i=0;i<StudentID.length;i++){
			if(map.get(StudentID[i])!=null)
				count=count+1;
		}
		if(count==0)
			boo=true;
		else if(StudentID.length>=cotors.length&&cotors.length==count)
			boo=true;
		
		return boo;
	}
	

}