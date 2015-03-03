/*
 * �������� 2006-5-25
 *
 * TODO Ҫ���Ĵ����ɵ��ļ���ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
package talent.core;

import java.util.*;
import java.text.*;

/**
 * @author Administrator
 *
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
public class Licence {
	private Properties pros = null;
	
	public Licence() {
		pros = new Properties();
		try{
			pros.load(this.getClass().getResourceAsStream("/properties/database.properties"));
			
		}catch(Exception e){
			
		}
	}
	
	public boolean parse() throws Exception {
		Date date = Calendar.getInstance().getTime();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String expire = pros.getProperty("expire");
		if(expire==null||"".equals(expire)) return false;
		
		if(expire.equalsIgnoreCase("no")) return true;
		if(expire.equalsIgnoreCase("yes")) return false;
		//System.out.print("#####expire is" + expire);
		
		Date expireDate = sdf.parse(expire);
		if(date.getTime() < expireDate.getTime()){
			return true;
		}
		
		return false;
	
	}

}

