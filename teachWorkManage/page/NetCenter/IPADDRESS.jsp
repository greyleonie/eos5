<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="" name="opeForm">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;网络中心教学管理—&gt;<span id="printTable">查询IP地址</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
      	<input type="hidden" name="queryaction" value="teachWorkManage.prNetCenter.selectIpAddressList.do">
      	<input type="hidden" name="addaction" value="teachWorkManage.prNetCenter.IpAddressAdd.do">
      	<input type="hidden" name="modifyaction" value="teachWorkManage.prNetCenter.IpAddressModify.do">
      	<input type="hidden" name="deleteaction" value="teachWorkManage.prNetCenter.IpAddressDelete.do">
		<html:hidden property="IPADDRESS/_order/col1/field"/>
		<html:hidden property="IPADDRESS/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
	  </td>
    </tr>
  </table>


<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td>
    	<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
	  <tr>
            <td height="30" class="text">
            
            姓名：
                <html:text property="IPADDRESS/USERNAME/criteria/value" attributesText='class="input" size="20"'/>
                <html:hidden property="IPADDRESS/USERNAME/criteria/operator" value="like"/>
                <html:hidden property="IPADDRESS/USERNAME/criteria/likeRule" value="center"/>
      IP地址： 
                <html:text property="IPADDRESS/IPADDRESS/criteria/value" attributesText='class="input" size="20"'/>
                <html:hidden property="IPADDRESS/IPADDRESS/criteria/operator" value="like"/>
                <html:hidden property="IPADDRESS/IPADDRESS/criteria/likeRule" value="center"/>
            
      Mac地址： 
                <html:text property="IPADDRESS/MACADDRESS/criteria/value" attributesText='class="input" size="20"'/>
                <html:hidden property="IPADDRESS/MACADDRESS/criteria/operator" value="like"/>
                <html:hidden property="IPADDRESS/MACADDRESS/criteria/likeRule" value="center"/>
				
			 
                <input name="query" type="button" class="button_02" value="查 询" onClick="talentquery()">
                <qx:talentButton property="add" type="button" styleClass="button_02" value="新 增" onclick="talentaddNew()" operation="DX_TEACH_MANAGE_NETCENTER_DT.DX_TEACH_MANAGE_NETCENTER_DT_ADD"/>
                <qx:talentButton property="modify" type="button" styleClass="button_02" value="修 改" onclick="talentmodify()" operation="DX_TEACH_MANAGE_NETCENTER_DT.DX_TEACH_MANAGE_NETCENTER_DT_MODIFY"/>
                <qx:talentButton property="delete" type="button" styleClass="button_02" value="删 除" onclick="talentdelete()" operation="DX_TEACH_MANAGE_NETCENTER_DT.DX_TEACH_MANAGE_NETCENTER_DT_DELETE"/>
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="3%" align="center"  nowrap> 
                  	<input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" >
                  </td>
                  <td width="10%" align="center"  nowrap id="IPADDRESS.USERNAME" onClick="talentsort()">姓名</td>
                  <td width="7%" align="center"  nowrap id="IPADDRESS.DEPARTMENT" onClick="talentsort()">部门</td>
                  <td width="5%" align="center"  nowrap id="IPADDRESS.COMPUTERNAME" onClick="talentsort()">计算机名</td>
                  <td width="10%" align="center"  nowrap id="IPADDRESS.MACADDRESS" onClick="talentsort()">mac地址</td>
                  <td width="20%" align="center"  nowrap id="IPADDRESS.IPADDRESS" onClick="talentsort()">IP地址</td>
                  <td width="10%"  align="center"  nowrap id="IPADDRESS.EQUIPMENTADDRESS" onClick="talentsort()">设备位置</td>
                  <td width="10%"  align="center"  nowrap id="IPADDRESS.EQUIPMENTTYPE" onClick="talentsort()">设备类型</td>
                </tr>
				<%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
				<logic:iterate id="resultset" property="list[@type='IPADDRESS']">
					<%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
                <tr class="<%=trClass%>" onClick="changeTRBgColor(this)"> 
                  <td align="center">
                  	<logic:present  id="resultset" property="IPADDRESS/ID">
			        	<html:checkbox id="resultset" name="list[@name='update']/IPADDRESS/ID" property="IPADDRESS/ID" indexed="true"/>
			        </logic:present></td>
				  <td align="center">
				  	<bean:write id="resultset" property="IPADDRESS/USERNAME" />
				  </td>
				  <td align="center">
				  	<bean:write id="resultset" property="IPADDRESS/DEPARTMENT" />
				  </td>
                 <td align="center">
				  	<bean:write id="resultset" property="IPADDRESS/COMPUTERNAME" />
				  </td>
				  <td align="center">
				  	<bean:write id="resultset" property="IPADDRESS/MACADDRESS" />
				  </td>
				  <td align="center">
				  	<bean:write id="resultset" property="IPADDRESS/IPADDRESS" />
				  </td>
				  <td align="center">
				  	<bean:write id="resultset" property="IPADDRESS/EQUIPMENTADDRESS" />
				  </td>
				  <td align="center">
				  	<bean:write id="resultset" property="IPADDRESS/EQUIPMENTTYPE" />
				  </td>
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
function talentaddNew() {
	var frm = document.forms[0];
	frm.action = frm.elements["addaction"].value ;
   	frm.submit();

}
</script>