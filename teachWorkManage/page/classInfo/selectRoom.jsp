<%@include file="/internet/common.jsp"%>
<title>
<logic:equal property="roomTypeID" value="1">选择教室</logic:equal>
<logic:equal property="roomTypeID" value="2">选择房间</logic:equal>
</title>

<body>
<form name="teachForm">

  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="100%" height="6"  border="0" cellpadding="0" cellspacing="0">
      <tr class="td2">
        <td>
        <logic:equal property="roomTypeID" value="1">选择教室</logic:equal>
        <logic:equal property="roomTypeID" value="2">选择房间</logic:equal></td>
      </tr>
    </table> 
       <table width="700"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
   <html:hidden property="flag"/>
      <logic:iterate id="resultSet" property="list[@type='Building']">
        <tr class="td2" onClick="">
          <td width="100%" align="left">&nbsp; <font color="red"><b><bean:write id="resultSet" property="Building/BuildingName"/></b></font></td>
          </tr>
        <%int i=0; %>
          <logic:iterate id="list" property="list[@type='Room']">
        <%if(i==0){ %>
          <logic:equal id="list" value="Building/BuildingID" valueType="variable" valueId="resultSet" property="Room/BuildingID" >          
            <tr class="td1" >             
            <td align="left">
          </logic:equal>
        <% }%>
        <%String style="";%>
        <logic:in  propertyId="list" property="Room/RoomID" valueType="variable" value="roomIds"><%style="style='background-color: #FF0000'"; %></logic:in>
        <logic:equal id="list" value="Building/BuildingID" valueType="variable" valueId="resultSet" property="Room/BuildingID" >          
           <input type="checkbox" <%=style %> name="chk" value='<bean:write id="list" property="Room/RoomID"/>'>   
            <bean:write id="list" property="Room/RoomName"/>  <html:hidden id="list" property="Room/RoomName"/>    
             <% i++; %>       
          </logic:equal>
        <%                   
         if(i==10){ %>
           </td>         
           </tr>
          <%
            i=0;
           }         
          %>  
       </logic:iterate>           
       </logic:iterate>     
    
      </table>      
      <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td align="center">
          <input name="Submit" type="button" class="button_02" onClick="add()" value="确 定">
          <input name="Submit" type="button" class="button_02" value="关 闭" onclick="window.close()">
          </td>
        </tr>
      </table></td>
  </tr>
</table>
</form>
</body>
<script language="javascript">
 function add(){
   var frm=document.teachForm;  
   if(chechedCount(frm)<1){
       alert("至少必须选择一个！");
       return;
   }else{
    if(frm("flag").value=="0"&&chechedCount(frm)>1){
       alert("只能选择选择一个！");
       return;
    }else
     getChechedValue(frm);
   }
   
 }
 
 
function getChechedValue(form) {
	var eles = form.elements;
		var i=0;
		var ids=",";
		var names="";	
		var array=new Array(2);

	while(i<eles.length){
			var obj= eles[i];
			if(obj.type == "checkbox" && !obj.disabled && obj.getAttribute("marked")==null){
				if(obj.checked){
				   ids+=obj.value+",";
				   if(names==""){
				     names=eles[i+1].value;
				   }else{
				     names+=","+eles[i+1].value;
				   }
			     }			   
			}
			i++;
		}//while		
		array[0]=ids;
		array[1]=names;
		
		window.returnValue=array;	
		window.close();
}
</script>