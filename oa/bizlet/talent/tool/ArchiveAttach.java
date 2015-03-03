package talent.tool;

import org.jdom.input.*;
import org.jdom.*;

import java.io.*;
import java.sql.Connection;
import java.sql.Statement;
import java.util.*;
import sun.misc.BASE64Decoder;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import base.util.DBconnection;
import talent.core.Webpriary;

/**
 * @author Administrator
 * @version 1.0
 * @date 2007-9-22
 * @class_displayName ArchiveAttach
 */

public class ArchiveAttach extends HttpServlet {
	public ArchiveAttach() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); //   Just puts "destroy" string in log
		//   Put your code here
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Calendar calendar = Calendar.getInstance();
		  int year = calendar.get(Calendar.YEAR);
		  int month = calendar.get(Calendar.MONTH);
		  int day = calendar.get(Calendar.DAY_OF_MONTH);
		  int hh = calendar.get(Calendar.HOUR_OF_DAY);
		  int mm = calendar.get(Calendar.MINUTE);
		  int ss = calendar.get(Calendar.SECOND);
		  String date = new Integer(year).toString() + new Integer(month).toString() + new Integer(day).toString();
		  date += new Integer(hh).toString() + new Integer(mm).toString() + new Integer(ss).toString();
		System.out.println(this.getClass());
		DBconnection db = new DBconnection();
		//System.out.println((String)request.getParameter("filename"));

		response.setContentType("text/html");
		//		 �������ݴ��䵥Ԫ��СΪ1KB
		int unit_size = 1024;
		// ��ʼ��xml�ļ���С�����ֽ�Ϊ��λ��
		int xmlfilesize = 0;
		// ��ʼ���ϴ��ļ����ƣ������ļ�����
		String xmlfilename = "";
		// ��ʼ���ϴ��ļ�����·������������·����
		String xmlfilepath = "";
		// �����ļ��洢�ֽ�����
		String instid = "";
		String archiveid = "";
		byte[] xmlfilebytes = null;
		try {
			// ��ʼ�� SAX ����xml�ļ�������
			SAXBuilder builder = new SAXBuilder();
			Document doc = builder.build(request.getInputStream());
			Element eroot = doc.getRootElement();
            // ��ȡ����ID
			Iterator it_instid = eroot.getChildren("processInstID").iterator();
			if (it_instid.hasNext()) {
				instid = ((Element) it_instid.next()).getText();
			}
            // ��ȡ����ID
			Iterator it_archiveid = eroot.getChildren("archiveID").iterator();
			if (it_archiveid.hasNext()) {
				archiveid = ((Element) it_archiveid.next()).getText();
			}
			// ��ȡ�ϴ��ļ�����������
			Iterator it_name = eroot.getChildren("uploadfilename").iterator();
			if (it_name.hasNext()) {
				xmlfilename = ((Element) it_name.next()).getText();
			}
			// ��ȡ�ϴ��ļ�����ľ�������·��
			Iterator it_path = eroot.getChildren("uploadfilepath").iterator();
			if (it_path.hasNext()) {
				xmlfilepath = ((Element) it_path.next()).getText()+date+xmlfilename;
			}
			// ��ȡ�ϴ��ļ��Ĵ�С
			Iterator it_size = eroot.getChildren("uploadfilesize").iterator();
			if (it_size.hasNext()) {
				xmlfilesize = Integer.parseInt(((Element) it_size.next())
						.getText());
				if (xmlfilesize > 0) {
					int unit_count = 0;
					// Ϊ�洢�ļ����ݵ��ֽ��������洢�ռ�
					xmlfilebytes = new byte[xmlfilesize];
					// ѭ����ȡ�ļ����ݣ������浽�ֽ�������
					Iterator it_content = eroot.getChildren("uploadcontent")
							.iterator();
					while (it_content.hasNext()) {
						// ��ʼ��Base64���������
						BASE64Decoder base64 = new BASE64Decoder();
						byte[] xmlnodebytearray = base64
								.decodeBuffer(((Element) it_content.next())
										.getText());
						if (xmlnodebytearray.length >= unit_size) {
							// ��ȡһ���������ݵ�Ԫ������
							System.arraycopy(xmlnodebytearray, 0, xmlfilebytes,
									unit_count * unit_size, unit_size);
						} else {
							// ��ȡС��һ�����ݵ�Ԫ����������
							System.arraycopy(xmlnodebytearray, 0, xmlfilebytes,
									unit_count * unit_size, xmlfilesize
											% unit_size);
						}
						// �������¶�ȡ�ļ�����
						unit_count++;
					}
				}
			}
			
			//���浽���ݿ�
			Connection conn = db.getEOSConnection();
			int primary = Webpriary.getPriaryTemp(conn,"FlowAttachment","attachID");
			String sql = "insert into FlowAttachment values ("+primary+","+instid+","+archiveid+",'upload/archivereceive/"+date+xmlfilename+"','image/pjpeg','"+xmlfilename+"',getdate())";
			Statement st = conn.createStatement();
			if (st.executeUpdate(sql)>0) {
			   // �����ļ����������
			   FileOutputStream fos = new FileOutputStream(xmlfilepath);
			   // д���ļ�����
			   fos.write(xmlfilebytes);
			   fos.flush();
			   // �ر��ļ����������
			   fos.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occure
	 */
	public void init() throws ServletException {

	}
}