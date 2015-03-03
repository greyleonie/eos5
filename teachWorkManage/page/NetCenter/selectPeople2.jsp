<%@include file="/internet/common.jsp"%>
<title>选择班级</title>
<body>
<form method="post" name="opeForm" >
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="100%" height="6"  border="0" cellpadding="0" cellspacing="0">
      <tr class="td2">
        <td align="center" class="td_title">选择工作任务负责人</td>
      </tr>
    </table> 
       <table  width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
		 <tr >
		 <td width="20%" align="right" class="td2">负责人:</td>
		  <td  width="80%" align="left" class="td1"><html:select  property="Task/Director"  >
          	<html:option  value="">--请选择--</html:option>
              <html:options property="list[@type='Teacher']/Teacher/TeacherName" labelProperty="list[@type='Teacher']/Teacher/TeacherName"/>
             </html:select></td>
		 </tr>
		<tr  > 
		 <td align="right" class="td2">协助人:</td>
         		 <td class="td1" align="left">
         		 <%int i=0; %>
         		  <logic:iterate id="result" property="list[@type='Teacher']">       
         		  <input type="checkbox" name="chk" value='<bean:write id="result" property="Teacher/TeacherID"/>'>
      			<html:hidden id="result" property="Teacher/TeacherName"/> 
             	<bean:write id="result" property="Teacher/TeacherName"/>&nbsp;&nbsp;        
        <% i++;                
         if(i%5==0){ %>
           <br/>         
          <%}%>  
       </logic:iterate>
</td>           
		 </tr>
       <tr > 
		 <td align="right" class="td2">备 注:</td>
		  <td  align="left" class="td1"> <html:textarea property="Task/Remarks" cols="80" rows="5" style="width:100%"/></td>
		</tr>
      </table>      
      <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td align="center">
          <input name="Submit" type="button" class="button_02" value="保 存" onclick="add()">
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
   var frm=document.opeForm;

   var director = frm["Task/Director"].value;
   if(director==""||director==null){
       alert("请选择负责人！");
       return;
   }else{
     getValue(frm);
   }
}
 
 
function getValue(form) {
	var eles = form.elements;
		var i=0;
		var ids=",";
		var names="";	
		var array=new Array(4);

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
		var director = form["Task/Director"].value;
		var remarks = form["Task/Remarks"].value;		
		array[0]=ids;
		array[1]=names;
		array[2]=director;
		array[3]=remarks;
		window.returnValue=array;	
		window.close();
}
</script>