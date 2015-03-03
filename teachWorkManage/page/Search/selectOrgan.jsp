<%@include file="/internet/common.jsp"%>
<title>选择参训单位</title>

<body>
<form>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="100%" height="6"  border="0" cellpadding="0" cellspacing="0">
      <tr class="td_title">
        <td align="center">选择参训单位</td>
      </tr>
    </table> 
       <table width="350"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
       <%int i=0; %>
          <logic:iterate id="organSet" property="list[@type='Organ']">
           <logic:equal id="organSet"  property="Organ/types"  value="1">
        <tr class="td5">
          <td width="100%" align="left" colspan="2">&nbsp; <bean:write id="organSet" property="Organ/unitname"/></td>
          </tr>
        <%i=0; %>
            </logic:equal>
          <logic:equal id="organSet"  id="organSet"  property="Organ/types"  value="0" >          
             <% i++; %>   
           <tr class="td1" onClick="changeTRBgColor(this)" ondblclick="onDClick(this)"> 
           
           <td align="center"><%=i %><input type="hidden"  value='<bean:write id="organSet" property="Organ/unitname"/>'/></td>
           <td><bean:write id="organSet" property="Organ/unitname"/></td>
           </logic:equal>
       </logic:iterate>           
   
    
      </table>      
      <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td align="center">
          <input name="Submit" type="button" class="button_02" value="关 闭" onclick="window.close()">
                    <p><font color="#C0C0C0"><b>说明：</b></font></p>
		  <p><font color="#C0C0C0">双击鼠标选定参训单位</font></p>
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