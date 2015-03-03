<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="teachWorkManage.prTeachingCase.teachingCaseList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;教学案例库—&gt;已录入案例库
              </td></tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="teachWorkManage.prTeachingCase.teachingCaseSearch.do">
		<input type="hidden" name="addaction" value="teachWorkManage.prTeachingCase.teachingCaseAdd.do">
		<input type="hidden" name="modifyaction" value="teachWorkManage.prTeachingCase.teachingCaseModify.do">
		<input type="hidden" name="deleteaction" value="teachWorkManage.prTeachingCase.teachingCaseDelete.do">
		<input type="hidden" name="viewaction" value="teachWorkManage.prTeachingCase.teachingCaseCheckView.do">
		<html:hidden property="QueryTeachingCase/_order/col1/field"/>
		<html:hidden property="QueryTeachingCase/_order/col1/asc" />
		<html:hidden property="QueryTeachingCase/_order/col2/field"/>
		<html:hidden property="QueryTeachingCase/_order/col2/asc" />
		
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
				
				 <qx:talentButton property="add" type="button" styleClass="button_02" value="新 增" onclick="talentadd()" operation="DX_TEACH_MANAGE_TeachingCase_LURU.DX_TEACH_MANAGE_TeachingCase_LURU_ADD"/>
              	<qx:talentButton property="delete" type="button" styleClass="button_02" value="删 除" onclick="talentdelete()" operation="DX_TEACH_MANAGE_TeachingCase_LURU.DX_TEACH_MANAGE_TeachingCase_LURU_DEL"/>
				<qx:talentButton property="modify" type="button" styleClass="button_02" value="修改/提交" onclick="talentmodify()" operation="DX_TEACH_MANAGE_TeachingCase_LURU.DX_TEACH_MANAGE_TeachingCase_LURU_MODIFY"/>
				<input name="view" type="button" class="button_02" value="查 看" onClick="talentview()">
				<input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
				服务端排序：<input type="checkbox" name="checkbox" onClick="servertoorder()" marked="">			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="8%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked="">                  </td>
                  <td width="12%" align="center" nowrap id="QueryTeachingCase.Theme" onClick="talentsort()">主题</td>
                  <td width="25%" align="center" nowrap id="QueryTeachingCase.Title" onClick="talentsort()">题目</td>
                  <td width="7%" align="center" nowrap id="QueryTeachingCase.Editor" onClick="talentsort()">作者</td>
                  <td width="12%" align="center" nowrap id="QueryTeachingCase.Org" onClick="talentsort()">单位</td>
                  <td width="9%" align="center" nowrap id="QueryTeachingCase.CaseTypeName" onClick="talentsort()">案例类别</td>
                  <td width="8%" align="center" nowrap id="QueryTeachingCase.SecretLevel" onClick="talentsort()">保密程度</td>
                  <td width="6%" align="center" nowrap id="QueryTeachingCase.State" onClick="talentsort()">状态</td>
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
                <td align="center"> 
                
                <logic:in  propertyId
="resultset" property="QueryTeachingCase/State" value="3,0">
                  <html:checkbox id="resultset" name="list[@name='update']/QueryTeachingCase/caseID" property="QueryTeachingCase/caseID" indexed="true"/>      
                </logic:in>
                <logic:in  propertyId
="resultset" property="QueryTeachingCase/State" value="1,2">
                  <html:checkbox id="resultset" name="list[@name='update']/QueryTeachingCase/caseID" property="QueryTeachingCase/caseID" indexed="true" disabled="true"/>      
                </logic:in>
                </td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="QueryTeachingCase/Theme"/></td>
                <td nowrap>&nbsp;
                <a href='/common/page/viewimgdb/viewFromDB.jsp?table=TeachingCase&pkn=caseID&field=Detail&pkv=<bean:write id="resultset" property="QueryTeachingCase/caseID"/>&type=<bean:write id="resultset" property="QueryTeachingCase/FileType"/>' target="_blank">
                <bean:write id="resultset" property="QueryTeachingCase/Title"/>
                </a>
                </td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="QueryTeachingCase/Editor"/></td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="QueryTeachingCase/Org"/></td>
                <td  nowrap>&nbsp;<bean:write id="resultset" property="QueryTeachingCase/CaseTypeName"/></td>
                <td  nowrap>&nbsp;<dict:write businTypeId="dx_secretLevel" id="resultset" property="QueryTeachingCase/SecretLevel"/></td>
                <td  nowrap>&nbsp;
                <logic:equal id="resultset" property="QueryTeachingCase/State" value="0">未提交</logic:equal>
                <logic:equal id="resultset" property="QueryTeachingCase/State" value="3">被回退</logic:equal>
                <logic:equal id="resultset" property="QueryTeachingCase/State" value="1">未审核</logic:equal>
                <logic:equal id="resultset" property="QueryTeachingCase/State" value="２">已审核</logic:equal>
                
                </td>
                <td  nowrap>&nbsp;<bean:write id="resultset" property="QueryTeachingCase/EnterTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
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