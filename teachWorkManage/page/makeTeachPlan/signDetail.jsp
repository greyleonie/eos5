<%@include file="/internet/common.jsp"%>
<body>
<form>
<html:hidden property="PageCond/begin"/>
<html:hidden property="PageCond/count"/>
<html:hidden property="PageCond/length"/>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;教学计划编制—&gt;专题班报名详细</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" class="text">
                <html:select property="SpecialSubject/SpecialID" onchange="selectSubject()" > 
              <html:option value="-1">--请选择专题--</html:option> 
              <html:options property="list[@type='SpecialSubject']/SpecialSubject/SpecialID" labelProperty="list[@type='SpecialSubject']/SpecialSubject/Title"/> 
              </html:select>
              <input name="B36" type="button" class="button_02" onClick="iePrint()" value="打印" >&nbsp; 
              <input name="B32" type="button" class="button_02" onClick="exporttoexcel()" value="导出">
                           </td>
        </tr>
      </table>      
        <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" id="listdetail" bgcolor="#A2C4DC">
          <tr align="center" class="td_title">
            <td width="7%">序号</td>
            <td width="10%">姓名</td>
            <td width="6%">性别</td>
            <td width="10%">文化程度<br></td>
            <td width="40%">单位及部门</td>
            <td width="15%">职务</td>
            <td width="12%">职级</td>
          </tr>
          <%
          int count=1; 
            String style="";
          %>
          <logic:iterate id="resultSet" property="list[@type='SignOfSpecialClass']">
          <%
          if(count%2==0){
              style="td2";
            }else{
             style="td1";
            }
           %>
          
         
          <tr class="<%=style %>">
            <td width="7%" align="center"><%=count%></td>
            <td width="10%" align="center"><bean:write id="resultSet" property="SignOfSpecialClass/Name"/></td>
            <td width="6%" align="center">
            <logic:equal id="resultSet" property="SignOfSpecialClass/Sex" value="0">
               男
            </logic:equal>
            <logic:equal id="resultSet" property="SignOfSpecialClass/Sex" value="1">
              女
            </logic:equal>          
            </td>
            <td width="10%" align="center"><bean:write id="resultSet" property="SignOfSpecialClass/Education"/></td>
            <td width="40%" align="left"><bean:write id="resultSet" property="SignOfSpecialClass/Organ"/><bean:write id="resultSet" property="SignOfSpecialClass/Department"/></td>
            <td width="15%" align="left"><bean:write id="resultSet" property="SignOfSpecialClass/Post"/></td>
            <td width="12%" align="left"><bean:write id="resultSet" property="SignOfSpecialClass/PostLevel"/></td>
          </tr>
          <% count++; %>
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
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>
<script language="javascript">
 function selectSubject(){
       document.forms[0].elements["PageCond/count"].value="";
       document.forms[0].elements["PageCond/length"].value="";
       document.forms[0].elements["PageCond/begin"].value="";
       
      if(document.forms[0].elements["SpecialSubject/SpecialID"].value!="-1"){
         document.forms[0].action="teachWorkManage.prMakeTeachPlan.signDetail.do";
         document.forms[0].submit();
      }
 }
</script>