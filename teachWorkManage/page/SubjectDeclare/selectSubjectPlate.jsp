<%@include file="/internet/common.jsp"%>
<title>选择课题板快</title>
<body>
<form name="classForm">

  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="100%" height="6"  border="0" cellpadding="0" cellspacing="0">
      <tr class="td2">
        <td align="center">选择课题板快（可多选）</td>
      </tr>
    </table> 
       <table   border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#A2C4DC">
        <%int i=0; %>
        <tr>
          <logic:iterate id="resultset" property="list[@type='SubjectPlate']">   
          <td class="td1">      
           <input type="checkbox" name="chk" value='<bean:write id="resultset" property="SubjectPlate/PlateID"/>'>
           <html:hidden id="resultset" property="SubjectPlate/PlateName"/> 
             <bean:write id="resultset" property="SubjectPlate/PlateName"/>&nbsp;&nbsp;        
        <% i++;                
         if(i%5==0){ %>
           <tr>         
          <%}%>  
       </logic:iterate>
       <%  i =i%5;if(i!=0){ 
        for(int j=0;j<5-i;j++){ %>
       <td class="td1">&nbsp;</td>
       <%}}%>
      </table>      
      <table width="100%" height="50"  border="0" cellpadding="0" cellspacing="0">
         <tr>
          <td align="center" height="30">&nbsp;</td>
        </tr>
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
		var ids="";
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