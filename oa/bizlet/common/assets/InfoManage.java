package common.assets;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.w3c.dom.*;

import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-7-17
 * @class_displayName InfoManage
 */

public class InfoManage {
	/**
	 * �ƶ�һ����Ʒ������һ������� <br>
	 * ����ֵ��
	 * @param doc
	 *            type: Document, DOM;
	 * @param param
	 *            type: BizContext;
	 * @return: int ,�����߼�����ֵ���ɹ�����1
	 * @throws Exception
	 *             <p>** bizlet ����ʾ���� **
	 * @bizlet_displayName BL_moveCOMM
	 * @bizlet_param passing="in" type="variable" value="" name=""
	 *               desc="�ƶ���Ʒ����Ʒ���"
	 * @bizlet_param passing="in" type="variable" value="" name=""
	 *               desc="Ŀ�������"
	 */
	public static int BL_moveMenu(Document doc, BizContext param)
			throws Exception {
		String srcID = (String) param.getParaObjectAt(0);
		String destID = (String) param.getParaObjectAt(1);

		if (srcID == null || srcID.equals(""))
			return -1;
		if (destID == null || destID.equals(""))
			return -1;

		PersistenceBroker broker = param.getDBBroker();
		Connection conn = broker.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
				PreparedStatement pupdate = null;
				
				String updateSql = "update CAPT_CAPITALINFO set TYPECODE=?  where CAPTID=?";
				pstmt = conn.prepareStatement(updateSql);
				pstmt.setString(1, destID);
				pstmt.setString(2, srcID);
				pstmt.executeUpdate();
				
		}
		finally {
			if (pstmt != null)
				pstmt.close();
			if (rs != null)
				rs.close();
			if (conn != null)
				conn.close();
			if (broker != null)
				broker.close();
		}
		return 1;
	}

}