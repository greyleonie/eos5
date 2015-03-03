<%@include file="/internet/common.jsp"%>

<script>
var allletter = new Array('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');

function outputLetter() {
	var strValue = "";
	for(var l = 0; l < allletter.length; l++) {
		strValue += '<a href="#" onClick=setWithLetter("' + allletter[l] + '") id="'+ allletter[l] +'">' + allletter[l] + '</a>&nbsp;&nbsp;'
	}
	if(strValue!="") document.write(strValue);

}


</script>
<body>
<form method="post" action="oa.prPsAddressList.pubAddressList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">办公系统—&gt;个人办公—&gt;个人通讯录</td>
          </tr>
        </table></td>
    </tr>

    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prPsAddressList.pubAddressList.do">
		<input type="hidden" name="addaction" value="oa.prPsAddressList.pubAddressListAdd.do">
		<input type="hidden" name="modifyaction" value="oa.prPsAddressList.pubAddressListModify.do">
		<input type="hidden" name="deleteaction" value="oa.prPsAddressList.pubAddressListDelete.do">
		<input type="hidden" name="viewaction" value="oa.prPsAddressList.pubAddressListView.do">
		<input type="hidden" name="groupaction" value="oa.prPsAddressList.txlGroupList.do">
		
		<html:hidden property="AddressList/_order/col1/field"/>
		<html:hidden property="AddressList/_order/col1/desc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />

	  </td>
    </tr>
  </table>

<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="99%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
          <tr>
      <td width="100%" height="28" class="text">【<a href="#" onClick="selectGroup('-1')" id="-1">所有</a>】
      <logic:iterate id="resultset" property="list[@type='AddressListGroup']"> 
      【<a href="#" onClick="selectGroup('<bean:write id="resultset" property="AddressListGroup/GroupID"/>')" id='<bean:write id="resultset" property="AddressListGroup/GroupID"/>'><bean:write id="resultset" property="AddressListGroup/GroupName"/></a>】
      </logic:iterate>
      <html:hidden property="AddressList/SearchGroup" value=""/>
       &nbsp;<input name="B3" type="button" class="button_02" value="组别管理" onClick="groupManage()">
      </td>
	  </tr>
      <tr>
        <td height="8"> </td>
      </tr>
	  <tr>
	  	<td class="text">
	  	    <a title='根据姓名查询"' id="keytitle">姓 名:</a>： 
			<html:text property="AddressList/SearchName" attributesText='class="input" size="15"'/>
	  	    <input name="query" type="button" class="button_02" value="查 询" onClick="talentquery()">
			<input name="add" type="button" class="button_02" value="新 增" onClick="talentadd()">
			<input name="modify" type="button" class="button_02" value="修 改" onClick="talentmodify()">
			<input name="delete" type="button" class="button_02" value="删 除" onClick="talentdelete()">
            <input name="view" type="button" class="button_02" value="查 看" onClick="talentview()">
            <input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
			<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
		</td>
	  </tr>
	  <tr class="text"> 
		<td height="25">&nbsp;&nbsp;
		     <html:hidden property="AddressList/SearchFirstLetter" value=""/>
			<script>
				outputLetter();
			</script>
		</td>
	  </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="4%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                  <td width="9%" align="center" nowrap id="AddressList.CUSTOMER" onClick="talentsort()">姓名</td>
                  <td width="6%" align="center" nowrap id="AddressList.Sex" onClick="talentsort()">性别</td>
                  <td width="22%" align="center" nowrap id="AddressList.COMPANY" onClick="talentsort()">单位</td>
				<td width="12%" align="center" nowrap id="AddressList.DUTY" onClick="talentsort()">职务</td>
				<td width="12%" align="center" nowrap id="AddressList.Department" onClick="talentsort()">部门</td>
				<td width="11%" align="center" nowrap id="AddressList.PHONE1" onClick="talentsort()">单位电话</td>
				<td width="13%" align="center" nowrap id="AddressList.MOBILE" onClick="talentsort()">手机</td>
					<td width="11%" align="center" nowrap id="AddressList.QQID" onClick="talentsort()">QQ号</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='AddressList']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="AddressList/CARDID"/>','true')">  
                <td align="center"> 
					<logic:present  id="resultset" property="AddressList/CARDID"> 
                  		<html:checkbox id="resultset" name="list[@name='update']/AddressList/CARDID" property="AddressList/CARDID" indexed="true"/> 
                  	</logic:present> 
				</td>
				<td nowrap >&nbsp;<bean:write id="resultset" property="AddressList/CUSTOMER"/></td>
				<td nowrap align="center">
				 <logic:equal id="resultset" property="AddressList/Sex" value="0">女</logic:equal>
                 <logic:equal id="resultset" property="AddressList/Sex" value="1">男</logic:equal></td>
				<td nowrap >&nbsp;<bean:write id="resultset" property="AddressList/COMPANY"/></td>
				<td nowrap >&nbsp;<bean:write id="resultset" property="AddressList/DUTY"/></td>
				<td nowrap >&nbsp;<bean:write id="resultset" property="AddressList/Department"/></td>
				<td nowrap >&nbsp;<bean:write id="resultset" property="AddressList/PHONE1"/></td>
				<td nowrap >&nbsp;<bean:write id="resultset" property="AddressList/MOBILE"/></td>
				<td nowrap >&nbsp;<bean:write id="resultset" property="AddressList/QQID"/></td>
				
                
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
function groupManage(){
    var frm =document.forms[0];
	frm.action = frm.elements["groupaction"].value;
    frm.submit();
}

function selectGroup(obj){
	var frm =document.forms[0];
	frm.elements["AddressList/SearchGroup"].value = obj;
	frm.elements["AddressList/SearchName"].value = "";
	frm.elements["AddressList/SearchFirstLetter"].value = "";
	
	if(frm.elements["PageCond/begin"] && frm.elements["PageCond/count"] && frm.elements["PageCond/length"]) {
		frm.elements["PageCond/begin"].value=0;
		frm.elements["PageCond/count"].value=-1;
		if(frm.elements["PageCond/talentlength"]) {
			frm.elements["PageCond/length"].value = frm.elements["PageCond/talentlength"].value;
		}else{
			frm.elements["PageCond/length"].value=10;
		}
		if(frm.elements["queryaction"]) {
			frm.action = frm.elements["queryaction"].value;
		}
		event.srcElement.blur();
		frm.submit();
	}
}

function setWithLetter(obj){
	var frm =document.forms[0];
	frm.elements["AddressList/SearchFirstLetter"].value = obj;
	frm.elements["AddressList/SearchName"].value = "";
	frm.elements["AddressList/SearchGroup"].value = "";
	
	if(frm.elements["PageCond/begin"] && frm.elements["PageCond/count"] && frm.elements["PageCond/length"]) {
		frm.elements["PageCond/begin"].value=0;
		frm.elements["PageCond/count"].value=-1;
		if(frm.elements["PageCond/talentlength"]) {
			frm.elements["PageCond/length"].value = frm.elements["PageCond/talentlength"].value;
		}else{
			frm.elements["PageCond/length"].value=10;
		}
		if(frm.elements["queryaction"]) {
			frm.action = frm.elements["queryaction"].value;
		}
		event.srcElement.blur();
		frm.submit();
	}
}

var id;
var id1 = '<bean:write property="AddressList/SearchGroup"/>';
var id2 = '<bean:write property="AddressList/SearchFirstLetter"/>';
if(id1!="") id = id1;
if(id2!="") id = id2;
if(id!=null&&id!="")
  document.getElementById(id).style.color = "#ff0000";
</script>