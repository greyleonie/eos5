<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="teachWorkManage.prBookManage.textbookModifyDo.do">
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
      <td>
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
      <td class="text">
	  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
	  
	  <tr class="td_title"> 
                  <td width="30%" align="center" nowrap id="Textbook.Title" onClick="talentsort()">书名</td>
                  <td width="20%" align="center" nowrap id="Textbook.Author" onClick="talentsort()">作者</td>
                  <td width="20%" align="center" nowrap id="Textbook.Publisher" onClick="talentsort()">出版社</td>
                  <td width="12%" align="center" nowrap id="Textbook.PublishTime" onClick="talentsort()">出版日期</td>
                  <td width="8%" align="center" nowrap id="Textbook.Price" onClick="talentsort()">价格(元)</td>
                  <td width="10%" align="center" nowrap id="Textbook.TextbookType" onClick="talentsort()">类别</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='textbook']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)">
                <td nowrap ><input type="text" name="booklist/Textbook[@hciTagIndex='<%=count%>']/Title" value="<bean:write id="resultset" property="Textbook/Title"/>" class="input"  size="30" style="100%" maxlength="50" ValidateType="notempty" Msg="书名不能为空" />
                			<input type="hidden" name="booklist/Textbook[@hciTagIndex='<%=count%>']/TextbookID" value="<bean:write id="resultset" property="Textbook/TextbookID"/>" />
                </td>
                <td nowrap ><input type="text" name="booklist/Textbook[@hciTagIndex='<%=count%>']/Author" value="<bean:write id="resultset" property="Textbook/Author"/>" class="input"  style="100%" maxlength="20"   /></td>
                <td nowrap ><input type="text" name="booklist/Textbook[@hciTagIndex='<%=count%>']/Publisher" value="<bean:write id="resultset" property="Textbook/Publisher"/>" class="input"  style="100%"  maxlength="50"  /></td>
                <td nowrap ><input type="text" name="booklist/Textbook[@hciTagIndex='<%=count%>']/PublishTime[@pattern='yyyy-MM-dd']" value="<bean:write id="resultset" property="Textbook/PublishTime[@pattern='yyyy-MM-dd']"/>" class="input"  style="100%" />
                			<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["booklist/Textbook[@hciTagIndex='<%=count%>']/PublishTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")></td>
                <td nowrap ><input type="text" name="booklist/Textbook[@hciTagIndex='<%=count%>']/Price" value="<bean:write id="resultset" property="Textbook/Price"/>" class="input"  style="100%"  ValidateType="money" Msg="价格必须为数字" /></td>
                <td nowrap ><select name="booklist/Textbook[@hciTagIndex='<%=count%>']/TextbookType"  class="input" style="100%" >
                				<logic:equal id="resultset" property="Textbook/TextbookType" value="-1" ><option value="-1" selected>--请选择--</option><option value="党建">党建</option><option value="哲学">哲学</option><option value="政治">政治</option>
                				<OPTION value="经济">经济</OPTION><OPTION value="法学">法学</OPTION><OPTION value="行政">行政</OPTION><OPTION value="管理">管理</OPTION><OPTION value="其他">其他</OPTION></logic:equal>
                				<logic:equal id="resultset" property="Textbook/TextbookType" value="党建"><option value="-1" >--请选择--</option><option value="党建" selected>党建</option><option value="哲学">哲学</option><option value="政治">政治</option>
                				<OPTION value="经济">经济</OPTION><OPTION value="法学">法学</OPTION><OPTION value="行政">行政</OPTION><OPTION value="管理">管理</OPTION><OPTION value="其他">其他</OPTION></logic:equal>
                				<logic:equal id="resultset" property="Textbook/TextbookType" value="哲学"><option value="-1" >--请选择--</option><option value="党建">党建</option><option value="哲学" selected>哲学</option><option value="政治">政治</option>
                				<OPTION value="经济">经济</OPTION><OPTION value="法学">法学</OPTION><OPTION value="行政">行政</OPTION><OPTION value="管理">管理</OPTION><OPTION value="其他">其他</OPTION></logic:equal>
                				<logic:equal id="resultset" property="Textbook/TextbookType" value="政治"><option value="-1" >--请选择--</option><option value="党建">党建</option><option value="哲学" >哲学</option><option value="政治" selected>政治</option>
                				<OPTION value="经济">经济</OPTION><OPTION value="法学">法学</OPTION><OPTION value="行政">行政</OPTION><OPTION value="管理">管理</OPTION><OPTION value="其他">其他</OPTION></logic:equal>
                			</select></td>
              
              </tr>
                </logic:iterate> 
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="保 存" onClick="save()">
              <input name="Submit2" type="button" class="button_02" value="返 回" onClick="history.back()"></td>
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
  function save() {
  	var frm = document.forms[0];
	if(validater(frm)) frm.submit();
  
  }
</script>