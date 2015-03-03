package talent.core;
import org.w3c.dom.*;
import java.io.*;

import org.apache.commons.logging.*;

import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.common.xml.XmlUtil;
/**
 * @author Administrator
 * @version 1.0
 * @date 2006-2-11
 * @class_displayName TalentFile
 */

public class TalentFile {
	private static Log fccLog = LogFactory.getLog(TalentFile.class);

	/**
	 * 
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_copyAndExpNode
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="文件集合list[@type=upload]"
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="copy到dest"
	 * @bizlet_param passing="in_out" type="field" value="/" name="" desc="FILE输出节点"
	 */
	public static int BL_copyAndExpNode(Document doc, BizContext param)
		throws Exception {
		Node param0 = (Node) param.getParaObjectAt(0);
		Node param1 = (Node) param.getParaObjectAt(1);
		Node param2 = (Node) param.getParaObjectAt(2);
		String fileName = "";
		String fileType = "application/octet-stream";
		String filePath = "";
		String filefolder = param1.getFirstChild().getNodeValue();
		String dstPath = "";
		
		NodeList list = param0.getChildNodes();
		if(list.getLength() > 0) {
			Node fbfile = list.item(0);
			Element el = (Element) fbfile;
			fileName = el.getElementsByTagName("FILE_NAME").item(0).getFirstChild().getNodeValue();
			fileType = el.getElementsByTagName("FILE_TYPE").item(0).getFirstChild().getNodeValue();
			filePath = el.getElementsByTagName("ABSOLUTEPATH").item(0).getFirstChild().getNodeValue();
		}
		String fileOtherName = filePath.substring(filePath.lastIndexOf("\\")+1);
		fccLog.info("all file info : fileName is " + fileName + "fileType is " + fileType + "old filePath is " + filePath + "new filefolder is" + filefolder);
		File src = new File(filePath);
		if(src.exists()) {
			File dst = new File(filefolder,fileOtherName);
			dstPath = dst.getAbsolutePath();
			TalentFile.copyFile(src,dst);
		
		
			Element tempFileName = doc.createElement("NAME");
			Element tempFileType = doc.createElement("TYPE");
			Element temFilePath = doc.createElement("PATH");
			Element temFile = doc.createElement("TFILE");
		
			XmlUtil.setNodeValue(tempFileName,fileName);
			XmlUtil.setNodeValue(tempFileType,fileType);
			XmlUtil.setNodeValue(temFilePath,dstPath);
			XmlUtil.setNodeValue(temFile,fileOtherName);
			param2.appendChild(tempFileName);
			param2.appendChild(tempFileType);
			param2.appendChild(temFilePath);
			param2.appendChild(temFile);
		}
		return 1;
	}
	
	public static void copyFile(File src,File dest) {
		try{
			FileInputStream in = new FileInputStream(src);
			BufferedInputStream bin = new BufferedInputStream(in);
			FileOutputStream fout = new FileOutputStream(dest);
			byte[] size = new byte[1024];
			int i = 0;
			while((i = bin.read(size))!=-1) {
				fout.write(size,0,i);
			}
			bin.close();
			fout.close();
			src.delete();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	
 
	/**
	 * 去掉文件名的后缀
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_getFileNameNoSuffix
	 * @bizlet_param passing="in_out" type="EOSEntity" value="/" name="" desc="输入文件名"
	 */
	public static int BL_getFileNameNoSuffix(Document doc, BizContext param) throws Exception{
		Node param0 = (Node)param.getParaObjectAt(0);
		String value=XmlUtil.getNodeValue(param0);
		if(value!=null){
			value=value.substring(0,value.lastIndexOf("."));
			XmlUtil.setNodeValue(param0,value);
		}
		return 1;
	}
}