<%@include file="/internet/common.jsp"%>
<html>
<head>
<title><bean:write property="title"/>—&gt;流程日志</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
</style>
<SCRIPT type="text/javascript">

</SCRIPT>
</head>
<body>
<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
      
      <tr>
        <td valign="top" class="text">
		<table width="99%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title">  
                  <td width="21%" align="center" nowrap id="ReceiveArchive.userID" onClick="talentsort()">资产名称[编号]</td>
                  <td width="15%" align="center" nowrap id="ReceiveArchive.operatorName" onClick="talentsort()">使用人</td>
                   <td width="15%" align="center" nowrap id="ReceiveArchive.operatorName" onClick="talentsort()">使用部门</td>
                  <td width="16%" align="center" nowrap id="ReceiveArchive.status" onClick="talentsort()">调拨时间</td>
                  <td width="17%" align="center" nowrap id="ReceiveArchive.cardID" onClick="talentsort()">归还时间</td>
                  <td width="20%" align="center" >状态</td>
                 
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[type='CAPT_BORROWVIEW']">
              <tr class="td1" onClick="changeTRBgColor(this)" >           
                <td nowrap title="<bean:write id="resultset" property="CAPT_BORROWVIEW/BORROWRECORD" />">&nbsp;<bean:write id="resultset" property="CAPT_BORROWVIEW/BORROWRECORD" maxLength="60"/></td>              
                <td nowrap >&nbsp;<bean:write id="resultset" property="CAPT_BORROWVIEW/BORROWERNAME"/></td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="CAPT_BORROWVIEW/DepNAME"/></td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="CAPT_BORROWVIEW/BORROWDATE" formatType="yyyy-MM-dd"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" /></td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="CAPT_BORROWVIEW/RETURNDATE" formatType="yyyy-MM-dd"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" /></td>
                <td><logic:equal id="resultset" property="CAPT_BORROWVIEW/STATE" value="0">使用中</logic:equal><logic:equal id="resultset" property="CAPT_BORROWVIEW/STATE" value="1">使用过</logic:equal>
                </td>
              </tr>
                </logic:iterate> 
          </table>
          
		  
	    </td>
      </tr>
    </table>

<script>
	//document.all["graphID"].width = document.all["graphID"].document.body.offsetWidth * .9;
	//document.all["graphID"].height = document.all["graphID"].document.body.offsetHeight * .43;
</script>
</body>
</html>