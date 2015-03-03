<%@include file="/internet/common.jsp"%>
<%@ page import=" java.util.GregorianCalendar"%>
<body>
<form method="post" action="teachWorkManage.prBookManage.searchList.do">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;教材管理—&gt;<span id="printTable">教材统计表</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="teachWorkManage.prBookManage.searchList.do">
		<html:hidden property="QueryTextbookInventory/_order/col1/field"/>
		<html:hidden property="QueryTextbookInventory/_order/col1/asc" />
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
            书名：
			<html:text property="QueryTextbookInventory/Title/criteria/value" attributesText='class="input" size="20" '/>
			<html:hidden property="QueryTextbookInventory/Title/criteria/operator" value="like"/>
			<html:hidden property="QueryTextbookInventory/Title/criteria/likeRule" value="center"/>
			类别：
			<html:select property="QueryTextbookInventory/TextbookType/criteria/value" attributesText='class="input"'>
			<html:option value="">请选择</html:option>
			<html:option value="党建">党建</html:option>
			<html:option value="哲学">哲学</html:option>
			<html:option value="政治">政治</html:option>
			<html:option value="经济">经济</html:option>
			</html:select>
			<html:hidden property="QueryTextbookInventory/TextbookType/criteria/operator" value="="/>
				
			<input name="view" type="button" class="button_02" value="查询" onClick="talentquery()">
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
                <td width="3%" align="center" nowrap >序 号</td>
                  <td width="30%" align="center" nowrap id="QueryTextbookInventory.Title" onClick="talentsort()">书 名</td>
                  <td width="17%" align="center" nowrap id="QueryTextbookInventory.Author" onClick="talentsort()">作 者</td>
                  <td width="30%" align="center" nowrap id="QueryTextbookInventory.Publisher" onClick="talentsort()">出版社</td>
                  <td width="5%" align="center" nowrap id="QueryTextbookInventory.TextbookType" onClick="talentsort()">类 型</td>
                  <td width="5%" align="center" nowrap id="QueryTextbookInventory.StockNum" onClick="talentsort()">当前库存数</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='queryinventory']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)">
                  <td  nowrap align="center"><%=count%></td>  
                  <td  nowrap><bean:write id="resultset" property="QueryTextbookInventory/Title"/></td>
                  <td  nowrap align="center"><bean:write id="resultset" property="QueryTextbookInventory/Author"/></td>
                  <td  nowrap align="center"><bean:write id="resultset" property="QueryTextbookInventory/Publisher"/></td>
                  <td  nowrap align="center"><bean:write id="resultset" property="QueryTextbookInventory/TextbookType"/></td>
                  <td  nowrap align="center"><bean:write id="resultset" property="QueryTextbookInventory/StockNum"/></td>
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
<script>
	loadOrderImg(document.forms[0],'QueryTextbookInventory');
</script>