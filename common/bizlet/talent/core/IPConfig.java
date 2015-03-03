/*
 * 创建日期 2006-6-15
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
package talent.core;
import java.util.*;
import java.io.*;

/**
 * @author Administrator
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class IPConfig {
	private Properties pro;
	
	public IPConfig() {
		pro = new Properties();
		try{
			pro.load(this.getClass().getResourceAsStream("/properties/FileCount.properties"));
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public IPConfig(String path) {
		pro = new Properties();
		try{
			pro.load(this.getClass().getResourceAsStream(path));
		}catch(Exception e) {
			e.printStackTrace();
		}
	
	}
	
	public String getValue(String key,String defaultValue){
		String result = null;
		result = pro.getProperty(key);
		if(result==null) {
			if(defaultValue!=null) {
				result = defaultValue;
			}else{
				result = "127.0.0.1";
			}
		}
		return result;
	
	}

}
