package talent.core;
import org.w3c.dom.*;
import java.io.*;
import java.util.*;

import com.primeton.tp.core.api.BizContext;
import com.primeton.tp.common.xml.XmlUtil;
/**
 * @author Administrator
 * @version 1.0
 * @date 2006-6-2
 * @class_displayName TalentPicture
 */

public class TalentPicture {

	/**
	 * 处理图片并反回实体集list[@type='fccpic']
	 * @param doc type: Document, DOM;
	 * @param param type: BizContext;
	 * @return: int ,运算逻辑返回值，如果失败返回0，成功返回1 
	 * @throws Exception 
	 * <p>
	 * ** bizlet 的显示名称 **
	 * @bizlet_displayName BL_handlepicture
	 * @bizlet_param passing="in" type="EOSEntityList" value="/" name="" desc="图片标题list"
	 * @bizlet_param passing="in" type="EOSEntityList" value="/" name="" desc="文件list"
	 * @bizlet_param passing="in" type="field" value="/" name="" desc="文件路径"
	 * @bizlet_param passing="in" type="EOSEntity" value="/" name="" desc="图片实体"
	 * @bizlet_param passing="in_out" type="EOSEntityList" value="/" name="" desc="返回结果list"
	 */
	public static int BL_handlepicture(Document doc, BizContext param)
		throws Exception {
		Node param0 = (Node) param.getParaObjectAt(0);//图片标题集合
		Node param1 = (Node) param.getParaObjectAt(1);//文件集合
		Node param2 = (Node) param.getParaObjectAt(2);//文件路径
		Node param3 = (Node) param.getParaObjectAt(3);//图片实体
		Node param4 = (Node) param.getParaObjectAt(4);//输出
		
		
		String filePath = param2.getFirstChild().getNodeValue();
		File dir = new File(filePath);
		if(!dir.exists()) dir.mkdirs();//路径不存在就新建
		
		Element picEntity = (Element) param3;
		String creator = picEntity.getElementsByTagName("CREATOR").item(0).getFirstChild().getNodeValue();//有用
		String createDate = picEntity.getElementsByTagName("CREATEDATE").item(0).getFirstChild().getNodeValue();//有用
		String typeId = picEntity.getElementsByTagName("TYPEID").item(0).getFirstChild().getNodeValue();//有用
		
		NodeList titlenodes = param0.getChildNodes();//标题集合
		NodeList filenodes = param1.getChildNodes();
		
		for(int i = 0; i < filenodes.getLength(); i++) {
			Element fileElement = (Element) filenodes.item(i);
			String fileName = fileElement.getElementsByTagName("FILE_NAME").item(0).getFirstChild().getNodeValue();//有用
			String fileType = fileElement.getElementsByTagName("FILE_TYPE").item(0).getFirstChild().getNodeValue();//有用
			String filetempPath = fileElement.getElementsByTagName("ABSOLUTEPATH").item(0).getFirstChild().getNodeValue();
			
			String fileRename = filetempPath.substring(filetempPath.lastIndexOf(File.separator)+1);
			String fileTruePath = filePath + File.separator + fileRename;//有用
			TalentPicture.copy(filetempPath,fileTruePath);
			
			String fileTitle = TalentPicture.getTile(titlenodes,fileName);//有用
			
			
			//开始创建
			Element entity = doc.createElement("entity");
			Element c1 = doc.createElement("PICTITLE");
			XmlUtil.setNodeValue(c1,fileTitle);
			Element c2 = doc.createElement("FILENAME");
			XmlUtil.setNodeValue(c2,fileName);
			Element c3 = doc.createElement("FILETYPE");
			XmlUtil.setNodeValue(c3,fileType);
			Element c4 = doc.createElement("FILEPATH");
			XmlUtil.setNodeValue(c4,fileTruePath);
			Element c5 = doc.createElement("CREATOR");
			XmlUtil.setNodeValue(c5,creator);
			Element c6 = doc.createElement("CREATEDATE");
			//Attr attr = doc.createAttributeNS("pattern","yyyy-MM-dd HH:mm:ss");
			//c6.setAttributeNode(attr);
			
			XmlUtil.setNodeValue(c6,createDate);
			Element c7 = doc.createElement("TYPEID");
			XmlUtil.setNodeValue(c7,typeId);
			
			entity.appendChild(c1);
			entity.appendChild(c2);
			entity.appendChild(c3);
			entity.appendChild(c4);
			entity.appendChild(c5);
			entity.appendChild(c6);
			entity.appendChild(c7);
			param4.appendChild(entity);
			
		
		}
		
		

		return 1;
	}
	
	
	
	/**
	 * 
	 * @param src
	 * @param dst
	 * @throws Exception
	 */
	public static void copy(String src,String dst) throws Exception {
		File from = new File(src);
		File to = new File(dst);
		
		FileInputStream fin = new FileInputStream(from);
		BufferedInputStream bin = new BufferedInputStream(fin);
		
		FileOutputStream fout = new FileOutputStream(to);
		BufferedOutputStream bout = new BufferedOutputStream(fout);
		
		byte[] temp = new byte[1024];
		int i = 0;
		
		while((i=bin.read(temp))!=-1) {
			bout.write(temp,0,i);
		}
		
		bout.close();
		bin.close();
		
		fout.close();
		fin.close();
	
		
	
	
	}
	
	public static String getTile(NodeList list,String name) {
		String result = "";
		for(int i = 0; i < list.getLength(); i++) {
			Element el = (Element) list.item(i);
			String fileName = el.getElementsByTagName("PIC").item(0).getFirstChild().getNodeValue();
			String title = el.getElementsByTagName("PICTITLE").item(0).getFirstChild().getNodeValue();
			if(name.equals(fileName)) return title;
		
		}
		return result;
	
	}

}