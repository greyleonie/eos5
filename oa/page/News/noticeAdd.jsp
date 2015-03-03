<%@include file="/internet/common.jsp"%>
<%
String column = request.getParameter("NewsOrg/Columns");

String orgID=base.util.TalentContext.getValue(pageContext,null,"SessionEntity/orgID");
String name = column.substring(column.length()-2,column.length());
%>
<script src="/internet/editor/KindEditor/kindeditor.js"></script>
		<script type="text/javascript">
			KE.show( {
				id :'content1'
			});
		</script>
<form method="post" enctype="multipart/form-data" action="oa.prNews.noticeAddDo.do">
        <input type="hidden" name="News/Content">
        <input type="hidden" name="News/Columns" value="<%=column%>">
		<html:hidden property="News/_order/col1/field"/>
		<html:hidden property="News/_order/col1/desc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />

  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;办公系统—&gt;校院信息—&gt;<%=column%>—&gt;新增<%=name%></td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="28"> </td>
    </tr>
    <tr>
      <td class="text"><table width="90%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="30" align="right" class="td2">标题：</td>
            <td width="87%" class="td1">&nbsp;
            <html:text property="News/Title" maxlength="50" attributesText='class="input" size="80" ValidateType="notempty" Msg="标题不能为空"'/>
            <span class="text_red">*</span></td>
          </tr>
         <tr>
          <td width="13%" height="30" align="right" class="td2">副标题：</td>
           <td width="87%" class="td1">&nbsp;
            <html:text property="News/Subhead" maxlength="50" attributesText='class="input" size="80"'/></td>
         </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="94" align="right" class="td2">通知内容：</td>
            <td width="87%" class="td1">
            <textarea id="content1" style="width:700px;height:300px;visibility:hidden;"></textarea>
            </td>
          </tr>
         
           <tr>
          <td width="13%" height="30" align="right" class="td2">部门：</td>
            <td  width="87%"  class="td1" >
                      <html:select property="News/Department" styleClass="input" value="<%= orgID%>"> 
             <html:options property="list[@type='TeachGroup']/TeachGroup/orgID" labelProperty="list[@type='TeachGroup']/TeachGroup/orgName"/> 
              </html:select>

      
         </tr>
        
          </table>
          <table width="100%" height="50"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="49" align="center"><input name="Button" type="button" class="button_02" value="保 存" onClick="save()">
                <input name="Submit2" type="button" class="button_02" value="返 回" onClick="window.location.href='oa.prNews.noticeList.do?NewsOrg/Columns/criteria/value=<%=column%>'">
              </td>
            </tr>
            
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;
        </td>
    </tr>
  </table>
  </form>
 
  <script>
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
  

  </script>
 