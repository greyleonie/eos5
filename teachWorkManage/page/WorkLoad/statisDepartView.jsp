<%@include file="/internet/common.jsp"%>
<%@ page import=" java.util.GregorianCalendar"%>
<body>
<form method="post" action="teachWorkManage.prWorkLoad.statisDepartView.do" name="opeForm">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;教师工作量统计—&gt;<span id="printTable">部门工作量统计</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="teachWorkManage.prWorkLoad.statisDepartView.do">
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
				年度：
            <html:select property="input/Yearth">
            <html:option value="">--请选择--</html:option>
			<%
			GregorianCalendar today=new GregorianCalendar();
          int thisYear=today.get(GregorianCalendar.YEAR);
			for(int i=thisYear+1;i>=thisYear-4;i--){%>
            <html:option value="<%=i+""%>"><%=i%></html:option>
           <%}%>
			</html:select>
            时期： 
            <html:select property="input/Period">		
                <html:option value="">--请选择--</html:option>
                <html:option value="1">上半年</html:option>
                <html:option value="2">下半年</html:option> 
                <html:option value="3">全年</html:option>       
			    </html:select>
			 
                <input name="query" type="button" class="button_02" value="统 计" onClick="talentstatis()">  
				<input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onClick="exportforword()">			
			</td>
      </tr>
      <tr>
        <td height="8" align="center" class="td1"><bean:write property="input/Yearth"/>年<logic:equal property="input/Period" value="1">上半年</logic:equal><logic:equal property="input/Period" value="2">下半年</logic:equal><logic:equal property="input/Period" value="3">全年</logic:equal>部门教学工作量统计表 </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="5%" align="center" rowspan="4"  nowrap >教研部</td>
                  <td width="5%" align="center" rowspan="2" colspan="4" nowrap >任课人数</td>
                  <td width="5%" align="center" rowspan="1" colspan="8" nowrap >主体班</td>
                  <td width="5%" align="center" rowspan="1" colspan="4" nowrap >函数班</td>
                  <td width="5%" align="center" rowspan="4" colspan="1" nowrap >总课次</td>

                </tr>
                  <tr class="td_title"> 
                  <td width="5%" align="center" rowspan="1" colspan="6" nowrap >授课</td>
                  <td width="5%" align="center" rowspan="2" colspan="2" nowrap >其它</td>
                  <td width="5%" align="center" rowspan="2" colspan="2" nowrap >授课</td>
                  <td width="5%" align="center" rowspan="2" colspan="2" nowrap >其它</td>
                  </tr>
                 <tr class="td_title"> 
                  <td width="5%" align="center" rowspan="1" colspan="2" nowrap >上半年</td>
                  <td width="5%" align="center" rowspan="1" colspan="2" nowrap >下半年</td>
                  <td width="5%" align="center" rowspan="1" colspan="2" nowrap >局级班</td>
                  <td width="5%" align="center" rowspan="1" colspan="2" nowrap >处级班</td>
                  <td width="5%" align="center" rowspan="1" colspan="2" nowrap >其它班</td>
                </tr>
                				<tr class="td_title">
                  <td width="5%" align="center"  nowrap >主体班</td>
                  <td width="5%" align="center"  nowrap >函数班</td>
                  <td width="5%" align="center"  nowrap >主体班</td>
                  <td width="5%" align="center"  nowrap >函数班</td>
                  <td width="5%" align="center"  nowrap >上半年</td>
                  <td width="5%" align="center"  nowrap >下半年</td>
                  
                  <td width="5%" align="center"  nowrap >上半年</td>
                  <td width="5%" align="center"  nowrap >下半年</td>
                  
                  <td width="5%" align="center"  nowrap >上半年</td>
                  <td width="5%" align="center"  nowrap >下半年</td>
                  
                  <td width="5%" align="center"  nowrap >上半年</td>
                  <td width="5%" align="center"  nowrap >下半年</td>
                  
                  <td width="5%" align="center"  nowrap >上半年</td>
                  <td width="5%" align="center"  nowrap >下半年</td>
                  
                  <td width="5%" align="center"  nowrap >上半年</td>
                  <td width="5%" align="center"  nowrap >下半年</td>
                  

                  </tr>
				<%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
				<logic:iterate id="resultset" property="list[@type='TeachGroup']">
					<%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
                <tr class="<%=trClass%>" onClick="changeTRBgColor(this)"> 

			  <td align="center"  nowrap ><bean:write id="resultset" property="TeachGroup/orgName" /></td>
   				  <td align="center"  nowrap ><bean:write id="resultset" property="TeachGroup/a1" /></td>
   				  <td align="center"  nowrap ><bean:write id="resultset" property="TeachGroup/a2" /></td>
   				  <td align="center"  nowrap ><bean:write id="resultset" property="TeachGroup/a3" /></td>
   				  <td align="center"  nowrap ><bean:write id="resultset" property="TeachGroup/a4" /></td>
   				  <td align="center"  nowrap ><bean:write id="resultset" property="TeachGroup/a5" /></td>
   				  <td align="center"  nowrap ><bean:write id="resultset" property="TeachGroup/a6" /></td>
   				  <td align="center"  nowrap ><bean:write id="resultset" property="TeachGroup/a7" /></td>
   				  <td align="center"  nowrap ><bean:write id="resultset" property="TeachGroup/a8" /></td>
   				  <td align="center"  nowrap ><bean:write id="resultset" property="TeachGroup/a9" /></td>
   				  <td align="center"  nowrap ><bean:write id="resultset" property="TeachGroup/a10" /></td>
   				  <td align="center"  nowrap ><bean:write id="resultset" property="TeachGroup/a11" /></td>
   				  <td align="center"  nowrap ><bean:write id="resultset" property="TeachGroup/a12" /></td>
   				  <td align="center"  nowrap ><bean:write id="resultset" property="TeachGroup/a13" /></td>
   				  <td align="center"  nowrap ><bean:write id="resultset" property="TeachGroup/a14" /></td>
   				  <td align="center"  nowrap ><bean:write id="resultset" property="TeachGroup/a15" /></td>
   				  <td align="center"  nowrap ><bean:write id="resultset" property="TeachGroup/a16" /></td>
   				  <td align="center"  nowrap ><bean:write id="resultset" property="TeachGroup/a17" /></td>
                </tr>
				</logic:iterate>
                  <tr class="td1" onClick="changeTRBgColor(this)"> 

				  <td align="center"  nowrap >合计</td>
   				  <td align="center"  nowrap ><bean:write property="Total/a1" /></td>
   				  <td align="center"  nowrap ><bean:write property="Total/a2" /></td>
   				  <td align="center"  nowrap ><bean:write property="Total/a3" /></td>
   				  <td align="center"  nowrap ><bean:write property="Total/a4" /></td>
   				  <td align="center"  nowrap ><bean:write property="Total/a5" /></td>
   				  <td align="center"  nowrap ><bean:write property="Total/a6" /></td>
   				  <td align="center"  nowrap ><bean:write property="Total/a7" /></td>
   				  <td align="center"  nowrap ><bean:write property="Total/a8" /></td>
   				  <td align="center"  nowrap ><bean:write property="Total/a9" /></td>
   				  <td align="center"  nowrap ><bean:write property="Total/a10" /></td>
   				  <td align="center"  nowrap ><bean:write property="Total/a11" /></td>
   				  <td align="center"  nowrap ><bean:write property="Total/a12" /></td>
   				  <td align="center"  nowrap ><bean:write property="Total/a13" /></td>
   				  <td align="center"  nowrap ><bean:write property="Total/a14" /></td>
   				  <td align="center"  nowrap ><bean:write property="Total/a15" /></td>
   				  <td align="center"  nowrap ><bean:write property="Total/a16" /></td>
   				  <td align="center"  nowrap ><bean:write property="Total/a17" /></td>
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
</body>
<script type="text/javascript">
<!--

//-->
function talentstatis() {
	var frm =document.forms[0];
	frm.action = "teachWorkManage.prWorkLoad.statisDepartView.do";
	frm.target = "_self";
	
	processError(frm);
	if(frm.elements["queryaction"]) {
			frm.action = frm.elements["queryaction"].value;
		}
	event.srcElement.blur();
	frm.submit();
	

}

function exportforword() {
	var frm =document.forms[0];
	frm.action = "teachWorkManage.prWorkLoad.statisDepartReport.do";
	frm.target = "_blank";
    frm.submit();
}
</script>