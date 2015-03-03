<%@include file="/internet/common.jsp"%>


<form name="parkForm" action="/talent/page/park/readCard.jsp" method="post">
	 <input name="cardid" type="text">
	 <input type="submit" name="submit" >
</form>

<%
String state = (String)request.getAttribute("state");
talent.util.ParkUserCard puc = (talent.util.ParkUserCard)request.getAttribute("puc");
String CardTypeName = "";
String CarID = "";
String ComeTime = "";
String LeaveTime = "";
int RecordID = 0;
if(puc!=null){
	if(puc.getCardType()==1) CardTypeName = "学员卡";
	else if(puc.getCardType()==2) CardTypeName = "学员卡";
	
	RecordID = puc.getRecordID();
	CarID = puc.getCarID();
	ComeTime = puc.getComeTime();
	LeaveTime = puc.getLeaveTime();
	if(CarID==null) CarID="";
	if(ComeTime==null) ComeTime="";
	if(LeaveTime==null) LeaveTime="";
}
 %>
<%
String cardData0 = (String)request.getAttribute("newCardData0");
 System.out.println("cardData0==========="+cardData0);
 %>
 <script language="javascript">
		   var controlflag=0;
           function WriteIntoCard(){
              try{	
		           controlflag=1;
					var com=0;
					cardcontrol.Init(com);	//初始化串口
					
					try{
					    <%if(cardData0!=null){%>
					    var dd = cardcontrol.WriteData(7,0,<%=cardData0%>);
					    alert(dd);
						if(cardcontrol.WriteData(7,0,<%=cardData0%>)==0){
								WriteIntoCardError();
								return;
						}
						<%}%>
					}
					catch(theException){
						WriteIntoCardError();
					}
					cardcontrol.Quit();
				}
				catch(theException){
						WriteIntoCardError();
				}
           }
           
           	function WriteIntoCardError(){
				if(window.confirm("写卡出现异常，请您检查操作是否有误，确定无误后再点击“确定”按钮重新写卡！")){
					cardcontrol.Quit();
					WriteIntoCard();
				}
				else{
					info.innerHTML="操作失败！";
					
				}
			}
</script>
<script>
				WriteIntoCard();
</script>
<table width="100%" border="0" cellpadding="0" cellspacing="1"align="center" bgcolor="#BABCD3">
  <tr>
    <td width="183">用户类型：<%=CardTypeName%></td>
    <td width="210">车牌号码：<%=CarID %></td>
    <td width="191">进门时间：<%=ComeTime %></td>
    <td width="223">出门时间：<%=LeaveTime %></td>
  </tr>
  <tr>
    <td height="74" colspan="4">
	<!--<table width="100%">
      <tr>
    <td width="19">进门图片</td>
    <td width="359">
    <img src='/common/page/viewimgdb/viewFromDB.jsp?table=ParkReadCardRecord&pkn=RecordID&field=ComeCarPic&pkv=<%=RecordID %>' width="200" height="100"></td>
    <td width="19">出门图片</td>
    <td width="408">
    <%if(state.equals("leave")||state.equals("reLeaveReadCard")){%>
    <img src='/common/page/viewimgdb/viewFromDB.jsp?table=ParkReadCardRecord&pkn=RecordID&field=ComeCarPic&pkv=<%=RecordID %>' width="200" height="100">
    <%}%>
    </td>
    </td>
     </tr>
    </table>-->

	</td>
  </tr>
<%if(state.equals("leave")||state.equals("reLeaveReadCard")){%>
  <tr>
    <td>停车时长：</td>
    <td>费率：</td>
    <td>收费金额：</td>
    <td>收费方式：</td>
  </tr>
  <tr>
    <td>应收金额：</td>
    <td>实收金额：</td>
    <td>是否补刷：</td>
    <td>补刷卡号：</td>

  </tr>
  <tr>
    <td colspan="4">备注：</td>
  </tr>
 <%}%>
 
 <form action="/parkReReadCard" name="reCardForm" method="post">>
 是否补刷卡:
 
 <input type="submit" name="add" value="确定">
 </form> 
</table>