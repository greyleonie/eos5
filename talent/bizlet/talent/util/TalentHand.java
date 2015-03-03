/**
 * @author 冯长春
 * @version 1.0
 * @date 2007-1-25
 * @class_displayName TalentHand
 */

package talent.util;

import java.sql.*;
import java.util.AbstractMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Calendar;
import java.text.SimpleDateFormat;

import org.apache.commons.logging.*;
import org.w3c.dom.*;

import com.primeton.tp.core.prservice.context.SessionContext;
import com.primeton.tp.core.config.EOSAppConfiguration;
import com.primeton.tp.core.prservice.context.RequestContext;
import com.primeton.tp.core.prservice.exception.PrException;
import com.primeton.tp.core.prservice.handle.RequestHandleSupport;

import com.primeton.tp.core.config.EOSConfigManager;

import com.primeton.tp.common.crypto.EOSDigestTool;
import com.primeton.tp.common.xml.*;

public class TalentHand extends RequestHandleSupport {
	private Log log = LogFactory.getLog(TalentHand.class);

	public void doProcess(SessionContext sessionContext,
			RequestContext reqContext) throws PrException {
		doProcess(EOSAppConfiguration.getDefaultAppID(), sessionContext,
				reqContext);
	}

	public void doProcess(String appID, SessionContext sessionContext,
			RequestContext reqContext) throws PrException {

		String userID = reqContext.getEntityValue("EOSOperator/userID");
		String pwd = reqContext.getEntityValue("EOSOperator/password");

		/**
		 * loginMarked=0 -----------initial data loginMarked=1 -----------login
		 * success loginMarked=2 -----------user not exist loginMarked=3
		 * -----------password error loginMarked=4 -----------status disabled
		 * loginMarked=5 -----------student type user disabled
		 */
		reqContext.setValue("loginMarked", "0", true);

		String operatorID = null;//操作ID
		String orgID = null;//部门ID
		String orgName = null;//部门名称
		String userName = null; //用户名称
		String operatorType = null;//用户类型
		String loginDate = "";
		String reqIP = "";
		int loginFailTime = 0;

		HttpServletRequest req = reqContext.getHttpRequest();//得到request
		HttpSession session = req.getSession();//得到session
		EOSDigestTool eosTool = new EOSDigestTool();

		if (session.getAttribute("loginFailTime") != null) {
			loginFailTime = ((Integer) session.getAttribute("loginFailTime"))
					.intValue();
		} else {
			loginFailTime = 0;
		}

		String sql0 = "select * from EOSOperator where 1=1";
		String sql1 = "select a.*,b.orgName from EOSORG_T_EmpOrgRef a left join EOSORG_T_Organization b on a.orgID=b.orgID where 1=1";
		String sql5 = "select * from eosoperator where operatorid in(select studentid from student where classid in(select classid from class where ishistoryclass=0))";

		reqIP = req.getRemoteHost();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		loginDate = sdf.format(Calendar.getInstance().getTime());

		Connection con = getConnection();

		try {
			pwd = eosTool.digest(pwd);
			log.info("^^^^^^^current login system userID=" + userID + "^^"
					+ ",password=" + pwd + "^^^^^^");
			sql0 += " and userID='" + userID + "'";
			Statement st0 = con.createStatement();
			ResultSet rs0 = st0.executeQuery(sql0);

			sql5 += " and userID='" + userID + "'";
			Statement st5 = con.createStatement();
			ResultSet rs5 = st5.executeQuery(sql5);
			if (rs0.next()) {
				operatorID = String.valueOf(rs0.getLong("operatorID"));
				userName = rs0.getString("operatorName");
				String tempPwd = rs0.getString("password");

				operatorType = String.valueOf(rs0.getInt("operatorType"));
				int status = rs0.getInt("status");
				if (!tempPwd.equals(pwd)) {
					reqContext.setValue("loginMarked", "3", true);//密码不正确
					loginFailTime++;
					session.setAttribute("loginFailTime", new Integer(
							loginFailTime));
					if (loginFailTime >= 3)
						reqContext.setValue("loginMarked", "4", true);//状态为0，禁止登录
					return;
				}

				if (status == 0) {
					reqContext.setValue("loginMarked", "4", true);//状态为0，禁止登录
					return;
				}
				if (operatorType == "1") { //学员用户
					if (!rs5.next()) {
						reqContext.setValue("loginMarked", "5", true);//不是当前学员，禁止登录
						return;
					}
				}

				sessionContext.setUserID(userID);
				Node sessionEntiry = sessionContext.getSessionEntity();
				Node opID = sessionContext.getDocument().createElement(
						"operatorID");
				Node opType = sessionContext.getDocument().createElement(
						"operatorType");
				Node userNameNode = sessionContext.getDocument().createElement(
						"userName");
				XmlUtil.setNodeValue(opID, operatorID);
				XmlUtil.setNodeValue(opType, operatorType);
				XmlUtil.setNodeValue(userNameNode, userName);

				sessionEntiry.appendChild(opID);
				sessionEntiry.appendChild(opType);
				sessionEntiry.appendChild(userNameNode);

				//sessionContext.setNode(sessionContext.getDocument().createElement("operatorID"));
				//sessionContext.setValue("operatorID",operatorID);
				//sessionContext.setNode(sessionContext.getDocument().createElement("operatorType"));
				//sessionContext.setValue("operatorType",operatorType);

				reqContext.setValue("loginMarked", "1", true);//登录验证成功

			} else {
				reqContext.setValue("loginMarked", "2", true);//用户不存在
				return;
			}
			if (rs0 != null)
				rs0.close();
			if (st0 != null)
				st0.close();
			if (rs5 != null)
				rs0.close();
			if (st5 != null)
				st0.close();

			TalentUserData talentUserData = new TalentUserData();//取数据权限类
			talentUserData.savaUserData(con, session, operatorID);//保存用户的权限

			sql1 += " and a.operatorID=" + operatorID;
			Statement st1 = con.createStatement();
			ResultSet rs1 = st1.executeQuery(sql1);
			if (rs1.next()) {
				orgID = String.valueOf(rs1.getInt("orgID"));
				orgName = rs1.getString("orgName");
				Node sessionEntiry = sessionContext.getSessionEntity();
				Node orgIDNode = sessionContext.getDocument().createElement(
						"orgID");
				Node orgNameNode = sessionContext.getDocument().createElement(
						"orgName");
				XmlUtil.setNodeValue(orgIDNode, orgID);
				XmlUtil.setNodeValue(orgNameNode, orgName);
				sessionEntiry.appendChild(orgIDNode);
				sessionEntiry.appendChild(orgNameNode);

				//sessionContext.setNode(sessionContext.getDocument().createElement("orgID"));
				//sessionContext.setValue("orgID",orgID);
				//sessionContext.setNode(sessionContext.getDocument().createElement("orgName"));
				//sessionContext.setValue("orgName",orgName);

			} else {
				Node sessionEntiry = sessionContext.getSessionEntity();
				Node orgIDNode = sessionContext.getDocument().createElement(
						"orgID");
				Node orgNameNode = sessionContext.getDocument().createElement(
						"orgName");
				XmlUtil.setNodeValue(orgIDNode, "-100");
				XmlUtil.setNodeValue(orgNameNode, "没有部门");
				sessionEntiry.appendChild(orgIDNode);
				sessionEntiry.appendChild(orgNameNode);

			}
			if (rs1 != null)
				rs1.close();
			if (st1 != null)
				st1.close();

			logLogIn(con, userID, loginDate, reqIP, operatorType);//系统日志

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			try {
				if (con != null)
					con.close();
				con = null;
				log
						.info("^^^^^^hi,hi,fcclzy_talent,database's connection is succecessful released^^^^^^");
			} catch (Exception e) {

				e.printStackTrace();
			}

		}

	}

	public void doProcess(SessionContext sessionContext, HttpSession session)
			throws PrException {

		String userID = sessionContext.getUserID();

		/**
		 * loginMarked=0 -----------initial data loginMarked=1 -----------login
		 * success loginMarked=2 -----------user not exist loginMarked=3
		 * -----------password error loginMarked=4 -----------status disabled
		 * loginMarked=5 -----------student type user disabled
		 */
		//reqContext.setValue("loginMarked", "0", true);
		String operatorID = null;//操作ID
		String orgID = null;//部门ID
		String orgName = null;//部门名称
		String userName = null; //用户名称
		String operatorType = null;//用户类型
		String loginDate = "";
		String reqIP = "";
		int loginFailTime = 0;

		//HttpServletRequest req = reqContext.getHttpRequest();//得到request
		//HttpSession session = req.getSession();//得到session
		EOSDigestTool eosTool = new EOSDigestTool();

		if (session.getAttribute("loginFailTime") != null) {
			loginFailTime = ((Integer) session.getAttribute("loginFailTime"))
					.intValue();
		} else {
			loginFailTime = 0;
		}

		String sql0 = "select * from EOSOperator where 1=1";
		String sql1 = "select a.*,b.orgName from EOSORG_T_EmpOrgRef a left join EOSORG_T_Organization b on a.orgID=b.orgID where 1=1";
		String sql5 = "select * from eosoperator where operatorid in(select studentid from student where classid in(select classid from class where ishistoryclass=0))";

		reqIP = sessionContext.getUserRemoteAddr();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		loginDate = sdf.format(Calendar.getInstance().getTime());

		Connection con = getConnection();

		try {
			log.info("^^^^^^^current login system userID=" + userID + "^^^^^^");
			sql0 += " and userID='" + userID + "'";
			Statement st0 = con.createStatement();
			ResultSet rs0 = st0.executeQuery(sql0);

			sql5 += " and userID='" + userID + "'";
			Statement st5 = con.createStatement();
			ResultSet rs5 = st5.executeQuery(sql5);
			if (rs0.next()) {
				operatorID = String.valueOf(rs0.getLong("operatorID"));
				userName = rs0.getString("operatorName");
				String tempPwd = rs0.getString("password");

				operatorType = String.valueOf(rs0.getInt("operatorType"));
				int status = rs0.getInt("status");

				if (status == 0) {
					//reqContext.setValue("loginMarked", "4", true);//状态为0，禁止登录
					return;
				}
				if (operatorType == "1") { //学员用户
					if (!rs5.next()) {
						//reqContext.setValue("loginMarked", "5",
						// true);//不是当前学员，禁止登录
						return;
					}
				}

				//sessionContext.setUserID(userID);
				Node sessionEntiry = sessionContext.getSessionEntity();
				Node opID = sessionContext.getDocument().createElement(
						"operatorID");
				Node opType = sessionContext.getDocument().createElement(
						"operatorType");
				Node userNameNode = sessionContext.getDocument().createElement(
						"userName");
				XmlUtil.setNodeValue(opID, operatorID);
				XmlUtil.setNodeValue(opType, operatorType);
				XmlUtil.setNodeValue(userNameNode, userName);

				sessionEntiry.appendChild(opID);
				sessionEntiry.appendChild(opType);
				sessionEntiry.appendChild(userNameNode);

				//sessionContext.setNode(sessionContext.getDocument().createElement("operatorID"));
				//sessionContext.setValue("operatorID",operatorID);
				//sessionContext.setNode(sessionContext.getDocument().createElement("operatorType"));
				//sessionContext.setValue("operatorType",operatorType);

				//reqContext.setValue("loginMarked", "1", true);//登录验证成功

			} else {
				//reqContext.setValue("loginMarked", "2", true);//用户不存在
				return;
			}
			if (rs0 != null)
				rs0.close();
			if (st0 != null)
				st0.close();
			if (rs5 != null)
				rs0.close();
			if (st5 != null)
				st0.close();

			TalentUserData talentUserData = new TalentUserData();//取数据权限类
			talentUserData.savaUserData(con, session, operatorID);//保存用户的权限

			sql1 += " and a.operatorID=" + operatorID;
			Statement st1 = con.createStatement();
			ResultSet rs1 = st1.executeQuery(sql1);
			if (rs1.next()) {
				orgID = String.valueOf(rs1.getInt("orgID"));
				orgName = rs1.getString("orgName");
				Node sessionEntiry = sessionContext.getSessionEntity();
				Node orgIDNode = sessionContext.getDocument().createElement(
						"orgID");
				Node orgNameNode = sessionContext.getDocument().createElement(
						"orgName");
				XmlUtil.setNodeValue(orgIDNode, orgID);
				XmlUtil.setNodeValue(orgNameNode, orgName);
				sessionEntiry.appendChild(orgIDNode);
				sessionEntiry.appendChild(orgNameNode);
				System.out.println("###login success######");
				//sessionContext.setNode(sessionContext.getDocument().createElement("orgID"));
				//sessionContext.setValue("orgID",orgID);
				//sessionContext.setNode(sessionContext.getDocument().createElement("orgName"));
				//sessionContext.setValue("orgName",orgName);

			} else {
				Node sessionEntiry = sessionContext.getSessionEntity();
				Node orgIDNode = sessionContext.getDocument().createElement(
						"orgID");
				Node orgNameNode = sessionContext.getDocument().createElement(
						"orgName");
				XmlUtil.setNodeValue(orgIDNode, "-100");
				XmlUtil.setNodeValue(orgNameNode, "没有部门");
				sessionEntiry.appendChild(orgIDNode);
				sessionEntiry.appendChild(orgNameNode);

			}
			if (rs1 != null)
				rs1.close();
			if (st1 != null)
				st1.close();

			logLogIn(con, userID, loginDate, reqIP, operatorType);//系统日志

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			try {
				if (con != null)
					con.close();
				con = null;
				log
						.info("^^^^^^hi,hi,fcclzy_talent,database's connection is succecessful released^^^^^^");
			} catch (Exception e) {

				e.printStackTrace();
			}

		}

	}

	public int getRetCode() {
		return 0;
	}

	public String getRetInfo() {
		return "";
	}

	/**
	 * @see 取得数据库连接
	 * @return
	 */
	private Connection getConnection() {
		Connection con = null;

		AbstractMap config = EOSConfigManager.getGroupValues("global",
				"DBConnect");
		String jdbcDriver = (String) config.get("jdbcdriver");
		String dburl = (String) config.get("jdbcurl");
		String username = (String) config.get("username");
		String password = (String) config.get("password");

		try {
			Class.forName(jdbcDriver);
			con = DriverManager.getConnection(dburl, username, password);
			log
					.info("^^^^^^hi,hi,fcclzy_talent,database's connection is acquired and EOS config is right^^^^^^");

		} catch (Exception e) {
			log
					.info("^^^^^^no,no,fcclzy_talent,database's connection is not acquired and EOS config has error^^^^^^");

		}

		return con;

	}

	private void logLogIn(Connection conn, String userID, String loginDate,
			String loginIP, String operatorType) throws Exception {
		String sql3 = "insert into SYS_LOG(USERID,LOGINDATE,IP,REMARK) values(?,?,?,?)";
		String remark = "党校信息平台欢迎";
		if (operatorType == null || "".equals(operatorType)) {
			remark = "党校信息平台欢迎您";
		} else {
			if ("-1".equalsIgnoreCase(operatorType)) {
				remark += "EOS用户进入系统";
			} else if ("0".equalsIgnoreCase(operatorType)) {
				remark += "教工进入系统办公";
			} else if ("1".equalsIgnoreCase(operatorType)) {
				remark += "学员进入系统";
			} else if ("2".equalsIgnoreCase(operatorType)) {
				remark += "宾客进入系统";
			}
		}
		remark = "";

		PreparedStatement pst = conn.prepareStatement(sql3);
		pst.setString(1, userID);
		pst.setString(2, loginDate);
		pst.setString(3, loginIP);
		pst.setString(4, remark);

		pst.executeUpdate();

		if (pst != null)
			pst.close();

	}

}