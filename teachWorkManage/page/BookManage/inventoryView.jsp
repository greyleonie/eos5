<%@include file="/internet/common.jsp"%>
<body>
<form method="post" >
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;教材管理—&gt;教材信息管理</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction">
		<input type="hidden" name="addaction">
		<input type="hidden" name="modifyaction">
		<input type="hidden" name="deleteaction">
		<input type="hidden" name="viewaction">
		
		<html:hidden property="Textbook/_order/col1/field"/>
		<html:hidden property="Textbook/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		
		<html:hidden property="PageCond/length" />
		<html:hidden property="Textbook/TextbookID" /> 
		
		
		
	  </td>
    </tr>
  </table>
   <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">
         <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr> 
            <td width="14%" align="right" nowrap class="td2">年度： </td>
            <td width="35%" class="td1"></td>
            <td width="12%" align="right" nowrap class="td2">时期： </td>
            <td width="39%" class="td1"></td>
            <td align="right" nowrap class="td2">订购名称： </td>
            <td class="td1"></td>
          </tr>
  
           <tr><td align="center" colspan="6" height="30" class="td1"> 订购明细 </td></tr>
        </table>
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC"  id="sortTable">
        
         <tr class="td_title"> 
                  <td width="8%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""></td>
                  <td width="16%" align="center" nowrap id="TextbookOrder.Title" onClick="talentsort()">书 名</td>
                  <td width="18%" align="center" nowrap >出版社</td>
                  <td width="18%" align="center" nowrap id="TextbookOrder.Price" onClick="talentsort()">单价</td>
                  <td width="20%" align="center" nowrap id="TextbookOrder.UseClasses" onClick="talentsort()">班别</td>
                  <td width="14%" align="center" nowrap id="TextbookOrder.Stock" onClick="talentsort()">库存</td>
                  <td width="14%" align="center" nowrap id="TTextbookOrder.OrderNum" onClick="talentsort()">购数</td>
                </tr>
            
                 <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='textbookorderdetail']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)">  
                <td align="center"></td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="TextbookOrderDetail/Title"/></td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="TextbookOrderDetail/Publisher"/></td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="TextbookOrderDetail/Price"/></td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="TextbookOrderDetail/UseClasses"/></td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="TextbookOrderDetail/Stock"/></td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="TextbookOrderDetail/OrderNum"/></td>
              </tr>
                </logic:iterate> 
                
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Submit2" type="button" class="button_02" value="返 回" onClick="history.back()"></td>
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
//validater函数功能
//用法:ValidateType="alphanumeric,email",Msg="必须是字母数字;邮件"
//验证类型有:url,postalcode,phone,money,int,notempty,email,numeric
//function validater(frmObj)