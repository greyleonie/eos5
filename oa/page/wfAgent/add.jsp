<%@include file="/internet/common.jsp"%>

<body>
<form method="post"  action="oa.prwfAgent.saveAgent.do">
<html:hidden property="WFAgent/processDefID"/>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">�칫ϵͳ��&gt;ί�й���&gt;<logic:equal property="isAdd" value="1">����ί����Ϣ</logic:equal><logic:equal property="isAdd" value="2">�޸�ί����Ϣ</logic:equal></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">				
      <html:hidden property="WFAgent/_order/col1/field"/>
		<html:hidden property="WFAgent/_order/col1/asc" />	
		<html:hidden property="isAdd"/>
		<html:hidden property="WFAgent/agentID"/>
		 <html:hidden property="WFAgent/agentTo"/>
	  </td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">
	  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr> 
            <td width="12%" align="right" class="td2">ί�з�ʽ�� </td>
            <td colspan="3" class="td1">
            <html:radio name="WFAgent/flag" value="0" onclick="selectProcess(0)" checked="true"/> ȫ��ί��
            <html:radio name="WFAgent/flag" value="1" onclick="selectProcess(1)"/> ����ί��            </td>
          </tr>
          <tr id="processID" style="display: none;"> 
            <td width="12%" align="right" class="td2">ѡ�����̣�		    </td>
            <td colspan="3" class="td1">
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr  >
                  <td width="480"><table border="0" cellspacing="0" cellpadding="0">
              
			  <tr>
			  <%int i=0; %>
			 <logic:iterate property="list[@type='WFProcessDefine']" id="resultset">
                
					
					<SCRIPT>
						var temp='<td class="td1" width="100" nowrap><html:checkbox name="processDefID" property="WFProcessDefine/processDefID" id="resultset"  />';
						var tmp='<bean:write property="WFProcessDefine/processChName" id="resultset" />';
						if(tmp!='wfOMM')
							document.write(temp+tmp+'</td>');
					</SCRIPT>
									
				<%i++;
				if(i%4== 0){
				 %>
				 </tr>
              <tr  class="td1"  width="100" nowrap>
              <%} %>
             </logic:iterate>    
              </tr>
            </table></td>
                  <td class="td1" ><span class="text_red">*</span>(��ѡ��)</td>
                </tr>
              </table>
            </td>
          </tr>
            <tr> 
            <td width="12%" align="right" class="td2">��ί���ˣ� </td>
            <td colspan="3" class="td1">
            <html:text property="agent"/>           
             <input name="Button" type="button" class="button_02" value="ѡ ��" elname="WFAgent/agentTo,agent" onClick="selectSysUser('yes')">
            <span class="text_red">*</span>(��ѡ��)</td>
          </tr>
          <tr> 
          <logic:equal property="IsWt" value='1'>
            <td align="right" class="td2">��ʼʱ�䣺 </td>
            <td width="36%" class="td1">
<html:text name="WFAgent/startTime[@pattern='yyyy-MM-dd']" property="currentDate" readonly="true" attributesText='class="input" size="30"' /> 
              <img src="image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["WFAgent/startTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>              </td>
            <td width="12%" align="right" class="td2">����ʱ�䣺 </td>
            <td width="40%" class="td1">
           <html:text name="WFAgent/endTime[@pattern='yyyy-MM-dd']" property="endTime"  readonly="true" attributesText='class="input" size="30"' /> 
              <img src="image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["WFAgent/endTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
              <span class="text_red">*</span>(��ѡ��)</td>
              </logic:equal>
              <logic:notPresent property="IsWt">
              <td align="right" class="td2">��ʼʱ�䣺 </td>
            <td width="36%" class="td1">
<html:text name="WFAgent/startTime[@pattern='yyyy-MM-dd']" property="WFAgent/startTime" readonly="true" attributesText='class="input" size="30"' /> 
              <img src="image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["WFAgent/startTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>              </td>
            <td width="12%" align="right" class="td2">����ʱ�䣺 </td>
            <td width="40%" class="td1">
           <html:text name="WFAgent/endTime[@pattern='yyyy-MM-dd']" property="WFAgent/endTime"  readonly="true" attributesText='class="input" size="30"' /> 
              <img src="image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["WFAgent/endTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
              <span class="text_red">*</span>(��ѡ��)</td>     
              </logic:notPresent>
          </tr>
          <tr> 
            <td align="right" class="td2">ί��ԭ��</td>
            <td colspan="3" class="td1">
            <html:textarea  property="WFAgent/agentCause" attributesText='class="input" cols="90" rows="6"' />
            </tr>
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="�� ��" onClick="save()">
              <logic:equal property="IsWt" value='1'>
              <input name="Submit3" type="button" class="button_02" value="�� ��" onClick="window.close()">
              </logic:equal>
              <logic:notPresent property="IsWt">
              <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="history.go(-1)">
              </logic:notPresent>
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
</html>

<script>
init();
//validater��������
//�÷�:ValidateType="alphanumeric,email",Msg="��������ĸ����;�ʼ�"
//��֤������:url,postalcode,phone,money,int,notempty,email,numeric
//function validater(frmObj)
  function save() {
  	var frm = document.forms[0];
  	var flag = 0 ;
  	var   oj   =   document.getElementsByName("WFAgent/flag");   
    for(i=0;i<oj.length;i++){   
  		if(oj[i].checked)   
  			flag = oj[i].value;   
    }  
    if(flag == 0 ){
      	frm.elements["WFAgent/processDefID"].value = "0";
    } 
    else{
    	var   temp   =   document.getElementsByName("processDefID"); 
    	var count = 0;
    	var processDefIDs = "";
    	for(i=0;i<temp.length;i++){   
  			if(temp[i].checked)   {
  				if(count == 0 )
  					processDefIDs += temp[i].value;
  				else{
  					processDefIDs = processDefIDs + "," + temp[i].value;
  				}
				count++;
  			}   
    	}
    	if(count == 0 ){
    		alert("��ѡ����Ҫί��������");
  	  		return;
    	}
    	else
    		frm.elements["WFAgent/processDefID"].value = processDefIDs;
    } 
  	if(frm.elements["WFAgent/startTime[@pattern='yyyy-MM-dd']"].value==""||frm.elements["WFAgent/endTime[@pattern='yyyy-MM-dd']"].value==""){
  	    alert("��ʼ�ͽ���ʱ�䶼����Ϊ�գ�");
    	return;
  	}else if(frm.elements["WFAgent/startTime[@pattern='yyyy-MM-dd']"].value>frm.elements["WFAgent/endTime[@pattern='yyyy-MM-dd']"].value){
  	  alert("��ʼʱ�����С�ڽ���ʱ��");
  	  return;
  	}
  	if(frm.elements["WFAgent/agentCause"].value.length>512)
  	{
     	alert("ί��ԭ��ֻ���޶�512�����֣�");
    	return;
  	}
	 frm.submit();
  
  }
  
  function selectProcess(n){
  	if(n==0){
  		processID.style.display="none";
  	}
  	else
  		processID.style.display=""
  }
  
  
  function init(){
  	<logic:equal property="isAdd" value="2" >
  		var frm = document.forms[0];
		var processDefID = frm.elements["WFAgent/processDefID"].value;
		var   flagOj   =   document.getElementsByName("WFAgent/flag");   
   		var   processOj   =   document.getElementsByName("processDefID"); 
		if(processDefID == "0" ){
			for(i=0;i<flagOj.length;i++){   
  				if(flagOj[i].value == "0")   
  					flagOj[i].checked="checked" ;
   			}  
   			selectProcess(0);
		}
		else{
			for(i=0;i<flagOj.length;i++){   
  				if(flagOj[i].value == "1")  { 
  						flagOj[i].checked="checked" ;
  					}
   			}  
   			selectProcess(1);
   			var temp = processDefID.split(",");
   			for (i=0 ; i<temp.length;i++){
   				for(j=0;j<processOj.length;j++){
   					if(temp[i]==processOj[j].value){
   						processOj[j].checked="checked" ;
   						break;
   					}
   				}
   			}
		}
			
	
	
	</logic:equal>
  
  
  }
  </script>