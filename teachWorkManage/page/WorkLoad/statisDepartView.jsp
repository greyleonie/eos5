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
            <td class="text_wirte">��ҳ��&gt;�������&gt;��ʦ������ͳ�ơ�&gt;<span id="printTable">���Ź�����ͳ��</span></td>
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
				��ȣ�
            <html:select property="input/Yearth">
            <html:option value="">--��ѡ��--</html:option>
			<%
			GregorianCalendar today=new GregorianCalendar();
          int thisYear=today.get(GregorianCalendar.YEAR);
			for(int i=thisYear+1;i>=thisYear-4;i--){%>
            <html:option value="<%=i+""%>"><%=i%></html:option>
           <%}%>
			</html:select>
            ʱ�ڣ� 
            <html:select property="input/Period">		
                <html:option value="">--��ѡ��--</html:option>
                <html:option value="1">�ϰ���</html:option>
                <html:option value="2">�°���</html:option> 
                <html:option value="3">ȫ��</html:option>       
			    </html:select>
			 
                <input name="query" type="button" class="button_02" value="ͳ ��" onClick="talentstatis()">  
				<input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="�� ��" onClick="exportforword()">			
			</td>
      </tr>
      <tr>
        <td height="8" align="center" class="td1"><bean:write property="input/Yearth"/>��<logic:equal property="input/Period" value="1">�ϰ���</logic:equal><logic:equal property="input/Period" value="2">�°���</logic:equal><logic:equal property="input/Period" value="3">ȫ��</logic:equal>���Ž�ѧ������ͳ�Ʊ� </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="5%" align="center" rowspan="4"  nowrap >���в�</td>
                  <td width="5%" align="center" rowspan="2" colspan="4" nowrap >�ο�����</td>
                  <td width="5%" align="center" rowspan="1" colspan="8" nowrap >�����</td>
                  <td width="5%" align="center" rowspan="1" colspan="4" nowrap >������</td>
                  <td width="5%" align="center" rowspan="4" colspan="1" nowrap >�ܿδ�</td>

                </tr>
                  <tr class="td_title"> 
                  <td width="5%" align="center" rowspan="1" colspan="6" nowrap >�ڿ�</td>
                  <td width="5%" align="center" rowspan="2" colspan="2" nowrap >����</td>
                  <td width="5%" align="center" rowspan="2" colspan="2" nowrap >�ڿ�</td>
                  <td width="5%" align="center" rowspan="2" colspan="2" nowrap >����</td>
                  </tr>
                 <tr class="td_title"> 
                  <td width="5%" align="center" rowspan="1" colspan="2" nowrap >�ϰ���</td>
                  <td width="5%" align="center" rowspan="1" colspan="2" nowrap >�°���</td>
                  <td width="5%" align="center" rowspan="1" colspan="2" nowrap >�ּ���</td>
                  <td width="5%" align="center" rowspan="1" colspan="2" nowrap >������</td>
                  <td width="5%" align="center" rowspan="1" colspan="2" nowrap >������</td>
                </tr>
                				<tr class="td_title">
                  <td width="5%" align="center"  nowrap >�����</td>
                  <td width="5%" align="center"  nowrap >������</td>
                  <td width="5%" align="center"  nowrap >�����</td>
                  <td width="5%" align="center"  nowrap >������</td>
                  <td width="5%" align="center"  nowrap >�ϰ���</td>
                  <td width="5%" align="center"  nowrap >�°���</td>
                  
                  <td width="5%" align="center"  nowrap >�ϰ���</td>
                  <td width="5%" align="center"  nowrap >�°���</td>
                  
                  <td width="5%" align="center"  nowrap >�ϰ���</td>
                  <td width="5%" align="center"  nowrap >�°���</td>
                  
                  <td width="5%" align="center"  nowrap >�ϰ���</td>
                  <td width="5%" align="center"  nowrap >�°���</td>
                  
                  <td width="5%" align="center"  nowrap >�ϰ���</td>
                  <td width="5%" align="center"  nowrap >�°���</td>
                  
                  <td width="5%" align="center"  nowrap >�ϰ���</td>
                  <td width="5%" align="center"  nowrap >�°���</td>
                  

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

				  <td align="center"  nowrap >�ϼ�</td>
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