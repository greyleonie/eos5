/*
 * �������� 2007-8-23
 *
 * TODO Ҫ���Ĵ����ɵ��ļ���ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
package talent.util;

import java.io.*;

/**
 * @author new
 *
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
public class SoundDisplay {

	/**
	 * ��Сд���ת���ɴ�д���
	 * @param money
	 * @return
	 */
	public static String getMoneyChinese(float money){
		String result = "";
		String s1="��Ҽ��������½��ƾ�"; 
		String s4="�ֽ���Ԫʰ��Ǫ��"; 
		String moneyStr = String.valueOf(money);
		int len = 0;
		if(moneyStr.indexOf(".")==-1) len = moneyStr.length();
		
		else len=moneyStr.indexOf(".");

		float temp = Float.parseFloat("0"+moneyStr.substring(len));
		if(temp>0){}
		else{
			moneyStr = moneyStr.substring(0,len);
		}
		
		int n1,n2=0; 
		String num=""; 
		String unit=""; 
		for(int i=0;i<moneyStr.length();i++){
			if(i>len+2){break;} 
			if(i==len) {continue;} 
			n1=Integer.parseInt(String.valueOf(moneyStr.charAt(i))); 
			num=s1.substring(n1,n1+1);
			n1=len-i+2; 
			unit=s4.substring(n1,n1+1); 
			result=result.concat(num).concat(unit); 
		}
		if ((len==moneyStr.length()) ||(len==moneyStr.length()-1)) result=result.concat("��"); 
		//if (len==moneyStr.length()-2) result=result.concat("���"); 
		return result;
	}
	
	/**
	 * ���������ļ�
	 * @param soundFile
	 */
	public static void soundPlay(String soundFile) {
		try { 
			InputStream is = new java.io.FileInputStream(soundFile);
			sun.audio.AudioStream soundStream = new sun.audio.AudioStream(is); 
			sun.audio.AudioPlayer.player.start(soundStream); 
		} catch (Exception e) { 
			e.printStackTrace(); 
		}
	}
	
	/**
	 * ���ݽ���ȡ����
	 * @param money
	 */
	public static void playSound(float money){
		String moneyStr = talent.util.SoundDisplay.getMoneyChinese(money);
		try{
			Thread.sleep(1000);
			}catch (Exception e) { e.printStackTrace(); 
		}
		talent.util.SoundDisplay.soundPlay("D:/primeton/wav/��.wav");
		try{
			Thread.sleep(500);
			}catch (Exception e) { e.printStackTrace(); 
		}
		for(int i=0;i<moneyStr.length();i++){
		  	if(moneyStr.charAt(i)=='��'){ 
		  		talent.util.SoundDisplay.soundPlay("D:/primeton/wav/0.wav");
			}else if(moneyStr.charAt(i)=='Ҽ'){ 
			talent.util.SoundDisplay.soundPlay("D:/primeton/wav/1.wav");
			}else if(moneyStr.charAt(i)=='��'){ 
			talent.util.SoundDisplay.soundPlay("D:/primeton/wav/2.wav");
			}else if(moneyStr.charAt(i)=='��'){ 
			talent.util.SoundDisplay.soundPlay("D:/primeton/wav/3.wav");
			}else if(moneyStr.charAt(i)=='��'){
			talent.util.SoundDisplay.soundPlay("D:/primeton/wav/4.wav");
			}else if(moneyStr.charAt(i)=='��'){ 
			talent.util.SoundDisplay.soundPlay("D:/primeton/wav/5.wav");
			}else if(moneyStr.charAt(i)=='½'){ 
			talent.util.SoundDisplay.soundPlay("D:/primeton/wav/6.wav");
			}else if(moneyStr.charAt(i)=='��'){
			talent.util.SoundDisplay.soundPlay("D:/primeton/wav/7.wav");
			}else if(moneyStr.charAt(i)=='��'){ 
			talent.util.SoundDisplay.soundPlay("D:/primeton/wav/8.wav");
			}else if(moneyStr.charAt(i)=='��'){ 
			talent.util.SoundDisplay.soundPlay("D:/primeton/wav/9.wav");
			}else if(moneyStr.charAt(i)=='��'){
			talent.util.SoundDisplay.soundPlay("D:/primeton/wav/��.wav"); 
			}else if(moneyStr.charAt(i)=='��'){
			talent.util.SoundDisplay.soundPlay("D:/primeton/wav/��.wav");
			}else if(moneyStr.charAt(i)=='Ԫ'){
			talent.util.SoundDisplay.soundPlay("D:/primeton/wav/Ԫ.wav");
			}else if(moneyStr.charAt(i)=='ʰ'){ 
			talent.util.SoundDisplay.soundPlay("D:/primeton/wav/ʮ.wav");
			}else if(moneyStr.charAt(i)=='��'){ 
			talent.util.SoundDisplay.soundPlay("D:/primeton/wav/��.wav");
			}else if(moneyStr.charAt(i)=='Ǫ'){ 
			talent.util.SoundDisplay.soundPlay("D:/primeton/wav/ǧ.wav");
			}
			try{
				Thread.sleep(500);
				}catch (Exception e) { e.printStackTrace(); 
			}
		}
		talent.util.SoundDisplay.soundPlay("D:/primeton/wav/л.wav");
		try{
			Thread.sleep(1000);
			}catch (Exception e) { e.printStackTrace(); 
		}
	}
	
	public static void main(String [] args){
//		float money = 1234;
//		String moneyStr = getMoneyChinese(money);
//		for(int i=0;i<moneyStr.length();i++){
//			if(moneyStr.charAt(i)=='��'){
//				soundPlay("talent/page/park/wav/0.wav");
//			}else if(moneyStr.charAt(i)=='Ҽ'){
//				soundPlay("talent/page/park/wav/1.wav");
//			}else if(moneyStr.charAt(i)=='��'){
//				soundPlay("talent/page/park/wav/2.wav");
//			}else if(moneyStr.charAt(i)=='��'){
//				soundPlay("talent/page/park/wav/3.wav");
//			}
//			try{
//			Thread.sleep(1000);
//			}catch (Exception e) { e.printStackTrace(); 
//			}
//		}
		float money = 274.0f;
		SoundDisplay s = new SoundDisplay();
		s.playSound(money);
	}
}
