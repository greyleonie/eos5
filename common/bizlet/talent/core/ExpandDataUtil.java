package talent.core;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.w3c.dom.*;

import com.primeton.tp.common.xml.XmlUtil;
import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;
/**
 * @author Administrator
 * @version 1.0
 * @date 2015-4-23
 * @class_displayName ExpandDataUtil
 */

public class ExpandDataUtil {

    /**
     * 得到下标为0的数据信息
     * @param doc type: Document, DOM;
     * @param param type: BizContext;
     * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
     * @throws Exception 
     * <p>
     * ** bizlet 的显示名称 **
     * @bizlet_displayName BL_expandData
     * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="返回的数据实体"
     * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="查询的SQL"
     */
    public static int BL_expandData(Document doc, BizContext param)
        throws Exception {
        Node entity = (Node) param.getParaObjectAt(0);
        String sql = (String) param.getParaObjectAt(1);
        NodeList list = entity.getChildNodes();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            PersistenceBroker db = param.getDBBroker();
    		conn = db.getConnection();
    		ps = conn.prepareStatement(sql);
    		rs = ps.executeQuery();
    		while(rs.next()) {
    		    for(int i = 0; i < list.getLength(); i ++) {
    		        Node cNode = list.item(i);
    		        String nodeName = cNode.getNodeName();
    		        XmlUtil.setNodeValue(cNode,rs.getObject(nodeName).toString());
    		    }
    		    break;
    		}
        } catch (Exception e) {
        } finally {
            if(rs != null) {
                rs.close();
                rs = null;
            }
            if(ps != null) {
                ps.close();
                ps = null;
            }
            if(conn != null) {
                conn.close();
                conn = null;
            }
        }
        //XmlUtil.setNodeValue(rowspanElement,row);
        return 1;
    }

	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_expandDataByIndex
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="返回的数据实体"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="查询的SQL"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="得到的下标，从1开始"
	 */
	public static int BL_expandDataByIndex(Document doc, BizContext param) throws Exception{
		Node entity = (Node)param.getParaObjectAt(0);
		String sql = (String)param.getParaObjectAt(1);
		String index = (String)param.getParaObjectAt(2);
		NodeList list = entity.getChildNodes();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            PersistenceBroker db = param.getDBBroker();
    		conn = db.getConnection();
    		ps = conn.prepareStatement(sql);
    		rs = ps.executeQuery();
    		int indexInt = new Integer(index).intValue();
    		int k = 1;
    		while(rs.next()) {
    		    if(k == indexInt) {
	    		    for(int i = 0; i < list.getLength(); i ++) {
	    		        Node cNode = list.item(i);
	    		        String nodeName = cNode.getNodeName();
	    		        XmlUtil.setNodeValue(cNode,rs.getObject(nodeName).toString());
	    		    }
	    		    break;
    		    }
    		}
        } catch (Exception e) {
        } finally {
            if(rs != null) {
                rs.close();
                rs = null;
            }
            if(ps != null) {
                ps.close();
                ps = null;
            }
            if(conn != null) {
                conn.close();
                conn = null;
            }
        }
		return 1;
	}
}