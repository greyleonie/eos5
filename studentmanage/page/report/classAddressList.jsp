<%@include file="/internet/common.jsp"%>
<style type="text/css">
<!--
.STYLE1 {font-size: 14px}
-->
</style>
<script type="text/javascript">
<!--
function talbeDisplay(){
  var table1=document.getElementById("listdetail");
  var info=document.getElementById("info");
  var table2=document.getElementById("listdetail1");
    
                 table1.style.display="none";
                table2.style.display="";
                table2.id="listdetail";
                table1.id="listdetail1";
                if( info.value=="ѧԱ��Ϣ")
                info.value="�ον�Ա";
             else
              info.value="ѧԱ��Ϣ";
  
}

//-->
</script>
<body>

<form method="post" action="studentmanage.prReport.classAddressList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
   
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="studentmanage.prReport.classAddressList.do">
		
		
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
            <td class="text">�� ���� <html:select property="QueryStudent/ClassID/criteria/value" onchange="talentquery()"> 
              <html:option value="-1">--��ѡ��༶--</html:option> <html:options property="list[@type='studentclass']/Class/ClassID" labelProperty="list[@type='studentclass']/Class/ClassName"/> 
              </html:select> 
			  &nbsp;
			  <input name="query" type="button" class="button_02" value="�� ѯ" onClick="toquery()">
			  <input name="tttt" type="button" id="info" class="button_02" value="�ον�Ա" onClick="talbeDisplay()">
			  <input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
              <input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">			 </td>
      </tr>
	 <logic:present property="QueryStudent/ClassID/criteria/value">
        <logic:notEqual property="QueryStudent/ClassID/criteria/value" value="-1"> 

      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td  class="text" align="center"><div id="printTable" style="display: none;">ͨѶ¼</div></td>
      </tr>
      
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="5%" align="center" nowrap onClick="talentsort()">���</td>
                  <td width="10%" align="center" nowrap onClick="talentsort()">����</td>
                  <td width="25%" align="center" nowrap onClick="talentsort()">��λ</td>
                  <td width="10%" align="center" nowrap onClick="talentsort()">ְ��</td>
                  <td width="10%" align="center" nowrap onClick="talentsort()">�칫�绰</td>
                  <td width="10%" align="center" nowrap onClick="talentsort()">סլ�绰</td>
                  <td width="10%" align="center" nowrap onClick="talentsort()">�ƶ��绰</td>
                  <td width="20%" align="center" nowrap onClick="talentsort()">��������</td>
                  </tr>
				<%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
				<logic:iterate id="resultset" property="list[@type='QueryStudent']">
					<%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
                <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" > 
                  <td nowrap align="center"><%=count %></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/operatorname"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/WorkingOrgan"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/Duty"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/OrganTel"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/HomeTel"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/MobileTel"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/Email"/></td>
                  </tr>  
				</logic:iterate>
				</table>
				<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail1" style="display:none">
				<tr class="td1">
				  <td height="30" colspan="8" align="center" nowrap> <a name="teacher"></a> ====== ��  ��  ��  Ա ======  </td>
				  </tr>
				<tr class="td_title">
				  <td colspan="2" align="center" nowrap>����</td>
				  <td align="center" nowrap>����</td>
				  <td colspan="2" align="center" nowrap>ְ��ְ�ƣ�</td>
				  <td colspan="3" align="center" nowrap>��ѧ���ݡ�����</td>
				  </tr>
				  <%
		             count=0;
			        
		  
		  		%>
				<logic:iterate id="resultset2" property="list[@type='Teacher']">
				  <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
                <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" > 
				
                    <td colspan="2" align="center" nowrap><bean:write id="resultset2" property="Teacher/operatorname"/>
					</td>
                    <td align="center" nowrap><bean:write id="resultset2" property="Teacher/orgName"/></td>
                    <td colspan="2" align="center" nowrap><bean:write id="resultset2" property="Teacher/DutyTechnicalPost"/></td>
                    <td colspan="3" >&nbsp;<bean:write id="resultset2" property="Teacher/CourseName"/></td>
                    </tr>
					</logic:iterate>
              </table></td>
      </tr>
      <script>
      	var sel=document.forms[0].elements["QueryStudent/ClassID/criteria/value"];
 		printTable.innerHTML=sel.options[sel.options.selectedIndex].text+"ͨѶ¼";
 		
      </script>
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
 	if(frm.elements["QueryStudent/ClassID/criteria/value"].value==-1){
 		alert("��ѡ��༶");
 		return;
 	}
 	
 	frm.action = frm.elements["queryaction"].value;
 	frm.submit();
 }
 
 
</script>
