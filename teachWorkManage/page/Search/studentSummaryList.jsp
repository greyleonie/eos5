<%@include file="/internet/common.jsp"%>
<!--û�м�¼-->
<script type="text/javascript">
<logic:equal property="PageCond/count" value="0">
       alert("û��ѧԱ��¼" );
</logic:equal>
</script>
<body>
<form method="post" name="opeForm" action="teachWorkManage.prSearch.studentSummaryList.do">
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">�������&gt;��ѯͳ�ơ�&gt;<span id="printTable">ѧԱ���¼������ѯ</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="teachWorkManage.prSearch.studentSummaryList.do">
		<input type="hidden" name="viewaction" value="teachWorkManage.prSearch.studentSummaryView.do">
		<html:hidden property="QueryStudent/_order/col1/field"/>
		<html:hidden property="QueryStudent/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
	  </td>
    </tr>
  </table>
 <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0"  class="table">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">
             <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" >
        <tr>
            <td class="td2" align="right">��&nbsp;&nbsp;&nbsp;&nbsp;����</td>
            <td class="td1" colspan="3" >
             <html:select property="QueryStudent/ClassID/criteria/value"  > 
              <html:option value="">--��ѡ��༶--</html:option> <html:options property="list[@type='studentclass']/Class/ClassID" labelProperty="list[@type='studentclass']/Class/ClassName"/> 
              </html:select> 
			  <html:hidden property="QueryStudent/ClassID/criteria/operator" value="=" />
			  </td>
      </tr>
	  <tr>
            <td class="td2" align="right">��&nbsp;&nbsp;&nbsp;&nbsp;����</td> 
			<td class="td1" >  <html:text property="QueryStudent/operatorname/criteria/value" attributesText='class="input" size="30"' />
			<html:hidden property="QueryStudent/operatorname/criteria/operator" value="like" />
			<html:hidden property="QueryStudent/operatorname/criteria/likeRule" value="center" /></td>
			<td class="td2" align="right">��&nbsp;&nbsp;&nbsp;&nbsp;λ��</td> 
			<td class="td1" >  <html:text property="QueryStudent/WorkingOrgan/criteria/value" attributesText='class="input" size="30"'/>
			<html:hidden property="QueryStudent/WorkingOrgan/criteria/operator" value="like" />
			<html:hidden property="QueryStudent/WorkingOrgan/criteria/likeRule" value="center" />
			
			</td>
	
	</tr>
		  <tr>
            <td class="td2" align="right">�������£�</td> 
			<td class="td1"  >��<html:text property="QueryStudent/Birthdate/criteria/min" attributesText='class="input" size="10"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["QueryStudent/Birthdate/criteria/min"],"yyyy-MM-dd")>
             	��<html:text property="QueryStudent/Birthdate/criteria/max" attributesText='class="input" size="10"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["QueryStudent/Birthdate/criteria/max"],"yyyy-MM-dd")>  
                <html:hidden property="QueryStudent/Birthdate/criteria/operator" value="between" />
			    <html:hidden property="QueryStudent/Birthdate/criteria/criteriaPattern" value="yyyy-MM-dd" />
             	</td>
            <td class="td2" align="right">�Ƿ���ѧ��</td> 
			<td class="td1"  ><html:radio property="QueryStudent/IsQuit/criteria/value"  value="1"/>�� <html:radio property="QueryStudent/IsQuit/criteria/value"  value="0" />��<html:radio property="QueryStudent/IsQuit/criteria/value"  value="" checked="true"/>ȫ��
			<html:hidden property="QueryStudent/IsQuit/criteria/operator"  value="="/>
			</td>
			
	
	</tr>
	
	  <tr>
            <td class="td2" align="right">����ʱ�䣺</td> 
			<td class="td1"  >��<html:text property="QueryStudent/BeginTime/criteria/min" attributesText='class="input" size="10"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["QueryStudent/BeginTime/criteria/min"],"yyyy-MM-dd")>
             	��<html:text property="QueryStudent/BeginTime/criteria/max" attributesText='class="input" size="10"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["QueryStudent/BeginTime/criteria/max"],"yyyy-MM-dd")>  
                <html:hidden property="QueryStudent/BeginTime/criteria/operator" value="between" />
			    <html:hidden property="QueryStudent/BeginTime/criteria/criteriaPattern" value="yyyy-MM-dd" />
             	</td>
            <td class="td2" align="right">�Ͻ�ҵʱ�䣺</td> 
			<td class="td1"  >��<html:text property="QueryStudent/EndTime/criteria/min" attributesText='class="input" size="10"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["QueryStudent/EndTime/criteria/min"],"yyyy-MM-dd")>
             	��<html:text property="QueryStudent/EndTime/criteria/max" attributesText='class="input" size="10"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["QueryStudent/EndTime/criteria/max"],"yyyy-MM-dd")>  
                <html:hidden property="QueryStudent/EndTime/criteria/operator" value="between" />
			    <html:hidden property="QueryStudent/EndTime/criteria/criteriaPattern" value="yyyy-MM-dd" />
			</td>
			
	
	</tr>
        </table>
	  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" >
          <tr> 
            <td  align="left" nowrap class="text">
            
			    ���������<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""> 
			    <input name="query" type="button" class="button_02" value="�� ѯ" onclick="talentquery()">
                <input name="query" type="button" class="button_02" value="�� ��" onClick="talentview()">
				<input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">
				
			</td>
          </tr>
        </table></td></tr>
        
        <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">
        
     <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail" >
                <tr class="td_title"> 
                  <td width="2%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                 
                  <td width="10%" align="center" nowrap id="QueryStudent.operatorname" onClick="talentsort()">����</td>
                  <td width="5%" align="center" nowrap id="QueryStudent.Sex" onClick="talentsort()">�Ա�</td>
                  <td width="9%" align="center" nowrap id="QueryStudent.Birthdate" onClick="talentsort()">��������</td>
                  <td width="13%" align="center" nowrap id="QueryStudent.DegreeID" onClick="talentsort()">�Ļ��̶�</td>
                  <td width="15%" align="center" nowrap id="QueryStudent.WorkingOrgan" onClick="talentsort()">������λ</td>
                  <td width="17%" align="center" nowrap id="QueryStudent.Duty" onClick="talentsort()">ְ��</td>
                  <td width="17%" align="center" nowrap id="QueryStudent.Duty" onClick="talentsort()">�༶</td>
                  <td width="10%" align="center" nowrap id="QueryStudent.TeamID" onClick="talentsort()">����</td>
                </tr>
				<%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
				<logic:iterate id="resultset" property="list[@type='student']">
					<%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
                <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="QueryStudent/StudentID"/>','true')"> 
                  <td align="center">
				  <logic:present  id="resultset" property="QueryStudent/StudentID">
				  	<html:checkbox id="resultset" name="list[@name='update']/QueryStudent/StudentID" property="QueryStudent/StudentID" indexed="true"/>
				  </logic:present>
				  </td>                
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/operatorname"/></td>
                  <td nowrap>&nbsp;<dict:write businTypeId="BNDICT_gender" property="QueryStudent/Sex" id="resultset"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/Birthdate" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>  
                  <td nowrap>&nbsp;<dict:write businTypeId="dx_education" property="QueryStudent/DegreeID" id="resultset"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/WorkingOrgan" maxLength="16"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/Duty" maxLength="16"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/ClassName" maxLength="16"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/TeamName" /></td>
                </tr>
				</logic:iterate>
                
              </table>
               <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="30" class="text">
              <script>
				PageCond(document.forms[0]);
		     </script>
            </td>
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
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>
<script>
//��ѯ
function queryStudent(){
	var frm =document.forms[0];
	processError(frm);
	if(frm.elements["PageCond/begin"] && frm.elements["PageCond/count"] && frm.elements["PageCond/length"]) {
		frm.elements["PageCond/begin"].value=0;
		frm.elements["PageCond/count"].value=-1;
		if(frm.elements["PageCond/talentlength"]) {
			frm.elements["PageCond/length"].value = frm.elements["PageCond/talentlength"].value;
		}else{
			frm.elements["PageCond/length"].value=10;
		}
		if(frm.elements["queryaction"]) {
			frm.action = frm.elements["queryaction"].value;
		}
		if(frm.elements["QueryStudent/fccsearch"].value=="����������ѧ��"){
			frm.elements["QueryStudent/fccsearch"].value="";
		}
		event.srcElement.blur();
		frm.submit();
	}

}
</script>