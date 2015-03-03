<%@include file="/internet/common.jsp"%><%
String column = base.util.TalentContext.getValue(pageContext,null,"News/Columns");
String ret = base.util.TalentContext.getValue(pageContext,null,"ret");
String orgID=base.util.TalentContext.getValue(pageContext,null,"SessionEntity/DepartmentName");
String name = column.substring(column.length()-2,column.length());
%>
<script src="/internet/editor/KindEditor/kindeditor.js"></script>
		<script type="text/javascript">
			KE.show( {
				id :'content1'
			});
		</script>

<FORM action=oa.prNews.noticeModifyDo.do method=post encType=multipart/form-data><html:hidden property="News/Content"></html:hidden><html:hidden property="News/Columns"></html:hidden><html:hidden property="News/_order/col1/field"></html:hidden><html:hidden property="News/_order/col1/desc"></html:hidden><html:hidden property="PageCond/begin"></html:hidden><html:hidden property="PageCond/count"></html:hidden><html:hidden property="PageCond/length"></html:hidden><html:hidden property="News/NewsID"></html:hidden>

<TABLE width="100%" cellPadding="0" border="0" cellSpacing="0">
<TBODY>
<TR>
<TD height="24" background="/internet/image/lz_bg.gif">
<TABLE width="100%" cellPadding="0" border="0" cellSpacing="0">
<TBODY>
<TR>
<TD width="15"></TD>
<TD class="text_wirte">首页—&gt;办公系统—&gt;校院信息—&gt;<%=column%>—&gt;<%=name%>修改</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
<TABLE width="100%" cellPadding="0" align="center" border="0" cellSpacing="0">
<TBODY>
<TR>
<TD height="28"></TD></TR>
<TR>
<TD class="text">
<TABLE width="90%" cellPadding="0" align="center" border="0" cellSpacing="1" bgColor="#a2c4dc">
<TBODY>
<TR onclick=changeTRBgColor(this)>
<TD width="13%" height="30" align="right" class="td2">标题：</TD>
<TD width="87%" class="td1">&nbsp; <html:text property="News/Title" attributesText='class="input" size="80" ValidateType="notempty" Msg="标题不能为空"' maxlength="50"></html:text><SPAN class=text_red>*</SPAN></TD></TR>
<TR>
<TD width="13%" height="30" align="right" class="td2">副标题：</TD>
<TD width="87%" class="td1">&nbsp; <html:text property="News/Subhead" attributesText='class="input" size="80"' maxlength="50"></html:text></TD></TR>
<TR onclick=changeTRBgColor(this)>
<TD width="13%" height="94" align="right" class="td2">通知内容：</TD>
<TD width="87%" class="td1"><textarea id="content1" style="width:700px;height:300px;visibility:hidden;"></textarea></TD></TR>
<script type="text/javascript">
	var content=document.getElementById('News/Content').value;
	document.getElementById('content1').value=content;
</SCRIPT>
<TR>
<TD width="13%" height="30" align="right" class="td2">部门：</TD>

<TD width="87%" class="td1">&nbsp; <html:select property="News/Department" styleClass="input" value="<%= orgID%>"> 
             <html:options property="list[@type='TeachGroup']/TeachGroup/orgID" labelProperty="list[@type='TeachGroup']/TeachGroup/orgName"/> 
              </html:select>&nbsp;<SPAN class=td2>默认本部门</SPAN></TD></TR></TBODY></TABLE>
<TABLE width="100%" cellPadding="0" height="50" border="0" cellSpacing="0">
<TBODY>
<TR>
<TD height="49" align="middle"><INPUT value="保 存" type="button" class="button_02" onclick="save()" name="Button"> <INPUT value="返 回" type="button" class="button_02" onclick="window.location.href='oa.prNews.noticeList.do?NewsOrg/Columns/criteria/value=<%=column%>'" name="Submit2"> </TD></TR></TBODY></TABLE></TD></TR>
<TR>
<TD class="text">&nbsp; </TD></TR></TBODY></TABLE></FORM>

<SCRIPT>
  
  function turnto(str){
	reg1 = /\n\r/gi;
	reg2=/'/gi;
	str = str.replace(reg1,"");
	str = str.replace(reg2,"’");
	return str;
  }
    
  function save() {
  	var frm = document.forms[0];
  	var content=KE.util.getData('content1');
	frm.elements["News/Content"].value = content;
	if(validater(frm)) frm.submit();
  
  }
  
  </SCRIPT>