<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="studentmanage.student_xj.teamModifyDo.do">
  <html:hidden property="Team/TeamID"/>
  <html:hidden property="Team/ClassID"/>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">学员管理—&gt;学籍管理—&gt;班组修改</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          
          <tr  onClick="changeTRBgColor(this)">
            <td width="15%" align="right" class="td2">班级：</td>
            <td width="85%" class="td1">
            <bean:write property="Class/ClassName"/>
			</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">组名：</td>
            <td class="td1">
             <html:select property="Team/TeamName">
               <html:option value="第一组">第一组</html:option>
               <html:option value="第二组">第二组</html:option>
               <html:option value="第三组">第三组</html:option>
               <html:option value="第四组">第四组</html:option>
               <html:option value="第五组">第五组</html:option>
               <html:option value="第六组">第六组</html:option>
               <html:option value="第七组">第七组</html:option>
               <html:option value="第八组">第八组</html:option>
               <html:option value="第九组">第九组</html:option>
               <html:option value="第十组">第十组</html:option>
                <html:option value="第十一组">第十一组</html:option>
               <html:option value="第十二组">第十二组</html:option>
                <html:option value="第十三组">第十三组</html:option>
                 <html:option value="第十四组">第十四组</html:option>
                  <html:option value="第十五组">第十五组</html:option>
            </html:select>  <span class="text_red">*</span></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">讨论室：</td>
            <td class="td1">
            <html:select property="Team/RoomID"  attributesText='id="printTable"'> 
              <html:options property="list[@type='Room']/Room/RoomID" labelProperty="list[@type='Room']/Room/RoomName"/> 
              </html:select>
            </td>
          </tr>
          
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Submit" type="submit" class="button_02" value="保 存">
                <input name="Submit2" type="button" class="button_02" value="返 回" onClick="javascript:history.go(-1)">
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
//validater函数功能
//用法:ValidateType="alphanumeric,email",Msg="必须是字母数字;邮件"
//验证类型有:url,postalcode,phone,money,int,notempty,email,numeric
//function validater(frmObj)
  function save() {
  	var frm = document.forms[0];
  	
	if(validater(frm)) frm.submit();
  
  }
 
  </script>
 