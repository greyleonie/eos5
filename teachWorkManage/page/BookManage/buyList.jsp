<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="teachWorkManage.prBookManage.buyList.do">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;教材管理—&gt;<span id="printTable">教材采购表</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="teachWorkManage.prBookManage.buyList.do">
		<input type="hidden" name="addaction" value="teachWorkManage.prBookManage.buyAdd.do">
		<input type="hidden" name="modifyaction" value="teachWorkManage.prBookManage.buyModify.do">
		<input type="hidden" name="deleteaction" value="teachWorkManage.prBookManage.buyDelete.do">

		<html:hidden property="TextbookBuyDetail/_order/col1/field"/>
		<html:hidden property="TextbookBuyDetail/_order/col1/asc" />
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
            <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1">
            <tr>
            <td nowrap align="right" class="td1">书&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
            <td nowrap class="td1"><html:text property="TextbookBuyDetail/Title/criteria/value" attributesText='class="input" size="20"'/>
            <html:hidden property="TextbookBuyDetail/Title/criteria/operator" value="like"/>
            <html:hidden property="TextbookBuyDetail/Title/criteria/likeRule" value="center"/></td>
            <td nowrap align="right" class="td1">作&nbsp;&nbsp;&nbsp;&nbsp;者：</td>
            <td nowrap class="td1"> <html:text property="TextbookBuyDetail/Author/criteria/value" attributesText='class="input" size="20"'/>
            <html:hidden property="TextbookBuyDetail/Author/criteria/operator" value="like"/>
            <html:hidden property="TextbookBuyDetail/Author/criteria/likeRule" value="center"/></td>
            <td nowrap align="right" class="td1">经手人：</td>
            <td nowrap class="td1">  <html:text property="TextbookBuyDetail/Handler/criteria/value" attributesText='class="input" size="10"'/>
            <html:hidden property="TextbookBuyDetail/Handler/criteria/operator" value="like"/>
            <html:hidden property="TextbookBuyDetail/Handler/criteria/likeRule" value="center"/></td>
            </tr>
            <tr>
             <td nowrap align="right" class="td1">入库时间：</td>
            <td nowrap class="td1"> 从
            	<html:text property="TextbookBuyDetail/EnterTime/criteria/min" attributesText='class="input" size="10" ' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["TextbookBuyDetail/EnterTime/criteria/min"],"yyyy-MM-dd")> 
           		到
           		<html:text property="TextbookBuyDetail/EnterTime/criteria/max" attributesText='class="input" size="10"' readonly="true"/>
          	    <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["TextbookBuyDetail/EnterTime/criteria/max"],"yyyy-MM-dd")>
			    <input type="hidden" name="TextbookBuyDetail/EnterTime/criteria/operator" value="between"/>
			    <input type="hidden" name="TextbookBuyDetail/EnterTime/criteria/criteriaPattern" value="yyyy-MM-dd"/></td>
            <td nowrap align="right" class="td1">类&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
            <td nowrap class="td1"><html:select property="TextbookBuyDetail/TextbookType/criteria/value">		
                <html:option value="">请选择</html:option>
                <html:option value="党建">党建</html:option>
                <html:option value="哲学">哲学</html:option>
                <html:option value="政治">政治</html:option> 
                <html:option value="经济">经济</html:option>
                <html:option value="法学">法学</html:option> 
                <html:option value="行政">行政</html:option> 
                <html:option value="管理">管理</html:option> 
                <html:option value="其他">其他</html:option> 
			</html:select>
             <html:hidden property="TextbookBuyDetail/TextbookType/criteria/operator" value="like"/>
            <html:hidden property="TextbookBuyDetail/TextbookType/criteria/likeRule" value="center"/></td>
            
            <td nowrap colspan="2"  class="td1"> 服务端排序：<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""></td>
            </tr>
            <tr>
            <td colspan="6" nowrap class="td1">
                <input name="query" type="button" class="button_02" value="查 询" onClick="talentquery()">

              	<qx:talentButton property="add" type="button" styleClass="button_02" value="新 增" onclick="talentadd()" operation="DX_TEACH_MANAGE_BOOK_BUY.DX_TEACH_MANAGE_BOOK_BUY_ADD"/>
                <qx:talentButton property="modify" type="button" styleClass="button_02" value="修 改" onclick="talentmodify()" operation="DX_TEACH_MANAGE_BOOK_BUY.DX_TEACH_MANAGE_BOOK_BUY_MODIFY"/> 
              	<qx:talentButton property="delete" type="button" styleClass="button_02" value="删 除" onclick="talentdelete()" operation="DX_TEACH_MANAGE_BOOK_BUY.DX_TEACH_MANAGE_BOOK_BUY_DELETE"/>
				<input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
            </td>
            </tr>
            </table>
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text" >
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="3%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""></td>
                  <td width="22%" align="center" nowrap id="TextbookBuyDetail.Title" onClick="talentsort()">书 名</td>
                  <td width="10%" align="center" nowrap id="TextbookBuyDetail.Author" onClick="talentsort()">作 者</td>
                  <td width="15%" align="center" nowrap id="TextbookBuyDetail.Publisher" onClick="talentsort()">出版社</td>
                  <td width="5%" align="center" nowrap id="TextbookBuyDetail.TextbookType" onClick="talentsort()">类 型</td>
                  <td width="5%" align="center" nowrap id="TextbookBuyDetail.BuyNum" onClick="talentsort()">采购数</td>
                  <td width="5%" align="center" nowrap id="TextbookBuyDetail.Price" onClick="talentsort()">单价</td>
                  <td width="5%" align="center" nowrap id="TextbookBuyDetail.TotalPrice" onClick="talentsort()">金额</td>
                  <td width="10%" align="center" nowrap id="TextbookBuyDetail.EnterTime" onClick="talentsort()">采购时间</td>
                  <td width="20%" align="center" nowrap id="TextbookBuyDetail.Remarks" onClick="talentsort()">备 注</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='buydetail']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)"">  
                <td align="center"> 
					<logic:present  id="resultset" property="TextbookBuyDetail/BuyID"> 
                  		<html:checkbox id="resultset" name="list[@type='update']/TextbookBuyDetail/BuyID" property="TextbookBuyDetail/BuyID" indexed="true"/> 
                  	</logic:present> 
				</td>
                  <td   nowrap> <bean:write id="resultset"  property="TextbookBuyDetail/Title" /></td>
                  <td   nowrap ><bean:write id="resultset"  property="TextbookBuyDetail/Author" /></td>
                  <td  nowrap ><bean:write id="resultset"  property="TextbookBuyDetail/Publisher" /></td>
                  <td  align="center" nowrap ><bean:write id="resultset"  property="TextbookBuyDetail/TextbookType" /></td>
                  <td  align="center" nowrap ><bean:write id="resultset"  property="TextbookBuyDetail/BuyNum" /></td>
                  <td  align="center" nowrap ><bean:write id="resultset"  property="TextbookBuyDetail/Price"  language="zh" country="CN"/></td>
                  <td  align="center" nowrap ><bean:write id="resultset"  property="TextbookBuyDetail/TotalPrice" language="zh" country="CN" /></td>
                  <td  align="center" nowrap ><bean:write id="resultset"  property="TextbookBuyDetail/EnterTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                  <td  align="center"  nowrap ><bean:write id="resultset"  property="TextbookBuyDetail/Remarks" /></td>
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
	loadOrderImg(document.forms[0],'TextbookBuyDetail');
</script>