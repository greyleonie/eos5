<%@include file="/internet/common.jsp"%>
<title>选择住宿地点</title>

<body>
<form name="teachForm">

  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="100%" height="6"  border="0" cellpadding="0" cellspacing="0">
      <tr class="td2">
        <td> 选择住宿地点</td>
      </tr>
    </table> 
       <table width="400"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
       <html:hidden property="flag"/>
        <%int i=0; %>
      <logic:iterate id="resultSet" property="list[@type='Building']">              
        <%if(i==0){ %>
          <tr class="td1" >             
            <td align="left">        
        <% }%>
           <input type="checkbox"  name="chk" value='<bean:write id="resultSet" property="Building/BuildingID"/>'>   
             <html:hidden id="resultSet" property="Building/BuildingName"/>
             <bean:write id="resultSet" property="Building/BuildingName"/>     
             <% i++; %>       
         
        <%                   
         if(i==4){ %>
           </td>         
           </tr>
          <%
            i=0;
           }         
          %>  
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