<%@include file="/internet/common.jsp"%>
<body>
<form action="ICCard.prMsg.linkBook.do" name="form1" method="post">
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		<html:hidden property="isAdd" />
        <html:hidden property="sort"/>
        <html:hidden property="firstChar"/>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" class="text" align="right">
            <input name="B3" type="button" class="button_02" value="新 增" onclick="add()">
             <input name="B3" type="button" class="button_02" value="修 改" onclick="update()">
            <input name="B3" type="button" class="button_02" value="删 除" onclick="del()">           
     
                          </td>
        </tr>
      </table>      
        <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr align="center" class="td_title">
            <td width="7%">
          <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked="firstChk">
            </td>
            <td width="7%">姓名</td>
            <td width="10%">分组</td>
            <td width="6%">手机号码</td>
            <td width="10%">电子邮件<br></td>
            <td width="40%">备注</td>
           
          </tr>
          <logic:iterate id="resultSet" property="list[@type='TelBook']">
          <tr class="td2" >
          	  <td width="7%" align="center">
          	  <html:checkbox id="resultSet" name="list[@name='TelBook']/TelBook/TelBookID" property="TelBook/TelBookID" indexed="true"/></td>
            <td width="17%" align=""><bean:write id="resultSet" property="TelBook/UserName"/></td>
            <td width="18%" align=""><bean:write id="resultSet" property="TelBook/Sort"/></td>
            <td width="16%" align=""><bean:write id="resultSet" property="TelBook/MobileTel"/></td>
            <td width="15%" align=""><bean:write id="resultSet" property="TelBook/Email"/></td>
            <td width="30%" align=""><bean:write id="resultSet" property="TelBook/Remark"/></td>           
          </tr>
      </logic:iterate>
        </table>
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="30" class="text">
              <script>
				PageCond(document.forms[0]);
		     </script>
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
<script>
var frm=document.forms[0];

 function add(){
    frm.action="ICCard.prMsg.addLinkBook.do";
    frm.elements["isAdd"].value="1";
    frm.submit();
 }
 
 function update(){
    if(chechedCount(frm)<1){
    alert("至少必须选择一行！");
    		return ;
  }
  if(chechedCount(frm)>1){
    		alert("只能选择一行！");
    		return ;
  }
  
  frm.action="ICCard.prMsg.queryLinkBook.do";
  frm.submit();
 }
 
 function del(){
     if(chechedCount(frm)<1){
    alert("至少必须选择一行！");
    		return ;
  }
  if(chechedCount(frm)>1){
    		alert("只能选择一行！");
    		return ;
  }
  if(confirm("确实删除这些信息？")){
   frm.action="ICCard.prMsg.delLinkBook.do";
   frm.submit();
  }

 }
 
 
</script>