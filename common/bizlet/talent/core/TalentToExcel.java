/*
 * �������� 2006-11-10
 *
 * TODO Ҫ���Ĵ����ɵ��ļ���ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
package talent.core;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.sql.Connection;
import java.sql.Statement;

import org.apache.commons.dbutils.QueryRunner;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;

import org.w3c.dom.*;
import org.xml.sax.InputSource;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

import org.apache.poi.hssf.util.Region;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.util.HSSFColor;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.primeton.eos.wf.persistence.xml.DOMBuilder;
import com.primeton.tp.common.xml.XmlUtil;


/**
 * @author �볤��
 *
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
public class TalentToExcel {
	
	private Log fccLog = null;//��־����
	private HSSFWorkbook wb = null;//������
	private int maxColNum = 0 ; //������������
	private int colLength[];
	public TalentToExcel() {
		fccLog = LogFactory.getLog(this.getClass());
		wb = new HSSFWorkbook();
	
	}
	
	
	/**
	 * Description:���excel
	 * @param req
	 * @param res
	 * @throws Exception
	 */
	public void export(PageContext pageContext) throws Exception {
		HttpServletRequest req = (HttpServletRequest)pageContext.getRequest();
		HttpServletResponse res = (HttpServletResponse) pageContext.getResponse();
		String title_temp = req.getParameter("title");//�õ�����ı���
		//���������ַ������ȴ���32���Զ���β
		String title = (title_temp.length() > 32) ? title_temp.substring(0,31) : title_temp;
		fccLog.info("*************title:" + title);

		
		Document xmlDom = getDomDate(req);//�õ�DOM
		
		OutputStream pageOut = res.getOutputStream();//�õ�ҳ�������
		
		HSSFSheet sheet = wb.createSheet();//������

		wb.setSheetName(0,title,HSSFWorkbook.ENCODING_UTF_16);//�����ֱ���
		sheet.setDisplayGridlines(false);//����������

		//-------------------
		
		Node node=changTableNode(xmlDom,xmlDom.getElementsByTagName("table").item(0));
		
		
	  //printNode(node);
		
		//------------------
		
		NodeList alltr = node.getChildNodes();
		fccLog.info("*************getLength:" + alltr.getLength());
		
		//maxColNum = getMaxcolNum(alltr);//������������
		
		HSSFRow rowTitle = sheet.createRow((short)0);
		HSSFCell cellTitle = rowTitle.createCell((short) 0);
		cellTitle.setEncoding(HSSFCell.ENCODING_UTF_16);
		sheet.addMergedRegion(new Region(0,(short)0,1,(short)(maxColNum-1)));
		HSSFFont titleFont = createFont(wb,"Arial",14,HSSFFont.BOLDWEIGHT_BOLD,HSSFColor.BLUE.index);
		HSSFCellStyle titleStyle = createStyle(wb,titleFont,HSSFCellStyle.BORDER_NONE,HSSFCellStyle.BORDER_NONE,HSSFCellStyle.BORDER_NONE,HSSFCellStyle.BORDER_NONE,HSSFCellStyle.ALIGN_CENTER,HSSFCellStyle.VERTICAL_CENTER,HSSFColor.WHITE.index,HSSFColor.WHITE.index,HSSFCellStyle.SOLID_FOREGROUND);
		cellTitle.setCellStyle(titleStyle);
		cellTitle.setCellValue(title);
		
		//createHeader(wb,sheet,alltr.item(0));//������ͷ
		
		//createBody(wb,sheet,alltr);
		createBodyNew(wb,sheet,alltr);

		for(int kIndex=0;kIndex<maxColNum;kIndex++)
		{
			
			//System.out.println(kIndex+" : "+colLength[kIndex]);
			if(colLength[kIndex]<=30)
				sheet.setColumnWidth((short)kIndex,(short)((colLength[kIndex]+4)*292));//�趨ÿ�еĿ��
			else
				sheet.setColumnWidth((short)kIndex,(short)((34)*292));//�趨ÿ�еĿ��
		}
		String fileNameTM = new String(title.getBytes("GBK"),"8859_1");
		res.setHeader("Content-disposition","attachment; filename="+fileNameTM+".xls");
		res.setContentType("application/vnd.ms-excel;charset=gbk");
		
		wb.write(pageOut);
		pageOut.flush();
		
	
	}
	
	
	
	/**
	 * Description:�õ�DOM
	 * @param req
	 * @return
	 */
	public Document getDomDate(HttpServletRequest req) {
		Document document = null;
		try{
			String domresult = "";
			String xmlHeader = "<?xml version=\"1.0\" encoding=\"GBK\"?>";
			String xmlBody = req.getParameter("xmlfcc");
			//fccLog.info("*************xmlfcc:" + xmlBody);
			domresult = xmlHeader + xmlBody;
			StringReader stringReader = new StringReader(domresult);
			InputSource inputSource = new InputSource(stringReader);
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db = dbf.newDocumentBuilder();
			document = db.parse(inputSource);
			fccLog.info("*************�������еõ�DOM���ɹ�*************");
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return document;
	
	}
	
	
	/**
	 * Description:��������
	 * @param wb ������
	 * @param fontName ���������
	 * @param height ����߶�
	 * @param boldWeight ���Ӵ���ΪHSSFFont.BOLDWEIGHT_NORMAL���Ӵ���ΪHSSFFont.BOLDWEIGHT_BOLD
	 * @param color ������ɫ�� ����HSSFColor����ĳ�Աֵ,�����ɫ�� HSSFColor.BLACK.index,��ɫ��HSSFColor.WHITE.index
	 * @return
	 */
	HSSFFont createFont(HSSFWorkbook wb,String fontName,int height,int boldWeight,int color) {
		HSSFFont font = wb.createFont();
		font.setFontHeightInPoints( (short)height);
		font.setBoldweight((short)boldWeight);
		font.setColor((short)color);
		font.setFontName(fontName);
		return font;
	}
	
	
	/**
	 * Description:������ʽ
	 * @param wb ������
	 * @param font ����
	 * @param top �����ϲ�������С������HSSFCellStyle����ĳ�Աֵ,����HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_MEDIUM,HSSFCellStyle.BORDER_THICK
	 * @param left �������������С
	 * @param bottom �����²�������С
	 * @param right �����ұ�������С
	 * @param halign ˮƽ���뷽ʽ HSSFCellStyle.ALIGN_CENTER ���У�HSSFCellStyle.ALIGN_LEFT �����,HSSFCellStyle.ALIGN_RIGHT �Ҷ���
	 * @param valign ��ֱ���뷽ʽ HSSFCellStyle.VERTICAL_CENTER ��ֱ���У�HSSFCellStyle.VERTICAL_TOP ��������,HSSFCellStyle.VERTICAL_BOTTOM �ײ�����
	 * @param fore ǰ��ɫ  ����HSSFColor����ĳ�Աֵ���� HSSFColor.YELLOW.index,HSSFColor.BLUE.index
	 * @param back ����ɫ  ����HSSFColor����ĳ�Աֵ,�� HSSFColor.GREEN.index
	 * @param pattern ������䱳����ɫ��ʽ������ HSSFCellStyle.SOLID_FOREGROUND
	 * @return
	 */
	 HSSFCellStyle createStyle(HSSFWorkbook wb,HSSFFont font,int top,int left,int bottom,int right,int halign,int valign,int fore,int back,int pattern) {
	 	
	 	HSSFCellStyle style = wb.createCellStyle();
	 	
	 	style.setFont(font);
	 	style.setBorderTop((short)top);
	 	style.setBorderLeft((short)left);
	 	style.setBorderBottom((short)bottom);
	 	style.setBorderRight((short)right);
	 	style.setAlignment((short)halign);
	 	style.setVerticalAlignment((short)valign);
	 	style.setFillBackgroundColor( (short) back);
	 	style.setFillForegroundColor( (short) fore);
	 	style.setFillPattern((short)pattern);
	 	
	 	
	 	return style;
	 
	 }
	 
	 
	 /**
	  * Description:���õ��޸�Ŀ�
	  * @param sheet
	  * @param columnIndex
	  * @param width
	  */
	 public void setColumnWidth(HSSFSheet sheet,int columnIndex,int width){
	    
	 	sheet.setColumnWidth((short)columnIndex,(short) width);
	 }
	 
	 
	 /**
	  * Description:�õ�������������
	  * @param trs
	  * @return
	  */
	 public int getMaxcolNumOld(NodeList trs) {
	 	int val = 0;
	 	for(int i = 0; i < trs.getLength(); i++) {
	 		int length = trs.item(i).getChildNodes().getLength();//td����
	 		if(length >= val) val = length;
	 	
	 	}
	 	return val;
	 
	 }
	 
	 
	 public int getMaxcolNum(NodeList trs) {
	 	int val = 0;
	 	for(int i = 0; i < trs.getLength(); i++) {
	 		Node tr = trs.item(i);
	 		NodeList tds = tr.getChildNodes();
	 		int tdNum = 0;
	 		for(int t = 0; t < tds.getLength(); t++) {
	 			Node td = tds.item(t);
	 			if(isExistAttribute(td,"colspan")) {
		 			int colspan = Integer.parseInt(getAttributeValue(td,"colspan"));
		 			tdNum += colspan;
		 		}else{
		 			tdNum++;
		 		}
	 			
	 			
	 		}
	 		if(tdNum >= val) val = tdNum;
	 		
	 	}
	 	
	 	return val;
	 
	 }
	 
	 
	 /**
	  * Description:�ڵ��Ƿ���ĳ������
	  * @param node
	  * @param attributeName
	  * @return
	  */
	 public boolean isExistAttribute(Node node,String attributeName) {
	    boolean result = false;
	    if(node==null) return false;
	    try{

	      NamedNodeMap temps = node.getAttributes();
	      for(int i = 0; i < temps.getLength(); i++) {
	        String name = temps.item(i).getNodeName();
	        //fccLog.info("###��nodeName���ڵ������У�" + name);
	        if(attributeName!=null && name.equalsIgnoreCase(attributeName)) {
	          return true;
	      }

	    }


	    }catch(Exception e) {
	      e.printStackTrace();
	    }
	    return result;
	  }
	 
	 
	 
	 public String getAttributeValue(Node node ,String attributeName) {
	    String result = "";

	    try{
	      NamedNodeMap temps = node.getAttributes();
	    for(int i = 0; i < temps.getLength(); i++) {
	      String name = temps.item(i).getNodeName();
	      if(attributeName!=null && name.equalsIgnoreCase(attributeName)) {
	        Node aNode = temps.item(i);
	        String value = aNode.getFirstChild().getNodeValue();
	         fccLog.info("#####id��ֵΪ��" + value);
	        return value;
	      }


	    }

	    }catch(Exception e) {
	      e.printStackTrace();
	    }
	    return result;
	  }
	 
	 
	 
	 public void createHeader(HSSFWorkbook wb,HSSFSheet sheet,Node node) {
	 	
	 	HSSFRow row = sheet.createRow((short)2);
	 	NodeList list = node.getChildNodes();
	 	for(int i = 0; i < list.getLength(); i++) {
	 		Node tdNode = list.item(i);
	 		String tdValue = tdNode.getFirstChild().getNodeValue();
	 		int tdValueLength = 0;
	 		if(tdValue == null) tdValue = "";
	 		tdValueLength = tdValue.length();
	 		
	 		int colspan = 1;
	 		if(isExistAttribute(tdNode,"colspan")) {
	 			colspan = Integer.parseInt(getAttributeValue(tdNode,"colspan"));
	 		}
	 		
	 		HSSFCell cell = row.createCell((short) i);
	 		cell.setEncoding(HSSFCell.ENCODING_UTF_16);
	 		if(colspan > 1) {
	 			int merged = i + colspan -1;
	 			sheet.addMergedRegion(new Region(1,(short)i,1,(short)merged));
	 			i +=  colspan - 1;
	 		}
	 		
	 		HSSFFont font = createFont(wb,"Arial",12,HSSFFont.BOLDWEIGHT_BOLD,HSSFColor.BLACK.index);
	 		HSSFCellStyle style = null;
	 		if(i == 0) {
	 			style = createStyle(wb,font,HSSFCellStyle.BORDER_THICK,HSSFCellStyle.BORDER_THICK,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.ALIGN_CENTER,HSSFCellStyle.VERTICAL_CENTER,HSSFColor.WHITE.index,HSSFColor.WHITE.index,HSSFCellStyle.SOLID_FOREGROUND);
	 		}else if(i == (list.getLength() -1)) {
	 			style = createStyle(wb,font,HSSFCellStyle.BORDER_THICK,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THICK,HSSFCellStyle.ALIGN_CENTER,HSSFCellStyle.VERTICAL_CENTER,HSSFColor.WHITE.index,HSSFColor.WHITE.index,HSSFCellStyle.SOLID_FOREGROUND);
	 		}else{
	 			style = createStyle(wb,font,HSSFCellStyle.BORDER_THICK,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.ALIGN_CENTER,HSSFCellStyle.VERTICAL_CENTER,HSSFColor.WHITE.index,HSSFColor.WHITE.index,HSSFCellStyle.SOLID_FOREGROUND);
	 		}
	 		
	 		setColumnWidth(sheet,i,tdValueLength);
	 		cell.setCellStyle(style);
	 		cell.setCellValue(tdValue);
	 		
	 		
	 		
	 		
	 	
	 	}
	 
	 
	 
	 }
	 
	 
	 public void createBody(HSSFWorkbook wb,HSSFSheet sheet,NodeList alltr) {
	 	int startrow = 2;
	 	if(alltr.getLength() > 1) {
	 		for(int m = 1; m < alltr.getLength(); m++) {
	 			HSSFRow row = sheet.createRow((short)(startrow + m));
	 			NodeList list =alltr.item(m).getChildNodes();
	 			HSSFFont font = createFont(wb,"Arial",12,HSSFFont.BOLDWEIGHT_NORMAL,HSSFColor.BLACK.index);
 		 			
	 			for(int i = 0; i < list.getLength(); i++) {
	 				
	 				Node tdNode = list.item(i);
	 				
	 		 		String tdValue = "";
	 		 		if(tdNode != null) {
	 		 			if(tdNode.getFirstChild()!=null)
	 		 				tdValue = tdNode.getFirstChild().getNodeValue();
	 		 		}
	 		 		
	 		 		int tdValueLength = 0;
	 		 		if(tdValue == null) tdValue = "";
	 		 		tdValueLength = tdValue.length() + 6;
	 		 		int colspan = 1;
	 		 		if(isExistAttribute(tdNode,"colspan")) {
	 		 			colspan = Integer.parseInt(getAttributeValue(tdNode,"colspan"));
	 		 		}
	 		 		
	 		 		HSSFCell cell = row.createCell((short) i);
	 		 		cell.setEncoding(HSSFCell.ENCODING_UTF_16);
	 		 		if(colspan > 1) {
	 		 			int merged = i + colspan -1;
	 		 			sheet.addMergedRegion(new Region(1,(short)i,1,(short)merged));
	 		 			i +=  colspan - 1;
	 		 		}
	 		 		
	 		 		
	 		 		HSSFCellStyle style = null;
	 		 		
	 		 		if(m!=(alltr.getLength() - 1)) {
	 		 			if(i == 0) {
		 		 			style = createStyle(wb,font,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THICK,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.ALIGN_CENTER,HSSFCellStyle.VERTICAL_CENTER,HSSFColor.WHITE.index,HSSFColor.WHITE.index,HSSFCellStyle.SOLID_FOREGROUND);
		 		 		}else if(i == (list.getLength() -1)) {
		 		 			style = createStyle(wb,font,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THICK,HSSFCellStyle.ALIGN_CENTER,HSSFCellStyle.VERTICAL_CENTER,HSSFColor.WHITE.index,HSSFColor.WHITE.index,HSSFCellStyle.SOLID_FOREGROUND);
		 		 		}else{
		 		 			style = createStyle(wb,font,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.ALIGN_CENTER,HSSFCellStyle.VERTICAL_CENTER,HSSFColor.WHITE.index,HSSFColor.WHITE.index,HSSFCellStyle.SOLID_FOREGROUND);
		 		 		}
		 		 		
	 		 		
	 		 		}else{
	 		 			if(i == 0) {
		 		 			style = createStyle(wb,font,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THICK,HSSFCellStyle.BORDER_THICK,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.ALIGN_CENTER,HSSFCellStyle.VERTICAL_CENTER,HSSFColor.WHITE.index,HSSFColor.WHITE.index,HSSFCellStyle.SOLID_FOREGROUND);
		 		 		}else if(i == (list.getLength() -1)) {
		 		 			style = createStyle(wb,font,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THICK,HSSFCellStyle.BORDER_THICK,HSSFCellStyle.ALIGN_CENTER,HSSFCellStyle.VERTICAL_CENTER,HSSFColor.WHITE.index,HSSFColor.WHITE.index,HSSFCellStyle.SOLID_FOREGROUND);
		 		 		}else{
		 		 			style = createStyle(wb,font,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THICK,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.ALIGN_CENTER,HSSFCellStyle.VERTICAL_CENTER,HSSFColor.WHITE.index,HSSFColor.WHITE.index,HSSFCellStyle.SOLID_FOREGROUND);
		 		 		}
		 		 		
	 		 		
	 		 		}
	 		 		
	 		 		setColumnWidth(sheet,i,tdValueLength);
	 		 		cell.setCellStyle(style);
	 		 		cell.setCellValue(tdValue);
	 				
	 			}
	 			
	 			
	 		
	 		}
	 	
	 	
	 	}
	 
	 
	 
	 }
	 
	 
	 public void createBodyNew(HSSFWorkbook wb,HSSFSheet sheet,NodeList alltr) {
	 	int startrow = 2;
	 	if(alltr.getLength() > 1) {
	 		//ԭ�����ͷʱ m=1
	 		colLength = new int[maxColNum];
	 		for(int m = 0; m < alltr.getLength(); m++) {
	 			int rows=startrow + m;
	 			int cellpos = 0;
	 			Node trNode=alltr.item(m);
	 			HSSFRow row = sheet.createRow((short)(rows));
	 			NodeList list =trNode.getChildNodes();
	 			
	 			HSSFFont font = createFont(wb,"Arial",12,HSSFFont.BOLDWEIGHT_NORMAL,HSSFColor.BLACK.index);
 		 		if(isExistAttribute(trNode,"class")){
 		 			if(getAttributeValue(trNode,"class").equalsIgnoreCase("td_title"))//����Ǳ����� ������
 		 				font = createFont(wb,"Arial",12,HSSFFont.BOLDWEIGHT_BOLD,HSSFColor.BLACK.index);
 		 		}
	 			for(int i = 0; i < list.getLength(); i++) {
	 				
	 				Node tdNode = list.item(i);
	 				
	 		 		String tdValue = "";
	 		 		if(tdNode != null) {
	 		 			if(tdNode.getFirstChild()!=null)
	 		 				tdValue = tdNode.getFirstChild().getNodeValue();
	 		 		}
	 		 		
	 		 		int tdValueLength = 0;
	 		 		if(tdValue == null) tdValue = "";
	 		 		tdValueLength = tdValue.getBytes().length;
	 		 		int colspan = 1;
	 		 		int rowspan = 1;
	 		 		if(isExistAttribute(tdNode,"colspan")) {
	 		 			colspan = Integer.parseInt(getAttributeValue(tdNode,"colspan"));
	 		 			
	 		 		}
	 		 		else if(tdValueLength>colLength[i]){
	 		 			colLength[i] = tdValueLength;
	 		 		}
	 		 		if(isExistAttribute(tdNode,"rowspan")) {
	 		 			rowspan = Integer.parseInt(getAttributeValue(tdNode,"rowspan"));
	 		 		}
	 		 		
	 		 		
	 		 		
	 		 		HSSFCell cell = row.createCell((short) cellpos);
	 		 		cell.setEncoding(HSSFCell.ENCODING_UTF_16);
	 		 		
	 		 		
	 		 		
	 		 		HSSFCellStyle style = null;
	 		 		
	 		 		if(m!=(alltr.getLength() - 1)) {
	 		 			if(i == 0) {
		 		 			style = createStyle(wb,font,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THICK,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.ALIGN_CENTER,HSSFCellStyle.VERTICAL_CENTER,HSSFColor.WHITE.index,HSSFColor.WHITE.index,HSSFCellStyle.SOLID_FOREGROUND);
		 		 		}else if(i == (list.getLength() -1)) {
		 		 			style = createStyle(wb,font,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THICK,HSSFCellStyle.ALIGN_CENTER,HSSFCellStyle.VERTICAL_CENTER,HSSFColor.WHITE.index,HSSFColor.WHITE.index,HSSFCellStyle.SOLID_FOREGROUND);
		 		 		}else{
		 		 			style = createStyle(wb,font,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.ALIGN_CENTER,HSSFCellStyle.VERTICAL_CENTER,HSSFColor.WHITE.index,HSSFColor.WHITE.index,HSSFCellStyle.SOLID_FOREGROUND);
		 		 		}
		 		 		
	 		 		
	 		 		}else{
	 		 			if(i == 0) {
		 		 			style = createStyle(wb,font,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THICK,HSSFCellStyle.BORDER_THICK,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.ALIGN_CENTER,HSSFCellStyle.VERTICAL_CENTER,HSSFColor.WHITE.index,HSSFColor.WHITE.index,HSSFCellStyle.SOLID_FOREGROUND);
		 		 		}else if(i == (list.getLength() -1)) {
		 		 			style = createStyle(wb,font,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THICK,HSSFCellStyle.BORDER_THICK,HSSFCellStyle.ALIGN_CENTER,HSSFCellStyle.VERTICAL_CENTER,HSSFColor.WHITE.index,HSSFColor.WHITE.index,HSSFCellStyle.SOLID_FOREGROUND);
		 		 		}else{
		 		 			style = createStyle(wb,font,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.BORDER_THICK,HSSFCellStyle.BORDER_THIN,HSSFCellStyle.ALIGN_CENTER,HSSFCellStyle.VERTICAL_CENTER,HSSFColor.WHITE.index,HSSFColor.WHITE.index,HSSFCellStyle.SOLID_FOREGROUND);
		 		 		}
		 		 		
	 		 		
	 		 		}
	 		 		style.setWrapText(true);
	 		 		//setColumnWidth(sheet,i,(length[i]+4)*250);
	 		 		cell.setCellStyle(style);
	 		 		cell.setCellValue(tdValue);
	 		 		
	 		 		
	 		 		if(colspan > 1) {
 		 				
 		 				sheet.addMergedRegion(new Region(rows,(short)cellpos,rows,(short)(cellpos+colspan -1)));
 		 				
	 		 		}
	 		 		
	 		 		if(rowspan >1) {
	 		 			
	 		 			int mergedy = rows + rowspan -1;
	 		 			sheet.addMergedRegion(new Region(rows,(short)cellpos,mergedy,(short)cellpos));
 		 			
	 		 		}
	 		 		
	 		 		cellpos++;
	 				
	 			}
	 			
	 			
	 		
	 		}
	 	
	 	
	 	}
	 
	 
	 
	 }
	 
	 
	 
	 
	/**
	 * @description ��Excel���뵽����
	 * @param excelFile excel�ļ�
	 * @param tableName ����
	 * @param keyName ������
	 */
	 public static void impExcelToTable(String excelFile,String tableName,String keyName,Connection con) {
	 	if(tableName == null) tableName = "StudentTest";
	 	if(keyName == null) keyName = "StudentID";
	 	System.out.println("������excelFile=" + excelFile);
	 	QueryRunner runner = new QueryRunner();
	 	int max = Webpriary.getPriaryTemp(con,tableName,keyName);
	 	
	 	
	 	try{
	 		File file = new File(excelFile);
	 		
	 		InputStream in = new FileInputStream(excelFile);
	 		System.out.println("-------file path" + file.getCanonicalPath());
	 		POIFSFileSystem fs = new POIFSFileSystem(in);
		 	HSSFWorkbook wb = new HSSFWorkbook(fs);
		    HSSFSheet sheet = wb.getSheetAt(0);
		    int tempcells = sheet.getRow(0).getPhysicalNumberOfCells();
		    System.out.println("-------tempcells" + tempcells);
		    int temprows = sheet.getPhysicalNumberOfRows();
		    System.out.println("-------temprows" + temprows);
		    
		    Object[] params = null;
		    con.setAutoCommit(false);
		    for(int i = 1; i < temprows; i++) {
		    	HSSFRow hssfRow = sheet.getRow(i);
		    	if(hssfRow!=null && !isNull(hssfRow)) {
		    		
			    	params = new Object[tempcells];
			    	//params[0] = new Integer(max);
			    	for(int j = 0; j < tempcells; j++) {
			    		HSSFCell hssfCell = hssfRow.getCell((short)j);
			    		if(hssfCell!=null) {
			    			int tempType = hssfCell.getCellType();
			    			if(tempType == HSSFCell.CELL_TYPE_STRING) {
			    				params[j] = hssfCell.getStringCellValue();
			    			}else if(tempType == HSSFCell.CELL_TYPE_NUMERIC) {
			    				
			    				if(HSSFDateUtil.isCellDateFormatted(hssfCell)) {
			    					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			    					params[j] = sdf.format(hssfCell.getDateCellValue());
			    				}else{
			    					params[j] = new Integer((int)hssfCell.getNumericCellValue());
			    				}
			    				
			    			}else{
			    				params[j] = hssfCell.getStringCellValue();
			    			}
			    			
			    		}else{
			    			params[j] = null;
			    			
			    		}
			    	
			    	}
			    	
			    	
			    	
			    	java.util.List list = new ArrayList();
			    	list.add(new Integer(max));
			    	for(int t = 0; t < params.length; t++) {
			    		if(t == 1) continue;
			    		Object temp = params[t];
			    		list.add(temp);
			    	}
			    	Object[] trueparams = new Object[list.size()];
			    	
			    	trueparams = (Object[])list.toArray(trueparams);
			    	System.out.println("@@@@@@@@@@@@length array is:" + trueparams.length);
			    	
			    	String sql = "insert into " + tableName + "(StudentID,StudentNO,Sex,Birthdate,DegreeID,major,JoinPartyTime,StartWorkingTime,WorkingOrgan,Duty,dutylevel,OrganTel,HomeTel,MobileTel,Email,TeamID,Remark)";
			    	sql += " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			    	
			    	
			    	runner.update(con,sql,trueparams);
			    	max++;
		    	}
		    	
		    	
		    	
		    
		    }
		    
		    con.commit();
		    con.setAutoCommit(true);
		    
	 		
	 	}catch(Exception e){
	 		e.printStackTrace();
	 		
	 	}finally{
	 		try{
	 			if(con!=null) con.close();
	 		}catch(Exception e) {
	 			
	 		}
	 	
	 	}
	 	
	 
	 }
	 
	 
	 
	 public static void impCommonExcelToTable(String excelFile,String sql,String tableName,String keyName,Connection con) {
	 	if(tableName == null) tableName = "StudentTest";
	 	if(keyName == null) keyName = "StudentID";
	 	System.out.println("������excelFile=" + excelFile);
	 	QueryRunner runner = new QueryRunner();
	 	int max = Webpriary.getPriaryTemp(con,tableName,keyName);
	 	
	 	
	 	try{
	 		File file = new File(excelFile);
	 		
	 		InputStream in = new FileInputStream(excelFile);
	 		System.out.println("-------file path" + file.getCanonicalPath());
	 		POIFSFileSystem fs = new POIFSFileSystem(in);
		 	HSSFWorkbook wb = new HSSFWorkbook(fs);
		    HSSFSheet sheet = wb.getSheetAt(0);
		    int tempcells = sheet.getRow(0).getPhysicalNumberOfCells();
		    System.out.println("-------tempcells" + tempcells);
		    int temprows = sheet.getPhysicalNumberOfRows();
		    System.out.println("-------temprows" + temprows);
		    
		    Object[] params = null;
		    con.setAutoCommit(false);
		    for(int i = 1; i < temprows; i++) {
		    	HSSFRow hssfRow = sheet.getRow(i);
		    	if(hssfRow!=null && !isNull(hssfRow)) {
		    		
			    	params = new Object[tempcells];
			    	//params[0] = new Integer(max);
			    	for(int j = 0; j < tempcells; j++) {
			    		HSSFCell hssfCell = hssfRow.getCell((short)j);
			    		if(hssfCell!=null) {
			    			int tempType = hssfCell.getCellType();
			    			if(tempType == HSSFCell.CELL_TYPE_STRING) {
			    				params[j] = hssfCell.getStringCellValue();
			    			}else if(tempType == HSSFCell.CELL_TYPE_NUMERIC) {
			    				
			    				if(HSSFDateUtil.isCellDateFormatted(hssfCell)) {
			    					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			    					params[j] = sdf.format(hssfCell.getDateCellValue());
			    				}else{
			    					params[j] = new Integer((int)hssfCell.getNumericCellValue());
			    				}
			    				
			    			}else{
			    				params[j] = hssfCell.getStringCellValue();
			    			}
			    			
			    		}else{
			    			params[j] = null;
			    			
			    		}
			    	
			    	}
			    	
			    	
			    	
			    	java.util.List list = new ArrayList();
			    	list.add(new Integer(max));
			    	for(int t = 0; t < params.length; t++) {
			    		if(t == 1) continue;
			    		Object temp = params[t];
			    		list.add(temp);
			    	}
			    	Object[] trueparams = new Object[list.size()];
			    	
			    	trueparams = (Object[])list.toArray(trueparams);
			    	System.out.println("@@@@@@@@@@@@length array is:" + trueparams.length);
			    	
//			    	sql = "insert into " + tableName + "(StudentID,StudentNO,Sex,Birthdate,DegreeID,major,JoinPartyTime,StartWorkingTime,WorkingOrgan,Duty,dutylevel,OrganTel,HomeTel,MobileTel,Email,TeamID,Remark)";
//			    	sql += " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			    	
			    	
			    	runner.update(con,sql,trueparams);
			    	max++;
		    	}
		    	
		    	
		    	
		    
		    }
		    
		    con.commit();
		    con.setAutoCommit(true);
		    
	 		
	 	}catch(Exception e){
	 		e.printStackTrace();
	 		
	 	}finally{
	 		try{
	 			if(con!=null) con.close();
	 		}catch(Exception e) {
	 			
	 		}
	 	
	 	}
	 	
	 
	 }
	 

	 
	 public static boolean isNull(HSSFRow hssfRow) {
	    boolean hasNull = true;
	    if(hssfRow == null) return true;
	    for(int i = 0; i < hssfRow.getPhysicalNumberOfCells(); i++) {
	      HSSFCell hssfCell = hssfRow.getCell((short)i);
	      Object object = null;
	      if(hssfCell!=null) {
	        int tempType = hssfCell.getCellType();
	        if (tempType == HSSFCell.CELL_TYPE_STRING) {
	          object = hssfCell.getStringCellValue();
	        }
	        else if (tempType == HSSFCell.CELL_TYPE_NUMERIC) {

	          if (HSSFDateUtil.isCellDateFormatted(hssfCell)) {
	            
	            object = hssfCell.getDateCellValue();
	          }
	          else {
	            object = new Integer( (int) hssfCell.getNumericCellValue());
	          }

	        }
	        else {
	          object = hssfCell.getStringCellValue();
	        }

	      }
	      if(object!=null && !object.equals("")) return false;
	    }
	    return hasNull;
	  
	  }
	
	
	public static void main(String arg[]){
		
	}
	
	
	//��Ȩtable ʹ���Ϊ�����
	public  Node changTableNode(Document doc,Node node) throws Exception{
		HashMap tempMap=new HashMap();
		NodeList nodeList=node.getChildNodes();
		maxColNum = getMaxcolNum(nodeList);//������������
		
		for(int m=0;m<nodeList.getLength();m++){
			Node trNode = nodeList.item(m);
			NodeList trList=trNode.getChildNodes();
			int n=0;
			int trLength=trList.getLength();
			for(int i=0;i<trLength;i++){
				Node tdNode = trList.item(i);
			 	int colspan = 1;
			 	int rowspan = 1;
			 	if(isExistAttribute(tdNode,"colspan")) {
			 			colspan = Integer.parseInt(getAttributeValue(tdNode,"colspan"));
			 	}
			 	if(isExistAttribute(tdNode,"rowspan")) {
			 			rowspan = Integer.parseInt(getAttributeValue(tdNode,"rowspan"));
			 	}
			 	Object tempStr=tempMap.get(String.valueOf(n));//���ǰ���Ƿ��� rowspan>1
			 	if(tempStr!=null){
			 		Node tempNode=tdNode.getNextSibling();
			 		Node newNode=doc.createElement("td");
		 			XmlUtil.setNodeValue(newNode,"");
		 			trNode.insertBefore(newNode,tdNode);
		 			int tempInt=Integer.parseInt(tempStr.toString())-1;
		 			if(tempInt<=1){
		 				tempMap.remove(String.valueOf(n));
		 			}
		 			else
		 				tempMap.put(String.valueOf(n),String.valueOf(tempInt));
		 			trLength++;
			 	}
			 		
			 		
			 	if(colspan>1){
			 		Node tempNode=tdNode.getNextSibling();
			 		for (int j=1;j<colspan;j++){
			 			Element newNode=doc.createElement("td");
			 			XmlUtil.setNodeValue(newNode,"");
			 			if(rowspan>1)
			 				newNode.setAttribute("rowspan",String.valueOf(rowspan));
			 				
			 			if(tempNode==null){
			 				trNode.appendChild(newNode);
			 			}
			 			else{
			 				trNode.insertBefore(newNode,tempNode);
			 			}
			 			trLength++;
			 		}
			 	}
			 	
			 	if(rowspan>1){
			 		tempMap.put(String.valueOf(n),String.valueOf(rowspan));
			 	}
			 		
			 		
				
				n++;
			}
			if(n<maxColNum){//��ȫ
				for(int k=n;k<maxColNum;k++){
					Object tempStr=tempMap.get(String.valueOf(k));//���ǰ���Ƿ��� rowspan>1
				 	if(tempStr!=null){
				 		
				 		Node newNode=doc.createElement("td");
			 			XmlUtil.setNodeValue(newNode,"");
			 			trNode.appendChild(newNode);
			 			int tempInt=Integer.parseInt(tempStr.toString())-1;
			 			if(tempInt<=1){
			 				tempMap.remove(String.valueOf(k));
			 			}
			 			else
			 				tempMap.put(String.valueOf(k),String.valueOf(tempInt));
				 	}
				}
			}
		}
		return node;
		
	}
	
	public void printNode(Node node){
		NodeList list=node.getChildNodes();
		for(int i=0;i<list.getLength();i++){
			Node node2=list.item(i);
			System.out.println();
			System.out.print("<"+node2.getNodeName()+">");
			System.out.print(XmlUtil.getNodeValue(node2));
			printNode(node2);
			System.out.print("</"+node2.getNodeName()+">");
		}
		
	}
	
	public void createSeatBody(HSSFWorkbook wb,HSSFSheet sheet,NodeList alltr) {
	 	//int startrow = 2;
	 	if(alltr.getLength() > 1) {
	 		//ԭ�����ͷʱ m=1
	 		colLength = new int[maxColNum];
	 		for(int m = 0; m < alltr.getLength(); m++) {
	 			int rows=m;
	 			int cellpos = 0;
	 			Node trNode=alltr.item(m);
	 			HSSFRow row = sheet.createRow((short)(rows));
	 			NodeList list =trNode.getChildNodes();
	 			
	 			HSSFFont font = wb.createFont();
	 			font.setFontName("����_GB2312");	 			         //������������
				font.setFontHeight((short)1440); 	 			//���������С
				font.setBoldweight((short)1000);                //���ô���
				font.setColor(HSSFColor.BLACK.index);  	 	   //����������ɫ 
				font.setItalic(false);  				           //����б��
//				if(isExistAttribute(trNode,"class")){
// 		 			if(getAttributeValue(trNode,"class").equalsIgnoreCase("td_title")){//����Ǳ����� ������
//	 		 			font.setFontHeight((short)500); 	 			//���������С
//	 		 			font.setBoldweight((short)500);                //���ô���
//	 		 			font.setColor(HSSFColor.BLACK.index);  	 	   //����������ɫ 
//	 		 			font.setItalic(false);  				       
// 		 			}
// 		 		}
//				


//	 			HSSFFont font = createFont(wb,"Arial",48,HSSFFont.BOLDWEIGHT_BOLD,HSSFColor.BLACK.index);
// 		 		if(isExistAttribute(trNode,"class")){
// 		 			if(getAttributeValue(trNode,"class").equalsIgnoreCase("td_title"))//����Ǳ����� ������
// 		 				font = createFont(wb,"Arial",12,HSSFFont.BOLDWEIGHT_BOLD,HSSFColor.BLACK.index);
// 		 		}
	 			for(int i = 0; i < list.getLength(); i++) {
	 				
	 				Node tdNode = list.item(i);
	 				
	 		 		String tdValue = "";
	 		 		if(tdNode != null) {
	 		 			if(tdNode.getFirstChild()!=null)
	 		 				tdValue = tdNode.getFirstChild().getNodeValue();
	 		 		}
	 		 		
	 		 		int tdValueLength = 0;
	 		 		if(tdValue == null) tdValue = "";
	 		 		tdValueLength = tdValue.getBytes().length;
	 		 		int colspan = 1;
	 		 		int rowspan = 1;
	 		 		if(isExistAttribute(tdNode,"colspan")) {
	 		 			colspan = Integer.parseInt(getAttributeValue(tdNode,"colspan"));
	 		 			
	 		 		}
	 		 		else if(tdValueLength>colLength[i]){
	 		 			colLength[i] = tdValueLength;
	 		 		}
	 		 		if(isExistAttribute(tdNode,"rowspan")) {
	 		 			rowspan = Integer.parseInt(getAttributeValue(tdNode,"rowspan"));
	 		 		}
	 		 			 		 		
	 		 		
	 		 		HSSFCell cell = row.createCell((short) cellpos);
	 		 		cell.setEncoding(HSSFCell.ENCODING_UTF_16);
	 		 		row.setHeight((short)4000);
	 		 		HSSFCellStyle style = wb.createCellStyle();
	 		 		style.setFont(font);

	 		 		cell.setCellStyle(style);
	 		 		cell.setCellValue(tdValue);
	 		 		
	 		 		
	 		 		
	 		 		if(colspan > 1) {
 		 				
 		 				sheet.addMergedRegion(new Region(rows,(short)cellpos,rows,(short)(cellpos+colspan -1)));
 		 				
	 		 		}
	 		 		
	 		 		if(rowspan >1) {
	 		 			
	 		 			int mergedy = rows + rowspan -1;
	 		 			sheet.addMergedRegion(new Region(rows,(short)cellpos,mergedy,(short)cellpos));
 		 			
	 		 		}
	 		 		
	 		 		cellpos++;
	 				
	 			}
	 			
	 			
	 		
	 		}
	 	
	 	
	 	}
	 
	 
	 
	 }
	 
	
	/**
	 * Description:���excel
	 * @param req
	 * @param res
	 * @throws Exception
	 */
	public void exportSeat(PageContext pageContext) throws Exception {
		HttpServletRequest req = (HttpServletRequest)pageContext.getRequest();
		HttpServletResponse res = (HttpServletResponse) pageContext.getResponse();
		
		Document xmlDom = getDomDate(req);//�õ�DOM
		
		OutputStream pageOut = res.getOutputStream();//�õ�ҳ�������
		
		HSSFSheet sheet = wb.createSheet();//������
		
		Node node=changTableNode(xmlDom,xmlDom.getElementsByTagName("table").item(0));
		
		
	  // printNode(node);
		
		//------------------
		
		NodeList alltr = node.getChildNodes();
		fccLog.info("*************getLength:" + alltr.getLength());
		
		//maxColNum = getMaxcolNum(alltr);//������������
		
		createSeatBody(wb,sheet,alltr);
		sheet.setColumnWidth((short)0,(short)(42.4*292));
		sheet.setColumnWidth((short)1,(short)(42.4*292));
//		sheet.setDefaultRowHeight((short)14000);
		
		res.setContentType("application/vnd.ms-excel;charset=gbk");
		String fileName = "ѧԱ���α�.xls";
		String fileNameTM =new String(fileName.getBytes("GBK"), "8859_1");
		res.setHeader("content-disposition","attachment;filename="+fileNameTM);
		
		wb.write(pageOut);
		pageOut.flush();
		
	
	}
	


}
