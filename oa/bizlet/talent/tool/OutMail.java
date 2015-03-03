package talent.tool;
import oracle.sql.CLOB;

import org.w3c.dom.*;

import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.common.xml.XmlUtil;
import com.primeton.tp.core.api.PersistenceBroker;
import com.primeton.tp.core.api.Unique;


import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
import javax.mail.internet.MimeUtility;
import java.util.Properties;
import java.util.*;
import java.text.SimpleDateFormat;
import java.io.*;
import java.sql.*;

import talent.core.Webpriary;
import base.util.DBconnection;

/**
 * @author Administrator
 * @version 1.0
 * @date 2005-9-15
 * @class_displayName OutMail
 */

public class OutMail {
    
	private static StringBuffer bodytext = new StringBuffer();//存放邮件内容
	
	/**
	 * 统计pop3邮件数
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_popcount
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="POP3数量"
	 * @bizlet_param passing="in" type="field" value="/" name="" desc="POP3邮件服务器地址"
	 * @bizlet_param passing="in" type="field" value="/" name="" desc="POP3服务器帐号"
	 * @bizlet_param passing="in" type="field" value="/" name="" desc="POP3服务器密码"
	 */
	public static int BL_popcount(Document doc, BizContext param)
		throws Exception {
		Node param0 = (Node) param.getParaObjectAt(0);
		Node param1 = (Node) param.getParaObjectAt(1);
		Node param2 = (Node) param.getParaObjectAt(2);
		Node param3 = (Node) param.getParaObjectAt(3);
		String pop3Server = param1.getFirstChild().getNodeValue();
		String tempServer = pop3Server;
		pop3Server = pop3Server.substring(0,pop3Server.lastIndexOf(":"));
		int port = 110;
		port = Integer.parseInt(tempServer.substring(tempServer.lastIndexOf(":")+1));
		System.out.print("^^^^^^^^^^^^^^^^^^^^^^^pop3Server:" + pop3Server);
		System.out.print("^^^^^^^^^^^^^^^^^^^^^^^port:" + port);
		
		String pop3User = param2.getFirstChild().getNodeValue();
		String pop3Pwd = param3.getFirstChild().getNodeValue();
		Store store = null;
		Folder folder = null;
		int mailCount = 0;
		String result = "连接失败";
		
		try{
			Properties props = System.getProperties();
			Session session = Session.getDefaultInstance(props,null);
			store = session.getStore("pop3");
			//store.connect(pop3Server,pop3User,pop3Pwd);
			store.connect(pop3Server,port,pop3User,pop3Pwd);
			System.out.print("connect to MailServer:" + pop3Server + " userName:" + pop3User + " success !");
			folder = store.getDefaultFolder();
			if (folder == null)throw new Exception("No default folder");
			folder = folder.getFolder("INBOX");
			if (folder == null)throw new Exception("No POP3 INBOX");
			folder.open(Folder.READ_WRITE);
			mailCount = folder.getMessageCount();
			result = String.valueOf(mailCount);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(folder!=null) folder.close(true);
				if(store!=null) store = null;
				
			}catch(Exception ex){
				ex.printStackTrace();
			}
		}
		XmlUtil.setNodeValue(param0,result);

		return 1;
	}

	/**
	 * 接收pop3服务器上的邮件并写入到本地数据库
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_popreceive
	 * @bizlet_param passing="in" type="field" value="/" name="" desc="邮件标识：TOOL_MAIL/MAILID"
	 * @bizlet_param passing="in" type="field" value="/" name="" desc="邮件附件标识:TOOL_MAILATTCH/ATTACHID"
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="pop3邮件数量"
	 * @bizlet_param passing="in" type="field" value="/" name="" desc="pop3邮件服务器地址:TOOL_MAILSERVER/POP3ADDRESS"
	 * @bizlet_param passing="in" type="field" value="/" name="" desc="pop3用户帐号:TOOL_MAILSERVER/POP3ACCOUNT"
	 * @bizlet_param passing="in" type="field" value="/" name="" desc="pop3用户密码:TOOL_MAILSERVER/POP3PWD"
	 * @bizlet_param passing="in" type="field" value="/" name="" desc="是否删除远程邮件:TOOL_MAILSERVER/DELFLAG"
	 * @bizlet_param passing="in" type="field" value="/" name="" desc="接收邮件夹:TOOL_MAILSERVER/INCEPTMAILDIR"
	 * @bizlet_param passing="in" type="field" value="/" name="" desc="EOS登录用户接收邮件者:TOOL_MAILSERVER/USERACCOUNT"
	 */
	public static int BL_popreceive(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);
		Node param1 = (Node)param.getParaObjectAt(1);
		Node param2 = (Node)param.getParaObjectAt(2);
		Node param3 = (Node)param.getParaObjectAt(3);
		
		Node param4 = (Node)param.getParaObjectAt(4);
		Node param5 = (Node)param.getParaObjectAt(5);
		Node param6 = (Node)param.getParaObjectAt(6);
		Node param7 = (Node)param.getParaObjectAt(7);
		Node param8 = (Node)param.getParaObjectAt(8);
		
		String mailType = "0";
		PersistenceBroker db = param.getDBBroker();
		
		String popServer = param3.getFirstChild().getNodeValue();
		String tempServer = popServer;
		popServer = popServer.substring(0,popServer.lastIndexOf(":"));
		int port = 110;
		port = Integer.parseInt(tempServer.substring(tempServer.lastIndexOf(":")+1));
		String popAccount = param4.getFirstChild().getNodeValue();
		String popPwd = param5.getFirstChild().getNodeValue();
		String flag = param6.getFirstChild().getNodeValue();
		int mailFolder =Integer.parseInt(param7.getFirstChild().getNodeValue());
		String userId = param8.getFirstChild().getNodeValue();
		OutMail.receive(db,popServer,port,popAccount,popPwd,param0,param1,flag,mailFolder,userId);
		return 1;
	}
	
	
	/**
	 * 进行邮件的接收
	 * @param popServer
	 * @param port
	 * @param popAccount
	 * @param popPwd
	 * @param mailNode
	 * @param aNode
	 * @param flag
	 * @param mailFolder
	 * @param userId
	 */
	public static void receive(PersistenceBroker db,String popServer,int port,String popAccount,String popPwd,
								Node mailNode,Node aNode,String flag,int mailFolder,String userId){
		Store store = null;
		Folder folder = null;
		Message msg;
		int mailcount = 0;
		try{
			Properties props = System.getProperties();
			Session session = Session.getDefaultInstance(props, null);
			store = session.getStore("pop3");
			store.connect(popServer,port, popAccount, popPwd);
			System.out.print("################### popServer is " + popServer + "port is " + port + "popUser is " + popAccount + "Pwd is" + popPwd);
			folder = store.getDefaultFolder();
			if (folder == null)throw new Exception("No default folder");
			folder = folder.getFolder("INBOX");
			if (folder == null)throw new Exception("No POP3 INBOX");
			folder.open(Folder.READ_WRITE);
			mailcount = folder.getMessageCount();
			System.out.print("^^^^^^^mailnum is " + mailcount + "^^^^^^");
			
			for (int msgNum = 1; msgNum <= mailcount; msgNum++){
				msg = folder.getMessage(msgNum);
				OutMail.getMessage(db,msg,mailNode,aNode,flag,mailFolder,userId);
				if(flag.equals("0")){
					msg.setFlag(Flags.Flag.DELETED, true);
				}
			}//for
		}catch(Exception ee){
			ee.printStackTrace();
		}finally{
			 try {
                if (folder != null && folder.isOpen()) folder.close(true);//注意,关闭时必须为true才能删除服务器上邮件.
                if (store != null) store.close();

            } catch (Exception ex2) {
                ex2.printStackTrace();
            }
			
		}
		
	}
	
	public static int getPrimaryKey(Node node,PersistenceBroker db) throws Exception{
		int key = 0;
		String pkName = "";
		if(pkName == null || "".equals(pkName)) pkName = node.getNodeName();
		key = Unique.nextInt(db.getAppID(),pkName);
		return key;
		
		
	}
	
	
	/**
	 * 增加邮件
	 * 
	 */
	
	public static void addMail(PersistenceBroker db,int mailId,String userAccount,String postUserName,
									String postAddress,String receiveAddress,String copySend,String denseSend,
									String sendDate,String title,int mailDirId,String reflag,String readFlag,
									String content,String mailType,String priority,int mailSize,int oldMailDirId){
		Connection cn = null;
		PreparedStatement pst = null;
		DBconnection testdb = new DBconnection();
		String sqlstr = "insert into TOOL_Mail(MAILID,USERACCOUNT,POSTUSERNAME,POSTADDRESS,RECEIVEADDRESS,COPYSEND,DENSESEND,SENDDATE,TITLE,MAILDIRID,REFLAG,READFLAG,CONTENT,MAILTYPE,PRIORITY,MAILSIZE,OLDMAILDIRID) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		//String sqlstr = "insert into TOOL_Mail(MAILID,USERACCOUNT,POSTUSERNAME,POSTADDRESS,RECEIVEADDRESS,COPYSEND,DENSESEND,SENDDATE,TITLE,MAILDIRID,REFLAG,READFLAG,MAILTYPE,PRIORITY,MAILSIZE,OLDMAILDIRID) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		//String sqlstr = "insert into TOOL_MAIL values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try{
			cn = testdb.getEOSConnection();
			//cn.setAutoCommit(false);
			pst = cn.prepareStatement(sqlstr);
			pst.setInt(1,mailId);
			pst.setString(2,userAccount);
			pst.setString(3,postUserName);
			pst.setString(4,postAddress);
			pst.setString(5,receiveAddress);
			pst.setString(6,copySend);
			pst.setString(7,denseSend);
			pst.setString(8,sendDate);
			pst.setString(9,title);
			pst.setInt(10,mailDirId);
			pst.setString(11,reflag);
			pst.setString(12,readFlag);
			pst.setString(13,content);
			pst.setString(14,mailType);
			pst.setString(15,priority);
			pst.setInt(16,mailSize);
			pst.setInt(17,oldMailDirId);
			int result = pst.executeUpdate();
			//cn.setAutoCommit(true);
			
		}catch(Exception ex){
			ex.printStackTrace();
			try{
				cn.rollback();
				
			}catch(Exception ee){
				
			}
			
			
		}finally{
			try{
				//cn.commit();
				if(pst!=null) pst.close();
				if(cn!=null) cn.close();
				
			}catch(Exception ep){
				ep.printStackTrace();
				
			}
			
		}
		//OutMail.update(db,"TOOL_MAIL","MAILID","CONTENT",String.valueOf(mailId),content);
		
	}
	
	
	/**
	 * 增加邮件附件
	 */
	public static void addMailAttach(PersistenceBroker db,int attachId,int mailId,String attachName,String filePath,String remark){
		Connection cn = null;
		PreparedStatement pst = null;
		DBconnection testdb = new DBconnection();
		String sqlstr = "insert into TOOL_MailAttch values(?,?,?,?,?)";
		try{
			cn = testdb.getEOSConnection();
			//cn.setAutoCommit(false);
			pst = cn.prepareStatement(sqlstr);
			pst.setInt(1,attachId);
			pst.setInt(2,mailId);
			pst.setString(3,attachName);
			pst.setString(4,filePath);
			pst.setString(5,remark);
			int result = pst.executeUpdate();
			//if (result > 0) cn.setAutoCommit(true);
		}catch(Exception ex){
			ex.printStackTrace();
			try{
				cn.rollback();
			}catch(Exception ee){
				
			}
			
			
		}finally{
			try{
				//cn.commit();
				if(pst!=null) pst.close();
				if(cn!=null) cn.close();
				
			}catch(Exception ep){
				ep.printStackTrace();
				
			}
		}
	}
	
	/**
	 * 保存附件文件
	 * @param filename
	 * @param in
	 * @throws IOException
	 */
	public static String saveAttacheFile(String userAccount,String filename, InputStream in) throws IOException {
		//System.out.println("file save as:" + filename + "\t");
		String fileAllPath = "";
		String savaPath = "d:\\upload\\outmail\\" + userAccount;
		File fdir = new File(savaPath);
		//if(!fdir.exists()) fdir.mkdirs();
		fdir.mkdirs();
		
		File f = new File(savaPath, filename);
		FileOutputStream outf = new FileOutputStream(f);
		int b;
		while ((b = in.read()) != -1)
			outf.write(b);
		outf.flush();
		outf.close();
		fileAllPath = savaPath + "\\" + filename;
		return fileAllPath;
	}
	
	
	/**
	 * 字符码问题转换
	 * @param s
	 * @return
	 */
	 public static String toChinese(String s) {
        if (s == null)
            return null;
        String s1 = null;
        try {
            byte abyte0[] = s.getBytes("iso-8859-1");
            s1 = new String(abyte0,"gb2312");
        } catch (UnsupportedEncodingException unsupportedencodingexception) {
            System.err.println("toChinese error:" + s +
                               unsupportedencodingexception.toString());
        }
        return s1;
	 }
	 
	 
	 /**
	  * 字符码问题转换
	  * @param s
	  * @return
	  */
	 public static String to_8859_1(String s) {
        if (s == null)
            return null;
        try {
            return new String(s.getBytes(), "iso-8859-1");

        } catch (Exception _ex) {
            _ex.printStackTrace();
            String s1 = null;
            return s1;
        }
    }
	 
	 
	 /**
	  * 接收邮件一个信息
	  * @param message
	  * @throws Exception
	  */
	 public static void getMessage(PersistenceBroker db,Message message,Node mailNode,Node aNode,String flag,int mailFolder,String userId) throws Exception{
	 	String postUserName = "";
	 	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	 	//int mailId = OutMail.getPrimaryKey(mailNode,db);
	 	int mailId = Webpriary.getPriaryTemp(db.getConnection(),"TOOL_Mail","MAILID");
	 	System.out.println("################## mailId is " + mailId);
	 	try{
	 		if (message.getFrom() != null)
	 		   postUserName = ((InternetAddress) message.getFrom()[0]).getAddress();//寄信人
	 		//String postUserName = "fcclzydouble@163.com";
	 		 System.out.println("#################### postUserName is " + postUserName);
	 		String postAddress = postUserName;//寄信人邮件地址
	 		String receiveAddress = "";
	 		InternetAddress[] to = (InternetAddress[])message.getRecipients(Message.RecipientType.TO);
	 		for(int i = 0; i<to.length; i++){
	 			receiveAddress += to[i].getAddress() + ",";
	 		}
	 		receiveAddress = receiveAddress.substring(0,receiveAddress.lastIndexOf(","));//收信人地址
	 		System.out.println("#################### receiveAddress is " + receiveAddress);
	 		
	 		String copySend = "";
	 		InternetAddress[] cc = null;
	 		if(message.getRecipients(Message.RecipientType.CC)!=null){
	 			cc = (InternetAddress[])message.getRecipients(Message.RecipientType.CC);
	 			for(int j = 0; j<cc.length; j++){
	 				copySend += cc[j].getAddress() + ",";
	 			}
	 			copySend = copySend.substring(0,copySend.lastIndexOf(","));//抄送人地址
	 		}
	 		
	 		System.out.println("#################### copySend is " + copySend);
	 		String denseSend = "";//密送人地址
	 		String sendDate = "";
	 		if(message.getSentDate()!=null)
	 		sendDate = sdf.format(message.getSentDate());//发送日期
	 		System.out.println("#################### sendDate is " + sendDate);
	 		
	 		String title = message.getSubject();//邮件主题
	 		System.out.println("#################### title is " + title);
	 		
	 		int mailSize = message.getSize();
	 		System.out.println("#################### mailSize is " + mailSize);
	 		
	 		String mailContent = "";
	 		
	 		Part messagePart = message;
	 		
	 		
	 		//System.out.println("#################### mailContent is " + getMailContent(messagePart,bodytext));
	 		
	 		Object content = messagePart.getContent();
	 		
	 		//读取邮件内容
		 	getMailContent(messagePart);
		 	mailContent = bodytext.toString();
		 	bodytext.delete(0,bodytext.length());
	 		
	 		String contentType = messagePart.getContentType();
	 		if(contentType.startsWith("text/plain")||contentType.startsWith("text/html")){
	 			//InputStream in = messagePart.getInputStream();
	 			//BufferedReader reader = new BufferedReader(new InputStreamReader(in));
	 			//String thisLine = "";
	 			//while (( thisLine = reader.readLine()) != null) {
                    //thisLine = reader.readLine();
                    //mailContent += thisLine;
                //}
	 			//reader.close();
                //in.close();
                //mailContent = OutMail.toChinese(mailContent);
               
                System.out.println("#################### mailContent is " + mailContent);		
                OutMail.addMail(db,mailId,userId,postUserName,
						postAddress,receiveAddress,copySend,denseSend,
						sendDate,title,mailFolder,"0","0",
						mailContent,"0","0",mailSize,mailFolder);
                System.out.println("#################### mail insert is successful");	
	 		}
	 		if(content instanceof Multipart){
	 			Multipart mpart = (Multipart) content;
	 			String thisLineOther = "";
	 			List list = new ArrayList();
	 			 for(int j = 0; j < mpart.getCount(); j++){
	 			 	Part part = mpart.getBodyPart(j); //获得每个bodypart
	 			 	//String temp = part.getFileName();
	 			 	//String s = temp.substring(11,temp.indexOf("?=")-1);//去到header和footer
	 			 	
	 			 	String filename = part.getFileName(); //附件文件名
	 			 	
	 			 	
	 			 	
	 			 	if (filename == null) filename = "";
	 			 	String disposition = part.getDisposition(); //附件标志，但有些邮件客户端不设置这个值。
	 			 	contentType = part.getContentType(); //content type
	 			 	
	 			 	if (filename.length() > 0){
	 			 		filename = OutMail.decodeText(filename);
	 			 		
	 			 		System.out.println("^^^^^^^^^^^^^^^^^" + filename);
	 			 		System.out.println("#################### filename " + filename);	
	 			 		InputStream in = new BufferedInputStream(part.getInputStream()); //获得附加文件的inputstream，然后进行处理
	 			 		String fileAllPath = OutMail.saveAttacheFile(userId,filename, in);
	 			 		in.close();
	 			 		Mailattach tempAttach = new Mailattach(filename,fileAllPath,contentType);
	 			 		list.add(tempAttach);
	 			 	}
	 			 	//else{
	 			 		//InputStream in = messagePart.getInputStream();
	 			 		//BufferedReader reader = new BufferedReader(new InputStreamReader(in));
	 			 		
	 			 		//while ((thisLineOther = reader.readLine()) != null) {
	 			 			//thisLineOther = new String(thisLineOther.getBytes("US-ASCII"),"gb2312");
	 			 			//mailContent += thisLineOther;
                        //}
	 			 		//reader.close();
                        //in.close();
	 			 		//mailContent = getMailContent(messagePart,bodytext);
	 			 	//}
	 			 }

	 			//System.out.println("#################### mailContent is " + mailContent);
	 			OutMail.addMail(db,mailId,userId,postUserName,
						postAddress,receiveAddress,copySend,denseSend,
						sendDate,title,mailFolder,"0","0",
						mailContent,"0","0",mailSize,mailFolder);
	 			System.out.println("#################### mail insert is successful");	
	 			for(int m = 0; m<list.size(); m++){
	 				Mailattach t = (Mailattach) list.get(m);
	 				int attachId = OutMail.getPrimaryKey(aNode,db);
	 				System.out.println("#################### mail attachId is " + attachId);
	 				int pmailId = mailId;
	 				String attachName = t.getAttachName();
	 				String filePath = t.getFilePath();
	 				String remark = t.getRemark();
	 				OutMail.addMailAttach(db,attachId,pmailId,attachName,filePath,remark);
	 				System.out.println("#################### mail attach insert is successful");
	 				
	 			}
	 		}

	 		
	 	}catch(Exception ex){
	 		ex.printStackTrace();
	 	}
	 }
	 
	 public static String base64Decoder(String s) throws Exception{
	 	sun.misc.BASE64Decoder decoder = new sun.misc.BASE64Decoder();
	 	byte[] b=decoder.decodeBuffer(s);
	 	return(new String(b));
	 }
	 
	 
	 public static String decodeText(String text) throws UnsupportedEncodingException{
	 	if(text==null) return null;
	 	if (text.startsWith("=?GB") || text.startsWith("=?gb")){
	 		text = MimeUtility.decodeText(text);

	 	}else{
	 		text = new String(text.getBytes("ISO8859_1"));
	 	}
	 	return text;
	 	
	 }
	 
	 public static void update(PersistenceBroker db,String tableName,String identifyField,String clobField,String val1,String val2){
		int value = -1;
		
		Connection cn = null;
		Statement st = null;
		ResultSet rs = null;
		String readStr = "";
		String updateSql = "update " + tableName + " set "+ clobField + "= empty_clob() where " + identifyField + "=" + val1;
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + updateSql + "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		String selstr = "select " + clobField + " from " + tableName + " where " + identifyField + "=" + val1 + " for update";
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + selstr + "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		
		try{
			cn = db.getConnection();
			cn.setAutoCommit(false);
			st = cn.createStatement();
			int m = st.executeUpdate(updateSql);
			
			rs = st.executeQuery(selstr);
			if(rs.next()){
				CLOB myclob=(CLOB)rs.getClob(clobField);
				BufferedWriter out = new BufferedWriter(myclob.getCharacterOutputStream());
				BufferedReader in = new BufferedReader(new StringReader(val2));
				
				while((readStr = in.readLine())!=null){
					out.write(readStr);
				}
				in.close();
				out.close();
			}
			cn.setAutoCommit(true);
			value = 1;
			
		}catch(Exception ex){
			ex.printStackTrace();
			try{
				cn.rollback();
			}catch(Exception er){
				er.printStackTrace();
			}
			
		}finally{
			try{
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				if(cn!=null) cn.close();
				
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
		
		
		
		
	}
	 
	 
	
	/**
	 * 删除远程POP3上的邮件
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_deleteMail
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="删除后的邮件数量"
	 * @bizlet_param passing="in" type="field" value="/" name="" desc="POP3邮件服务器地址"
	 * @bizlet_param passing="in" type="field" value="/" name="" desc="POP3服务器帐号"
	 * @bizlet_param passing="in" type="field" value="/" name="" desc="POP3服务器密码"
	 */
	public static int BL_deleteMail(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);
		Node param1 = (Node)param.getParaObjectAt(1);
		Node param2 = (Node)param.getParaObjectAt(2);
		Node param3 = (Node)param.getParaObjectAt(3);
		String pop3Server = param1.getFirstChild().getNodeValue();
		String tempServer = pop3Server;
		pop3Server = pop3Server.substring(0,pop3Server.lastIndexOf(":"));
		int port = 110;
		port = Integer.parseInt(tempServer.substring(tempServer.lastIndexOf(":")+1));
		String pop3User = param2.getFirstChild().getNodeValue();
		String pop3Pwd = param3.getFirstChild().getNodeValue();
		Store store = null;
		Folder folder = null;
		int mailCount = 0;
		int i = 0;
		String result = "连接失败";
		try{
			Properties props = System.getProperties();
			Session session = Session.getDefaultInstance(props,null);
			store = session.getStore("pop3");
			store.connect(pop3Server,port,pop3User,pop3Pwd);
			folder = store.getDefaultFolder();
			if (folder == null)throw new Exception("No default folder");
			folder = folder.getFolder("INBOX");
			if (folder == null)throw new Exception("No POP3 INBOX");
			folder.open(Folder.READ_WRITE);
			mailCount = folder.getMessageCount();
			i = mailCount;
			for (int msgNum = 1; msgNum <= mailCount; msgNum++){
				Message msg = folder.getMessage(msgNum);
				msg.setFlag(Flags.Flag.DELETED, true);
				if (msg.isSet(Flags.Flag.DELETED)){
					i--;
				}
			}
			result = String.valueOf(i);
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(folder!=null) folder.close(true);
				if(store!=null) store = null;
				
			}catch(Exception ex){
				ex.printStackTrace();
			}
		}
		XmlUtil.setNodeValue(param0,result);
		
		return 1;
	}
	
	
	public static int sendMail(String mailhost,int port,String username,String pwd,InternetAddress from,InternetAddress[] to,InternetAddress[] cc,InternetAddress[] bcc,String subject,String content,List fileList,String encoding,String smtpAuth){
		int i = -1;
		boolean debug = false;
		MimeMessage msg = null;
		Transport transport = null;
		Multipart mp=new MimeMultipart();
		
		Properties props = System.getProperties();
		props.put("mail.smtp.host",mailhost);
		if(smtpAuth.equals("1")){
			props.put("mail.smtp.auth","true");
		}
		Session session = Session.getDefaultInstance(props);
		session.setDebug(debug);
		try{
			msg = new MimeMessage(session);
			msg.setSubject(subject,encoding);//邮件主题
			msg.setFrom(from);
			if(to != null && to.length > 0){
				msg.setRecipients(Message.RecipientType.TO,to);//邮件接收人
			}
			if(cc != null && cc.length > 0){
				msg.setRecipients(Message.RecipientType.CC,cc);//邮件抄送人
			}
			if(bcc != null && bcc.length > 0){
				msg.setRecipients(Message.RecipientType.BCC,bcc);//邮件密送人
			}
			
			MimeBodyPart mbp1=new MimeBodyPart();//邮件正文
			mbp1.setContent(content,"text/html;charset="+encoding);
			mp.addBodyPart(mbp1);
			
			//邮件附件
			if( fileList != null ){
				for(int j = 0; j<fileList.size(); j++){
					String attachName = (String)fileList.get(j);
					System.out.print("############################# attachname is " + attachName);
					MimeBodyPart mbpTemp=new MimeBodyPart();
					//mbpTemp.setHeader("Content-Location",attachName);
					FileDataSource fds = new FileDataSource(attachName);
					//FileDataSource fds = new FileDataSource("d:\\talent.doc");
					DataHandler dh = new DataHandler(fds);
					
					mbpTemp.setDataHandler(dh);
					mbpTemp.setFileName(MimeUtility.encodeText(fds.getName(),"GB2312", "B"));
					//mbpTemp.setFileName(attachName.substring(attachName.lastIndexOf("\\")+1));
					
					mp.addBodyPart(mbpTemp);
				}
			}
			
			msg.setContent(mp);
			
			msg.setSentDate(Calendar.getInstance().getTime());//发送日期
			if(smtpAuth.equals("1")){
				transport = session.getTransport("smtp");
				//transport.connect(mailhost,port,username,pwd);
				System.out.print("^^^^^mailhost is "+mailhost + "^^^ port is " +port + "^^^ username is " + username + "^^^ pwd is" +pwd);
				transport.connect(mailhost,username,pwd);
				transport.sendMessage(msg, msg.getAllRecipients());
				i = 1;
			}else{
				Transport.send(msg,msg.getAllRecipients());
				i = 1;
			}
			
		}catch(Exception ex){
			 i = -1;
			ex.printStackTrace();
		
		}finally{
			try{
		        if(transport!=null) transport.close();
		      
			}catch(Exception ex){
		        ex.printStackTrace();
		      
			}
		
		}
		
		return i;
	}
	/**
	 * 发送外部邮件
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_smtpSend
	 * @bizlet_param passing="in" type="EOSEntity" value="/" name="" desc="传入TOOL_MAIL实体"
	 * @bizlet_param passing="in" type="EOSEntity" value="/" name="" desc="传入TOOL_MAILSERVER实体"
	 * @bizlet_param passing="in" type="field" value="/" name="" desc="传入outmailAttach附件，用;分开的文件全名"
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="返回值"
	 */
	public static int BL_smtpSend(Document doc, BizContext param) throws Exception{
		int retValue = -1;
		Node param0 = (Node)param.getParaObjectAt(0);
		Node param1 = (Node)param.getParaObjectAt(1);
		Node param2 = (Node)param.getParaObjectAt(2);
		Node param3 = (Node)param.getParaObjectAt(3);
		
		Element tool_mail = (Element)param0;
		Element tool_mailserver = (Element)param1;
		List fileList = new ArrayList();//附件集合
		if(param2.hasChildNodes()){
			String outmailAttach = param2.getFirstChild().getNodeValue();
			if(!"".equalsIgnoreCase(outmailAttach)&&null!=outmailAttach){
				String[] tempArray = outmailAttach.split(",");
				for(int i = 0; i<tempArray.length; i++){
					System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@ attachname is " + tempArray[i]);
					fileList.add(tempArray[i]);
				}//for
			}
		}//if
		
		String mailhostAndPort = tool_mailserver.getElementsByTagName("SMTPSERVER").item(0).getFirstChild().getNodeValue();
		String mailhost = mailhostAndPort.substring(0,mailhostAndPort.lastIndexOf(":"));//邮件主机名
		int port = Integer.parseInt(mailhostAndPort.substring(mailhostAndPort.lastIndexOf(":")+1));//邮件端口
		System.out.print("^^^^^^^^^^^^^^^mailhost is " + mailhost + "***** port is " + port);
		String username = "";
		if(tool_mailserver.getElementsByTagName("SMTPNAME").item(0).hasChildNodes()){
			username = tool_mailserver.getElementsByTagName("SMTPNAME").item(0).getFirstChild().getNodeValue();//用户名
		}
		System.out.print("^^^^^^ userName is " + username);
		
		InternetAddress from = null;
		
		String mailfrom = tool_mailserver.getElementsByTagName("SHOWADDRESS").item(0).getFirstChild().getNodeValue();//发送地址
		from = new InternetAddress(mailfrom);
		
		String pwd = "";
		if(tool_mailserver.getElementsByTagName("SMTPPWD").item(0).hasChildNodes()){
			pwd = tool_mailserver.getElementsByTagName("SMTPPWD").item(0).getFirstChild().getNodeValue();//密码
		}
		
		System.out.print("^^^^^^^ pwd is " + pwd + "^^^mailfrom is " + mailfrom);
		String smtpAuth = tool_mailserver.getElementsByTagName("SMTPAUTH").item(0).getFirstChild().getNodeValue();//邮件认证与否
		String encoding = "gb2312";//编码
		
		String subject = "";
		String content = "";
		InternetAddress[] to = null;//收信人
		String tempto = "";
		InternetAddress[] cc = null;//抄送人
		String tempcc = "";
		InternetAddress[] bcc = null;//密送人
		String tempbcc = "";
		
		List singleAddr = new ArrayList();
		
		subject = tool_mail.getElementsByTagName("TITLE").item(0).getFirstChild().getNodeValue();//邮件主题
		content = tool_mail.getElementsByTagName("CONTENT").item(0).getFirstChild().getNodeValue();//邮件内容
		
		tempto = tool_mail.getElementsByTagName("RECEIVEADDRESS").item(0).getFirstChild().getNodeValue();
		String[] arrayTempTo = getUserEmail(tempto.split(","));
		int tolength = arrayTempTo.length;
		to = new InternetAddress[tolength];
		for(int m = 0;m<tolength;m++){
			System.out.print("*****************TT address is " + arrayTempTo[m]);
			to[m] = new InternetAddress(arrayTempTo[m]);
			singleAddr.add(arrayTempTo[m]);
		}
		
		String[] arrayTempCc = null;
		if(tool_mail.getElementsByTagName("COPYSEND").item(0).hasChildNodes()){
			System.out.println("+++++++++++++++++++++++++++" + tool_mail.getElementsByTagName("COPYSEND").item(0).hasChildNodes());
			
			System.out.print("%%%%%%%%%%%%%%%%%%********"+tool_mail.getElementsByTagName("COPYSEND").getLength());
			tempcc = tool_mail.getElementsByTagName("COPYSEND").item(0).getFirstChild().getNodeValue();
			System.out.println("********************" + tempcc);
			if(!"".equalsIgnoreCase(tempcc)&&null!=tempcc){
				arrayTempCc = getUserEmail(tempcc.split(","));
				int cclength = arrayTempCc.length;
				cc = new InternetAddress[cclength];
				for(int n = 0;n<cclength; n++){
					System.out.print("*****************CC address is " + arrayTempCc[n]);
					cc[n] = new InternetAddress(arrayTempCc[n]);
					singleAddr.add(arrayTempCc[n]);
				}
			}
			
		}
		
		String[] arrayTempBcc = null;
		if(tool_mail.getElementsByTagName("DENSESEND").item(0).hasChildNodes()){
			tempbcc = tool_mail.getElementsByTagName("DENSESEND").item(0).getFirstChild().getNodeValue();
			System.out.println("********************" + tempbcc);
			if(!"".equalsIgnoreCase(tempbcc)&&null!=tempbcc){
				arrayTempBcc = getUserEmail(tempbcc.split(","));
				int bcclength = arrayTempBcc.length;
				bcc = new InternetAddress[bcclength];
				for(int p = 0;p<bcclength; p++){
					System.out.print("*****************BCC address is " + arrayTempBcc[p]);
					bcc[p] = new InternetAddress(arrayTempBcc[p]);
					singleAddr.add(arrayTempBcc[p]);
				}
				
			}
			
		}
		
		if (arrayTempTo.length==0 && arrayTempCc.length==0 && arrayTempBcc.length==0) {
			XmlUtil.setNodeValue(param3,"邮件发送失败，所有收件人都没有设置外发邮件地址！");
			return -1;
		}
		
//		System.out.print("*****************ISSINGLE is " + tool_mail.getElementsByTagName("ISSINGLE").item(0).getFirstChild().getNodeValue());
		if(tool_mail.getElementsByTagName("ISSINGLE").item(0)==null) {
			retValue = OutMail.sendMail(mailhost,port,username,pwd,from,to,cc,bcc,subject,content,fileList,encoding,smtpAuth);
			System.out.print("$$$$$$$$ return value is " + retValue);
			XmlUtil.setNodeValue(param3,String.valueOf(retValue));
			
		}else{
			for(int j = 0; j < singleAddr.size(); j++) {
				String tempStr = (String)singleAddr.get(j);
				InternetAddress[] sendtemp = {new InternetAddress(tempStr)};
				retValue = OutMail.sendMail(mailhost,port,username,pwd,from,sendtemp,null,null,subject,content,fileList,encoding,smtpAuth);
			}
			
			
		}
		
		if (retValue == 1) XmlUtil.setNodeValue(param3,"邮件发送并保存成功！");
		
		
		return retValue;
	}
	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_getAttachPath
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="输入输出一个附件的集，用，分开的字符串"
	 * @bizlet_param passing="in" type="field" value="/" name="" desc="上传的文件集合"
	 */
	public static int BL_getAttachPath(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);
		Node param1 = (Node)param.getParaObjectAt(1);
		Element e = (Element)param1;
		String savaAttach = XmlUtil.getNodeValue(param0);
		System.out.print("^^^^^^ savaAttach is " + savaAttach);
		String tempPath = "";
		String result = "";
		String tempstr = "";
		if(XmlUtil.hasChildNodes(param1)){
			NodeList upLoad = e.getElementsByTagName("FBFILE_T_FILE");
			//NodeList upLoad = XmlUtil.findNodes(param1,"FBFILE_T_FILE");
			int len = upLoad.getLength();
			System.out.print("^^^^^ len is " + len);
			for(int i = 0; i<len; i++){
				Element fileItem = (Element)upLoad.item(i);
				String upPath = fileItem.getElementsByTagName("ABSOLUTEPATH").item(0).getFirstChild().getNodeValue();
				tempPath += upPath + ",";
				System.out.print("^^^^^^ tempPath is " + tempPath);
				
			}//for
			tempPath = tempPath.substring(0,tempPath.lastIndexOf(","));
			
		}//if
		
		if(savaAttach!=null&&!"".equalsIgnoreCase(savaAttach)){
			if(tempPath!=null&&!"".equalsIgnoreCase(tempPath)){
				result = savaAttach + "," + tempPath;
			}else{
				result = savaAttach;
			}
			System.out.print("^^^^^^ result is " + result);
			
		}else{
			if(tempPath!=null&&!"".equalsIgnoreCase(tempPath)){
				result = tempPath;
			}
			System.out.print("^^^^^^ result is " + result);
		}
		
		XmlUtil.setNodeValue(param0,result);
		
		
		return 1;
	}
	
    public static String[] getUserEmail(String[] users) {
    	String[] mails = null;
    	List mailist = new ArrayList();
    	DBconnection db = new DBconnection();
    	Connection conn = db.getEOSConnection();
    	
    	for (int i=0;i<users.length;i++) {
    		Statement stm = null;
    		ResultSet rs = null;
    		
    		if (users[i].indexOf("@")>=0) {
    			mailist.add(users[i]);
    			continue;
    		}
    		
    		String sql = "select top 1 a.mail from ("
                       + "select SHOWADDRESS mail from TOOL_MAILSERVER where USERACCOUNT='" + users[i] + "' and SHOWADDRESS is not null "
                       + "union "
                       + "select Email mail from Teacher where TeacherID=" + users[i] + " and Email is not null) a";
    		try {
    			stm = conn.createStatement();
    		    rs = stm.executeQuery(sql);
    		   
    		    if (rs!=null && rs.next()) {
    		    	String mail = rs.getString("mail");
    		    	mailist.add(mail);
    		    }
    		} catch (Exception e) {
    			e.printStackTrace();
    		} finally {
    			try {
    			   if (stm!=null) stm.close();
    			   if (rs!=null) rs.close();
    			}catch (Exception e) {
        			e.printStackTrace();
        		} 
    		}
    	}
    	
    	mails = new String[mailist.size()];
    	for (int j=0;j<mailist.size();j++) {
    		mails[j] = (String)mailist.get(j);
    	}
    	
    	try {
    		if (conn != null) conn.close();
    	} catch(Exception ex) {
    		ex.printStackTrace();
    	}
    	
    	return mails;
    }
	
    /**   
     * 解析邮件，把得到的邮件内容保存到一个StringBuffer对象中，解析邮件 主要是根据MimeType类型的不同执行不同的操作，一步一步的解析   
     */   
    public static void getMailContent(Part part) throws Exception {  
        String contenttype = part.getContentType();    
        int nameindex = contenttype.indexOf("name");    
        boolean conname = false;    
        if (nameindex != -1)    
            conname = true;    
        System.out.println("CONTENTTYPE: " + contenttype);    
        System.out.println("Content: " + bodytext.toString());
        if (part.isMimeType("text/plain") && !conname) {    
            bodytext.append((String) part.getContent());
        } else if (part.isMimeType("text/html") && !conname) {  
        	if (bodytext.toString().indexOf("HTML")<0 && !"".equals(bodytext.toString())) {
        	    bodytext.delete(0,bodytext.length());
                bodytext.append((String) part.getContent());
        	} else {
        		bodytext.append((String) part.getContent());
        	}
        } else if (part.isMimeType("multipart/*")) {    
            Multipart multipart = (Multipart) part.getContent(); 
            int counts = multipart.getCount();
            for (int i = 0; i < counts; i++) {
                getMailContent(multipart.getBodyPart(i));
            }    
        } else if (part.isMimeType("message/rfc822")) {    
            getMailContent((Part) part.getContent());
        } else {}    
        
        //return bodytext.toString();
    }    
}