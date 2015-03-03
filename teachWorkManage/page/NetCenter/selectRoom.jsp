<%@include file="/internet/common.jsp"%>
<title>选择班级</title>
<body>
<form name="classForm">

  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="100%" height="6"  border="0" cellpadding="0" cellspacing="0">
      <tr class="td2">
        <td align="center">选择课室（可多选）</td>
      </tr>
    </table> 
       <table   border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
		<%int i=0; %>
          <logic:iterate id="buildingresult" property="list[@type='Building']"> 
           <tr class="td1" onClick="changeTRBgColor(this)">
                <td nowrap colspan="5" align="center"><bean:write id="buildingresult" property="Building/BuildingName"/> </td></tr>
        <%i=0; %>
        <tr>
          <logic:iterate id="classroomresult" property="list[@type='ClassRoom']"> 
                	<logic:equal id="classroomresult" property="ClassRoom/BuildingID" value="Building/BuildingID" valueType="variable" valueId="buildingresult"> 
          <td class="td1">      
           <input type="checkbox" name="chk" value='<bean:write id="classroomresult" property="ClassRoom/RoomID"/>'>
           <html:hidden id="classroomresult" property="ClassRoom/RoomName"/> 
             <bean:write id="classroomresult" property="ClassRoom/RoomName"/>&nbsp;&nbsp;        
        <% i++;                
         if(i%5==0){ %>
           <tr>         
          <%}%>  
          </logic:equal>
       </logic:iterate>
       <% i =i%5; if(i!=0){ 
        for(int j=0;j<5-i;j++){ %>
       <td class="td1">&nbsp;</td>
       <%}}%>
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
   var frm=document.classForm;  
   if(chechedCount(frm)<1){
       alert("至少必须选择一个！");
       return;
   }else{
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