<%@include file="/internet/common.jsp"%>
<SCRIPT language="JavaScript" src="/internet/scripts/common.js" ></SCRIPT>
<body>
<form method="post" action="teachWorkManage.prBookManage.inventoryList.do" name="opeForm">
<table width="100%"  border="0" cellspacing="0" cellpadding="0" >
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;教材管理—&gt;<span  id="printTable">教材盘点列表</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="teachWorkManage.prBookManage.inventoryList.do">
		<input type="hidden" name="addaction" value="teachWorkManage.prBookManage.inventoryAdd.do">
		<input type="hidden" name="modifyaction" value="teachWorkManage.prBookManage.inventoryModify.do">
		<input type="hidden" name="deleteaction" value="teachWorkManage.prBookManage.inventoryDelete.do">
		<input type="hidden" name="viewaction" value="teachWorkManage.prBookManage.inventoryView.do">
		<html:hidden property="TextbookInventoryDetail/_order/col1/field"/>
		<html:hidden property="TextbookInventoryDetail/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
	  </td>
    </tr>
  </table>
  
  <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table" >
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">
    
	  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1"  >
          <tr> 
            <td  align="left" nowrap class="text">盘点时间：从
            	<html:text property="TextbookInventoryDetail/StockTime/criteria/min" attributesText='class="input" size="20"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["TextbookInventoryDetail/StockTime/criteria/min"],"yyyy-MM-dd")> 
           		到
           		<html:text property="TextbookInventoryDetail/StockTime/criteria/max" attributesText='class="input" size="20"' readonly="true"/>
          	    <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["TextbookInventoryDetail/StockTime/criteria/max"],"yyyy-MM-dd")>
			    <input type="hidden" name="TextbookInventoryDetail/StockTime/criteria/operator" value="between"/>
			    <input type="hidden" name="TextbookInventoryDetail/StockTime/criteria/criteriaPattern" value="yyyy-MM-dd"/>
			    服务端排序：<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""> 
			    <br/>
                <input name="query" type="button" class="button_02" value="查 询" onClick="talentquery()">
				<qx:talentButton property="add" type="button" styleClass="button_02" value="新 增" onclick="talentadd()" operation="DX_TEACH_MANAGE_BOOK_INVENTORY.DX_TEACH_MANAGE_BOOK_INVENTORY_ADD"/>
                <qx:talentButton property="modify" type="button" styleClass="button_02" value="修 改" onclick="talentmodify()" operation="DX_TEACH_MANAGE_BOOK_INVENTORY.DX_TEACH_MANAGE_BOOK_INVENTORY_MODIFY"/> 
              	<!--qx:talentButton property="delete" type="button" styleClass="button_02" value="删 除" onclick="talentdelete()" operation="DX_TEACH_MANAGE_BOOK_INVENTORY.DX_TEACH_MANAGE_BOOK_INVENTORY_DELETE"/-->
				<input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
				
			</td>
          </tr>
        </table></td></tr>
        
        <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">
        
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC"  id="listdetail" >
        
         <tr class="td_title" height="10"> 
                  <td width="3%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""></td>
                  <td width="20%" align="center" nowrap id="TextbookInventoryDetail.Title" onClick="talentsort()">书 名</td>
                  <td width="15%" align="center" nowrap id="TextbookInventoryDetail.Author" onClick="talentsort()">作 者</td>
                  <td width="15%" align="center" nowrap id="TextbookInventoryDetail.Publisher" onClick="talentsort()">出版社</td>
                  <td width="5%" align="center" nowrap id="TextbookInventoryDetail.TextbookType" onClick="talentsort()">类 型</td>
                   <td width="12%" align="center" nowrap id="TextbookInventoryDetail.StockTime" onClick="talentsort()">盘点时间</td>
                   <td width="5%" align="center" nowrap >期初<br/>结存</td>
                  <td width="5%" align="center" nowrap >帐面<br/>库存</td>
                  
                  <td width="5%" align="center" nowrap id="TextbookInventoryDetail.StockNum" onClick="talentsort()">盘点<br/>库存</td>
                 <td width="5%" align="center" nowrap >差额</td>
                  <td width="15%" align="center" nowrap id="TextbookInventoryDetail.Remarks" onClick="talentsort()">备 注</td>
                </tr>
            
                 <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='inventorydetail']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)">  
                <td align="center"> 
					<logic:present  id="resultset" property="TextbookInventoryDetail/InventoryID"> 
                  		<html:checkbox id="resultset" name="list[@type='update']/TextbookInventoryDetail/InventoryID" property="TextbookInventoryDetail/InventoryID" indexed="true"/> 
                  	</logic:present> 
				</td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="TextbookInventoryDetail/Title"/></td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="TextbookInventoryDetail/Author"/></td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="TextbookInventoryDetail/Publisher"/></td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="TextbookInventoryDetail/TextbookType"/></td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="TextbookInventoryDetail/StockTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                 <td nowrap>&nbsp;<bean:write id="resultset" property="TextbookInventoryDetail/Balance"/></td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="TextbookInventoryDetail/NominalNum"/></td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="TextbookInventoryDetail/StockNum"/></td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="TextbookInventoryDetail/Diff"/></td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="TextbookInventoryDetail/Remarks"/></td>
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
  </table>
  </form>
  <form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>