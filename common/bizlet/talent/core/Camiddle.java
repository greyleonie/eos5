/*
 * 创建日期 2006-3-15
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
package talent.core;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.*;

import com.gdcalib.PSIApp;
/**
 * @author Administrator
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 * CA用户登录处理(从CA服务器获得随机数，送到客户端做签名)
 */
public class Camiddle {
	private Log fccLog = LogFactory.getLog(Camiddle.class);
	
	public void validate(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String sign_cert = request.getParameter("sign_cert").trim();//用户签名证书
		fccLog.info("############用户签名证书：" + sign_cert);
		
		String enc_cert = request.getParameter("enc_cert").trim();//加密证书
		fccLog.info("############加密证书：" + sign_cert);
		
		String Certsn = request.getParameter("UserKeyID").trim();//数据库表EOSOPERATOR中字段CAID;
		fccLog.info("############证书号：" + sign_cert);
		
		String UserPin = request.getParameter("capassword").trim();//CA密码
		fccLog.info("############CA密码：" + sign_cert);
		
		String KeyType = request.getParameter("KeyType");//介质类型
		fccLog.info("############介质类型：" + sign_cert);
		
		String mac = request.getParameter("mac");
		if(mac==null) mac = "123456789";
		
		PSIApp psij = new PSIApp();
		int CurStatus = psij.GetCurStatus();
		if (CurStatus != 0) {
			fccLog.info("############系统异常#####");
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
