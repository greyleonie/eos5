/*
 * �������� 2006-11-15
 *
 * TODO Ҫ���Ĵ����ɵ��ļ���ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
package talent.core;

import java.io.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;

import base.util.DBconnection;

/**
 * @author Administrator
 *
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
public class TalentLoaddowFromDB {

	public void loaddown(PageContext pageContext) throws Exception{
		HttpServletRequest req = (HttpServletRequest) pageContext.getRequest();
		HttpServletResponse res = (HttpServletResponse) pageContext.getResponse();
		
		String table = req.getParameter("table");//����
		String pkn = req.getParameter("pkn");//������
		String field = req.getParameter("field");//byte�ֶ���
		String pkv = req.getParameter("pkv");//����ֵ
		String type = req.getParameter("type");//����
		String fileName = req.getParameter("fileName");
		if(fileName == null) fileName = "talent.temp";
		if(type == null) type = "image/*";
		byte[] filecontent = getFileContent(table,pkn,field,pkv);
		
		res.setContentType(type);
		
			res.setHeader("Content-Disposition", "inline;filename=" + new String(fileName.getBytes("gb2312"),"8859_1") + ";");
		
		if(filecontent==null&&type.equals("image/*")){ //û��ͼƬ�͸��š�����ͼƬ����ͼƬ����
			filecontent=getNoPic(req);
		}
		outputBlob(res.getOutputStream(),filecontent);
		
	}
	
	public byte[] getFileContent(String table,String pkn,String field,String pkv) {
		byte[] result = null;
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		String sql = "select " + field + " from " + table + " where " + pkn + "=" + pkv;
		System.out.println("********byte sql is:" + sql);
		
		try{
			DBconnection db = new DBconnection();
			con = db.getEOSConnection();
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				result = rs.getBytes(field);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally{
			try{
				if(rs!=null) rs.close();
				if(st!=null) st.close();
				if(con!=null) con.close();
				
			}catch(Exception e) {
				
			}
		}
		
		return result;
	
	}
	
	private void outputBlob(OutputStream os,byte b[]) throws Exception{
	   if(b!=null) {
	   		os.write(b);
	   		os.flush();	
	   }
	}
	
	
	
	public byte[] getNoPic(HttpServletRequest req)  throws Exception{
		byte[] result = null;
		try{
			String path = req.getRealPath("/internet/image/noPic.gif");
			System.out.println("-----------path=" + path);
			
			File file = new File(path);
			FileInputStream in = new FileInputStream(file);
			BufferedInputStream bin = new BufferedInputStream(in);
			byte[] r = new byte[2048];
			int i = 0;
			ByteArrayOutputStream byteOut = new ByteArrayOutputStream();
			while((i = bin.read(r))!=-1) {
				byteOut.write(r,0,i);
			}
			result = byteOut.toByteArray();
		}
		catch(Exception e){
			//e.printStackTrace();
		}
		return result;
	}
	
	
	public void loaddownFromDisk(PageContext pageContext) throws Exception {
		HttpServletRequest req = (HttpServletRequest) pageContext.getRequest();
		HttpServletResponse res = (HttpServletResponse) pageContext.getResponse();
		
		String fileName = req.getParameter("fileName");
		String filePath = req.getParameter("filePath");
		String fileType = req.getParameter("fileType");
		
		res.setContentType(fileType);
		res.setHeader("Content-Disposition", "inline;filename=" + new String(fileName.getBytes("gb2312"),"8859_1") + ";");
		
		outputBlob(res.getOutputStream(),getFile(new File(filePath)));
		
	}
	
	public byte[] getFile(File file) throws Exception {
		byte[] b = null;
		
		FileInputStream in = new FileInputStream(file);
		BufferedInputStream bin = new BufferedInputStream(in);
		ByteArrayOutputStream byteout = new ByteArrayOutputStream();
		
		int i = 0;
		byte[] temp = new byte[1024];
		
		while((i=bin.read(temp))!=-1) {
			byteout.write(temp,0,i);
		}
		
		in.close();
		b = byteout.toByteArray();
		byteout.flush();
		
		bin.close();
		
		return b;
		
	
	}
}
