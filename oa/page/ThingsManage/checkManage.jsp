<%@ include file="/internet/common.jsp" %>
 <logic:present property="Msg">
 <script>
 alert('<bean:write property="Msg"/>');
 </script>
  </logic:present>
<%
java.util.Date date = new java.util.Date();
java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
String curdate = sdf.format(date);
%>

<body>
<form method="post" action="oa.prThingsManage.checkManage.do">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
 			<td class="text_wirte">首页—&gt;办公系统—&gt;用品管理—&gt;用品盘点</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction"  value="oa.prThingsManage.checkManage.do" >
		<input type="hidden" name="addaction">
		<input type="hidden" name="modifyaction" >
		<input type="hidden" name="deleteaction" >
	
		<html:hidden property="COMM_CHECKDETAILVIEW/_order/col1/field"/>
		<html:hidden property="COMM_CHECKDETAILVIEW/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count" />
		<html:hidden property="PageCond/length" />
		
		<span id="printTable" style="display: none;">用品盘点表</span>
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
              <td align="left" class="td1">  	

			     <input name="check" type="button" class="button_02" value="我要盘点" onClick="checkGood()"> 
                &nbsp; 
                <input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
                </td>
            </tr>
            
             <tr>
        <td height="8" class="td1" align="center">最近一次盘点</td>
      </tr>
            
      <tr>
        <td valign="top" class="text" >
         	      <table width="96%"  border="0" cellpadding="0" cellspacing="0">
				   <tr>
				
				<td align="right" class="td1" align="center" colspan="5">
				盘点时间：<bean:write property='COMM_CHECK/CHECKDATE' formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" />             
				  </td>
				  <td align="right" class="td1" align="right" colspan="8">
				盘点人：<bean:write  property='COMM_CHECK/operatorName' />       
				  </td>
				</tr>
     </table>
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
              
                <tr class="td_title">
                  <td width="3%" align="center"  nowrap id="COMM_CHECKDETAILVIEW.ID" onClick="talentsort()">序号</td>
                  <td width="17%" align="center" nowrap id="COMM_CHECKDETAILVIEW.COMMNAME" onClick="talentsort()">品名</td>
                  <td width="5%" align="center" nowrap id="COMM_CHECKDETAILVIEW.UNIT" onClick="talentsort()">计量<br/>单位</td>
                  <td width="10%" align="center" nowrap id="COMM_CHECKDETAILVIEW.SPECIA" onClick="talentsort()">规格</td>
                  <td width="10%" align="center" nowrap id="COMM_CHECKDETAILVIEW.PRICE" onClick="talentsort()">单价（元)</td>
                  <td width="5%" align="center" nowrap id="COMM_CHECKDETAILVIEW.STORAGE" onClick="talentsort()">期初<br/>库存</td>
                  <td width="5%" align="center" nowrap id="COMM_CHECKDETAILVIEW.STORAGE" onClick="talentsort()">本期<br/>入库</td>
                  <td width="5%" align="center" nowrap id="COMM_CHECKDETAILVIEW.STORAGE" onClick="talentsort()">本期<br/>出库</td>
                  <td width="5%" align="center" nowrap id="COMM_CHECKDETAILVIEW.STORAGE" onClick="talentsort()">帐面<br/>库存</td>
                  <td width="5%" align="center" nowrap id="COMM_CHECKDETAILVIEW.STORAGE" onClick="talentsort()">实际<br/>库存</td>
                  <td width="5%" align="center" nowrap id="COMM_CHECKDETAILVIEW.BALANCE" onClick="talentsort()">差额</td>
                  <td width="5%" align="center" nowrap id="COMM_CHECKDETAILVIEW.REMARK" onClick="talentsort()">差额<br/>金额</td>
                  <td width="30%" align="center" nowrap id="COMM_CHECKDETAILVIEW.REMARK" onClick="talentsort()">备注</td>
                </tr>
                    <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='COMM_CHECKDETAILVIEW']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)">  
                <td nowrap align="center"><%=count%></td>
                <td nowrap><bean:write id="resultset" property='COMM_CHECKDETAILVIEW/COMMNAME'/></td> 
                <td nowrap><bean:write id="resultset" property='COMM_CHECKDETAILVIEW/UNITNAME'/></td>
                <td nowrap><bean:write id="resultset" property='COMM_CHECKDETAILVIEW/SPECIA' /></td>
                <td nowrap align="right"><bean:write id="resultset" property='COMM_CHECKDETAILVIEW/PRICE' />  </td>
                <td nowrap align="right"><bean:write id="resultset" property='COMM_CHECKDETAILVIEW/BEGINNUM'/></td>
                <td nowrap align="right"><bean:write id="resultset" property='COMM_CHECKDETAILVIEW/ENTRY' /></td>
                <td nowrap align="right"><bean:write id="resultset" property='COMM_CHECKDETAILVIEW/DELIVERY'/></td>
                <td nowrap align="right"><bean:write id="resultset" property='COMM_CHECKDETAILVIEW/NOMINALNUM'/> </td>
                <td nowrap align="right"><bean:write id="resultset" property='COMM_CHECKDETAILVIEW/STOCKNUM'/></td>
                <td nowrap align="right"><bean:write id="resultset" property='COMM_CHECKDETAILVIEW/BALANCE'  /></td>
                <td nowrap align="right"><bean:write id="resultset" property='COMM_CHECKDETAILVIEW/AMOUNT' /></td>
                <td nowrap><bean:write id="resultset" property='COMM_CHECKDETAILVIEW/REMARK' /></td>
				</tr>
				</logic:iterate>
              </table>
        
              
		  </td>
      </tr>
      <tr>
        <td class="text"><script>
				PageCond(document.forms[0]);
		     </script></td>
      </tr>
    </table>    </td>
  </tr>
</table>   
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title" value="用品盘点列表">
<input type="hidden" name="xmlfcc">
</form>
</body>

<script language="JavaScript">
  function checkGood() {
  	var frm = document.forms[0];
    frm.action = "oa.prThingsManage.checkAdd.do";
	frm.submit();

  
  }

</script>







	