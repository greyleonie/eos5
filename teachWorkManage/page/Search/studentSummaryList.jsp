<%@include file="/internet/common.jsp"%>
<!--没有记录-->
<script type="text/javascript">
<logic:equal property="PageCond/count" value="0">
       alert("没有学员记录" );
</logic:equal>
</script>
<body>
<form method="post" name="opeForm" action="teachWorkManage.prSearch.studentSummaryList.do">
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">教务管理—&gt;查询统计—&gt;<span id="printTable">学员文章及评语查询</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="teachWorkManage.prSearch.studentSummaryList.do">
		<input type="hidden" name="viewaction" value="teachWorkManage.prSearch.studentSummaryView.do">
		<html:hidden property="QueryStudent/_order/col1/field"/>
		<html:hidden property="QueryStudent/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
	  </td>
    </tr>
  </table>
 <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0"  class="table">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">
             <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" >
        <tr>
            <td class="td2" align="right">班&nbsp;&nbsp;&nbsp;&nbsp;级：</td>
            <td class="td1" colspan="3" >
             <html:select property="QueryStudent/ClassID/criteria/value"  > 
              <html:option value="">--请选择班级--</html:option> <html:options property="list[@type='studentclass']/Class/ClassID" labelProperty="list[@type='studentclass']/Class/ClassName"/> 
              </html:select> 
			  <html:hidden property="QueryStudent/ClassID/criteria/operator" value="=" />
			  </td>
      </tr>
	  <tr>
            <td class="td2" align="right">姓&nbsp;&nbsp;&nbsp;&nbsp;名：</td> 
			<td class="td1" >  <html:text property="QueryStudent/operatorname/criteria/value" attributesText='class="input" size="30"' />
			<html:hidden property="QueryStudent/operatorname/criteria/operator" value="like" />
			<html:hidden property="QueryStudent/operatorname/criteria/likeRule" value="center" /></td>
			<td class="td2" align="right">单&nbsp;&nbsp;&nbsp;&nbsp;位：</td> 
			<td class="td1" >  <html:text property="QueryStudent/WorkingOrgan/criteria/value" attributesText='class="input" size="30"'/>
			<html:hidden property="QueryStudent/WorkingOrgan/criteria/operator" value="like" />
			<html:hidden property="QueryStudent/WorkingOrgan/criteria/likeRule" value="center" />
			
			</td>
	
	</tr>
		  <tr>
            <td class="td2" align="right">出生年月：</td> 
			<td class="td1"  >从<html:text property="QueryStudent/Birthdate/criteria/min" attributesText='class="input" size="10"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["QueryStudent/Birthdate/criteria/min"],"yyyy-MM-dd")>
             	到<html:text property="QueryStudent/Birthdate/criteria/max" attributesText='class="input" size="10"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["QueryStudent/Birthdate/criteria/max"],"yyyy-MM-dd")>  
                <html:hidden property="QueryStudent/Birthdate/criteria/operator" value="between" />
			    <html:hidden property="QueryStudent/Birthdate/criteria/criteriaPattern" value="yyyy-MM-dd" />
             	</td>
            <td class="td2" align="right">是否退学：</td> 
			<td class="td1"  ><html:radio property="QueryStudent/IsQuit/criteria/value"  value="1"/>是 <html:radio property="QueryStudent/IsQuit/criteria/value"  value="0" />否<html:radio property="QueryStudent/IsQuit/criteria/value"  value="" checked="true"/>全部
			<html:hidden property="QueryStudent/IsQuit/criteria/operator"  value="="/>
			</td>
			
	
	</tr>
	
	  <tr>
            <td class="td2" align="right">开班时间：</td> 
			<td class="td1"  >从<html:text property="QueryStudent/BeginTime/criteria/min" attributesText='class="input" size="10"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["QueryStudent/BeginTime/criteria/min"],"yyyy-MM-dd")>
             	到<html:text property="QueryStudent/BeginTime/criteria/max" attributesText='class="input" size="10"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["QueryStudent/BeginTime/criteria/max"],"yyyy-MM-dd")>  
                <html:hidden property="QueryStudent/BeginTime/criteria/operator" value="between" />
			    <html:hidden property="QueryStudent/BeginTime/criteria/criteriaPattern" value="yyyy-MM-dd" />
             	</td>
            <td class="td2" align="right">毕结业时间：</td> 
			<td class="td1"  >从<html:text property="QueryStudent/EndTime/criteria/min" attributesText='class="input" size="10"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["QueryStudent/EndTime/criteria/min"],"yyyy-MM-dd")>
             	到<html:text property="QueryStudent/EndTime/criteria/max" attributesText='class="input" size="10"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["QueryStudent/EndTime/criteria/max"],"yyyy-MM-dd")>  
                <html:hidden property="QueryStudent/EndTime/criteria/operator" value="between" />
			    <html:hidden property="QueryStudent/EndTime/criteria/criteriaPattern" value="yyyy-MM-dd" />
			</td>
			
	
	</tr>
        </table>
	  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" >
          <tr> 
            <td  align="left" nowrap class="text">
            
			    服务端排序：<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""> 
			    <input name="query" type="button" class="button_02" value="查 询" onclick="talentquery()">
                <input name="query" type="button" class="button_02" value="查 看" onClick="talentview()">
				<input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
				
			</td>
          </tr>
        </table></td></tr>
        
        <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">
        
     <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail" >
                <tr class="td_title"> 
                  <td width="2%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                 
                  <td width="10%" align="center" nowrap id="QueryStudent.operatorname" onClick="talentsort()">姓名</td>
                  <td width="5%" align="center" nowrap id="QueryStudent.Sex" onClick="talentsort()">性别</td>
                  <td width="9%" align="center" nowrap id="QueryStudent.Birthdate" onClick="talentsort()">出生年月</td>
                  <td width="13%" align="center" nowrap id="QueryStudent.DegreeID" onClick="talentsort()">文化程度</td>
                  <td width="15%" align="center" nowrap id="QueryStudent.WorkingOrgan" onClick="talentsort()">工作单位</td>
                  <td width="17%" align="center" nowrap id="QueryStudent.Duty" onClick="talentsort()">职务</td>
                  <td width="17%" align="center" nowrap id="QueryStudent.Duty" onClick="talentsort()">班级</td>
                  <td width="10%" align="center" nowrap id="QueryStudent.TeamID" onClick="talentsort()">分组</td>
                </tr>
				<%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
				<logic:iterate id="resultset" property="list[@type='student']">
					<%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
                <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="QueryStudent/StudentID"/>','true')"> 
                  <td align="center">
				  <logic:present  id="resultset" property="QueryStudent/StudentID">
				  	<html:checkbox id="resultset" name="list[@name='update']/QueryStudent/StudentID" property="QueryStudent/StudentID" indexed="true"/>
				  </logic:present>
				  </td>                
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/operatorname"/></td>
                  <td nowrap>&nbsp;<dict:write businTypeId="BNDICT_gender" property="QueryStudent/Sex" id="resultset"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/Birthdate" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>  
                  <td nowrap>&nbsp;<dict:write businTypeId="dx_education" property="QueryStudent/DegreeID" id="resultset"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/WorkingOrgan" maxLength="16"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/Duty" maxLength="16"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/ClassName" maxLength="16"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/TeamName" /></td>
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
//查询
function queryStudent(){
	var frm =document.forms[0];
	processError(frm);
	if(frm.elements["PageCond/begin"] && frm.elements["PageCond/count"] && frm.elements["PageCond/length"]) {
		frm.elements["PageCond/begin"].value=0;
		frm.elements["PageCond/count"].value=-1;
		if(frm.elements["PageCond/talentlength"]) {
			frm.elements["PageCond/length"].value = frm.elements["PageCond/talentlength"].value;
		}else{
			frm.elements["PageCond/length"].value=10;
		}
		if(frm.elements["queryaction"]) {
			frm.action = frm.elements["queryaction"].value;
		}
		if(frm.elements["QueryStudent/fccsearch"].value=="输入姓名或学号"){
			frm.elements["QueryStudent/fccsearch"].value="";
		}
		event.srcElement.blur();
		frm.submit();
	}

}
</script>