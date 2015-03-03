<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="teachWorkManage.prTeachingCase.teachingCaseSearch.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;教学案例库—&gt;已选案例库
              </td></tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="teachWorkManage.prTeachingCase.teachingCaseSearch.do">
		<input type="hidden" name="addaction" value="teachWorkManage.prTeachingCase.teachingCaseAdd.do">
		<input type="hidden" name="modifyaction" value="teachWorkManage.prTeachingCase.teachingCaseModify.do">
		<input type="hidden" name="deleteaction" value="teachWorkManage.prTeachingCase.teachingCaseDelete.do">
		<input type="hidden" name="viewaction" value="teachWorkManage.prTeachingCase.teachingCaseView.do">
		<html:hidden property="QueryTeachingCase/_order/col1/field"/>
		<html:hidden property="QueryTeachingCase/_order/col1/asc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		<html:hidden property="isSearch" value="1"/>
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
	    <a title='关键字可以是"主题、题目、作者"' id="keytitle">关键词：</a>
	    <html:text property="QueryTeachingCase/caseSearch" attributesText='class="input"'/>
       
&nbsp; 类别：

<html:select property="QueryTeachingCase/CaseTypeID/criteria/value"  attributesText='id="printTable"'> 
              <html:option value="-1">请选择</html:option> 
              <html:options property="list[@type='CaseType']/CaseType/CaseTypeID" labelProperty="list[@type='CaseType']/CaseType/CaseTypeName"/> 
              </html:select>   
&nbsp; 保密程度：
<dict:select businTypeId="dx_secretLevel" name="QueryTeachingCase/SecretLevel/criteria/value" property="QueryTeachingCase/SecretLevel" nullOption="true" nullLabel="请选择" />	

&nbsp; 来源：
<html:text property="QueryTeachingCase/CaseFrom/criteria/value" attributesText='class="input"' size="10"/>
<INPUT value="like" type="hidden" name="QueryTeachingCase/CaseFrom/criteria/operator">
<INPUT value="center" type="hidden" name="QueryTeachingCase/CaseFrom/criteria/likeRule">
	服务端排序：<input type="checkbox" name="checkbox" onClick="servertoorder()" marked="">   
	    </td>
	    </tr>
	    <tr>
	    	<td height="30" class="text">
	    		班&nbsp;&nbsp;级：
	    		<html:select property="QueryTeachingCase/ClassID/criteria/value"  attributesText='id="printTable"' styleClass="input"> 
              <html:option value="-1">--请选择班级--</html:option> <html:options property="list[@type='studentclass']/Class/ClassID" labelProperty="list[@type='studentclass']/Class/ClassName"/> 
              </html:select> 
              <input name="B32" type="button" class="button_02" value="查 询" onClick="talentquery()">
              <input name="view" type="button" class="button_02" value="查 看" onClick="talentview()">
				<qx:talentButton property="modify" type="button" styleClass="button_02" value="修 改" onclick="talentmodify()" operation="DX_TEACH_MANAGE_TeachingCase_SEARCH.DX_TEACH_MANAGE_TeachingCase_SEARCH_EDIT"/>
				<input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
	    	</td>
	    </tr>
	  
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
          <tr class="td_title">
            <td width="8%" align="center" nowrap><input type="checkbox" name="checkbox2" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked="">
            </td>
            <td width="12%" align="center" nowrap id="QueryTeachingCase.Theme" onClick="talentsort()">主题</td>
            <td width="25%" align="center" nowrap id="QueryTeachingCase.Title" onClick="talentsort()">题目</td>
            <td width="7%" align="center" nowrap id="QueryTeachingCase.Editor" onClick="talentsort()">作者</td>
            <td width="12%" align="center" nowrap id="QueryTeachingCase.Org" onClick="talentsort()">单位</td>
            <td width="9%" align="center" nowrap id="QueryTeachingCase.CaseTypeName" onClick="talentsort()">案例类别</td>
            <td width="8%" align="center" nowrap id="QueryTeachingCase.SecretLevel" onClick="talentsort()">保密程度</td>
            <td width="6%" align="center" nowrap id="QueryTeachingCase.State" onClick="talentsort()">来源</td>
            <td width="13%" align="center" nowrap id="QueryTeachingCase.EnterTime" onClick="talentsort()">入库时间</td>
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
            <td align="center"><html:checkbox id="resultset" name="list[@name='update']/QueryTeachingCase/caseID" property="QueryTeachingCase/caseID" indexed="true"/>
            </td>
        <td nowrap>&nbsp;
            <bean:write id="resultset" property="QueryTeachingCase/Theme"/></td>
              <td nowrap>&nbsp;
              	<a href='/common/page/viewimgdb/viewFromDB.jsp?table=TeachingCase&pkn=caseID&field=Detail&pkv=<bean:write id="resultset" property="QueryTeachingCase/caseID"/>&type=<bean:write id="resultset" property="QueryTeachingCase/FileType"/>' target="_blank">
                  <bean:write id="resultset" property="QueryTeachingCase/Title"/>
                  </a>
                  </td>
              <td nowrap>&nbsp;
                  <bean:write id="resultset" property="QueryTeachingCase/Editor"/></td>
              <td nowrap>&nbsp;
                  <bean:write id="resultset" property="QueryTeachingCase/Org"/></td>
              <td  nowrap>&nbsp;
                  <bean:write id="resultset" property="QueryTeachingCase/CaseTypeName"/></td>
              <td  nowrap>&nbsp;
                  <dict:write businTypeId="dx_secretLevel" id="resultset" property="QueryTeachingCase/SecretLevel"/></td>
              <td  nowrap>&nbsp;
           <bean:write id="resultset" property="QueryTeachingCase/CaseFrom"/>
        </td>
              <td  nowrap>&nbsp;
                  <bean:write id="resultset" property="QueryTeachingCase/EnterTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
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