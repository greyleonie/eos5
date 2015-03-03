<%@include file="/internet/common.jsp"%>
<body>
<form name="form2" method="post" action="" enctype="multipart/form-data">
    <table width="100%"  border="0" cellspacing="0" cellpadding="0">
   
    <tr> 
    <logic:notPresent property="QueryKaoqinTotal/ClassID/criteria/value">
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">学员管理—&gt;班级考勤管理—&gt;学员考勤情况统计</td>
          </tr>
        </table> 
    </td>
    </logic:notPresent>
     <tr>
	    <td height="30" class="text">
	    &nbsp;&nbsp;<div id="printTable"  style="display: none;" >广州市委党校（广州行政学院）学员考勤情况统计表</div>
	    <input name="Submit2" type="button" class="button_02" value="返 回" onClick="javascript:history.go(-1)">
	    <input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
		<input name="export" type="button" class="button_02" value="导 出" onClick="domToDoc()">
	    
	    </td>
	    </tr>
    </tr>
    <tr height="10">
   <td></td>
   </tr>
   <tr>
   <td><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" id="listdetail">
     <tr>
       <td class="td1">&nbsp;考勤时间：<%= talent.core.TalentFunctions.formatUtilDateCnTime(new java.util.Date())%></td>
     </tr>
     <tr>
       <td><table width="100%"  border="1" align="center" cellpadding="0" cellspacing="0"  height="369" bordercolordark="#FFFFFF" bordercolorlight="#A2C4DC" id="listdetail2">
         <tr class="td_title">
           <td width="10%" align="center"> 姓名</td>
           <td width="20%" align="center">单位</td>
           <td width="20%" align="center">时间</td>
           <td width="10%" align="center">考勤状态</td>
           <td width="10%" align="center">迟到累计</td>
           <td width="10%" align="center">缺课累计</td>
           <td width="10%" align="center">公假累计</td>
           <td width="10%" align="center">事假/病假累计</td>
         </tr>
         <%int i=0;
      %>
         <logic:iterate id="resultset" property="list[@type='StudentlaterLogs']">
           <%if (i==0){ %>
           <tr    class="td1">
             <td rowspan="2" align="center" valign="middle" id="operatorname"><bean:write property="QueryStudentSimple/operatorname"/></td>
             <td rowspan="2" valign="middle" id="WorkingOrgan"><bean:write property="QueryStudentSimple/WorkingOrgan"/></td>
             <td align="center"><bean:write id="resultset" property="StudentlaterLogs/checkTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd hh:mm:ss"/>
                 <dict:write  id="resultset" property="StudentlaterLogs/wubie" businTypeId="dx_kqWubie"/>
             </td>
             <td align="center">&nbsp;<dict:write  id="resultset" property="StudentlaterLogs/state" businTypeId="dx_kqState"/></td>
             <td rowspan="2" align="center" valign="middle" id="count1">&nbsp;<bean:write property="QueryStudentSimple/count1"/></td>
             <td rowspan="2" align="center" valign="middle" id="count2">&nbsp;<bean:write property="QueryStudentSimple/count2"/></td>
             <td rowspan="2" align="center" valign="middle" id="count3">&nbsp;<bean:write property="QueryStudentSimple/count3"/></td>
             <td rowspan="2" align="center" valign="middle" id="count4">&nbsp;<bean:write property="QueryStudentSimple/count4"/></td>
           </tr>
           <%}else{ %>
           <tr class="td1">
             <td align="center"><bean:write id="resultset" property="StudentlaterLogs/checkTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd hh:mm:ss"/>
                 <dict:write  id="resultset" property="StudentlaterLogs/wubie" businTypeId="dx_kqWubie"/></td>
             <td align="center"><dict:write  id="resultset" property="StudentlaterLogs/state" businTypeId="dx_kqState"/></td>
           </tr>
           <%}
	i++;
	 %>
         </logic:iterate>
       </table></td>
     </tr>
   </table>
   </td>
   </tr>
   </table>
   
   
     
    </form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>
<script type="text/javascript">


	document.getElementById("operatorname").setAttribute("rowSpan",<%=i%>);
	document.getElementById("WorkingOrgan").setAttribute("rowSpan","<%=i%>");
	document.getElementById("count1").setAttribute("rowSpan","<%=i%>");
	document.getElementById("count2").setAttribute("rowSpan","<%=i%>");
	document.getElementById("count3").setAttribute("rowSpan","<%=i%>");
	document.getElementById("count4").setAttribute("rowSpan","<%=i%>");
	
	//operatorname.setAttribute("rowSpan","7");
	listdetail2.outerHTML = listdetail2.outerHTML;
	
 
</script>