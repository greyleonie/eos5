<%@ include file="/internet/common.jsp" %>
<body>
<form>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
 			<td class="text_wirte">首页—&gt;办公系统—&gt;用品管理—&gt;<span id="printTable">用品出库单</span>查看</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" >
		<input type="hidden" name="addaction">
		<input type="hidden" name="modifyaction" >
		<input type="hidden" name="deleteaction" >
		<input type="hidden" name="viewaction" >
	
		<html:hidden property="COMM_DRAW/_order/col1/field"/>
		<html:hidden property="COMM_DRAW/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		
		
		<html:hidden property="COMM_DRAW/STOREID"/>
	  </td>
    </tr>
  </table>
  

		<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
		  <tr> 
                  <td width="10%" align="right" class="td1">发放编号：</td>
                  <td width="20%"  class="td1">&nbsp;<bean:write property="COMM_DRAWVIEW/DRAWCODE"/> </td>
                  <td width="10%" align="right" class="td1">发放日期：</td>
                  <td width="20%"  class="td1">&nbsp;<bean:write property="COMM_DRAWVIEW/DRAWDATE"  formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/></td>
                  <td width="10%" align="right" class="td1">操 作 人：</td>
                  <td width="*" class="td1" colspan="3"> <bean:write  property="COMM_DRAWVIEW/OPERATORNAME" /> </td>
                </tr>
                <tr> 
                  <td align="right" class="td1">领用部门：</td>
                  <td class="td1" colspan="3"><bean:write   property="COMM_DRAWVIEW/BRANCHNAME" /> 
                   </td>
                  <td align="right" class="td1">领 用 人：</td>
                  <td class="td1" colspan="3"><bean:write   property="COMM_DRAWVIEW/PROPOSERNAME"/>
                </tr>
                <tr class="td_title"> 
                  <td width="27%" align="center" nowrap >序号</td>
                  <td width="27%" align="center" nowrap >品名</td>
                  <td width="10%" align="center" nowrap >计量单位</td>
                  <td width="10%" align="center" nowrap >规格</td>
                  <td width="10%" align="center" nowrap >单价（元)</td>
                  <td width="10%" align="center" nowrap >数量</td>
                  <td width="10%" align="center" nowrap >合计金额（元)</td>
                   <td width="20%" align="center" nowrap >备注</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type=COMM_DRAWDETAILVIEW']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
               <tr class="<%=trClass %>" onClick="changeTRBgColor(this)" id="row_<%=count%>"> 
               <td nowrap align="center"><%=count %></td>  
                <td nowrap><bean:write id="resultset" property='COMM_DRAWDETAILVIEW/COMMNAME'/></td> 
                <td nowrap><bean:write id="resultset" property='COMM_DRAWDETAILVIEW/UNITNAME'/></td>
                <td nowrap><bean:write id="resultset" property='COMM_DRAWDETAILVIEW/SPECIA' /></td>
                <td nowrap><bean:write id="resultset" property='COMM_DRAWDETAILVIEW/PRICE'/></td>
                <td nowrap><bean:write id="resultset" property='COMM_DRAWDETAILVIEW/QUANTITY'/></td>
                <td nowrap><bean:write id="resultset" property='COMM_DRAWDETAILVIEW/AMOUNT'/></td>
                <td nowrap><bean:write id="resultset" property='COMM_DRAWDETAILVIEW/REMARK'/></td>
              </tr>
				</logic:iterate>
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
<input type="hidden" name="title" value="用品出库列表">
<input type="hidden" name="xmlfcc">
</form>
</body>
<script>
  function goBack() {
  	var frm = document.forms[0];
  	frm.action = "oa.prThingsManage.drawList.do";
	frm.submit();
  }

</script>