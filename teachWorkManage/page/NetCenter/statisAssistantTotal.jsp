<%@include file="/internet/common.jsp"%>
<logic:notEqual property="Msg" value="">
<script>
alert("<bean:write property="Msg"/>");
</script>
</logic:notEqual>
<body>
<form method="post" action="teachWorkManage.prNetCenter.statisAssistantTotal.do" name="opeForm">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;�������Ľ�ѧ����&gt;��ѧ��������</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="teachWorkManage.prNetCenter.statisAssistantTotal.do">
		
		<html:hidden property="CenterTask/_order/col1/field"/>
		<html:hidden property="CenterTask/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
	  </td>
    </tr>
  </table>


<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
	  <tr>
            <td height="30" class="text">
            ���ڣ� ��
            	<html:text property="input/BeginTime" attributesText='class="input" size="10"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["input/BeginTime"],"yyyy-MM-dd")> 
           		��
           		<html:text property="input/EndTime" attributesText='class="input" size="10"' readonly="true"/>
          	    <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["input/EndTime"],"yyyy-MM-dd")>
			    

                <input name="query" type="button" class="button_02" value="�� ��" onClick="statistotal()">  
                <input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">&nbsp;&nbsp;&nbsp;&nbsp;
				<input name="add" type="button" class="button_02" value="�� ϸ" onClick="statisdetail()">			
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
        <tr>
        <td class="td1" align="center"><span id="printTable"><b>��ѧ�������ܱ�</b></span> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="50%" align="center"  nowrap id="TaskCount.Task" onClick="talentsort()">��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
                  <td width="50%" align="center"  nowrap id="TaskCount.TaskCount" onClick="talentsort()">��������</td>

                </tr>
				<%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
				<logic:iterate id="resultset" property="list[@type='TaskCount']">
					<%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
                <tr class="<%=trClass%>" onClick="changeTRBgColor(this)"> 
                  <td align="center" ><bean:write id="resultset" property="TaskCount/Task"/></td>
                  <td align="center" ><bean:write id="resultset" property="TaskCount/TaskCount"/></td>
                </tr>
				</logic:iterate>
                
              </table>
          
		  
		  </td>
      </tr>
      <tr>
        <td class="text">&nbsp;</td>
      </tr>
    </table>    </td>
  </tr>
</table>
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>

<script>
	loadOrderImg(document.forms[0],'Teacher');
</script>
<script>
function statisdetail(){
 	var frm = document.forms[0];
	var BeginTime = frm["input/BeginTime"].value;
	var EndTime = frm["input/EndTime"].value;
	window.location.href="teachWorkManage.prNetCenter.statisAssistantDetail.do?input/BeginTime="+BeginTime+"&input/EndTime="+EndTime;

}

function statistotal(){

 	var frm = document.forms[0];
	var BeginTime = frm["input/BeginTime"].value;
	var EndTime = frm["input/EndTime"].value;
	if(BeginTime==""||EndTime ==""){
		alert("ʱ�䲻��Ϊ��");
		return ;
	}
	window.location.href="teachWorkManage.prNetCenter.statisAssistantTotal.do?input/BeginTime="+BeginTime+"&input/EndTime="+EndTime;

}

</script>