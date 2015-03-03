/*
 * �������� 2006-3-15
 *
 * TODO Ҫ���Ĵ����ɵ��ļ���ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
package talent.core;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.*;

import com.gdcalib.PSIApp;
/**
 * @author Administrator
 *
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 * CA�û���¼����(��CA�����������������͵��ͻ�����ǩ��)
 */
public class Camiddle {
	private Log fccLog = LogFactory.getLog(Camiddle.class);
	
	public void validate(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String sign_cert = request.getParameter("sign_cert").trim();//�û�ǩ��֤��
		fccLog.info("############�û�ǩ��֤�飺" + sign_cert);
		
		String enc_cert = request.getParameter("enc_cert").trim();//����֤��
		fccLog.info("############����֤�飺" + sign_cert);
		
		String Certsn = request.getParameter("UserKeyID").trim();//���ݿ��EOSOPERATOR���ֶ�CAID;
		fccLog.info("############֤��ţ�" + sign_cert);
		
		String UserPin = request.getParameter("capassword").trim();//CA����
		fccLog.info("############CA���룺" + sign_cert);
		
		String KeyType = request.getParameter("KeyType");//��������
		fccLog.info("############�������ͣ�" + sign_cert);
		
		String mac = request.getParameter("mac");
		if(mac==null) mac = "123456789";
		
		PSIApp psij = new PSIApp();
		int CurStatus = psij.GetCurStatus();
		if (CurStatus != 0) {
			fccLog.info("############ϵͳ�쳣#####");
		 }
		int Type = 1 ;
		int flag2 = psij.AdvGDCA_Login(Type) ;
		if (flag2 != 0) {
			fccLog.info("############AdvGDCA_Login error#####");
		}
		
		String originalText = psij.AdvGenRandom(24);
		request.getSession().setAttribute("ca_userCertSn", Certsn);
		request.getSession().setAttribute("ca_userSignCert", sign_cert);
		request.getSession().setAttribute("user_encrypt_cert", enc_cert);
		request.getSession().setAttribute("ca_originalText", originalText);
		request.getSession().setAttribute("ca_UserPin", UserPin);
		request.getSession().setAttribute("KeyType", KeyType);
		psij.release();
		response.sendRedirect("/internet/camiddle.jsp?mac="+mac);
	
	}

}
