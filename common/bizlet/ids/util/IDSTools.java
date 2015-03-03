package ids.util;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.w3c.dom.Document;

import base.util.ActiveDirectoryUtil;

import com.primeton.tp.core.api.BizContext;
import com.trs.idm.api.remote.ServicesFactory;
import com.trs.idm.api.remote.SimpleResponse;
import com.trs.idm.api.remote.bo.UserEntry;
import com.trs.idm.api.remote.exception.ServiceException;
import com.trs.idm.api.remote.manage.user.UserManageService;
import com.trs.idm.api.remote.user.UserService;

/**
 * @author 罗立本
 * @version 1.0
 * @date 2009-10-15
 * @class_displayName IDSTools
 */

public class IDSTools {

	/**
	 * 
	 * @param doc
	 *            type: Document, DOM;
	 * @param param
	 *            type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1
	 * @throws Exception
	 *             <p>** bizlet 的显示名称 **
	 * @bizlet_displayName BL_resetPassword
	 * @bizlet_param passing="in_out" type="variable" value="/" name=""
	 *               desc="用户名"
	 * @bizlet_param passing="in_out" type="variable" value="/" name=""
	 *               desc="旧密码"
	 * @bizlet_param passing="in_out" type="variable" value="/" name=""
	 *               desc="新密码"
	 * @bizlet_param passing="in_out" type="variable" value="/" name=""
	 *               desc="确认新密码"
	 * @bizlet_param passing="in_out" type="variable" value="/" name=""
	 *               desc="返回代码"
	 */
	public static int BL_resetPassword(Document doc, BizContext param)
			throws Exception {
		String userName = (String) param.getParaObjectAt(0);
		String opwd = (String) param.getParaObjectAt(1);
		String npwd = (String) param.getParaObjectAt(2);
		String spwd = (String) param.getParaObjectAt(3);
		String code = (String) param.getParaObjectAt(4);
		try {
			UserService service = ServicesFactory.getUserService();
			UserEntry userEntry = service.findUser(null, userName, opwd);
			userEntry.setPassword(npwd);
			SimpleResponse response = service.updateUser(userEntry);
		} catch (Exception e) {
			throw new Exception();
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
	 *             <p>** bizlet 的显示名称 **
	 * @bizlet_displayName BL_resetPassword
	 * @bizlet_param passing="in_out" type="variable" value="/" name=""
	 *               desc="用户真名"
	 * @bizlet_param passing="in_out" type="variable" value="/" name=""
	 *               desc="邮件地址"
	 * @bizlet_param passing="in_out" type="variable" value="/" name=""
	 *               desc="班级编号"
	 * @bizlet_param passing="in_out" type="variable" value="/" name=""
	 *               desc="学号"
	 */
	public static int BL_createStudent(Document doc, BizContext param) {
		String trueName = (String) param.getParaObjectAt(0);
		String email = (String) param.getParaObjectAt(1);
		String classCode = (String) param.getParaObjectAt(2);
		String studentNo = (String) param.getParaObjectAt(3);
		//        studentNo=studentNo.substring(1);
		String pwd = "37665163";
		String userName = classCode + studentNo;
		try {
			UserService service = ServicesFactory.getUserService();
			UserEntry userEntry = new UserEntry();
			userEntry.setUserName(userName);
			userEntry.setPassword(pwd);
			userEntry.setTrueName(trueName);
			userEntry.setEmail(email);
			userEntry.setNickName(trueName);
			userEntry.setServices(getProperty("student"));
			SimpleResponse response = service.regUser(userEntry);
			ActiveDirectoryUtil ad = new ActiveDirectoryUtil();
			ad.updateUserAttributes(userName, "EveryOne", "OU", "学员");
			ad.changeUserGroup(userName, "EveryOne", "学员");
			ad.closeDirContext();
			return 1;
		} catch (Exception e) {
			return 0;
		}
		//        return IDSTools.createUser(userName,trueName,pwd,email);
		//        int flag=0;
		//        flag=IDSTools.createUser(userName,trueName,pwd,email);
		//        flag=IDSTools.applyApp(userName,"Platform");
		//        return flag;
	}

	/**
	 * 
	 * @param doc
	 *            type: Document, DOM;
	 * @param param
	 *            type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1
	 * @throws Exception
	 *             <p>** bizlet 的显示名称 **
	 * @bizlet_displayName BL_resetPassword
	 * @bizlet_param passing="in_out" type="variable" value="/" name=""
	 *               desc="用户真名"
	 * @bizlet_param passing="in_out" type="variable" value="/" name=""
	 *               desc="邮件地址"
	 * @bizlet_param passing="in_out" type="variable" value="/" name=""
	 *               desc="密码"
	 */
	public static int BL_createTeacher(Document doc, BizContext param) {
		String trueName = (String) param.getParaObjectAt(0);
		String email = (String) param.getParaObjectAt(1);
		String pwd = (String) param.getParaObjectAt(2);

		char[] tempList = trueName.toCharArray();
		String userName = "";
		for (int i = 0; i < tempList.length; i++) {
			if (i == 0) {
				userName = userName
						+ PinYinTools.getPingYin(String.valueOf(tempList[i]));
			} else {
				userName = userName
						+ PinYinTools.getPinYinHeadChar(String
								.valueOf(tempList[i]));
			}
		}

		if (pwd == null || pwd.equals("")) {
			pwd = "37665163";
		}
		if (email == null || email.equals("")) {
			email = userName + "@gzswdx.gov.cn";
		}
		return IDSTools.createUser(userName, trueName, pwd, email);
		//        int flag=0;
		//        if( IDSTools.createUser(userName,trueName,pwd,email,"net")==1){
		//            flag=IDSTools.applyApp(userName,"Platform");
		//        }
		//        return flag;
	}

	/**
	 * 
	 * @param doc
	 *            type: Document, DOM;
	 * @param param
	 *            type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1
	 * @throws Exception
	 *             <p>** bizlet 的显示名称 **
	 * @bizlet_displayName BL_resetPassword
	 * @bizlet_param passing="in_out" type="variable" value="/" name=""
	 *               desc="用户真名"
	 * @bizlet_param passing="in_out" type="variable" value="/" name=""
	 *               desc="登录名"
	 */
	public static int BL_importUser(Document doc, BizContext param) {
		String trueName = (String) param.getParaObjectAt(0);
		String userName = (String) param.getParaObjectAt(1);
		String pwd = "37665163";
		String email = userName + "@gzswdx.gov.cn";
		return IDSTools.createUser(userName, trueName, pwd, email);
	}

	public static int applyApp(String userName, String appName) {
		try {
			UserService service = ServicesFactory.getUserService();
			SimpleResponse response = service.applyEnableCoApp(null, userName,
					appName);
			return 1;
		} catch (ServiceException e) {
			return 0;
		}
	}

	public static int createUser(String userName, String trueName, String pwd,
			String email) {
		try {
			UserService service = ServicesFactory.getUserService();
			UserEntry userEntry = new UserEntry();
			userEntry.setUserName(userName);
			userEntry.setPassword(pwd);
			userEntry.setTrueName(trueName);
			userEntry.setEmail(email);
			userEntry.setNickName(trueName);
			userEntry.setServices(getProperty("teacher"));
			SimpleResponse response = service.regUser(userEntry);
			return 1;
		} catch (Exception e) {
			return 0;
		}
	}

	/**
	 * 
	 * @param doc
	 *            type: Document, DOM;
	 * @param param
	 *            type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1
	 * @throws Exception
	 *             <p>** bizlet 的显示名称 **
	 * @bizlet_displayName BL_resetPassword
	 * @bizlet_param passing="in_out" type="variable" value="/" name=""
	 *               desc="用户名"
	 */
	public static int BL_deleteStudent(Document doc, BizContext param) {
		String userName = (String) param.getParaObjectAt(0);
		try {
			UserManageService service = ServicesFactory.getUserManageService();
			SimpleResponse simpleResponse = service.removeUser("userName");
			return 1;
		} catch (Exception e) {
			return 0;
		}
	}

	public static String getProperty(String type) {
		Properties cfgProps = new Properties();
		InputStream in = null;
		String property = "";
		try {
			in = new BufferedInputStream(new FileInputStream(
					"D:\\primeton\\eosserver\\config\\ldap4eos.properties"));
			cfgProps.load(in);
			if (type.equals("student"))
				property = cfgProps.getProperty("studentApp");
			else
				property = cfgProps.getProperty("teacherApp");
		} catch (FileNotFoundException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
		} catch (IOException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
		}
		return property;
	}

}