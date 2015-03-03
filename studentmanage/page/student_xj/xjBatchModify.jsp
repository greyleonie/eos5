<%@include file="/internet/common.jsp"%> 
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
//-->
</script>

<div id="Layer1" style="position:absolute; left:100%; top:272px; z-index:100; background-color: #FFFFFF; layer-background-color: #FFFFFF; border: 1px none #000000;"></div>
<form method="post"  action="studentmanage.student_xj.xjBatchModifyDO.do">
<html:hidden property="QueryStudent/ClassID/criteria/value"/>
<table width="200%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">学员管理—&gt;学籍管理—&gt;班级学员批量修改—&gt;<bean:write property="Class/ClassName"/></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		
		
		
	  </td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="1%" height="20">&nbsp;</td>
      <td width="99%"><table width="98%"  border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td align="center" nowrap >行号</td>
                  <td align="center" nowrap onclick="talentsort()">分组</td>
                  <td align="center" nowrap onclick="talentsort()">学号</td>
                  <td align="center" nowrap  onclick="talentsort()">姓名</td>
                  <td align="center" nowrap onclick="talentsort()">培训条形码</td>
                  <td align="center" nowrap onclick="talentsort()">性别</td>
                  <td align="center" nowrap onclick="talentsort()">出生年月</td>
                  <td align="center" nowrap onclick="talentsort()">民族</td>
                  <td align="center" nowrap onclick="talentsort()">籍贯</td>
                  <td align="center" nowrap onclick="talentsort()">文化程度</td>
                  <td align="center" nowrap onclick="talentsort()">学位</td>
                  <td align="center" nowrap onclick="talentsort()">所学专业</td>
                  <td align="center" nowrap onclick="talentsort()">工作单位</td>
                  <td align="center" nowrap onclick="talentsort()">职务</td>
                  <td align="center" nowrap onclick="talentsort()">职称</td>
                  <td align="center" nowrap onclick="talentsort()">职级</td>
                  <td align="center" nowrap onclick="talentsort()">参加工作时间</td>
                  <td align="center" nowrap onclick="talentsort()">入党时间</td>
                  <td align="center" nowrap onclick="talentsort()">党内职务</td>
                  <td align="center" nowrap onclick="talentsort()">社会职务</td>
                  <td align="center" nowrap onclick="talentsort()">单位电话</td>
                  <td align="center" nowrap onclick="talentsort()">单位地址</td>
                  <td align="center" nowrap onclick="talentsort()">单位邮编</td>
                  <td align="center" nowrap onclick="talentsort()">住宅电话</td>
                  <td align="center" nowrap onclick="talentsort()">电子邮箱</td>
                  <td align="center" nowrap onclick="talentsort()">手机</td>
                  <td align="center" nowrap onclick="talentsort()">毕（结）业证号码</td>
                  <td align="center" nowrap onclick="talentsort()">备注</td>
                </tr>
				<%
		             int count=0;
			         String trClass = "result_content"; 
		  			 String str="";
		  		%>
				<logic:iterate id="resultset" property="list[@type='QueryStudent']">
					<%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
                <tr class="<%=trClass%>" onclick="changeTRBgColor(this)" > 
                <td nowrap align="center"><%=count %></td>
                  <td align="center">
                  <html:hidden name="list[@type='Student']/Student/StudentID" id="resultset" property="QueryStudent/StudentID" indexed="true" />
               		<html:select id="resultset" name="list[@type='Student']/Student/TeamID" property="QueryStudent/TeamID" indexed="true" styleClass="input"> 
              			<html:options property="list[@type='Team']/Team/TeamID" labelProperty="list[@type='Team']/Team/TeamName"/> 
              		</html:select> 
              		</td>
				  <td nowrap><html:text name="list[@type='Student']/Student/StudentNO" id="resultset" property="QueryStudent/StudentNO" indexed="true" styleClass="input" maxlength="20" size="10"/></td>
                  <td nowrap><html:text name="list[@type='Student']/Student/operatorname" id="resultset" property="QueryStudent/operatorname" indexed="true" styleClass="input" maxlength="20" size="10" attributesText='ValidateType="notempty" Msg="姓名不能为空"'/></td>
                  <td nowrap><html:text name="list[@type='Student']/Student/Barcode" id="resultset" property="QueryStudent/Barcode" indexed="true" styleClass="input" maxlength="20" size="20"/></td>
                  <td nowrap><dict:select businTypeId="BNDICT_gender"  name="list[@type='Student']/Student/Sex"   property="QueryStudent/Sex" id="resultset"  indexed="true" styleClass="input" /></td>
                  <td nowrap>
                  	<INPUT type="text" name="list[@type='Student']/Student[@hciTagIndex='<%=count-1 %>']/Birthdate[@pattern='yyyy-MM-dd']" value='<bean:write id="resultset" property="QueryStudent/Birthdate" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>' Class="input" size="10" readonly onclick='calendar(this,"yyyy-MM-dd")' >
                  </td>
                  <td nowrap><dict:select businTypeId="dx_folk"  name="list[@type='Student']/Student/FolkID"   property="QueryStudent/FolkID" id="resultset"  indexed="true" styleClass="input" nullOption="true" nullLabel="请选择" />
                  </td>
                  <td nowrap><html:text name="list[@type='Student']/Student/NativePlace" id="resultset" property="QueryStudent/NativePlace" indexed="true" styleClass="input" maxlength="20" size="10"/></td>
                  <td nowrap>
                  	<dict:select businTypeId="dx_education"  name="list[@type='Student']/Student/DegreeID"   property="QueryStudent/DegreeID" id="resultset"  indexed="true" styleClass="input" nullOption="true" nullLabel="请选择" />
                  </td>
                  <td nowrap><html:text name="list[@type='Student']/Student/EduLevel" id="resultset" property="QueryStudent/EduLevel" indexed="true" styleClass="input" maxlength="20" size="10"/></td>
                  <td nowrap><html:text name="list[@type='Student']/Student/Major" id="resultset" property="QueryStudent/Major" indexed="true" styleClass="input" maxlength="30" size="10"/></td>
                  <td nowrap><html:text name="list[@type='Student']/Student/WorkingOrgan" id="resultset" property="QueryStudent/WorkingOrgan" indexed="true" styleClass="input" maxlength="50" size="10"/></td>
                  <td nowrap><html:text name="list[@type='Student']/Student/Duty" id="resultset" property="QueryStudent/Duty" indexed="true" styleClass="input" maxlength="50" size="10"/></td>
                  <td nowrap><html:text name="list[@type='Student']/Student/JobTitle" id="resultset" property="QueryStudent/JobTitle" indexed="true" styleClass="input" maxlength="30" size="10"/></td>
                  <td nowrap><dict:select businTypeId="dx_dutylevel"  name="list[@type='Student']/Student/dutylevel"   property="QueryStudent/dutylevel" id="resultset"  indexed="true" styleClass="input" nullOption="true" nullLabel="请选择" />
                  </td>
                  <td nowrap>
                  <INPUT type="text" name="list[@type='Student']/Student[@hciTagIndex='<%=count-1 %>']/StartWorkingTime[@pattern='yyyy-MM-dd']" value='<bean:write id="resultset" property="QueryStudent/StartWorkingTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>' Class="input" size="10" readonly onclick='calendar(this,"yyyy-MM-dd")' >
                 </td>
                  <td nowrap>
						<INPUT type="text" name="list[@type='Student']/Student[@hciTagIndex='<%=count-1 %>']/JoinPartyTime[@pattern='yyyy-MM-dd']" value='<bean:write id="resultset" property="QueryStudent/JoinPartyTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>' Class="input" size="10" readonly onclick='calendar(this,"yyyy-MM-dd")' >
					</td>
                  <td nowrap><html:text name="list[@type='Student']/Student/PartyPost" id="resultset" property="QueryStudent/PartyPost" indexed="true" styleClass="input" maxlength="20" size="10"/></td>
                  <td nowrap><html:text name="list[@type='Student']/Student/SocietyPost" id="resultset" property="QueryStudent/SocietyPost" indexed="true" styleClass="input" maxlength="20" size="10"/></td>
                  <td nowrap><html:text name="list[@type='Student']/Student/OrganTel" id="resultset" property="QueryStudent/OrganTel" indexed="true" styleClass="input" maxlength="20" size="10"/></td>
                  <td nowrap><html:text name="list[@type='Student']/Student/OrgAddr" id="resultset" property="QueryStudent/OrgAddr" indexed="true" styleClass="input" maxlength="50" size="10"/></td>
                  <td nowrap><html:text name="list[@type='Student']/Student/OrgPostcode" id="resultset" property="QueryStudent/OrgPostcode" indexed="true" styleClass="input" maxlength="20" size="10" attributesText='ValidateType="postalcode" Msg="邮编不正确"'/></td>
                  <td nowrap><html:text name="list[@type='Student']/Student/HomeTel" id="resultset" property="QueryStudent/HomeTel" indexed="true" styleClass="input" maxlength="20" size="10"/></td>
                  <% str = "ValidateType='email' Msg=第"+(count)+"行必须为有效邮箱"; %>
                  <td nowrap><html:text name="list[@type='Student']/Student/Email" id="resultset" property="QueryStudent/Email" indexed="true" styleClass="input" maxlength="50" size="10" attributesText="<%=str%>"/></td>
                  <td nowrap><html:text name="list[@type='Student']/Student/MobileTel" id="resultset" property="QueryStudent/MobileTel" indexed="true" styleClass="input" maxlength="20" size="10" /></td>
                  <td nowrap><html:text name="list[@type='Student']/Student/DiplomaNO" id="resultset" property="QueryStudent/DiplomaNO" indexed="true" styleClass="input" maxlength="50" size="15"/></td>

                  <td nowrap><html:text name="list[@type='Student']/Student/Remark" id="resultset" property="QueryStudent/Remark" indexed="true" styleClass="input" maxlength="100" size="20"/></td>
                  </tr>
				</logic:iterate>
        </table></td>
    </tr>
    <tr>
      <td height="8" colspan="2"></td>
    </tr>
    <tr>
      <td colspan="2">
	  
	  
      </td>
    </tr>
    <tr>
      <td colspan="2" class="text"><table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td  width="16%">&nbsp;</td>
              <td ><input name="Button" type="button" class="button_02" value="保 存" onClick="save()">
              <input name="Submit2" type="button" class="button_02" value="返 回" onClick="javascript:history.go(-1)"></td>
            </tr>
        </table></td>
    </tr>
    <tr>
      <td colspan="2" class="text">&nbsp;</td>
    </tr>
  </table>
</form>
  <script>
  function viewphoto() {
  	var fvalue = event.srcElement.value;
  	var obj = document.getElementById("photoview");
	if(fvalue.lastIndexOf(".gif")>0 || fvalue.lastIndexOf(".GIF")>0 || fvalue.lastIndexOf(".jpg")>0 || fvalue.lastIndexOf(".JPG")>0) {
		obj.src = fvalue;
	}
  }
  
//validater函数功能
//用法:ValidateType="alphanumeric,email",Msg="必须是字母数字;邮件"
//验证类型有:url,postalcode,phone,money,int,notempty,email,numeric
//function validater(frmObj)
  
  function save() {
  	var frm = document.forms[0];
	if (validater(frm)) {
	   if (!checkNo())
	      frm.submit();
	   else
	      alert("学号不能相同,请更改！");
    }
  }
  
  function checkNo() {
     var flag = false;
     var count = <%=count%>;
     
     for (var i=0;i<count;i++) {
         var num = i+1;
         var value1 = document.forms[0].elements["list[@type='Student']/Student[@hciTagIndex='"+i+"']/StudentNO"].value;
         
         for (var j=num;j<count;j++) {
             var value2 = document.forms[0].elements["list[@type='Student']/Student[@hciTagIndex='"+j+"']/StudentNO"].value;
             
             if (trim(value1) == trim(value2)) {
                flag = true;
                break;
             }
         }
     }
     
     if (flag) return true;
     else return false;
  }
  </script>