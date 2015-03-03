package tools.util;
import java.io.IOException;

import org.w3c.dom.*;

import com.lowagie.text.DocumentException;
import com.lowagie.text.Font;
import com.lowagie.text.pdf.BaseFont;
import com.primeton.tp.core.api.BizContext;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-9-28
 * @class_displayName PDFChineseFont
 */

public class PDFChineseFont { 

	private static Font chineseFont; 



	public final static Font createChineseFont(int size, int style) { 

	try { 

	chineseFont = new Font(BaseFont.createFont("STSong-Light", 
	"UniGB-UCS2-H", BaseFont.NOT_EMBEDDED), size, style); 

	} catch (DocumentException e) { 

//	 TODO Auto-generated catch block 

	e.printStackTrace(); 

	} catch (IOException e) { 

//	 TODO Auto-generated catch block 

	e.printStackTrace(); 

	} 

	return chineseFont; 

	} 

	} 