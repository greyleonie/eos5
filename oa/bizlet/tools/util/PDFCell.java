package tools.util;
import org.w3c.dom.*;

import com.lowagie.text.BadElementException;
import com.lowagie.text.Cell;
import com.lowagie.text.Chunk;
import com.lowagie.text.Font;
import com.primeton.tp.core.api.BizContext;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-9-28
 * @class_displayName PDFCell
 */

public class PDFCell extends Cell { 

public PDFCell(String content, int rowspan, int colspan) 	throws BadElementException { 
	super(new Chunk(content, PDFChineseFont.createChineseFont(8, Font.NORMAL))); 
	setRowspan(rowspan); 
	setColspan(colspan); 
	
	setHeader(false); 
	}
} 

