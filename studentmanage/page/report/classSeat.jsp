<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="studentmanage.prReport.classSeat.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
   
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="studentmanage.prReport.classSeat.do">
		
		
		<html:hidden property="QueryStudent/_order/col1/field"/>
		<html:hidden property="QueryStudent/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		 </td>
    </tr>
  </table>


<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
            <td class="text">班 级： <html:select property="QueryStudent/ClassID" onchange="talentquery()" > 
              <html:option value="-1">--请选择班级--</html:option> <html:options property="list[@type='studentclass']/Class/ClassID" labelProperty="list[@type='studentclass']/Class/ClassName"/> 
              </html:select> 
			  &nbsp;
			  
              <input name="export" type="button" class="button_02" value="导 出" onClick="exporttoseatexcel()">			 </td>
      </tr>
	  <logic:present property="QueryStudent/ClassID">
        <logic:notEqual property="QueryStudent/ClassID" value="-1">
      <tr>
         <td  class="text" align="center">&nbsp;</td>
      </tr>
      <tr>
        <td  class="text" align="center"><div id="printTable" style="font-size: 18px"><bean:write  property="QueryStudent/ClassName"/>
          学员座次表</div></td>
      </tr>
      <tr>
        <td  class="text" align="center">&nbsp;</td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
		 <%int i=0; %>
         <logic:iterate id="resultset" property="QueryStudent/list[@type='ClassSeat']">
         <%i++;
         if(i%2==1){
          %>
          <tr class="td1">
          <%} %>
            <td align="center"><bean:write id="resultset" property="QueryStudent/operatorname"/></td>
          <%if(i%2==0){ %>
          </tr>
           <%} %>
           
         </logic:iterate>
         <%if(i%2==1){ %>
           <td align="center">&nbsp;</td>
          </tr>
          <%} %>
        </table></td>
      </tr>
      
        </logic:notEqual>
      </logic:present>
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
 function toquery(){
 	var frm =document.forms[0];
 	if(frm.elements["QueryStudent/ClassID"].value==-1){
 		alert("请选择班级");
 		return;
 	}
 	
 	frm.action = frm.elements["queryaction"].value;
 	frm.submit();
 }
 
 
 function exporttoseatexcel() {

    if(document.forms[0].elements["QueryStudent/ClassID"].value==-1){
    	alert("请选择班级");
 		return;
    }
    var exportTime = new Date().getTime();
	var pwidth = screen.width - 10;
	var pheight = screen.height - 60;
	var etitle = "";
	var exml = "";

	var reportTable = document.all.listdetail;
	
	exml = tabletoxml(reportTable);
	

	var frm = document.forms[1];
	if(!frm) {
		alert("不能导出，没有导出form");
		return;
	}
	frm.elements["xmlfcc"].value = exml;
	
	var url = "studentmanage.prReport.classSeattoExcel.do?exportTime=" + exportTime;
	frm.action = url;
	frm.submit();
	//alert("注意：打印前设置好每行居中\n打印页面设置---左、右边距为：0.9，上、下边距为0");
}
</script>