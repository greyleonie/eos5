<%@ taglib uri="/WEB-INF/hci-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/hci-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/hci-logic.tld" prefix="logic" %>
<%
response.setContentType("application/msword;charset=gb2312");
%>
<body>
<table width="98%"   border="1" align="center" cellpadding="0" cellspacing="0"  height="369" bordercolordark="#FFFFFF" bordercolorlight="#A2C4DC">
                <tr class="td1"> 
                  <td width="5%" align="center" rowspan="4"  nowrap >教研部</td>
                  <td width="5%" align="center" rowspan="2" colspan="4" nowrap >任课人数</td>
                  <td width="5%" align="center" rowspan="1" colspan="8" nowrap >主体班</td>
                  <td width="5%" align="center" rowspan="1" colspan="4" nowrap >函数班</td>
                  <td width="5%" align="center" rowspan="4" colspan="1" nowrap >总课次</td>

                </tr>
                  <tr class="td1"> 
                  <td width="5%" align="center" rowspan="1" colspan="6" nowrap >授课</td>
                  <td width="5%" align="center" rowspan="2" colspan="2" nowrap >其它</td>
                  <td width="5%" align="center" rowspan="2" colspan="2" nowrap >授课</td>
                  <td width="5%" align="center" rowspan="2" colspan="2" nowrap >其它</td>
                  </tr>
                 <tr class="td1"> 
                  <td width="5%" align="center" rowspan="1" colspan="2" nowrap >上半年</td>
                  <td width="5%" align="center" rowspan="1" colspan="2" nowrap >下半年</td>
                  <td width="5%" align="center" rowspan="1" colspan="2" nowrap >局级班</td>
                  <td width="5%" align="center" rowspan="1" colspan="2" nowrap >处级班</td>
                  <td width="5%" align="center" rowspan="1" colspan="2" nowrap >其它班</td>
                </tr>
                				<tr class="td1">
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
                <tr class="td1" > 

			  <td align="center" class="td1"  nowrap ><bean:write id="resultset" property="TeachGroup/orgName" /></td>
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
                  <tr class="td1" > 

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
</body>