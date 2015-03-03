<%@include file="/internet/common.jsp"%>
<title>选择教师</title>

<body>
<form name="teachForm">
<input type="hidden" name="dataEntity/_order/col1/field" value="me">
<input type="hidden" name="dataEntity/_order/col1/asc" value="ASC">
<input type="hidden" name="PageCond/begin" value="0">
<input type="hidden" name="PageCond/count" value="65">
<input type="hidden" name="PageCond/length" value="20">
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="100%" height="6"  border="0" cellpadding="0" cellspacing="0">
      <tr class="td2">
        <td>选择教师 </td>
      </tr>
    </table> 
       <table width="700"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
   <html:hidden property="flag"/>
      <logic:iterate id="resultSet" property="list[@type='org']">
        <tr class="td2" onClick="">
          <td width="100%" align="left">&nbsp; <bean:write id="resultSet" property="EOSORG_T_Organization/orgName"/></td>
          </tr>
        <%int i=0; %>
          <logic:iterate id="list" property="list1">
        <%if(i==0){ %>
          <logic:equal id="list" value="EOSORG_T_Organization/orgID" valueType="variable" valueId="resultSet" property="Teacher/DepartmentID" >          
            <tr class="td1" onClick="changeTRBgColor(this)">             
            <td align="left">
          </logic:equal>
        <% }%>
         <logic:equal id="list" value="EOSORG_T_Organization/orgID" valueType="variable" valueId="resultSet" property="Teacher/DepartmentID" >          
           <input type="checkbox" name="chk" value='<bean:write id="list" property="Teacher/TeacherID"/>'>   
             <html:hidden id="list" property="Teacher/name"/>
             <bean:write id="list" property="Teacher/name"/>     
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
		var ids="";
		var names="";	
		var array=new Array(2);

	while(i<eles.length){
			var obj= eles[i];
			if(obj.type == "checkbox" && !obj.disabled && obj.getAttribute("marked")==null){
				if(obj.checked){
				if(ids==""){
				   ids=obj.value;
				}else{
				   ids+=","+obj.value;
				}
				  
				   
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