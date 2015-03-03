/*
 * 创建日期 2006-1-16
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
package base.util;

import java.util.*;
import javax.servlet.http.HttpSession;

import talent.core.Licence;
/**
 * @author Administrator
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class RightParse {
	private Licence licence = new Licence();
	private boolean isExpire = false;
	
	public RightParse() {
		try{
			isExpire = licence.parse();
		}catch(Exception e) {
			
		}
	}
	
	public boolean parse(String operation,HttpSession session){
		try{
			if(null==operation||"".equals(operation)) {
				return true;
			}
			int index = operation.indexOf(".");
			if(index==-1) {
				return false;
			}
			String module = operation.substring(0,index);
			String action = operation.substring(index+1,operation.length());
			if(module==null || action==null) {
				return false;
			}
			if(null==session.getAttribute("userPermissions")) {
				return false;
			}
			HashMap allRight = (HashMap) session.getAttribute("userPermissions");
			if(null==allRight.get(module)) {
				return false;
			}
			String currentModuleAllRight = (String)(allRight.get(module));
			
			if(currentModuleAllRight.indexOf(action)!=-1&&isExpire) {
				return true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
}
