<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="teachWorkManage.prBookManage.issueList.do">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;�̲Ĺ���&gt;<span id="printTable">�̲ķ��ű�</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="teachWorkManage.prBookManage.issueList.do">
		<input type="hidden" name="addaction" value="teachWorkManage.prBookManage.issueAdd.do">
		<input type="hidden" name="modifyaction" value="teachWorkManage.prBookManage.issueModify.do">
		<input type="hidden" name="deleteaction" value="teachWorkManage.prBookManage.issueDelete.do">
		<html:hidden property="TextbookIssueDetail/_order/col1/field"/>
		<html:hidden property="TextbookIssueDetail/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
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
           ����ʱ�䣺 ��
            	<html:text property="TextbookIssueDetail/IssueTime/criteria/min" attributesText='class="input" size="10" ' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["TextbookIssueDetail/IssueTime/criteria/min"],"yyyy-MM-dd")> 
           		��
           		<html:text property="TextbookIssueDetail/IssueTime/criteria/max" attributesText='class="input" size="10"' readonly="true"/>
          	    <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["TextbookIssueDetail/IssueTime/criteria/max"],"yyyy-MM-dd")>
			    <input type="hidden" name="TextbookIssueDetail/IssueTime/criteria/operator" value="between"/>
			    <input type="hidden" name="TextbookIssueDetail/IssueTime/criteria/criteriaPattertn" value="yyyy-MM-dd"/>
			 ������
			<html:text property="TextbookIssueDetail/Title/criteria/value" attributesText='class="input" size="20" '/>
            <html:hidden property="TextbookIssueDetail/Title/criteria/operator" value="like"/>
            <html:hidden property="TextbookIssueDetail/Title/criteria/likeRule" value="center"/><br>
            �༶��
			<html:select property="TextbookIssueDetail/DepartOrClass/criteria/value" attributesText='class="input"'>
			 <html:option value=""></html:option>
			 <html:options property="list[@type='Class']/Class/ClassShortName" labelProperty="list[@type='Class']/Class/ClassShortName"/>
			</html:select>
			<html:hidden property="TextbookIssueDetail/DepartOrClass/criteria/operator" value="like"/>
            <html:hidden property="TextbookIssueDetail/DepartOrClass/criteria/likeRule" value="center"/>
			���ţ�
			<html:select property="TextbookIssueDetail/DepartOrClass/criteria/value" attributesText='class="input"'>
			<html:option value=""></html:option>
			 <html:options property="list[@type='Department']/Department/Department" labelProperty="list[@type='Department']/Department/Department"/>
			</html:select><br/>
            
			    <input name="query" type="button" class="button_02" value="�� ѯ" onClick="talentquery()">
 <qx:talentButton property="add" type="button" styleClass="button_02" value="�� ��" onclick="talentadd()" operation="DX_TEACH_MANAGE_BOOK_ISSUE.DX_TEACH_MANAGE_BOOK_ISSUE_ADD"/>
                <qx:talentButton property="modify" type="button" styleClass="button_02" value="�� ��" onclick="talentmodify()" operation="DX_TEACH_MANAGE_BOOK_ISSUE.DX_TEACH_MANAGE_BOOK_ISSUE_MODIFY"/> 
              	<qx:talentButton property="delete" type="button" styleClass="button_02" value="ɾ ��" onclick="talentdelete()" operation="DX_TEACH_MANAGE_BOOK_ISSUE.DX_TEACH_MANAGE_BOOK_ISSUE_DELETE"/>
              	
				<input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">
				���������<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""> 
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text" >
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="3%" align="center" nowrap><input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""></td>
                  <td width="22%" align="center" nowrap id="TextbookIssueDetail.Title" onClick="talentsort()">�� ��</td>
                  <td width="10%" align="center" nowrap id="TextbookIssueDetail.Author" onClick="talentsort()">�� ��</td>
                  <td width="10%" align="center" nowrap id="TextbookIssueDetail.Publisher" onClick="talentsort()">������</td>
                  <td width="5%" align="center" nowrap id="TextbookIssueDetail.TextbookType" onClick="talentsort()">�� ��</td>
                  <td width="5%" align="center" nowrap id="TextbookIssueDetail.IssueNum" onClick="talentsort()">������</td>
                  <td width="5%" align="center" nowrap id="TextbookIssueDetail.Price" onClick="talentsort()">����</td>
                  <td width="5%" align="center" nowrap id="TextbookIssueDetail.TotalPrice" onClick="talentsort()">���</td>
                  <td width="10%" align="center" nowrap id="TextbookIssueDetail.IssueTime" onClick="talentsort()">����ʱ��</td>
                  <td width="15%" align="center" nowrap id="TextbookIssueDetail.DepartOrClass" onClick="talentsort()">ʹ�ð༶/����</td>
                  <td width="10%" align="center" nowrap id="TextbookIssueDetail.Remarks" onClick="talentsort()">�� ע</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='issuedetail']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" >  
                <td align="center"> 
					<logic:present  id="resultset" property="TextbookIssueDetail/IssueID"> 
                  		<html:checkbox id="resultset" name="list[@type='update']/TextbookIssueDetail/IssueID" property="TextbookIssueDetail/IssueID" indexed="true"/> 
                  	</logic:present> 
				</td>
                  <td  nowrap > <bean:write id="resultset" property="TextbookIssueDetail/Title" /></td>
                  <td  nowrap > <bean:write id="resultset" property="TextbookIssueDetail/Author" /></td>
                  <td  nowrap > <bean:write id="resultset" property="TextbookIssueDetail/Publisher" /></td>
                  <td  nowrap > <bean:write id="resultset" property="TextbookIssueDetail/TextbookType" /></td>
                  <td  nowrap > <bean:write id="resultset" property="TextbookIssueDetail/IssueNum" /></td>
                  <td  nowrap > <bean:write id="resultset" property="TextbookIssueDetail/Price" language="zh" country="CN" /></td>
                  <td  nowrap > <bean:write id="resultset" property="TextbookIssueDetail/TotalPrice" language="zh" country="CN"/></td>
                  <td  nowrap > <bean:write id="resultset" property="TextbookIssueDetail/IssueTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd" /></td>
                  <td  nowrap > <bean:write id="resultset" property="TextbookIssueDetail/DepartOrClass" /></td>
                  <td  nowrap > <bean:write id="resultset" property="TextbookIssueDetail/Remarks" /></td>
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
function talentaddNew() {
	var frm = document.forms[0];
	frm.action = frm.elements["addaction"].value ;
   	frm.submit();

}
</script>
<script>
	loadOrderImg(document.forms[0],'QueryTextbookOrder');
</script>