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
//  	if(moneyStr.charAt(i)=='��'){ 
//  	talent.util.SoundDisplay.soundPlay("D:/wav/0.wav");
//	}else if(moneyStr.charAt(i)=='Ҽ'){ 
//	talent.util.SoundDisplay.soundPlay("D:/wav/1.wav");
//	}else if(moneyStr.charAt(i)=='��'){ 
//	talent.util.SoundDisplay.soundPlay("D:/wav/2.wav");
//	}else if(moneyStr.charAt(i)=='��'){ 
//	talent.util.SoundDisplay.soundPlay("D:/wav/3.wav");
//	}else if(moneyStr.charAt(i)=='��'){
//	talent.util.SoundDisplay.soundPlay("D:/wav/4.wav");
//	}else if(moneyStr.charAt(i)=='��'){ 
//	talent.util.SoundDisplay.soundPlay("D:/wav/5.wav");
//	}else if(moneyStr.charAt(i)=='½'){ 
//	talent.util.SoundDisplay.soundPlay("D:/wav/6.wav");
//	}else if(moneyStr.charAt(i)=='��'){
//	talent.util.SoundDisplay.soundPlay("D:/wav/7.wav");
//	}else if(moneyStr.charAt(i)=='��'){ 
//	talent.util.SoundDisplay.soundPlay("D:/wav/8.wav");
//	}else if(moneyStr.charAt(i)=='��'){ 
//	talent.util.SoundDisplay.soundPlay("D:/wav/9.wav");
//	}else if(moneyStr.charAt(i)=='��'){
//	talent.util.SoundDisplay.soundPlay("D:/wav/fen.wav"); 
//	}else if(moneyStr.charAt(i)=='��'){
//	talent.util.SoundDisplay.soundPlay("D:/wav/jiao.wav");
//	}else if(moneyStr.charAt(i)=='��'){ 
//	talent.util.SoundDisplay.soundPlay("D:/wav/zheng.wav");
//	}else if(moneyStr.charAt(i)=='Ԫ'){
//	talent.util.SoundDisplay.soundPlay("D:/wav/yuan.wav");
//	}else if(moneyStr.charAt(i)=='ʰ'){ 
//	talent.util.SoundDisplay.soundPlay("D:/wav/shi.wav");
//	}else if(moneyStr.charAt(i)=='��'){ 
//	talent.util.SoundDisplay.soundPlay("D:/wav/bai.wav");
//	}else if(moneyStr.charAt(i)=='Ǫ'){ 
//	talent.util.SoundDisplay.soundPlay("D:/wav/qian.wav");
//	}else if(moneyStr.charAt(i)=='��'){ 
//	talent.util.SoundDisplay.soundPlay("D:/wav/wan.wav");
//	}
//	try{
//		Thread.sleep(1000);
//		}catch (Exception e) { e.printStackTrace(); 
//	}
//}%>