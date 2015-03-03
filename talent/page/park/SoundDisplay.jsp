<%@include file="/internet/common.jsp"%>
<%
float money = Float.parseFloat(request.getParameter("money"));
System.out.println("money----------"+money);
talent.util.SoundDisplay.playSound(money);
 %>
<%
//float money=1234.2f;
//String moneyStr = talent.util.SoundDisplay.getMoneyChinese(money);
//for(int i=0;i<moneyStr.length();i++){
//  	if(moneyStr.charAt(i)=='Áã'){ 
//  	talent.util.SoundDisplay.soundPlay("D:/wav/0.wav");
//	}else if(moneyStr.charAt(i)=='Ò¼'){ 
//	talent.util.SoundDisplay.soundPlay("D:/wav/1.wav");
//	}else if(moneyStr.charAt(i)=='·¡'){ 
//	talent.util.SoundDisplay.soundPlay("D:/wav/2.wav");
//	}else if(moneyStr.charAt(i)=='Èþ'){ 
//	talent.util.SoundDisplay.soundPlay("D:/wav/3.wav");
//	}else if(moneyStr.charAt(i)=='ËÁ'){
//	talent.util.SoundDisplay.soundPlay("D:/wav/4.wav");
//	}else if(moneyStr.charAt(i)=='Îé'){ 
//	talent.util.SoundDisplay.soundPlay("D:/wav/5.wav");
//	}else if(moneyStr.charAt(i)=='Â½'){ 
//	talent.util.SoundDisplay.soundPlay("D:/wav/6.wav");
//	}else if(moneyStr.charAt(i)=='Æâ'){
//	talent.util.SoundDisplay.soundPlay("D:/wav/7.wav");
//	}else if(moneyStr.charAt(i)=='°Æ'){ 
//	talent.util.SoundDisplay.soundPlay("D:/wav/8.wav");
//	}else if(moneyStr.charAt(i)=='¾Á'){ 
//	talent.util.SoundDisplay.soundPlay("D:/wav/9.wav");
//	}else if(moneyStr.charAt(i)=='·Ö'){
//	talent.util.SoundDisplay.soundPlay("D:/wav/fen.wav"); 
//	}else if(moneyStr.charAt(i)=='½Ç'){
//	talent.util.SoundDisplay.soundPlay("D:/wav/jiao.wav");
//	}else if(moneyStr.charAt(i)=='Õû'){ 
//	talent.util.SoundDisplay.soundPlay("D:/wav/zheng.wav");
//	}else if(moneyStr.charAt(i)=='Ôª'){
//	talent.util.SoundDisplay.soundPlay("D:/wav/yuan.wav");
//	}else if(moneyStr.charAt(i)=='Ê°'){ 
//	talent.util.SoundDisplay.soundPlay("D:/wav/shi.wav");
//	}else if(moneyStr.charAt(i)=='°Û'){ 
//	talent.util.SoundDisplay.soundPlay("D:/wav/bai.wav");
//	}else if(moneyStr.charAt(i)=='Çª'){ 
//	talent.util.SoundDisplay.soundPlay("D:/wav/qian.wav");
//	}else if(moneyStr.charAt(i)=='Íò'){ 
//	talent.util.SoundDisplay.soundPlay("D:/wav/wan.wav");
//	}
//	try{
//		Thread.sleep(1000);
//		}catch (Exception e) { e.printStackTrace(); 
//	}
//}%>