/*
 * 创建日期 2007-8-23
 *
 * TODO 要更改此生成的文件的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
package talent.util;

import java.io.*;

/**
 * @author new
 *
 * TODO 要更改此生成的类型注释的模板，请转至
 * 窗口 － 首选项 － Java － 代码样式 － 代码模板
 */
public class SoundDisplay {

	/**
	 * 将小写金额转换成大写金额
	 * @param money
	 * @return
	 */
	public static String getMoneyChinese(float money){
		String result = "";
		String s1="零壹贰叁肆伍陆柒捌玖"; 
		String s4="分角整元拾佰仟万"; 
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
		if ((len==moneyStr.length()) ||(len==moneyStr.length()-1)) result=result.concat("整"); 
		//if (len==moneyStr.length()-2) result=result.concat("零分"); 
		return result;
	}
	
	/**
	 * 播放声音文件
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
	 * 根据金额读取声音
	 * @param money
	 */
	public static void playSound(float money){
		String moneyStr = talent.util.SoundDisplay.getMoneyChinese(money);
		try{
			Thread.sleep(1000);
			}catch (Exception e) { e.printStackTrace(); 
		}
		talent.util.SoundDisplay.soundPlay("D:/primeton/wav/请.wav");
		try{
			Thread.sleep(500);
			}catch (Exception e) { e.printStackTrace(); 
		}
		for(int i=0;i<moneyStr.length();i++){
		  	if(moneyStr.charAt(i)=='零'){ 
		  		talent.util.SoundDisplay.soundPlay("D:/primeton/wav/0.wav");
			}else if(moneyStr.charAt(i)=='壹'){ 
			talent.util.SoundDisplay.soundPlay("D:/primeton/wav/1.wav");
			}else if(moneyStr.charAt(i)=='贰'){ 
			talent.util.SoundDisplay.soundPlay("D:/primeton/wav/2.wav");
			}else if(moneyStr.charAt(i)=='叁'){ 
			talent.util.SoundDisplay.soundPlay("D:/primeton/wav/3.wav");
			}else if(moneyStr.charAt(i)=='肆'){
			talent.util.SoundDisplay.soundPlay("D:/primeton/wav/4.wav");
			}else if(moneyStr.charAt(i)=='伍'){ 
			talent.util.SoundDisplay.soundPlay("D:/primeton/wav/5.wav");
			}else if(moneyStr.charAt(i)=='陆'){ 
			talent.util.SoundDisplay.soundPlay("D:/primeton/wav/6.wav");
			}else if(moneyStr.charAt(i)=='柒'){
			talent.util.SoundDisplay.soundPlay("D:/primeton/wav/7.wav");
			}else if(moneyStr.charAt(i)=='捌'){ 
			talent.util.SoundDisplay.soundPlay("D:/primeton/wav/8.wav");
			}else if(moneyStr.charAt(i)=='玖'){ 
			talent.util.SoundDisplay.soundPlay("D:/primeton/wav/9.wav");
			}else if(moneyStr.charAt(i)=='分'){
			talent.util.SoundDisplay.soundPlay("D:/primeton/wav/分.wav"); 
			}else if(moneyStr.charAt(i)=='角'){
			talent.util.SoundDisplay.soundPlay("D:/primeton/wav/角.wav");
			}else if(moneyStr.charAt(i)=='元'){
			talent.util.SoundDisplay.soundPlay("D:/primeton/wav/元.wav");
			}else if(moneyStr.charAt(i)=='拾'){ 
			talent.util.SoundDisplay.soundPlay("D:/primeton/wav/十.wav");
			}else if(moneyStr.charAt(i)=='佰'){ 
			talent.util.SoundDisplay.soundPlay("D:/primeton/wav/百.wav");
			}else if(moneyStr.charAt(i)=='仟'){ 
			talent.util.SoundDisplay.soundPlay("D:/primeton/wav/千.wav");
			}
			try{
				Thread.sleep(500);
				}catch (Exception e) { e.printStackTrace(); 
			}
		}
		talent.util.SoundDisplay.soundPlay("D:/primeton/wav/谢.wav");
		try{
			Thread.sleep(1000);
			}catch (Exception e) { e.printStackTrace(); 
		}
	}
	
	public static void main(String [] args){
//		float money = 1234;
//		String moneyStr = getMoneyChinese(money);
//		for(int i=0;i<moneyStr.length();i++){
//			if(moneyStr.charAt(i)=='零'){
//				soundPlay("talent/page/park/wav/0.wav");
//			}else if(moneyStr.charAt(i)=='壹'){
//				soundPlay("talent/page/park/wav/1.wav");
//			}else if(moneyStr.charAt(i)=='贰'){
//				soundPlay("talent/page/park/wav/2.wav");
//			}else if(moneyStr.charAt(i)=='叁'){
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
