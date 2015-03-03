<%@include file="/internet/common.jsp"%>
<title>选择教学模式</title>
<script>
var msg='<bean:write property="msg"/>';
if(msg!=""){
   alert(msg);
   window.close();
}
</script>
<body>
<form name="resultForm" method="post" action="">

  <table width="100%"  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" id="beforefixtable1">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte"> 选择教学模式</td> 
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr id="beforefixtable2">
      <td height="8">
      <html:hidden property="selectedIds"/>
      <html:hidden property="notSelectedIds"/>
       </td>
    </tr>
    <tr>
      <td class="text">        
      
      <table width="90%"  border="0" align="center" cellpadding="0" cellspacing="1" >
      <%int i=0;%>
	   <logic:iterate id="educateResult" property="list[@type='EducatingMode']">
	     <%if(i==0){%>
	      <tr align="center" >
		   <%}
		  String isExecute=base.util.TalentContext.getValue(pageContext,"educateResult","EducatingMode/IsExecute");
		System.out.println("======isExecute:"+isExecute);
		  String selected="";
		  if(isExecute!=null&&isExecute.equals("1")){
		     selected="checked='true'";
		  }
		   %>
            <td width="2%"  align="left" class="text">
            <input type="checkbox" name="chk"  <%=selected %>  value='<bean:write id="educateResult" property="EducatingMode/EducatingModeID"/>'>
            <bean:write id="educateResult" property="EducatingMode/EducatingMode"/>
           </td>
           
        <%
        selected="";
         i++;
        if(i==3){%>
		 </tr>
		  <%
		    i=0;
		  }
		
		  %>
	  </logic:iterate> 
        </table>
             <table width="90%" height="30"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td align="center">
          <input name="Submit" type="button" class="button_02" onClick="arangeIds(document.resultForm)" value="保 存">
          <input name="Submit" type="button" class="button_02" value="关 闭" onclick="window.close()">
          </td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
</form>
</body>


<script language="javascript">


function arangeIds(form) {
	
		var eles = form.elements;
		var i=0;
	    var selectedIds="";	       
		var notSelectedIds="";
		
		while(i<eles.length){
			var obj= eles[i];
			if(obj.type == "checkbox"){
				if(obj.checked){
				  if(selectedIds==""){
				    selectedIds=obj.value;
				  }else{
				     selectedIds+=","+obj.value;
				  }
			     }else{
			        if(notSelectedIds==""){
				    notSelectedIds=obj.value;
				  }else{
				     notSelectedIds+=","+obj.value;
				  }
			     }
			}
			i++
		}//while		
	//alert("selectedIds:"+selectedIds+"  notSelectedIds:"+notSelectedIds);
	form.elements["selectedIds"].value=selectedIds;
	form.elements["notSelectedIds"].value=notSelectedIds;
	form.action="teachWorkManage.prMakeTeachPlan.updateEducationModal.do";
	form.submit();
}

</script>