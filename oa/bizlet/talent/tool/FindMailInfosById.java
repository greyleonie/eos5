/*
 * 创建日期 2006-9-6
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
package talent.tool;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;

import base.util.DBconnection;

/**
 * @author user
 * 
 * TODO 要更改此生成的类型注释的模板，请转至 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class FindMailInfosById {
	/**
	 * @deprecated 根据邮件ID号 返回一个MailInfo实体
	 *  
	 */
	public MailInfo FindById(Integer MailId, Integer ServerId)
			throws SQLException {
		MailInfo mail = null;
		if (MailId == null || MailId.intValue() == 0) {
			return mail;
		}
		if (ServerId == null || ServerId.intValue() == 0) {
			return mail;
		}
		mail = new MailInfo();
		String sqlMail = "select * from TOOL_MAIL s where s.MAILID ="
				+ MailId.intValue();
		String sqlMailServer = "select * from TOOL_MAILSERVER  s where s.SERVERID ="
				+ ServerId.intValue();
		
		DBconnection dbCon = new DBconnection();
		Connection conn = dbCon.getEOSConnection();
		Statement stmt = null;
		ResultSet rsmail = null;		
		ResultSet rsserver = null;
		
		InternetAddress[] to = null;//收信人
		String tempto = "";
		InternetAddress[] cc = null;//抄送人
		String tempcc = "";
		InternetAddress[] bcc = null;//密送人
		String tempbcc = "";

		InternetAddress from = null; //发信人

		try {
			stmt = conn.createStatement();			
			rsserver = stmt.executeQuery(sqlMailServer);
			if (rsserver.next()) {
				String mailhostAndPort = rsserver.getString("SMTPSERVER");
				String mailhost = mailhostAndPort.substring(0, mailhostAndPort
						.lastIndexOf(":"));//邮件主机名
				int port = Integer.parseInt(mailhostAndPort
						.substring(mailhostAndPort.lastIndexOf(":") + 1));//邮件端口

				mail.setMailhost(mailhost); //邮件主机名
				mail.setPort(port); //邮件断口号

				mail.setUsername(rsserver.getString("SMTPNAME")); //用户名

				String mailfrom = rsserver.getString("SHOWADDRESS");
				from = new InternetAddress(mailfrom);
				mail.setFrom(from); //发送地址

				String pwd = rsserver.getString("SMTPPWD");
				mail.setPwd(pwd); //密码

				mail.setSmtpAuth(rsserver.getString("SMTPAUTH"));//邮件认证与否
				String encoding = "gb2312";//编码
				mail.setEncoding(encoding);
			}
			rsserver.close();
			
			rsmail = stmt.executeQuery( sqlMail );
			if ( rsmail.next() ) {
				mail.setSubject(rsmail.getString("TITLE"));//邮件标题
				mail.setContent(rsmail.getString("CONTENT"));//邮件内容

				tempto = rsmail.getString("RECEIVEADDRESS");
				if( tempto != null || !"".equals(tempto) ){
					String[] arrayTempTo = tempto.split(",");
					int tolength = arrayTempTo.length;
					to = new InternetAddress[tolength];
					for (int i = 0; i < tolength; i++) {
						System.out.print("*****************TT address is "
								+ arrayTempTo[i]);
						to[i] = new InternetAddress(arrayTempTo[i]);
					}
				}
				mail.setTo(to); //保存邮件接收地址
				
				tempcc = rsmail.getString("COPYSEND");
				if( tempcc != null ){
					String[] arrayTempCc = tempcc.split(",");
					int cclength = arrayTempCc.length;
					cc = new InternetAddress[cclength];
					for (int i = 0; i < cclength; i++) {
						System.out.print("*****************CC address is "
								+ arrayTempCc[i]);
						cc[i] = new InternetAddress(arrayTempCc[i]);
					}
				}
				mail.setCc(cc); //保存邮件抄送地址

				tempbcc = rsmail.getString("DENSESEND");
				if(  tempbcc != null ){
					String[] arrayTempBcc = tempbcc.split(",");
					int bcclength = arrayTempBcc.length;
					bcc = new InternetAddress[bcclength];
					for (int i = 0; i < bcclength; i++) {
						System.out.print("*****************BCC address is "
								+ arrayTempBcc[i]);
						bcc[i] = new InternetAddress(arrayTempBcc[i]);
					}
				}
				mail.setBcc(bcc); //保存邮件密送地址

			}
			rsmail.close();
			
		} catch (SQLException e) {

			e.printStackTrace();
		} catch (AddressException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
		} finally {
			if (rsmail != null)
				rsmail.close();
			if (rsserver != null)
				rsserver.close();
			if (stmt != null)
				stmt.close();
		}

		return mail;
	}

	public static void main(String[] args) {
		FindMailInfosById f = new FindMailInfosById();
		Integer mid = new Integer("508");
		Integer sid = new Integer("3");

		try {
			f.FindById(mid, sid);
		} catch (SQLException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
		}

	}
}