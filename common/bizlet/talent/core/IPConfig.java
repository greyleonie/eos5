/*
 * �������� 2006-6-15
 *
 * TODO Ҫ���Ĵ����ɵ��ļ���ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
package talent.core;
import java.util.*;
import java.io.*;

/**
 * @author Administrator
 *
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
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
