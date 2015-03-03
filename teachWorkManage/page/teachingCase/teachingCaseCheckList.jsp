<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="teachWorkManage.prTeachingCase.teachingCaseCheckList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;教学案例库—&gt;待选案例库
              </td></tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
	
		<input type="hidden" name="modifyaction" value="teachWorkManage.prTeachingCase.teachingCaseCheck.do">
		<input type="hidden" name="viewaction" value="teachWorkManage.prTeachingCase.teachingCaseView.do">
		
		<html:hidden property="QueryTeachingCase/_order/col1/field"/>
		<html:hidden property="QueryTeachingCase/_order/col1/asc" />
		
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
				
			    <qx:talentButton property="modify" type="button" styleClass="button_02" value="审 核" onclick="talentmodify()" operation="DX_TEACH_MANAGE_TeachingCase_CHECK.DX_TEACH_MANAGE_TeachingCase_CHECK_DO"/> </td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title">
                  <td align="center" nowrap><input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked="">                  </td>
                  <td align="center" nowrap id="QueryTeachingCase.Theme" onClick="talentsort()">主题</td>
                  <td align="center" nowrap id="QueryTeachingCase.Title" onClick="talentsort()">题目</td>
                  <td align="center" nowrap id="QueryTeachingCase.Editor" onClick="talentsort()">作者</td>
                  <td align="center" nowrap id="QueryTeachingCase.Org" onClick="talentsort()">单位</td>
                  <td align="center" nowrap id="QueryTeachingCase.CaseTypeName" onClick="talentsort()">案例类别</td>
                  <td align="center" nowrap id="QueryTeachingCase.SecretLevel" onClick="talentsort()">保密程度</td>
                  <td align="center" nowrap id="QueryTeachingCase.EnterTime" onClick="talentsort()">入库时间</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='QueryTeachingCase']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
               <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="QueryTeachingCase/caseID"/>','true')">  
              
                <td width="8%" align="center"> 
                  <html:checkbox id="resultset" name="list[@name='update']/QueryTeachingCase/caseID" property="QueryTeachingCase/caseID" indexed="true"/>                </td>
                <td width="12%" nowrap>&nbsp;<bean:write id="resultset" property="QueryTeachingCase/Theme"/></td>
                <td width="25%" nowrap>&nbsp;
                <a href='/common/page/viewimgdb/viewFromDB.jsp?table=TeachingCase&pkn=caseID&field=Detail&pkv=<bean:write id="resultset" property="QueryTeachingCase/caseID"/>&type=<bean:write id="resultset" property="QueryTeachingCase/FileType"/>' target="_blank">
                <bean:write id="resultset" property="QueryTeachingCase/Title"/>
                </a>
                </td>
                <td width="7%" nowrap>&nbsp;<bean:write id="resultset" property="QueryTeachingCase/Editor"/></td>
                <td width="12%" nowrap>&nbsp;<bean:write id="resultset" property="QueryTeachingCase/Org"/></td>
                <td width="9%"  nowrap>&nbsp;<bean:write id="resultset" property="QueryTeachingCase/CaseTypeName"/></td>
                <td width="8%"  nowrap>&nbsp;<dict:write businTypeId="dx_secretLevel" id="resultset" property="QueryTeachingCase/SecretLevel"/></td>
                <td width="13%"  nowrap>&nbsp;<bean:write id="resultset" property="QueryTeachingCase/EnterTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
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
	loadOrderImg(document.forms[0],'QueryTeachingCase');
</script>