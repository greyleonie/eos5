<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="teachWorkManage.prSearch.studentInfoList.do" name="opeForm">
<table width="100%"  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" id="beforefixtable1">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable" >
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ -&gt; ������� -&gt; ��ѯͳ��
              -&gt; ѧԱ��Ϣ��ѯ</td> 
          </tr>
      </table></td>
    </tr>
    
     <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="teachWorkManage.prSearch.studentInfoList.do">
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
        <td class="text">
         <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
        <tr>
            <td class="td2" align="right">��&nbsp;&nbsp;&nbsp;&nbsp;����</td>
            <td class="td1" colspan="3" >
             <html:select property="QueryStudent/ClassID/criteria/value" onchange="talentquery()" attributesText='id="printTable"'> 
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
			<td class="td2" align="right">ѧ&nbsp;&nbsp;&nbsp;&nbsp;�ţ�</td> 
			<td class="td1" >  <html:text property="QueryStudent/StudentNO" attributesText='class="input" size="30"'/>
			<html:hidden property="QueryStudent/StudentNO/criteria/operator" value="like" />
			<html:hidden property="QueryStudent/StudentNO/criteria/likeRule" value="center" />
			
			</td>
	
	</tr>
		  <tr>
            <td class="td2" align="right">�������£�</td> 
			<td class="td1"  >��<html:text property="QueryStudent/Birthdate/criteria/min" attributesText='class="input" size="20"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["QueryStudent/Birthdate/criteria/min"],"yyyy-MM-dd")>
             	��<html:text property="QueryStudent/Birthdate/criteria/max" attributesText='class="input" size="20"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["QueryStudent/Birthdate/criteria/max"],"yyyy-MM-dd")>  
                <html:hidden property="QueryStudent/Birthdate/criteria/operator" value="between" />
			    <html:hidden property="QueryStudent/Birthdate/criteria/criteriaPattern" value="yyyy-MM-dd" />
             	</td>
            <td class="td2" align="right">�Ƿ���ѧ��</td> 
			<td class="td1"  ><html:radio property="QueryStudent/IsQuit/criteria/value"  value="1"/>�� <html:radio property="QueryStudent/IsQuit/criteria/value"  value="0" />��<html:radio property="QueryStudent/IsQuit/criteria/value"  value="" checked="true"/>ȫ��
			<html:hidden property="QueryStudent/IsQuit/criteria/operator"  value="="/>
			</td>
			
	
	</tr>
        </table>
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="30" class="text" align="center">
				<input name="query" type="button" class="button_02" value="�� ѯ" onclick="talentquery()">
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