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
	if(puc.getCardType()==1) CardTypeName = "ѧԱ��";
	else if(puc.getCardType()==2) CardTypeName = "ѧԱ��";
	
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
					cardcontrol.Init(com);	//��ʼ������
					
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
				if(window.confirm("д�������쳣�������������Ƿ�����ȷ��������ٵ����ȷ������ť����д����")){
					cardcontrol.Quit();
					WriteIntoCard();
				}
				else{
					info.innerHTML="����ʧ�ܣ�";
					
				}
			}
</script>
<script>
				WriteIntoCard();
</script>
<table width="100%" border="0" cellpadding="0" cellspacing="1"align="center" bgcolor="#BABCD3">
  <tr>
    <td width="183">�û����ͣ�<%=CardTypeName%></td>
    <td width="210">���ƺ��룺<%=CarID %></td>
    <td width="191">����ʱ�䣺<%=ComeTime %></td>
    <td width="223">����ʱ�䣺<%=LeaveTime %></td>
  </tr>
  <tr>
    <td height="74" colspan="4">
	<!--<table width="100%">
      <tr>
    <td width="19">����ͼƬ</td>
    <td width="359">
    <img src='/common/page/viewimgdb/viewFromDB.jsp?table=ParkReadCardRecord&pkn=RecordID&field=ComeCarPic&pkv=<%=RecordID %>' width="200" height="100"></td>
    <td width="19">����ͼƬ</td>
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
    <td>ͣ��ʱ����</td>
    <td>���ʣ�</td>
    <td>�շѽ�</td>
    <td>�շѷ�ʽ��</td>
  </tr>
  <tr>
    <td>Ӧ�ս�</td>
    <td>ʵ�ս�</td>
    <td>�Ƿ�ˢ��</td>
    <td>��ˢ���ţ�</td>

  </tr>
  <tr>
    <td colspan="4">��ע��</td>
  </tr>
 <%}%>
 
 <form action="/parkReReadCard" name="reCardForm" method="post">>
 �Ƿ�ˢ��:
 
 <input type="submit" name="add" value="ȷ��">
 </form> 
</table>