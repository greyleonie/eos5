<%@include file="/internet/common.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.ParseException"%>
<%

       String curDateStr  = "";
	   String showdate = base.util.TalentContext.getValue(pageContext,null,"input/CurrDate");;

		Calendar calendar = Calendar.getInstance();		
		SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");	
		SimpleDateFormat formaterYear = new SimpleDateFormat("yyyy");	
		SimpleDateFormat formaterMon = new SimpleDateFormat("MM");
		
		curDateStr = formater.format(calendar.getTime());
		
		Date date = null;
		int curMonth = 1;
		if (!showdate.equals("")){
			try{
				date = formater.parse(showdate);
			}catch(ParseException parseE){
				date = calendar.getTime();
				showdate = formater.format(date);
			}
		}else{
			date = calendar.getTime();
			showdate = formater.format(date);
		}
		curMonth = Integer.parseInt(formaterMon.format(date));
		int curYear = Integer.parseInt(formaterYear.format(date));
		String YearMon = curYear+"��"+curMonth+"��";
				
%>
<form method="post" name="opeForm">
<input  type="hidden" name="RoomID" value="<bean:write property="input/RoomID"/>"/>
<input  type="hidden" name="CurrDate" value="<bean:write property="input/CurrDate" formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/>" />
<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">

	  <tr>   
         <td>
         
         <table width="98%"  border="0" align="center"  cellpadding="0" cellspacing="0">
         <tr>
         <td class="td_title" align="center"> 
       <font color="#FFFFFF" ></font>   �ͷ�����<font color="red"><bean:write property="Room/RoomName"/></font>
       <font color="#FFFFFF">  ���ڽ����</font><font color="red"><bean:write property="Room/BuildingName"/></font>
       <font color="#FFFFFF" > ¥�㣺</font><font color="red"><bean:write property="Room/LayerNO"/>¥</font>
       <font color="#FFFFFF" >  �·ݣ�</font><font color="red"><%=YearMon%></font>
      </tr>
      </table>
      
	</td>
      </tr>

      <tr>
        <td valign="top" class="text">
      <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" style="cursor:hand">	
	 <tr class="td_title">

    <td width="7%"  class="Standard-title" valign="bottom"  nowrap align="center">
    <font color="#FFFFFF" title="��һ���" onclick="doYearClick(false)">��<%=curYear-1%></font></td>




    <td id=01 width="7%" bgcolor="" class="Standard-title"  valign="bottom"  nowrap align="center">
    <font color="<%=(curMonth==1?"red":"#FFFFFF")%>" title="1�·�" onclick="doMonthClick(1)">1��</font></td>
    

    
    <td width="7%"  class="Standard-title" valign="bottom" nowrap align="center">
      <font color="<%=curMonth==2?"red":"#FFFFFF"%>" title="2�·�" onclick="doMonthClick(2)">2��</font></td>
    

    
    <td id=03 width="7%" class="Standard-title"valign="bottom" nowrap align="center">
    <font color="<%=(curMonth==3?"red":"#FFFFFF")%>" title="3�·�" onclick="doMonthClick(3)">3��</font></td>
    
 
    <td id=04 width="7%" class="Standard-title"valign="bottom" nowrap align="center">
      <font color="<%=(curMonth==4?"red":"#FFFFFF")%>" title="4�·�" onclick="doMonthClick(4)">4��</font></td>
   


    <td id=05 width="7%" class="Standard-title" valign="bottom" nowrap align="center">
    <font color="<%=(curMonth==5?"red":"#FFFFFF")%>" title="5�·�" onclick="doMonthClick(5)">5��</font></td>
   


    <td id=06 width="7%" valign="bottom" nowrap align="center">
    <font color="<%=(curMonth==6?"red":"#FFFFFF")%>" title="6�·�" onclick="doMonthClick(6)">6��</font></td>
   

    <td id=07 width="7%" class="Standard-title" valign="bottom" nowrap align="center">
    <font color="<%=(curMonth==7?"red":"#FFFFFF")%>" title="7�·�" onclick="doMonthClick(7)">7��</font></td>
 

   
    <td id=08 width="7%"  class="Standard-title" valign="bottom" nowrap align="center">
      <font color="<%=(curMonth==8?"red":"#FFFFFF")%>" title="8�·�" onclick="doMonthClick(8)">8��</font></td>
   

   
    <td id=09 width="7%" class="Standard-title"  valign="bottom" nowrap align="center">
    <font color="<%=(curMonth==9?"red":"#FFFFFF")%>" title="9�·�" onclick="doMonthClick(9)">9��</font></td>
  

 
    <td id=10 width="7%"  class="Standard-title" valign="bottom" nowrap align="center">
      <font color="<%=(curMonth==10?"red":"#FFFFFF")%>" title="10�·�" onclick="doMonthClick(10)">10��</font></td>
    
   
    <td id=11 width="7%"  class="Standard-title" valign="bottom" nowrap align="center">
    <font color="<%=(curMonth==11?"red":"#FFFFFF")%>" title="11�·�" onclick="doMonthClick(11)">11��</font></td>
   

  
    <td id=12 width="7%"  class="Standard-title" valign="bottom" nowrap align="center">
      <font color="<%=(curMonth==12?"red":"#FFFFFF")%>" title="12�·�" onclick="doMonthClick(12)">12��</font></td>
   

    
    <td width="7%"  class="Standard-title" valign="bottom" nowrap align="center">
      <font color="#FFFFFF" title="��һ���" onclick="doYearClick(true)"><%=curYear+1%>��</font></td>
    

  </tr></table>
	      </td>


    
 
    
    
    
    
    <tr>
      <td class="text">
      
	<% 
	int i =0;
	int colPerRow = 7; //ÿ����ʾ������
	int j = 0; // ����ÿ����ʾ
	int weekDay = Integer.parseInt(base.util.TalentContext.getValue(pageContext,null,"input/WeekDay")); //����1�ŵ�����
	
	%>





	<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" style="cursor:hand">
	<tr class="td3" align="center"><td>��</td><td>һ</td><td>��</td><td>��</td><td>��</td><td>��</td><td>��</td></tr>	
	  <tr class="td3">
	   <% //��������
	   for(int x=0; x<weekDay; x++){%>
					<TD class="td3">&nbsp;</TD>
				<%j++;}%>
	
	<logic:iterate iterateId="date" property="list[@type='Date']">
		     <%i++;
		     if(j%colPerRow==0){%>
		     	<tr class="td3">
		     <%}%>
		      
				<!--���ÿ�����ڵ�һ��-->
	 			<TD>
				<TABLE BORDER=0 align=right width='100%'  cellpadding="0" cellspacing="0" >
					<TR  class="td3">	 
				
				<!--���ҵ�Ԫ-->


				<TD  align="center"  onmouseover='doMsg(this)' onmouseout='doHidePane()' onclick='doDateClick(this)'  class="
				<logic:equal id="date" property="ENTITY/UsingType" value="1">state_empty</logic:equal><logic:equal id="date" property="ENTITY/UsingType" value="2">state_school</logic:equal><logic:equal id="date" property="ENTITY/UsingType" value="3">state_other</logic:equal>
				<logic:equal id="date" property="ENTITY/UsingType" value="4">state_book</logic:equal>
				" >
				<input type='hidden' value='��������<bean:write property="Room/RoomName"/>'/>
				<input type='hidden' value='<bean:write id="date" property="ENTITY/Date"/>'/>

								<b><%=i %></b>


				</TD>
					</TR>
				</TABLE>
			</TD>
	
				<% 
				j++;
				//�����β
				if(j%colPerRow==0){%>
					</TR>
				<%} %>

	</logic:iterate>
	
	     <%
	     
	      //������β
			j = j%colPerRow;
			if(j<colPerRow&&j!=0){
				for(int x=j; x<colPerRow; x++){%>
					<TD class="td3">&nbsp;</TD>
				<%}%>
				</tr>
			<%}%>
			</table>
		
		  </td>
      </tr>
      <tr>
        <td class="text">&nbsp;</td>
      </tr>
    </table>    </td>
  </tr>
</table>  
  </form>
  <div id="msgpane" style="display:none;position:absolute;z-index:100;font-size:9pt;border:1px inset #000000;background-color:#FAFAD2">
</div>
  <script>
	function doMsg(obj){
		var msgpane = document.all.msgpane;
		var msg = obj.children[0].value;
		msgpane.innerHTML = msg;
		msgpane.style.display = "";
		msgpane.style.top = event.y+document.body.scrollTop ;
		msgpane.style.left = event.x+document.body.scrollLeft;
	}

	function doHidePane(){
		var msgpane = document.all.msgpane;
		msgpane.style.display = "none";
	}

	function doMonthClick(id){
		var frm = document.opeForm;
		var RoomID = frm.RoomID.value;
		var CurrDate = frm.CurrDate.value;
		var dateArray = CurrDate.split("-");
		dateArray[1] = id;
		dateStr = "";
		for(i=0;i<dateArray.length;i++){
			dateStr +=dateArray[i]+"-";
		}
		dateStr = dateStr.substring(0,dateStr.length-1);
       
        var frameb = window.parent["bottomFrame"];
		
		frameb.location.href = "ICCard.prField.guestRoom4Month.do?input/RoomID="+RoomID+"&input/CurrDate="+dateStr;
	}

	function doYearClick(mode){
		var frm = document.opeForm;
		var RoomID = frm.RoomID.value;
		var CurrDate = frm.CurrDate.value;
		var dateArray = CurrDate.split("-");
		if(mode){
			dateArray[0]++;
		}else{
			dateArray[0]--;
		}

		dateStr = "";
		for(i=0;i<dateArray.length;i++){
			dateStr +=dateArray[i]+"-";
		}
		dateStr = dateStr.substring(0,dateStr.length-1);
		
        var frameb = window.parent["bottomFrame"];
		
		frameb.location.href = "ICCard.prField.guestRoom4Month.do?input/RoomID="+RoomID+"&input/CurrDate="+dateStr;
	}

	var gSelectedTD = null;
	function doDateClick(obj){
		if (gSelectedTD!=null){
			gSelectedTD.background = "";
		}else{
			if(typeof(document.all.initTD)!="undefined"){
				document.all.initTD.background = "image/state_selected.gif";
			}
		}
		gSelectedTD = obj;
		obj.background = "image/state_selected.gif";
		var CurrDate = obj.children[1].value;
		var frm = document.opeForm;
		var RoomID = frm.RoomID.value;
		var frame = window.parent["topFrame"];
		var op = "<bean:write property="op"/>";
		frame.location.href = "ICCard.prField.guestRoom4Day.do?input/RoomID="+RoomID+"&op="+op+"&input/CurrDate="+CurrDate;
	}

  </script>
  