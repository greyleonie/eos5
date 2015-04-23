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
     * �õ��±�Ϊ0��������Ϣ
     * @param doc type: Document, DOM;
     * @param param type: BizContext;
     * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
     * @throws Exception 
     * <p>
     * ** bizlet ����ʾ���� **
     * @bizlet_displayName BL_expandData
     * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="���ص�����ʵ��"
     * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="��ѯ��SQL"
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
	 * @return: int ,�����߼�����ֵ�����ʧ�ܷ���0���ɹ�����1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_expandDataByIndex
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="���ص�����ʵ��"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="��ѯ��SQL"
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="�õ����±꣬��1��ʼ"
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