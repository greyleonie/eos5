<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prAssetsManage.reportWriteOffList.do">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
 			<td class="text_wirte">首页—&gt;办公系统—&gt;资产管理—&gt;<span id="printTable">资产报废报表</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prAssetsManage.reportWriteReject.do">
		
		<input type="hidden" name="addaction" value="oa.prAssetsManage.updateReject.do">	
		<html:hidden property="CAPT_WRITEOFFDETAILVIEW/_order/col1/field"/>
		<html:hidden property="CAPT_WRITEOFFDETAILVIEW/_order/col1/asc" />
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
				<a title="资产编码，资产名称，品牌，规格型号,经办人，部门">关键字： </a>
			   	<html:text property="CAPT_WRITEOFFDETAILVIEW/searchText" attributesText='class="input" size="30"'/>
				<html:hidden property="CAPT_WRITEOFFDETAILVIEW/searchField" value="CAPTCODE,CAPTNAME,BRANDNAME,SPECIA,RequestName,DepName"/>
			    <input name="query" type="button" class="button_02" value="统 计" onClick="talentquery()">
			    <input name="query" type="button" class="button_02" value="报废" onClick="update()">
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
          <td width="5%" align="center" nowrap id="Reject.CAPTCODE" onClick="talentsort()">编码</td>
		  <td width="10%" align="center" id="Reject.CAPTCODE" onClick="talentsort()">资产条码</td>
          <td width="10%" align="center" id="Reject.CAPTCODE" onClick="talentsort()">资产编码</td>
          <td width="25%" align="center" id="Reject.CAPTNAME" onClick="talentsort()">资产名称</td>
          <td width="10%" align="center" id="Reject.BRANDNAME" onClick="talentsort()">品牌</td>
          <td width="15%" align="center" id="Reject.SPECIA" onClick="talentsort()">规格型号</td>
          <td width="10%" align="center" id="Reject.WRITEOFFDATE" onClick="talentsort()">使用日期</td>
        </tr>
        
               <%
		 		
			         int count=0;
			         String trClass = "result_content"; 
			        %>
       <logic:iterate property="list[type='Reject']" id="resultset">
                   <%
			       	if(count%2==0)
			       	    trClass = "td1";
			       	else
			       	    trClass = "td2";
			       	count++;
			       %>
		
           <tr class="<%=trClass%>">
			<td align="center"> 
					<logic:present  id="resultset" property="Reject/CAPTID"> 
                  		<html:checkbox id="resultset" name="listInsert/Reject/CAPTID" property="Reject/CAPTID" indexed="true"/> 
                  	</logic:present> 
				</td>
          <td align="left">
              <bean:write id="resultset" property="Reject/BARCODE"/>
           </td>
           <td>
           
           <bean:write id="resultset" property="Reject/CAPTCODE"/>
          </td>
           <td>
           <bean:write id="resultset" property="Reject/CAPTNAME"/>
          </td>
          <td align="left">
           <bean:write id="resultset" property="Reject/BRANDNAME"/>
          </td>
          <td align="left">
           <bean:write id="resultset" property="Reject/SPECIA"/>
           </td>
          
          <td align="left">
           <bean:write id="resultset" property="Reject/BORROWDATE" formatType="yyyy-MM-dd"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" />
           </td>
        </tr>   
       
       </logic:iterate>
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

</body>
<script>
function update() {
	var frm = document.forms[0];
	frm.action = frm.elements["addaction"].value ;
   	frm.submit();

}
</script>