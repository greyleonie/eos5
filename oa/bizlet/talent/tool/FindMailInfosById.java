/*
 * �������� 2006-9-6
 *
 * TODO Ҫ���Ĵ����ɵ��ļ���ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
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
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת�� ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
public class FindMailInfosById {
	/**
	 * @deprecated �����ʼ�ID�� ����һ��MailInfoʵ��
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
		
		InternetAddress[] to = null;//������
		String tempto = "";
		InternetAddress[] cc = null;//������
		String tempcc = "";
		InternetAddress[] bcc = null;//������
		String tempbcc = "";

		InternetAddress from = null; //������

		try {
			stmt = conn.createStatement();			
			rsserver = stmt.executeQuery(sqlMailServer);
			if (rsserver.next()) {
				String mailhostAndPort = rsserver.getString("SMTPSERVER");
				String mailhost = mailhostAndPort.substring(0, mailhostAndPort
						.lastIndexOf(":"));//�ʼ�������
				int port = Integer.parseInt(mailhostAndPort
						.substring(mailhostAndPort.lastIndexOf(":") + 1));//�ʼ��˿�

				mail.setMailhost(mailhost); //�ʼ�������
				mail.setPort(port); //�ʼ��Ͽں�

				mail.setUsername(rsserver.getString("SMTPNAME")); //�û���

				String mailfrom = rsserver.getString("SHOWADDRESS");
				from = new InternetAddress(mailfrom);
				mail.setFrom(from); //���͵�ַ

				String pwd = rsserver.getString("SMTPPWD");
				mail.setPwd(pwd); //����

				mail.setSmtpAuth(rsserver.getString("SMTPAUTH"));//�ʼ���֤���
				String encoding = "gb2312";//����
				mail.setEncoding(encoding);
			}
			rsserver.close();
			
			rsmail = stmt.executeQuery( sqlMail );
			if ( rsmail.next() ) {
				mail.setSubject(rsmail.getString("TITLE"));//�ʼ�����
				mail.setContent(rsmail.getString("CONTENT"));//�ʼ�����

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
				mail.setTo(to); //�����ʼ����յ�ַ
				
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
				mail.setCc(cc); //�����ʼ����͵�ַ

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
				mail.setBcc(bcc); //�����ʼ����͵�ַ

			}
			rsmail.close();
			
		} catch (SQLException e) {

			e.printStackTrace();
		} catch (AddressException e) {
			// TODO �Զ����� catch ��
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
			// TODO �Զ����� catch ��
			e.printStackTrace();
		}

	}
}