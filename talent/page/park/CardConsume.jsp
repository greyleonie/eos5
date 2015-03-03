<%@include file="/internet/common.jsp"%>
<%
String moneyStr = (String)request.getAttribute("moneystr");
String conCode = (String)request.getAttribute("ConnectCode");
String deviceID = (String)request.getAttribute("deviceID");
float money = 0;
if(moneyStr!=null){
	money = Float.parseFloat(moneyStr);
}
 %>
<form name="parkForm" action="/parkDispatcher" method="post" target="parkdata">
	 <input name="devCardID" type="hidden">
	 <input name="IsConSume" type="hidden">
</form>
  <script>
  var paymoney = <%=money%>; 
  var conCode = <%=conCode%>;
  var deviceID = <%=deviceID%>;
  if(paymoney>0){
	  //alert(paymoney);
	  var rs = parent.parkclient.document.control.ConsumeOnPOS(conCode,deviceID,4,1,paymoney);
	  //alert(rs);
	  var devCardID = parent.parkclient.document.control.RepeatedPoll(conCode,deviceID,4,0);
	  //alert(devCardID);
	   
	  document.parkForm.devCardID.value = devCardID;
	  if(devCardID.substring(2,4)=='A7'){
	  	document.parkForm.IsConSume.value = 0;
	  	
	  }else{
	   if(rs)  document.parkForm.IsConSume.value = 1;
	   else document.parkForm.IsConSume.value = 2;
	  }
	  parkForm.submit();
  }
  
  </script>