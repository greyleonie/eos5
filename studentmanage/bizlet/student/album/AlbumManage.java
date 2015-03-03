package student.album;






import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Enumeration;




import org.apache.tools.zip.ZipFile;
import org.w3c.dom.*;









import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.core.api.PersistenceBroker;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-2-5
 * @class_displayName AlbumManage
 */

public class AlbumManage {

	/**
	 * 批量上传相片
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_batchUpload
	 * @bizlet_param passing="in_out" type="variable" value="/" name="" desc="输入文件所在路径"
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="输入QueryStudentSimple"
	 */
	public static int BL_batchUpload(Document doc, BizContext param)
		throws Exception {
		String path = (String) param.getParaObjectAt(0);
		Element param1 = (Element) param.getParaObjectAt(1);
		
	
		
		String catalog = path.substring(0,path.lastIndexOf("."));//解压目录
		String nameType = param1.getElementsByTagName("NameType").item(0).getFirstChild().getNodeValue();
		String ClassID = param1.getElementsByTagName("ClassID").item(0).getFirstChild().getNodeValue();
		String sql;
		if(nameType.equals("operatorname"))
			sql=" update Student set Photo = ? where StudentID in (select operatorID from eosoperator where operatorname = ? )  and ClassID = ?";
		else
			sql = " update Student set Photo = ? where   "+nameType+" = ? and  ClassID = ?";
		
		PersistenceBroker db = param.getDBBroker();
		Connection con = null;
		PreparedStatement pst = null;
		
		ZipFile zipFile=null;
		
		try{
			con = db.getConnection();
			con.setAutoCommit(false);
			
			zipFile=new ZipFile(path);
			Enumeration enu=zipFile.getEntries();
			org.apache.tools.zip.ZipEntry zipEntry=null;
			while (enu.hasMoreElements()){
		        zipEntry = (org.apache.tools.zip.ZipEntry)enu.nextElement();
		        System.out.println("unziping "+zipEntry.getName());
		        if (!zipEntry.isDirectory()){
		        	String fileName = zipEntry.getName();
		        	fileName=fileName.substring(0,fileName.lastIndexOf("."));//图片名称
		            if(fileName.indexOf("/")>0){
		            	fileName=fileName.substring(fileName.lastIndexOf("/")+1,fileName.length());
		            }
		        	System.out.println("filename==>"+fileName);
		        	InputStream in = zipFile.getInputStream(zipEntry);
		            BufferedInputStream bin = new BufferedInputStream(in);
					byte[] r = new byte[2048];
					int i = 0;
					ByteArrayOutputStream byteOut = new ByteArrayOutputStream();
					while((i = bin.read(r))!=-1) {
						byteOut.write(r,0,i);
					}
					byte[] b = byteOut.toByteArray();
					
					pst = con.prepareStatement(sql);
		            pst.setBytes(1,b);
		            pst.setString(2,fileName);
		            pst.setString(3,ClassID);
		            
					int j=pst.executeUpdate();
					
					byteOut.close();
					bin.close();
		            in.close();
		        }
		    }	
			
			con.commit();
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			try{
				if(zipFile!=null) zipFile.close();
				if(pst!=null) pst.close();
				if(con!=null) con.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
        
        
		return 1;
			
			/*
			//CheckedInputStream csumi = new CheckedInputStream( new FileInputStream(path), new Adler32());
				in = new ZipInputStreamExt(new FileInputStream(path));
				//in = new ZipInputStream(new FileInputStream(path));
			/*
			GZIPInputStream in=new GZIPInputStream(new FileInputStream(path));
				
				
				FileOutputStream fout=new FileOutputStream(catalog); 
				byte[] buf=new byte[1024]; 
				int num; 
				 
				while ((num=in.read(buf,0,buf.length)) != -1) 
				{ 
				fout.write(buf,0,num); 
				} 
				
				fout.close(); 
				in.close();

				
				File newdir = new File(catalog);
				newdir.mkdir();

				byte[] c = new byte[1024];
				int len;
				int slen;
				//zip
				ZipEntry file;
				
				//talent.zip.ZipEntry file;
				while ((file=in.getNextEntry())!=null){
					
					System.out.println(file.getName());
					String filename=(new String(file.getName())).replace('/','\\');
					System.out.println(filename);
					///System.out.println(new String(file.getName().getBytes("gbk"),"ISO8859_1"));
					int  i = filename.lastIndexOf('\\');
					if ( i != -1 ){
						File dirs = new File(catalog+File.separator+filename.substring(0,i));
						dirs.mkdirs();
						dirs = null;
					}
				     
						
					if (file.isDirectory()){
						File dirs = new File(catalog+File.separator+filename);
						dirs.mkdir();
						dirs = null;
					}
					else{ 
						System.out.println(catalog+File.separator+file.getName());
						FileOutputStream out = new FileOutputStream(catalog+File.separator+filename);
						while((slen = in.read(c,0,c.length)) != -1)
							out.write(c,0,slen);
						out.close();
					}
					System.out.print("O.K. ");
					file.clone();
					}
			*/
		
	}

	/**
	 * 初始化学员相片ID
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_initPhotoID
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="输入输出学员列表"
	 */
	public static int BL_initPhotoID(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);
		NodeList list=param0.getChildNodes();
		int n=String.valueOf(list.getLength()).length(); //获得相片ID位数
		return 1;
	}
}