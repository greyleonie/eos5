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
		//		 设置数据传输单元大小为1KB
		int unit_size = 1024;
		// 初始化xml文件大小（以字节为单位）
		int xmlfilesize = 0;
		// 初始化上传文件名称（完整文件名）
		String xmlfilename = "";
		// 初始化上传文件保存路径（绝对物理路径）
		String xmlfilepath = "";
		// 声明文件存储字节数组
		String instid = "";
		String archiveid = "";
		byte[] xmlfilebytes = null;
		try {
			// 初始化 SAX 串行xml文件解析器
			SAXBuilder builder = new SAXBuilder();
			Document doc = builder.build(request.getInputStream());
			Element eroot = doc.getRootElement();
            // 获取流程ID
			Iterator it_instid = eroot.getChildren("processInstID").iterator();
			if (it_instid.hasNext()) {
				instid = ((Element) it_instid.next()).getText();
			}
            // 获取流程ID
			Iterator it_archiveid = eroot.getChildren("archiveID").iterator();
			if (it_archiveid.hasNext()) {
				archiveid = ((Element) it_archiveid.next()).getText();
			}
			// 获取上传文件的完整名称
			Iterator it_name = eroot.getChildren("uploadfilename").iterator();
			if (it_name.hasNext()) {
				xmlfilename = ((Element) it_name.next()).getText();
			}
			// 获取上传文件保存的绝对物理路径
			Iterator it_path = eroot.getChildren("uploadfilepath").iterator();
			if (it_path.hasNext()) {
				xmlfilepath = ((Element) it_path.next()).getText()+date+xmlfilename;
			}
			// 获取上传文件的大小
			Iterator it_size = eroot.getChildren("uploadfilesize").iterator();
			if (it_size.hasNext()) {
				xmlfilesize = Integer.parseInt(((Element) it_size.next())
						.getText());
				if (xmlfilesize > 0) {
					int unit_count = 0;
					// 为存储文件内容的字节数组分配存储空间
					xmlfilebytes = new byte[xmlfilesize];
					// 循环读取文件内容，并保存到字节数组中
					Iterator it_content = eroot.getChildren("uploadcontent")
							.iterator();
					while (it_content.hasNext()) {
						// 初始化Base64编码解码器
						BASE64Decoder base64 = new BASE64Decoder();
						byte[] xmlnodebytearray = base64
								.decodeBuffer(((Element) it_content.next())
										.getText());
						if (xmlnodebytearray.length >= unit_size) {
							// 读取一个完整数据单元的数据
							System.arraycopy(xmlnodebytearray, 0, xmlfilebytes,
									unit_count * unit_size, unit_size);
						} else {
							// 读取小于一个数据单元的所有数据
							System.arraycopy(xmlnodebytearray, 0, xmlfilebytes,
									unit_count * unit_size, xmlfilesize
											% unit_size);
						}
						// 继续向下读取文件内容
						unit_count++;
					}
				}
			}
			
			//保存到数据库
			Connection conn = db.getEOSConnection();
			int primary = Webpriary.getPriaryTemp(conn,"FlowAttachment","attachID");
			String sql = "insert into FlowAttachment values ("+primary+","+instid+","+archiveid+",'upload/archivereceive/"+date+xmlfilename+"','image/pjpeg','"+xmlfilename+"',getdate())";
			Statement st = conn.createStatement();
			if (st.executeUpdate(sql)>0) {
			   // 创建文件输入输出流
			   FileOutputStream fos = new FileOutputStream(xmlfilepath);
			   // 写入文件内容
			   fos.write(xmlfilebytes);
			   fos.flush();
			   // 关闭文件输入输出流
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