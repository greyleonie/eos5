<%@ include file="/internet/common.jsp" %>
<body>
<form >
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
 			<td class="text_wirte">首页—&gt;办公系统—&gt;用品管理—&gt;<span id="printTable">用品盘点查看</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" >
		<input type="hidden" name="addaction">
		<input type="hidden" name="modifyaction" >
		<input type="hidden" name="deleteaction" >
	
		<html:hidden property="COMM_CHECK/_order/col1/field"/>
		<html:hidden property="COMM_CHECK/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count" value="-1"/>
		<html:hidden property="PageCond/length" />
	  </td>
    </tr>
  </table>
  
  <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" id="listdetail">
      <tr>
        <td height="8"> </td>
      </tr>
      
	  <tr>
            <td class="text">
            <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1"  bgcolor="#A2C4DC">
                <tr> 
                  <td width="10%" align="right" class="td2">盘点编号：</td>
                  <td width="20%"  class="td1">&nbsp;<bean:write property="COMM_CHECK/CHECKCODE"/> </td>
                  <td width="10%" align="right" class="td2">盘点日期：</td>
                  <td width="20%"  class="td1">&nbsp;  <bean:write  property="COMM_CHECK/CHECKDATE" formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/></td>
                  <td width="10%" align="right" class="td2">盘 点 人：</td>
                  <td width="30%" class="td1"> <bean:write property="COMM_CHECK/operatorName"/> </td>
                  
                </tr>
                <tr> 
                  <td align="right" class="td2">备注：</td>
                  <td colspan="5"  class="td1">
				  <bean:write property="COMM_CHECK/REMARK" />
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
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" >
                <tr class="td_title"> 
                  <td width="5%" align="center" nowrap> 序号</td>
                  <td width="17%" align="center" nowrap >品名</td>
                  <td width="10%" align="center" nowrap >计量<br/>单位</td>
                  <td width="10%" align="center" nowrap >规格</td>
                  <td width="10%" align="center" nowrap >单价（元)</td>
                  <td width="5%" align="center" nowrap >期初<br/>库存</td>
                  <td width="5%" align="center" nowrap >本期<br/>入库</td>
                  <td width="5%" align="center" nowrap >本期<br/>出库</td>
                  <td width="5%" align="center" nowrap >帐面<br/>库存</td>
                  <td width="5%" align="center" nowrap >实际<br/>库存</td>
                  <td width="5%" align="center" nowrap >差额</td>
                  <td width="5%" align="center" nowrap >合计<br/>金额</td>
                  <td width="*" align="center" nowrap >备注</td>
                </tr>
                
                    <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type=COMM_CHECKDETAILVIEW']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
               <tr class="<%=trClass %>" onClick="changeTRBgColor(this)" id="row_<%=count %>">  
                <td align="center"> <%=count %></td>
                <td nowrap><bean:write id="resultset" property='COMM_CHECKDETAILVIEW/COMMNAME'/></td> 
                <td nowrap> <bean:write id="resultset" property='COMM_CHECKDETAILVIEW/UNITNAME'/> </td>
                <td nowrap><bean:write id="resultset" property='COMM_CHECKDETAILVIEW/SPECIA' /> </td>
                <td nowrap><bean:write id="resultset" property='COMM_CHECKDETAILVIEW/PRICE'/>  </td>
                <td nowrap> <bean:write id="resultset" property='COMM_CHECKDETAILVIEW/BEGINNUM'/></td>
                <td nowrap> <bean:write id="resultset" property='COMM_CHECKDETAILVIEW/ENTRY'/></td>
                <td nowrap><bean:write id="resultset" property='COMM_CHECKDETAILVIEW/DELIVERY'/></td>
                <td nowrap> <bean:write id="resultset" property='COMM_CHECKDETAILVIEW/NOMIALNUM'/></td>
                <td nowrap> <bean:write id="resultset" property='COMM_CHECKDETAILVIEW/STOCKNUM'/></td>
                <td nowrap> <bean:write id="resultset" property='COMM_CHECKDETAILVIEW/BALANCE'/></td>
                <td nowrap> <bean:write id="resultset" property='COMM_CHECKDETAILVIEW/AMOUNT'/></td>
                <td nowrap> <bean:write id="resultset" property='COMM_CHECKDETAILVIEW/REMARK'/></td>
              </tr>
				</logic:iterate>
              </table>
		  </td>
      </tr>
      <tr>
        <td class="text">  </td>
      </tr>
    </table>    </td>
  </tr>
</table>  
   	<table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
				<tr>
				  <td align="center">
					<input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
					<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
				  <input name="wfcancel" type="button" class="button_02" value="返 回" onClick="goBack()"></td>
				</tr>
     </table> 
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title" value="用品盘点表">
<input type="hidden" name="xmlfcc">
</form>
</body>

<script>
  function goBack() {
  	var frm = document.forms[0];
  	frm.action = "oa.prThingsManage.checkManage.do";
	frm.submit();
  }

</script>