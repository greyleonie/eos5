<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prAssetsManage.vindicatorList.do" name="opeForm">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
 			<td class="text_wirte">首页—&gt;办公系统—&gt;资产管理—&gt;<span id="printTable">售后服务商信息列表</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prAssetsManage.vindicatorList.do">
		<input type="hidden" name="addaction" value="oa.prAssetsManage.vindicatorAdd.do">
		<input type="hidden" name="modifyaction" value="oa.prAssetsManage.vindicatorModify.do">
		<input type="hidden" name="deleteaction" value="oa.prAssetsManage.vindicatorDelete.do">
		<input type="hidden" name="viewaction" value="oa.prAssetsManage.vindicatorView.do">
	
		<html:hidden property="CAPT_VINDICATOR/_order/col1/field"/>
		<html:hidden property="CAPT_VINDICATOR/_order/col1/asc" />
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
				<a title="售后服务商名称，联系人，联系电话，E-mail">关键字： </a>
			    <html:text property="CAPT_VINDICATOR/searchText" attributesText='class="input"'/>

				<input name="delete" type="button" class="button_02" value="查 询" onClick="talentquery()">
				<qx:talentButton property="add" type="button" styleClass="button_02" value="新 增" onclick="talentadd()" operation="DX_OASYS_ASSETSMANAGE_VINDICATOR.DX_OASYS_ASSETSMANAGE_VINDICATOR_ADD" />
				<qx:talentButton property="modify" type="button" styleClass="button_02" value="修 改" onclick="talentmodify()" operation="DX_OASYS_ASSETSMANAGE_VINDICATOR.DX_OASYS_ASSETSMANAGE_VINDICATOR_MODIFY" />
				<qx:talentButton property="delete" type="button" styleClass="button_02" value="删 除" onclick="talentdelete()" operation="DX_OASYS_ASSETSMANAGE_VINDICATOR.DX_OASYS_ASSETSMANAGE_VINDICATOR_DEL" />
              	<input name="delete" type="button" class="button_02" value="查 看" onClick="talentview()">
				<input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
				服务端排序：<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""> 
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text" >
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="3%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                  <td width="10%" align="center" nowrap id="CAPT_VINDICATOR.VINDNAME" onClick="talentsort()">售后服务商名称</td>
                  <td width="20%" align="center" nowrap id="CAPT_VINDICATOR.LINKMAN" onClick="talentsort()">联系人</td>
                  <td width="20%" align="center" nowrap id="CAPT_VINDICATOR.TEL" onClick="talentsort()">联系电话</td>
                  <td width="10%" align="center" nowrap id="CAPT_VINDICATOR.E_MAIL" onClick="talentsort()">E-mail</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='CAPT_VINDICATOR']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)">  
                <td align="center"> 
					<logic:present  id="resultset" property="CAPT_VINDICATOR/VINDCODE"> 
                  		<html:checkbox id="resultset" name="list[@name='update']/CAPT_VINDICATOR/VINDCODE" property="CAPT_VINDICATOR/VINDCODE" indexed="true"/> 
                  	</logic:present> 
				</td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="CAPT_VINDICATOR/VINDNAME"/></td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="CAPT_VINDICATOR/LINKMAN"/></td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="CAPT_VINDICATOR/TEL"/></td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="CAPT_VINDICATOR/E_MAIL"/></td>
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
<input type="hidden" name="title" value="售后服务商信息列表">
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
<script>
	loadOrderImg(document.forms[0],'CAPT_VINDICATOR');
</script>