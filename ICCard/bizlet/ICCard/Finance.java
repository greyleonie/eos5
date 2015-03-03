package ICCard;

import org.w3c.dom.*;
import java.util.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import talent.core.TalentFunctions;
import com.primeton.tp.core.api.BizContext;
import base.util.DBconnection;

/**
 * @author 陈绍栋
 * @version 1.0
 * @date 2007-3-27
 * @class_displayName Finance
 */

public class Finance {

	private static String[] STARTTIME_STRING = { "00:00:00", "00:00:00",
			"11:00:00", "16:30:00" };

	private static String[] ENDTIME_STRING = { "23:59:59", "11:00:00",
			"16:30:00", "23:59:59" };

	/**
	 * 
	 * @param doc
	 *            type: Document, DOM;
	 * @param param
	 *            type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1
	 * @throws Exception
	 *             <p>** bizlet 的显示名称 **
	 * @bizlet_displayName appendTimeCondition
	 * @bizlet_param passing="in_out" type="field" value="/" name=""
	 *               desc="存储结果节点"
	 * @bizlet_param passing="in_out" type="variable" value="/" name=""
	 *               desc="输入开始时间"
	 * @bizlet_param passing="in_out" type="variable" value="/" name=""
	 *               desc="输入截止时间"
	 * @bizlet_param passing="in_out" type="variable" value="/" name=""
	 *               desc="输入时段类型"
	 */
	public static int appendTimeCondition(Document doc, BizContext param)
			throws Exception {
		int daydiff = 0;
		GregorianCalendar begin = new GregorianCalendar();
		GregorianCalendar end = new GregorianCalendar();
		Node param0 = (Node) param.getParaObjectAt(0);
		String sql = (String) param.getParaObjectAt(1);
		String param2 = (String) param.getParaObjectAt(2);
		String param3 = (String) param.getParaObjectAt(3);
		String param4 = (String) param.getParaObjectAt(4);
		int index = Integer.parseInt(param4);
		String startime = param2 + " " + STARTTIME_STRING[index];
		String endtime = param2 + " " + ENDTIME_STRING[index];

		sql = sql + " and ((b.happeningtime between '" + startime + "' and '"
				+ endtime + "')";
		if (param2 != null && param2.length() > 0) {
			SimpleDateFormat sf = null;
			try {
				sf = new SimpleDateFormat("yyyy-MM-dd", Locale.CHINESE);
				begin.setTime(sf.parse(param2));
			} catch (Exception ex) {
			}
		}
		if (param3 != null && param3.length() > 0) {
			SimpleDateFormat sf = null;
			try {
				sf = new SimpleDateFormat("yyyy-MM-dd", Locale.CHINESE);
				end.setTime(sf.parse(param3));
			} catch (Exception ex) {
			}
		}
		daydiff = getDays(begin, end);
		if (daydiff > 0) {
			int i = 1;
			while (daydiff >= i) {
				sql = sql + " or (b.happeningtime between DATEADD(day," + i
						+ ",'" + startime + "') and DATEADD(day," + i + ",'"
						+ endtime + "'))";
				i++;
			}
		}
		sql = sql + ")";
		com.primeton.tp.common.xml.XmlUtil.setNodeValue(param0, sql);

		return 1;
	}

	private static int getDays(GregorianCalendar g1, GregorianCalendar g2) {
		int elapsed = 0;
		GregorianCalendar gc1, gc2;

		if (g2.after(g1)) {
			gc2 = (GregorianCalendar) g2.clone();
			gc1 = (GregorianCalendar) g1.clone();
		} else {
			gc2 = (GregorianCalendar) g1.clone();
			gc1 = (GregorianCalendar) g2.clone();
		}

		gc1.clear(Calendar.MILLISECOND);
		gc1.clear(Calendar.SECOND);
		gc1.clear(Calendar.MINUTE);
		gc1.clear(Calendar.HOUR_OF_DAY);

		gc2.clear(Calendar.MILLISECOND);
		gc2.clear(Calendar.SECOND);
		gc2.clear(Calendar.MINUTE);
		gc2.clear(Calendar.HOUR_OF_DAY);

		while (gc1.before(gc2)) {
			gc1.add(Calendar.DATE, 1);
			elapsed++;
		}
		return elapsed;
	}

	/**
	 * 
	 * @param doc
	 *            type: Document, DOM;
	 * @param param
	 *            type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1
	 * @throws Exception
	 *             <p>** 提取逻辑卡号 **
	 * @bizlet_displayName getInnerCardidFromPOS
	 * @bizlet_param passing="in_out" type="field" value="tmpCardId" name=""
	 *               desc=""
	 * @bizlet_param passing="in" type="variable" value="/" name="" desc=""
	 */
	public static int getInnerCardidFromPOS(Document doc, BizContext param)
			throws Exception {
		Node param0 = (Node) param.getParaObjectAt(0);
		String param1 = (String) param.getParaObjectAt(1);

		if (param1.length() >= 6) {
			//存储在记录的1－5十六进制位中
			try {
				com.primeton.tp.common.xml.XmlUtil.setNodeValue(param0, Integer
						.decode("0x" + param1.substring(1, 6)).toString());
			} catch (NumberFormatException ex) {
				ex.printStackTrace();
			}
		}

		return 1;
	}

	/**
	 * 
	 * @param doc
	 *            type: Document, DOM;
	 * @param param
	 *            type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1
	 * @throws Exception
	 *             <p>** 提取卡使用次数 **
	 * @bizlet_displayName getCardUsingTimesFromPOS
	 * @bizlet_param passing="in_out" type="field" value="tmpUseTime" name=""
	 *               desc=""
	 * @bizlet_param passing="in" type="variable" value="/" name="" desc=""
	 */
	public static int getCardUsingTimesFromPOS(Document doc, BizContext param)
			throws Exception {
		Node param0 = (Node) param.getParaObjectAt(0);
		String param1 = (String) param.getParaObjectAt(1);

		if (param1.length() >= 10) {
			//存储在记录的6－9十六进制位中
			try {
				com.primeton.tp.common.xml.XmlUtil.setNodeValue(param0, Integer
						.decode("0x" + param1.substring(6, 10)).toString());
			} catch (NumberFormatException ex) {
				ex.printStackTrace();
			}
		}

		return 1;
	}

	/**
	 * 
	 * @param doc
	 *            type: Document, DOM;
	 * @param param
	 *            type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1
	 * @throws Exception
	 *             <p>** 提取卡消费金额 **
	 * @bizlet_displayName getBizMoneyFromPOS
	 * @bizlet_param passing="in_out" type="field" value="tmpBizMoney" name=""
	 *               desc=""
	 * @bizlet_param passing="in" type="variable" value="/" name="" desc=""
	 */
	public static int getBizMoneyFromPOS(Document doc, BizContext param)
			throws Exception {
		Node param0 = (Node) param.getParaObjectAt(0);
		String param1 = (String) param.getParaObjectAt(1);

		if (param1.length() >= 20) {
			//存储在记录的15－19十六进制位中
			try {
				com.primeton.tp.common.xml.XmlUtil.setNodeValue(param0,
						new Float(
								Integer.decode("0x" + param1.substring(15, 20))
										.floatValue() / 100F).toString());
			} catch (NumberFormatException ex) {
				ex.printStackTrace();
			}
		}

		return 1;
	}

	/**
	 * 
	 * @param doc
	 *            type: Document, DOM;
	 * @param param
	 *            type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1
	 * @throws Exception
	 *             <p>** 提取卡余额 **
	 * @bizlet_displayName getBalanceFromPOS
	 * @bizlet_param passing="in_out" type="field" value="tmpBalance" name=""
	 *               desc=""
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc=""
	 */
	public static int getBalanceFromPOS(Document doc, BizContext param)
			throws Exception {
		Node param0 = (Node) param.getParaObjectAt(0);
		String param1 = (String) param.getParaObjectAt(1);

		if (param1.length() >= 20) {
			//存储在记录的15－19十六进制位中
			try {
				StringBuffer tempString = new StringBuffer();
				tempString.append(param1.substring(14, 15)).append(
						param1.substring(12, 14)).append(
						param1.substring(10, 12));
				com.primeton.tp.common.xml.XmlUtil.setNodeValue(param0,
						new Float(Integer.decode("0x" + tempString.toString())
								.floatValue() / 100F).toString());
			} catch (NumberFormatException ex) {
				ex.printStackTrace();
			}
		}

		return 1;
	}
	
	/**
	 * 
	 * @param doc
	 *            type: Document, DOM;
	 * @param param
	 *            type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1
	 * @throws Exception
	 *             <p>** 在卡数据串中截取卡使用次数 **
	 * @bizlet_displayName getCardUsingTimesFromCard
	 * @bizlet_param passing="in_out" type="field" value="tmpUseTime" name=""
	 *               desc=""
	 * @bizlet_param passing="in" type="variable" value="/" name="" desc=""
	 */
	public static int getCardUsingTimesFromCard(Document doc, BizContext param)
			throws Exception {
		Node param0 = (Node) param.getParaObjectAt(0);
		String param1 = (String) param.getParaObjectAt(1);

		if (param1.length() >= 4) {
			//存储在记录的0－3十六进制位中
			try {
				com.primeton.tp.common.xml.XmlUtil.setNodeValue(param0, Integer
						.decode("0x" + param1.substring(0, 4)).toString());
			} catch (NumberFormatException ex) {
				ex.printStackTrace();
			}
		}

		return 1;
	}
	
	/**
	 * 
	 * @param doc
	 *            type: Document, DOM;
	 * @param param
	 *            type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1
	 * @throws Exception
	 *             <p>** 在卡数据串中截取消费总额 **
	 * @bizlet_displayName getCardUsingTimesFromCard
	 * @bizlet_param passing="in_out" type="field" value="tmpSum" name=""
	 *               desc=""
	 * @bizlet_param passing="in" type="variable" value="/" name="" desc=""
	 */
	public static int getSumFromCard(Document doc, BizContext param)
			throws Exception {
		Node param0 = (Node) param.getParaObjectAt(0);
		String param1 = (String) param.getParaObjectAt(1);

		if (param1.length() >= 14) {
			//存储在记录的8－14十六进制位中
			try {
				Float sum = new Float(Float.valueOf(param1.substring(8, 14)).floatValue() / 100.0F);
				com.primeton.tp.common.xml.XmlUtil.setNodeValue(param0,sum.toString());
			} catch (NumberFormatException ex) {
				ex.printStackTrace();
			}
		}

		return 1;
	}
	
	/**
	 * 
	 * @param doc
	 *            type: Document, DOM;
	 * @param param
	 *            type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1
	 * @throws Exception
	 *             <p>** 当日结算 **
	 * @bizlet_displayName SettlementThisDate
	 * @bizlet_param passing="in" type="variable" value="" name="" desc="交易部门ID"
	 * @bizlet_param passing="in" type="variable" value="" name="" desc="交易日期"
	 * @bizlet_param passing="in" type="variable" value="" name="" desc="结算人"
	 */
	public static int SettlementThisDate(Document doc, BizContext param)
			throws Exception {
		String param0 = (String) param.getParaObjectAt(0);
		String param1 = (String) param.getParaObjectAt(1);
		String param2 = (String) param.getParaObjectAt(2);
		Node param3 = (Node) param.getParaObjectAt(3);

		int count = 0;
		int dpmid = Integer.parseInt(param0);
		java.sql.Date ConsumeDate = java.sql.Date.valueOf(param1);
		String oprtname = param2;
		
		try {
		DBconnection db = new DBconnection();
		Connection conn = db.getEOSConnection();
		PreparedStatement ps = conn.prepareStatement("Exec SettlementThisDate ?,?,?");
        ps.setInt(1, dpmid); // 交易部门ID
        ps.setDate(2, ConsumeDate);// 交易日期
        ps.setString(3, oprtname);// 结算人
        int i = ps.executeUpdate();
        if (i == 0)
        	count = -1;
        com.primeton.tp.common.xml.XmlUtil.setNodeValue(param3,new Integer(count).toString());
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}

		return 1;
	}
	
	/**
	 * 
	 * @param doc
	 *            type: Document, DOM;
	 * @param param
	 *            type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1
	 * @throws Exception
	 *             <p>** 当日重新结算 **
	 * @bizlet_displayName ReSettlementThisDate
	 * @bizlet_param passing="in" type="variable" value="" name="" desc="交易部门ID"
	 * @bizlet_param passing="in" type="variable" value="" name="" desc="交易日期"
	 * @bizlet_param passing="in" type="variable" value="" name="" desc="结算人"
	 */
	public static int ReSettlementThisDate(Document doc, BizContext param)
			throws Exception {
		String param0 = (String) param.getParaObjectAt(0);
		String param1 = (String) param.getParaObjectAt(1);
		String param2 = (String) param.getParaObjectAt(2);

		int count = 0;
		int dpmid = Integer.parseInt(param0);
		java.sql.Date ConsumeDate = java.sql.Date.valueOf(param1);
		String oprtname = param2;
		
		try {
		DBconnection db = new DBconnection();
		Connection conn = db.getEOSConnection();
		PreparedStatement ps = conn.prepareStatement("Exec ReSettlementThisDate ?,?,?");
        ps.setInt(1, dpmid); // 交易部门ID
        ps.setDate(2, ConsumeDate);// 交易日期
        ps.setString(3, oprtname);// 结算人
        int i = ps.executeUpdate();
        if (i == 0) return 1;
        
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}

		return 1;
	}
}