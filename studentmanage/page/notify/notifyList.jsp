<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="studentmanage.prNotify.notifyList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">ѧԱ����&gt;�༶֪ͨ��&gt;֪ͨ�б�</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="studentmanage.prNotify.notifyList.do">
		<input type="hidden" name="viewaction" value="studentmanage.prNotify.notifyView.do">
		<input type="hidden" name="addaction" value="studentmanage.prNotify.notifyAdd.do">
		<input type="hidden" name="modifyaction" value="studentmanage.prNotify.notifyModify.do">
		<input type="hidden" name="deleteaction" value="studentmanage.prNotify.notifyDelete.do">
		<html:hidden property="QueryClassNotify/_order/col1/field"/>
		<html:hidden property="QueryClassNotify/_order/col1/asc" />
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
            <td class="text">�ࡡ������ <html:select property="QueryClassNotify/ClassID/criteria/value"  attributesText='id="printTable"'> 
              <html:option value="-1">--��ѡ��༶--</html:option> <html:options property="list[@type='studentclass']/Class/ClassID" labelProperty="list[@type='studentclass']/Class/ClassName"/> 
              </html:select> &nbsp;
			  ֪ͨ���ݲ�ѯ�� 
			    <html:text property="QueryClassNotify/Content/criteria/value" attributesText='class="input"'/>
			  <html:hidden property="QueryClassNotify/Content/criteria/operator" value="like"/>
			  <html:hidden property="QueryClassNotify/Content/criteria/likeRule" value="center"/>
			  &nbsp;
			 
			  ���������<input type="checkbox" name="checkbox" onclick="servertoorder()" marked="">			 </td>
      </tr>
	  <tr>
            <td height="30" class="text">
				
			    ����ʱ�䣺 <html:text property="QueryClassNotify/ChangeTime/criteria/min" attributesText='class="input" size="14"' readonly="true"/>
            <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onclick=calendar(document.forms[0].elements["QueryClassNotify/ChangeTime/criteria/min"],"yyyy-MM-dd")>
                ��
				<html:text property="QueryClassNotify/ChangeTime/criteria/max" attributesText='class="input" size="14"' readonly="true"/>
            <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onclick=calendar(document.forms[0].elements["QueryClassNotify/ChangeTime/criteria/max"],"yyyy-MM-dd")>
               <html:hidden property="QueryClassNotify/ChangeTime/criteria/criteriaPattern" value="yyyy-MM-dd"/> 
               <html:hidden property="QueryClassNotify/ChangeTime/criteria/operator" value="between"/> 
			    <input name="query" type="button" class="button_02" value="�� ѯ" onclick="talentquery()">
			    <qx:talentButton property="add" type="button"    styleClass="button_02" value="�� ��" onclick="talentaddNew()" operation="DX_STUDENT_MANAGE_NOTIFY.DX_STUDENT_MANAGE_NOTIFY_ADD" />
				<qx:talentButton property="modify" type="button" styleClass="button_02" value="�� ��" onclick="talentmodify()" operation="DX_STUDENT_MANAGE_NOTIFY.DX_STUDENT_MANAGE_NOTIFY_MODIFY" />
			    <qx:talentButton property="delete" type="button" styleClass="button_02" value="ɾ ��" onclick="talentdelete()" operation="DX_STUDENT_MANAGE_NOTIFY.DX_STUDENT_MANAGE_NOTIFY_DEL" />
	    <input name="view" type="button" class="button_02" value="�� ��" onclick="talentview()">
	    		<input name="ieprint" type="button" class="button_02" value="�� ӡ" onclick="iePrint()">
				<input name="export" type="button" class="button_02" value="�� ��" onclick="exporttoexcel()">
					</td>
      </tr>
	 
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="5%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onclick="eosCheckAll(document.forms[0],this)" marked="">                  </td>
                  <td width="55%" align="center" nowrap id="QueryClassNotify.Content" onclick="talentsort()">֪ͨ����ժҪ</td>
                  <td width="10%" align="center" nowrap id="QueryClassNotify.CreatorName" onclick="talentsort()">������</td>
                  <td width="15%" align="center" nowrap id="QueryClassNotify.ChangeTime" onclick="talentsort()">����ʱ��</td>
                  <td width="15%" align="center" nowrap id="QueryClassNotify.PublishTime" onclick="talentsort()">����ʱ��</td>
                  
                </tr>
				<%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
				<logic:iterate id="resultset" property="list[@type='QueryClassNotify']">
					<%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
                <tr class="<%=trClass%>" onclick="changeTRBgColor(this)"  onDblClick="talentviewf('<bean:write id="resultset" property="QueryClassNotify/ClassNotifyID"/>','true')"> 
                  <td align="center">
				  <logic:present  id="resultset" property="QueryClassNotify/ClassNotifyID">
				  	<html:checkbox id="resultset" name="list[@name='update']/QueryClassNotify/ClassNotifyID" property="QueryClassNotify/ClassNotifyID" indexed="true"/>
				  </logic:present>				  </td>
                  <td >&nbsp;<bean:write id="resultset" property="QueryClassNotify/Content" maxLength="100"/></td>
                  <td nowrap align="center"><bean:write id="resultset" property="QueryClassNotify/CreatorName" /></td>
                  <td nowrap align="center"><bean:write id="resultset" property="QueryClassNotify/ChangeTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                  <td nowrap align="center"><bean:write id="resultset" property="QueryClassNotify/PublishTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                  
                  </tr>
				</logic:iterate>
              </table>
          <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="30" class="text">
			  <script>
				PageCond(document.forms[0]);
		  </script>			  </td>
            </tr>
          </table>		  </td>
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
	if(frm.elements["QueryClassNotify/ClassID/criteria/value"].value == "-1") {
		alert("��ѡ��༶");
		return
	}
	var sel = frm.elements["QueryClassNotify/ClassID/criteria/value"];
	var className = sel.options[sel.options.selectedIndex].text;
	frm.action = frm.elements["addaction"].value + "?ClassNotify/ClassName=" + className;
   	frm.submit();

}

</script>