<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="teachWorkManage.prSearch.studentByUnitList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">�������&gt;��ѯͳ�ơ�&gt;��ѵ��λ��ѯ</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
      	<input type="hidden" name="queryaction" value="teachWorkManage.prSearch.studentByUnitList.do">
		<html:hidden property="StudentByUnit/_order/col1/field"/>
		<html:hidden property="StudentByUnit/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
	  </td>
    </tr>
  </table>


<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
    
    <tr><td>
    
       <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" >
         <tr>
            <td  class="td2" align="right" width="20%">	 ��&nbsp;&nbsp;&nbsp;&nbsp;���� </td>
			<td class="td1"  width="30%"><html:text property="StudentByUnit/StudentName/criteria/value" attributesText='class="input"' size="20"/>
			   <input type="hidden" name="StudentByUnit/StudentName/criteria/operator" value="like">
			   <input type="hidden" name="StudentByUnit/StudentName/criteria/likeRule" value="center"></td>
		   <td class="td2" align="right">�������£�</td> 
			<td class="td1"  >��<html:text property="StudentByUnit/Birthdate/criteria/min" attributesText='class="input" size="10"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["StudentByUnit/Birthdate/criteria/min"],"yyyy-MM-dd")>
             	��<html:text property="StudentByUnit/Birthdate/criteria/max" attributesText='class="input" size="10"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["StudentByUnit/Birthdate/criteria/max"],"yyyy-MM-dd")>  
                <html:hidden property="StudentByUnit/Birthdate/criteria/operator" value="between" />
			    <html:hidden property="StudentByUnit/Birthdate/criteria/criteriaPattern" value="yyyy-MM-dd" />
             	</td></tr>
           <tr>
             <td  class="td2" align="right"> ��&nbsp;&nbsp;&nbsp;&nbsp;�� </td>
			<td class="td1"><dict:radio businTypeId="BNDICT_gender" property="StudentByUnit/Sex/criteria/value" modifiable="true"  value="2"/>
			   <input type="hidden" name="StudentByUnit/Sex/criteria/operator" value="=">
			   </td>
		  <td class="td2" align="right">ְ&nbsp;&nbsp;&nbsp;&nbsp;�� </td> 
			<td class="td1" ><html:text property="StudentByUnit/Duty/criteria/value" attributesText='class="input" size="20"'/>
                <html:hidden property="StudentByUnit/Duty/criteria/operator" value="like" />
			    <html:hidden property="StudentByUnit/Duty/criteria/likeRule" value="center" />
             	</td>
           </tr>
            <tr>
             <td  class="td2" align="right">ְ&nbsp;&nbsp;&nbsp;&nbsp;���� </td>
			<td class="td1" colspan="3"><dict:select businTypeId="dx_dutylevel" property="StudentByUnit/dutylevel/criteria/value" nullOption="true" nullLabel="--��ѡ��--" /> 
			   <input type="hidden" name="StudentByUnit/dutylevel/criteria/operator" value="=">
			   </td>
		 
           </tr>
           <tr>
            <td  class="td2" align="right"> ��ѵ��λ�� </td>
			<td class="td1"><html:select property="StudentByUnit/Commission/criteria/value"  attributesText='ValidateType="notempty" Msg="�༶���Ʋ���Ϊ��" '> 
              <html:option value="">--��ѡ��--</html:option> <html:options property="list[@type='Commission']/Commission/Commission" labelProperty="list[@type='Commission']/Commission/Commission"/> 
              </html:select>
			   <input type="hidden" name="StudentByUnit/Commission/criteria/operator" value="like">
			   <input type="hidden" name="StudentByUnit/Commission/criteria/likeRule" value="center"></td>
		  <td class="td2" align="right">��ѵʱ�䣺</td> 
			<td class="td1" >��<html:text property="StudentByUnit/CommissTime/criteria/min" attributesText='class="input" size="10"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["StudentByUnit/CommissTime/criteria/min"],"yyyy-MM-dd")> 
                ��<html:text property="StudentByUnit/CommissTime/criteria/max" attributesText='class="input" size="10"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["StudentByUnit/CommissTime/criteria/max"],"yyyy-MM-dd")> 
                <html:hidden property="StudentByUnit/CommissTime/criteria/operator" value="between" />
			    <html:hidden property="StudentByUnit/CommissTime/criteria/criteriaPattern" value="yyyy-MM-dd" />
             	</td></tr>
        </table>
    
    
    </td></tr>
      <tr>
        <td class="text">
          <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" >
          <tr> 
            <td  align="left" nowrap class="text">
            
			    ���������<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""> 
			    <input name="query" type="button" class="button_02" value="�� ѯ" onclick="talentquery()"> 
				<input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">
				
			</td>
          </tr>
        </table>
         </td>
      </tr>
     
	  <tr>
            <td  class="text" align="center">
            <b> <span id="printTable"><bean:write  property="StudentByUnit/Commission/criteria/value"/>��ѵ����</span></b><br/>
            <logic:notEqual property="StudentByUnit/CommissTime/criteria/min" value="">
            <font color="red">(<bean:write  property="StudentByUnit/CommissTime/criteria/min" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/> �� <bean:write  property="StudentByUnit/CommissTime/criteria/max" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>)</font>
            </logic:notEqual>
            </td>
    </tr>
     
      <tr>
        <td valign="top" class="text">
        <logic:notPresent property="input/isFirst">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="5%" align="center" nowrap id="StudentByUnit.StudentName" onClick="talentsort()">����</td>
                  <logic:equal property="StudentByUnit/Commission/criteria/value" value="">
                  <td width="20%" align="center" nowrap id="StudentByUnit.Commission" onClick="talentsort()">��ѵ��λ</td>
                  </logic:equal>
                  <td width="10%" align="center" nowrap id="StudentByUnit.Duty" onClick="talentsort()">ְ��</td>
                  <td width="5%" align="center" nowrap id="StudentByUnit.DegreeID" onClick="talentsort()">�Ļ��̶�</td>
                  <td width="5%" align="center" nowrap id="StudentByUnit.EduLevel" onClick="talentsort()">ѧλ</td>
                  <td width="25%" align="center" nowrap id="StudentByUnit.ClassName" onClick="talentsort()">���ڰ༶</td>
                  <td width="5%" align="center" nowrap id="StudentByUnit.HeadTeacherName" onClick="talentsort()">������</td>
                  <td width="10%" align="center" nowrap id="StudentByUnit.Birthdate" onClick="talentsort()">��������</td>
                  <td width="5%" align="center" nowrap id="StudentByUnit.Sex" onClick="talentsort()">�Ա�</td>
                  <td width="10%" align="center" nowrap id="StudentByUnit.CommissTime" onClick="talentsort()">��ѵʱ��</td>
                </tr>
				<%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
				<logic:iterate id="resultset" property="list[@type='StudentByUnit']">
					<%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
                 <tr class="<%=trClass%>" onClick="changeTRBgColor(this)"> 
                  <td nowrap="nowrap" >&nbsp;<bean:write id="resultset" property="StudentByUnit/StudentName"/></td>
                  <logic:equal property="StudentByUnit/Commission/criteria/value" value="">
                  <td >&nbsp;<bean:write id="resultset" property="StudentByUnit/Commission"/></td>
                   </logic:equal>
                  <td >&nbsp;<bean:write id="resultset" property="StudentByUnit/Duty" /></td>
                  <td >&nbsp;<dict:write businTypeId="dx_education" id="resultset" property="StudentByUnit/DegreeID"  /></td>
                  <td >&nbsp;<bean:write id="resultset" property="StudentByUnit/EduLevel" /></td>
                  <td >&nbsp;<bean:write id="resultset" property="StudentByUnit/ClassName" /></td>
                  <td nowrap="nowrap">&nbsp;<bean:write id="resultset" property="StudentByUnit/HeadTeacherName" /></td>
                  <td >&nbsp;<bean:write id="resultset" property="StudentByUnit/Birthdate" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                  <td >&nbsp;<dict:write businTypeId="BNDICT_gender" property="StudentByUnit/Sex" id="resultset"/></td>
				  <td >&nbsp;<bean:write id="resultset" property="StudentByUnit/CommissTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
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
		  </logic:notPresent>
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
	loadOrderImg(document.forms[0],'StudentByUnit');
</script>