/*
 * 创建日期 2006-9-6
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
package talent.tool;

import java.util.*;
import javax.mail.internet.*;

/**
 * @author user
 * 
 * TODO 要更改此生成的类型注释的模板，请转至 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class MailInfo {
	String mailhost;
	int port;
	String username;

	String pwd;

	InternetAddress from;

	InternetAddress[] to;

	InternetAddress[] cc;

	InternetAddress[] bcc;

	String subject;

	String content;

	List fileList;

	String encoding;

	String smtpAuth;

	public MailInfo() {

	}

	public MailInfo(String mailhost, int port, String username, String pwd,
			InternetAddress from, InternetAddress[] to, InternetAddress[] cc,
			InternetAddress[] bcc, String subject, String content,
			List fileList, String encoding, String smtpAuth) {
		this.mailhost = mailhost;
		this.port = port;
		this.username = username;
		this.pwd = pwd;
		this.from = from;
		this.to = to;
		this.cc = cc;
		this.fileList = fileList;
		this.encoding = encoding;
		this.smtpAuth = smtpAuth;
	}
	
	public InternetAddress[] getBcc() {
		return bcc;
	}
	public void setBcc(InternetAddress[] bcc) {
		this.bcc = bcc;
	}
	public InternetAddress[] getCc() {
		return cc;
	}
	public void setCc(InternetAddress[] cc) {
		this.cc = cc;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getEncoding() {
		return encoding;
	}
	public void setEncoding(String encoding) {
		this.encoding = encoding;
	}
	public List getFileList() {
		return fileList;
	}
	public void setFileList(List fileList) {
		this.fileList = fileList;
	}
	public InternetAddress getFrom() {
		return from;
	}
	public void setFrom(InternetAddress from) {
		this.from = from;
	}
	public String getMailhost() {
		return mailhost;
	}
	public void setMailhost(String mailhost) {
		this.mailhost = mailhost;
	}
	public int getPort() {
		return port;
	}
	public void setPort(int port) {
		this.port = port;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getSmtpAuth() {
		return smtpAuth;
	}
	public void setSmtpAuth(String smtpAuth) {
		this.smtpAuth = smtpAuth;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public InternetAddress[] getTo() {
		return to;
	}
	public void setTo(InternetAddress[] to) {
		this.to = to;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
}