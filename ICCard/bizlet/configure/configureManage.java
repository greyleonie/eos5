package configure;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Date;

import org.w3c.dom.*;

import com.primeton.tp.common.xml.XmlUtil;
import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;
/**
 * @author ���ܶ�
 * @version 1.0
 * @date 2007-4-5
 * @class_displayName configureManage
 */

public class configureManage {

	/**
	 * ���ϵͳ������Ϣ,����������
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_loadConfigure
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="����/���ϵͳ�������Խڵ�"
	 */
	public static int BL_loadConfigure(Document doc, BizContext param)
		throws Exception {
		int count= param.getLength();
		PersistenceBroker db = param.getDBBroker();
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try{
			conn=db.getConnection();
			st=conn.createStatement();
			for(int i = 0 ;i<count ; i++ ){
				try{
					Node node = (Node) param.getParaObjectAt(i);
					String sql= "select *  from Configure where ConfigureName='"+node.getNodeName()+"'";
					rs=st.executeQuery(sql);
					if(rs.next()){
						String result=rs.getString("ConfigureInfo");
						XmlUtil.setNodeValue(node,result);
					}
				}
				catch(Exception ex){
					ex.printStackTrace();
				}
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
				try{
					if(rs!=null) rs.close();
					if(st!=null) st.close();
					if(conn!=null) conn.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
				
			}
		return 1;
	}

	/**
	 * ����ϵͳ�����޸�
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_savConfigure
	 * @bizlet_param passing="in_out" type="EOSEntity" value="ConfigureTree" name="" desc="����ϵͳ������"
	 */
	public static int BL_savConfigure(Document doc, BizContext param) throws Exception{
		Node ConfigureTree = (Node)param.getParaObjectAt(0);
		PersistenceBroker db = param.getDBBroker();
		Connection conn = null;
		PreparedStatement st = null;
		try{
			conn=db.getConnection();
			NodeList nodeList = ConfigureTree.getChildNodes();
			String sql=" update Configure set ConfigureInfo = ? ,UpdateTime = ? where ConfigureName= ?";
			st = conn.prepareStatement(sql);
			for(int i=0; i<nodeList.getLength();i++){
				try{
					Node node = nodeList.item(i);
					String name=node.getNodeName();
					String value=XmlUtil.getNodeValue(node);
					if(value!=null){
						st.setString(1,value);
						st.setTimestamp(2,new Timestamp((new Date()).getTime()));
						st.setString(3,name);
						st.executeUpdate();
					}
				}
				catch(Exception ex){
					ex.printStackTrace();
				}
			}
			 
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
				try{
					if(st!=null) st.close();
					if(conn!=null) conn.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
				
			}
		return 1;
	}
}