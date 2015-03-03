<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="talent.pr.userlist.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">系统管理—&gt;用户管理—&gt;<logic:equal property="sysTUser/operatorType/criteria/value" value="-1">EOS用户</logic:equal><logic:equal property="sysTUser/operatorType/criteria/value" value="1">教师用户</logic:equal><logic:equal property="sysTUser/operatorType/criteria/value" value="0">学员用户</logic:equal><logic:equal property="sysTUser/operatorType/criteria/value" value="2">宾客用户</logic:equal></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="talent.pr.userlist.do">
		<input type="hidden" name="addaction" value="talent.pr.useradd.do">
		<input type="hidden" name="modifyaction" value="talent.pr.usermodify.do">
		<input type="hidden" name="deleteaction" value="talent.pr.userdelete.do">
		<input type="hidden" name="viewaction" value="talent.pr.userview.do">
		<html:hidden property="sysTUser/_order/col1/field"/>
		<html:hidden property="sysTUser/_order/col1/asc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		<html:hidden property="sysTUser/operatorType/criteria/value" />
		<INPUT value="like" type="hidden" name="sysTUser/operatorName/criteria/operator">
		<INPUT value="center" type="hidden" name="sysTUser/operatorName/criteria/likeRule">
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
				<a title='关键字可以是"姓名"' id="keytitle">姓名</a>： 
			    <html:text property="sysTUser/operatorName/criteria/value" attributesText='class="input"'/>
			    <input name="query" type="button" class="button_02" value="查 询" onClick="talentquery()">
				<logic:equal property="sysTUser/operatorType/criteria/value" value="-1">
                <input name="add" type="button" class="button_02" value="新 增" onClick="talentadd()">
              	<input name="delete" type="button" class="button_02" value="删 除" onClick="talentdelete()">
				<input name="view" type="button" class="button_02" value="查 看" onClick="talentview()">
				</logic:equal>
				<input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
				服务端排序：<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""> 
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="8%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                  <td width="14%" align="center" nowrap id="sysTUser.userID" onClick="talentsort()">帐号</td>
                  <td width="16%" align="center" nowrap id="sysTUser.operatorName" onClick="talentsort()">姓名</td>
                  <td width="14%" align="center" nowrap id="sysTUser.status" onClick="talentsort()">用户状态</td>
                  <td width="15%" align="center" nowrap id="sysTUser.cardID" onClick="talentsort()">用户CARD</td>
                  <td width="14%" align="center" >用户权限</td>
                  <td width="19%" align="center" >修改</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='QUERYUSER']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="sysTUser/operatorID"/>','true')">  
                <td align="center"> 
					<logic:present  id="resultset" property="sysTUser/operatorID"> 
                  		<html:checkbox id="resultset" name="list[@name='update']/sysTUser/operatorID" property="sysTUser/operatorID" indexed="true"/> 
                  	</logic:present> 
				</td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="sysTUser/userID"/></td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="sysTUser/operatorName"/></td>
                <td nowrap>&nbsp;
					<logic:equal id="resultset" property="sysTUser/status" value="0">
					  不可用
					</logic:equal>
					<logic:equal id="resultset" property="sysTUser/status" value="1">
					  可用
					</logic:equal>
				</td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="sysTUser/cardID"/></td>
                <td align="center" nowrap><a href='talent.pr.userRightNew.do?usermark=<bean:write id="resultset" property="sysTUser/operatorID"/>&tempuserid=<bean:write id="resultset" property="sysTUser/userID"/>&mode=-1'><img src="/internet/image/QuanXian.gif" width="16" height="16" border="0" align="absmiddle"></a></td>
                <td align="center" nowrap><a href='talent.pr.usermodify.do?sysTUser/operatorID=<bean:write id="resultset" property="sysTUser/operatorID"/>&operatorType=<bean:write property="sysTUser/operatorType/criteria/value"/>'><img src="/internet/image/XiuGai.gif" width="16" height="16" border="0" align="absmiddle"></a></td>
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
	loadOrderImg(document.forms[0],'sysTUser');
</script>