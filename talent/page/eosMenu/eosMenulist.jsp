<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="talent.prEosMenu.eosMenulist.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">系统管理—&gt;菜单管理—&gt;<bean:write property="TEOSMenu/parentName"/></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="talent.prEosMenu.eosMenulist.do">
		<input type="hidden" name="addaction" value="talent.prEosMenu.eosMenuAdd.do">
		<input type="hidden" name="modifyaction" value="">
		<input type="hidden" name="deleteaction" value="talent.prEosMenu.eosMenuDelete.do">
		<input type="hidden" name="viewaction" value="">
		<input type="hidden" name="modifytoSave" value="talent.prEosMenu.eosMenuModifySave.do">
		<html:hidden property="TEOSMenu/_order/col1/field"/>
		<html:hidden property="TEOSMenu/_order/col1/asc" />
		<html:hidden property="TEOSMenu/parentsID/criteria/value" />
		<html:hidden property="TEOSMenu/parentName" />
		<html:hidden property="TEOSMenu/parentLevel" />
		
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		
		<INPUT value="like" type="hidden" name="TEOSMenu/menuName/criteria/operator">
		<INPUT value="center" type="hidden" name="TEOSMenu/menuName/criteria/likeRule">
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
				<a title='关键字可以是"菜单名称"' id="keytitle">菜单名称</a>： 
			    <html:text property="TEOSMenu/menuName/criteria/value" attributesText='class="input"'/>
			    <input name="query" type="button" class="button_02" value="查 询" onClick="talentquery()">
				
                <input name="add" type="button" class="button_02" value="新 增" onClick="talentadd()">
              	<input name="delete" type="button" class="button_02" value="删 除" onClick="talentdelete()">
				<input name="modifyandsave" type="button" class="button_02" value="修改保存" onClick="modifySave('listdetail')">
				
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
                  <td width="3%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                  <td width="15%" align="center" nowrap id="TEOSMenu.menuName" onClick="talentsort()">菜单名称</td>
                  <td width="8%" align="center" nowrap id="TEOSMenu.displayOrder" onClick="talentsort()">显示顺序</td>
                  <td width="56%" align="center" nowrap id="TEOSMenu.menuAction" onClick="talentsort()">菜单链接地址</td>
				  <td width="18%" align="center" nowrap >菜单资源操作管理</td>
                  
                  
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='teosmenu']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="TEOSMenu/menuID"/>','false')">  
                <td align="center"> 
					<logic:present  id="resultset" property="TEOSMenu/menuID">
						
                  		
                  			<html:checkbox id="resultset" name="list[@name='update']/TEOSMenu/menuID" property="TEOSMenu/menuID" indexed="true" /> 
                  
                  	</logic:present> 
				</td>
                <td nowrap onClick="toEditable()">&nbsp;<bean:write id="resultset" property="TEOSMenu/menuName"/></td>
                
                  <td nowrap align="center" onClick="toEditable()"><bean:write id="resultset" property="TEOSMenu/displayOrder" /></td>
                <td nowrap onClick="toEditable()"><bean:write id="resultset" property="TEOSMenu/menuAction" /></td>
				<td align="center" nowrap ><a href="javascript:menuOperators('<bean:write id="resultset" property="TEOSMenu/menuID" />','<bean:write id="resultset" property="TEOSMenu/menuName" />','true')">资源操作管理</a></td>
                
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
	loadOrderImg(document.forms[0],'TEOSMenu');
</script>

<script>
function menuOperators(menuId,menuName,right) {
	var frm = document.forms[0];
	frm.action = "talent.prEosMenu.eosMenuOperatorList.do?SYSRESOPERATION/MENUID/criteria/value=" + menuId + "&SYSRESOPERATION/MENULABEL=" + menuName;
	if(right == "true") frm.submit();
	
}
</script>


