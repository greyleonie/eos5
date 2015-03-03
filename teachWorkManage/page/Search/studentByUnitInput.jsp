<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="teachWorkManage.prSearch.studentByUnitList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">教务管理—&gt;查询统计—&gt;参训名册查询</td>
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


<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td class="text">
         <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
         <tr>
            <td  class="td2" align="right" width="20%">	 姓&nbsp;&nbsp;&nbsp;&nbsp;名： </td>
			<td class="td1"  width="30%"><html:text property="StudentByUnit/StudentName/criteria/value" attributesText='class="input"' size="20"/>
			   <input type="hidden" name="StudentByUnit/StudentName/criteria/operator" value="like">
			   <input type="hidden" name="StudentByUnit/StudentName/criteria/likeRule" value="center"></td>
		  <td class="td2" align="right"  width="20%">出生年月：</td> 
			<td class="td1"   width="30%"><html:text property="StudentByUnit/Birthdate/cirteria/value" attributesText='class="input" size="20"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["StudentByUnit/Birthdate/cirteria/value"],"yyyy-MM-dd")> 
                <html:hidden property="StudentByUnit/Birthdate/criteria/operator" value="=" />
			    <html:hidden property="StudentByUnit/Birthdate/criteria/criteriaPattern" value="yyyy-MM-dd" />
             	</td></tr>
           <tr>
             <td  class="td2" align="right"> 性&nbsp;&nbsp;&nbsp;&nbsp;别： </td>
			<td class="td1"><dict:radio businTypeId="BNDICT_gender" property="StudentByUnit/Sex" modifiable="true" value="1"/>
			   <input type="hidden" name="StudentByUnit/Sex/criteria/operator" value="=">
			   </td>
		  <td class="td2" align="right">职&nbsp;&nbsp;&nbsp;&nbsp;务： </td> 
			<td class="td1" ><html:text property="StudentByUnit/Duty/cirteria/value" attributesText='class="input" size="20"'/>
                <html:hidden property="StudentByUnit/Duty/criteria/operator" value="like" />
			    <html:hidden property="StudentByUnit/Duty/criteria/likeRule" value="center" />
             	</td>
           </tr>
            <tr>
             <td  class="td2" align="right">职&nbsp;&nbsp;&nbsp;&nbsp;级： </td>
			<td class="td1"><dict:select businTypeId="dx_dutylevel" property="StudentByUnit/EduLevel" nullOption="true" nullLabel="--请选择--" /> 
			   <input type="hidden" name="StudentByUnit/EduLevel/criteria/operator" value="like">
			   <input type="hidden" name="StudentByUnit/EduLevel/criteria/likeRule" value="center"></td>
		  <td class="td2" align="right">单位类别：</td> 
			<td class="td1" ><html:text property="StudentByUnit/Birthdate/cirteria/value" attributesText='class="input" size="20"' />
                <html:hidden property="StudentByUnit/Birthdate/criteria/operator" value="=" />
			    <html:hidden property="StudentByUnit/Birthdate/criteria/criteriaPattern" value="yyyy-MM-dd" />
             	</td>
           </tr>
           <tr>
            <td  class="td2" align="right"> 参训单位： </td>
			<td class="td1"><html:select property="StudentByUnit/Commission/criteria/value"  attributesText='ValidateType="notempty" Msg="班级名称不能为空" '> 
              <html:option value="">--请选择--</html:option> <html:options property="list[@type='Commission']/Commission/Commission" labelProperty="list[@type='Commission']/Commission/Commission"/> 
              </html:select>
			   <input type="hidden" name="StudentByUnit/Commission/criteria/operator" value="like">
			   <input type="hidden" name="StudentByUnit/Commission/criteria/likeRule" value="center"></td>
		  <td class="td2" align="right">参训时间：</td> 
			<td class="td1" >从<html:text property="StudentByUnit/CommissTime/criteria/min" attributesText='class="input" size="10"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["StudentByUnit/CommissTime/criteria/min"],"yyyy-MM-dd")> 
                到<html:text property="StudentByUnit/CommissTime/criteria/max" attributesText='class="input" size="10"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["StudentByUnit/CommissTime/criteria/max"],"yyyy-MM-dd")> 
                <html:hidden property="StudentByUnit/CommissTime/criteria/operator" value="between" />
			    <html:hidden property="StudentByUnit/CommissTime/criteria/criteriaPattern" value="yyyy-MM-dd" />
             	</td></tr>
        </table>
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="30" class="text" align="center">
				<input name="query" type="button" class="button_02" value="查 询" onclick="talentquery()">
            </td>
          </tr>
        </table>
        
        </td>
      </tr>
    </table>    </td>
  </tr>
</table>
</form>
</body>






	 