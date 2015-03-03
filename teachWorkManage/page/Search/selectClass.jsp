<%@include file="/internet/common.jsp"%>
<title>选择班级</title>

<body>
<form>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="100%" height="6"  border="0" cellpadding="0" cellspacing="0">
      <tr class="td_title">
        <td align="center">选择班级(请双击)</td>
      </tr>
    </table> 
       <table width="350"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
       <%int i=0; %>
          <logic:iterate id="classSet" property="list[@type='studentclass']">         
             <% i++; %>   
           <tr class="td1" onClick="changeTRBgColor(this)" ondblclick="onDClick(this)"> 
           <td align="center"><%=i %><input type="hidden"  value='<bean:write id="classSet" property="Class/ClassName"/>'/></td>
           <td><bean:write id="classSet" property="Class/ClassName"/></td>
       </logic:iterate>           
   
    
      </table>      
      <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td align="center">
          <input name="Submit" type="button" class="button_02" value="关 闭" onclick="window.close()"><br><br>
          </td>
        </tr>
      </table></td>
  </tr>
</table>
</form>
</body>
<script language="javascript">
 function add(){
   var frm=document.forms[0];  
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
function onDClick(thisObject){
	window.returnValue = thisObject.children[0].children[0].value;
	window.close();
	}
</script>