<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prThingsManage.infoList.do" name="opeForm">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prThingsManage.infoList.do">
		<input type="hidden" name="addaction" value="oa.prThingsManage.infoAdd.do">
		<input type="hidden" name="modifyaction" value="oa.prThingsManage.infoModify.do">
		<input type="hidden" name="deleteaction" value="oa.prThingsManage.infoDelete.do">
	
		<html:hidden property="COMM_COMMODITYINFO/_order/col1/field"/>
		<html:hidden property="COMM_COMMODITYINFO/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		
		<span style="display: none;" id="printTable">用品信息列表</span>
	  </td>
    </tr>
  </table>


<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
      
	  <tr>
            <td height="30" class="text">
            
            		<a title="品名，规格 ">关键字：</a>
				<html:text property="COMM_COMMODITYINFO/searchText" attributesText='class="input" size="20"'/>
				<html:hidden property="COMM_COMMODITYINFO/searchField" value="COMMNAME,SPECIA"/>
			    <input name="query" type="button" class="button_02" value="查 询" onClick="talentquery()">
                <qx:talentButton property="add" type="button" styleClass="button_02" value="新 增" onclick="talentadd()" operation="DX_OASYS_THINGSMANAGE_INFO.DX_OASYS_THINGSMANAGE_INFO_ADD" />
                <qx:talentButton property="add" type="button" styleClass="button_02" value="修 改" onclick="talentmodify()" operation="DX_OASYS_THINGSMANAGE_INFO.DX_OASYS_THINGSMANAGE_INFO_MODIFY" />
				<qx:talentButton property="delete" type="button" styleClass="button_02" value="设为无效" onclick="talentdelete()" operation="DX_OASYS_THINGSMANAGE_INFO.DX_OASYS_THINGSMANAGE_INFO_DEL" />             
                
                
                
                <!--
				<input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
				-->
				
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text" >
		<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="3%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                  <td width="30%" align="center" nowrap id="COMM_COMMODITYINFO.COMMNAME" onClick="talentsort()">品名</td>
                  <td width="12%" align="center" nowrap id="COMM_COMMODITYINFO.TYPEID" onClick="talentsort()">类别</td>
                  <td width="10%" align="center" nowrap id="COMM_COMMODITYINFO.SPECIA" onClick="talentsort()">规格</td>
                  <td width="5%" align="center" nowrap id="COMM_COMMODITYINFO.UNITID" onClick="talentsort()">单位</td>
                  <td width="10%" align="center" nowrap id="COMM_COMMODITYINFO.PRICE" onClick="talentsort()">单价（元)</td>
                  <td width="8%" align="center" nowrap id="COMM_COMMODITYINFO.STORAGE" onClick="talentsort()">库存</td>
                  <td width="10%" align="center" nowrap id="COMM_COMMODITYINFO.PRICE" onClick="talentsort()">是否有效</td>
                  <td width="*" align="center" nowrap id="COMM_COMMODITYINFO.REMARK" onClick="talentsort()">备 注</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='COMM_COMMODITYINFO']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)">  
                <td align="center"> 
					<logic:present  id="resultset" property="COMM_COMMODITYINFO/COMMID"> 
                  		<html:checkbox id="resultset" name="list[@name='update']/COMM_COMMODITYINFO/COMMID" property="COMM_COMMODITYINFO/COMMID" indexed="true"/> 
                  	</logic:present> 
				</td>
               
                <td nowrap ><bean:write id="resultset" property="COMM_COMMODITYINFO/COMMNAME"/></td>
                <td nowrap ><bean:write id="resultset" property="COMM_COMMODITYINFO/TYPENAME"/></td>
                <td nowrap ><bean:write id="resultset" property="COMM_COMMODITYINFO/SPECIA"/></td>
                <td nowrap ><dict:write id="resultset" businTypeId="dx_unit" property="COMM_COMMODITYINFO/UNITID"/></td>
                <td nowrap ><bean:write id="resultset" property="COMM_COMMODITYINFO/PRICE" language="zh" country="CN"/></td>
                <td nowrap ><bean:write id="resultset" property="COMM_COMMODITYINFO/STORAGE"/></td>
                <td nowrap ><logic:equal  id="resultset" property="COMM_COMMODITYINFO/ENABLE" value="0" >否</logic:equal>
                <logic:equal  id="resultset" property="COMM_COMMODITYINFO/ENABLE" value="1" >是</logic:equal>
                </td>
                <td nowrap ><bean:write id="resultset" property="COMM_COMMODITYINFO/REMARK" /></td>
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
<input type="hidden" name="title" value="用品信息列表">
<input type="hidden" name="xmlfcc">
</form>
</body>
<script>
	loadOrderImg(document.forms[0],'COMM_COMMODITYINFO');
</script>