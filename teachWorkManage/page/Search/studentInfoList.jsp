<%@include file="/internet/common.jsp"%>
       <!--没有记录-->
       <script type="text/javascript">
<logic:equal property="PageCond/count" value="0">
       alert("没有学员记录" );
</logic:equal>
</script>
 
<body>
<form method="post" action="teachWorkManage.prSearch.studentInfoList.do" name="opeForm">
<%String selectState=  base.util.TalentContext.getValue(pageContext,null,"doDetail"); %>
<table width="96%"  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" id="beforefixtable1">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
        
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页 -&gt; 教务管理 -&gt; 查询统计
              -&gt;
              <span id="printTable"> 学员信息</span>查询</td> 
          </tr>
      </table></td>
    </tr>
     <tr>
      <td height="5">
        <input type="hidden" name="queryaction" value="teachWorkManage.prSearch.studentInfoList.do">
		<input type="hidden" name="viewaction" value="teachWorkManage.prSearch.studentInfoView.do">
		<input type="hidden" name="selectdoDetial" value="1">
		 <html:hidden property="QueryStudent/_order/col1/field"/>
		<html:hidden property="QueryStudent/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
	  </td>
    </tr>
    
    
  </table>
  
   <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0"  class="table">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">
             <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" >
        <tr>
            <td class="td2" align="right">班&nbsp;&nbsp;&nbsp;&nbsp;级：</td>
            <td class="td1" colspan="3" >
             <html:select property="QueryStudent/ClassID/criteria/value"> 
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
			    显示明细：<input type="checkbox"  name="doDetail" onclick="dispDetail()" <%if(selectState!=null) out.print("checked='checked'") ;%>>
			    <input name="query" type="button" class="button_02" value="查 询" onclick="talentquery()">
                <input name="query" type="button" class="button_02" value="查 看" onClick="talentview()">
				<input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onClick="deal(),exporttoexcel()">
				
			</td>
          </tr>
        </table></td></tr>
        
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">
        
     <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail" >
                <tr class="td_title"> 
                  <td width="2%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                 
                  <td width="10%" align="center" nowrap id="QueryStudent.operatorname" onClick="talentsort()">姓名</td>
                  <td width="5%" align="center" nowrap id="QueryStudent.Sex" onClick="talentsort()">性别</td>
                  <td width="9%" align="center" nowrap id="QueryStudent.Birthdate" onClick="talentsort()">出生年月</td>
                  <td width="13%" align="center" nowrap id="QueryStudent.DegreeID" onClick="talentsort()">文化程度</td>
                  <td width="13%" align="center" nowrap id="QueryStudent.Major" onClick="talentsort()">专业</td>
                  <td width="15%" align="center" nowrap id="QueryStudent.WorkingOrgan" onClick="talentsort()">工作单位</td>
                  <td width="17%" align="center" nowrap id="QueryStudent.Duty" onClick="talentsort()">职务</td>
                  <td width="17%" align="center" nowrap id="QueryStudent.Duty" onClick="talentsort()">班级</td>
                  <td width="10%" align="center" nowrap id="QueryStudent.TeamID" onClick="talentsort()">分组</td>
                  <td width="10%" align="center" nowrap id="QueryStudent.HomeTel" onClick="talentsort()" style="display: none">住宅电话</td>
                  <td width="10%" align="center" nowrap id="QueryStudent.OrganTel" onClick="talentsort()" style="display: none">单位电话</td>
                  <td width="11%" align="center" nowrap id="QueryStudent.MobileTel" onClick="talentsort()" style="display: none">手机</td>
                  <td width="11%" align="center" nowrap id="QueryStudent.Email" onClick="talentsort()" style="display: none">EMAIL</td>
                  <td width="11%" align="center" nowrap id="QueryStudent.OnStudyTime" onClick="talentsort()" style="display: none">在校时间</td>
                  <td width="11%" align="center" nowrap id="QueryStudent.Remark" onClick="talentsort()" style="display: none">备注</td>
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
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/Major"/></td>
                 
                  <td nowrap id="WorkingOrgan<%=count%>" title="<bean:write id='resultset' property='QueryStudent/WorkingOrgan'/>" abbr="<bean:write id='resultset' property='QueryStudent/WorkingOrgan' maxLength='16'/>">&nbsp;<bean:write id="resultset" property="QueryStudent/WorkingOrgan" maxLength="16"/></td>
                  <td nowrap id="Duty<%=count%>" title="<bean:write id='resultset' property='QueryStudent/Duty'/>" abbr="<bean:write id='resultset' property='QueryStudent/Duty' maxLength='16'/>">&nbsp;<bean:write id="resultset" property="QueryStudent/Duty" maxLength="16"/></td>
                  <td nowrap id="ClassName<%=count%>" title="<bean:write id='resultset' property='QueryStudent/ClassName'/>" abbr="<bean:write id='resultset' property='QueryStudent/ClassName' maxLength='16'/>">&nbsp;<bean:write id="resultset" property="QueryStudent/ClassName" maxLength="16"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudent/TeamName" /></td>
                  <td nowrap id="HomeTel<%=count%>" style="display: none">&nbsp;<bean:write id="resultset" property="QueryStudent/HomeTel"/></td>
                  <td nowrap id="OrganTel<%=count%>" style="display: none">&nbsp;<bean:write id="resultset" property="QueryStudent/OrganTel"/></td>
                  <td nowrap id="MobileTel<%=count%>" style="display: none">&nbsp;<bean:write id="resultset" property="QueryStudent/MobileTel" /></td>
                  <td nowrap id="Email<%=count%>" style="display: none">&nbsp;<bean:write id="resultset" property="QueryStudent/Email" /></td>
                  <td nowrap id="OnStudyTime<%=count%>" style="display: none">&nbsp;<bean:write id="resultset" property="QueryStudent/OnStudyTime" /></td>
                  <td nowrap id="Remark<%=count%>" style="display: none">&nbsp;<bean:write id="resultset" property="QueryStudent/Remark" /></td>
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
  </table>
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>
<script>
    <% if (selectState!=null){%>
    dispDetail();
    <%}%>
	loadOrderImg(document.forms[0],'QuerySocialSurvey');
	
	function dispDetail() {
	   var frm = document.forms[0];
	   var len = frm.elements["PageCond/length"].value;
	   
	   if (document.getElementById("doDetail").checked) {
	      
	      document.getElementById("QueryStudent.HomeTel").style.display = "";
	      document.getElementById("QueryStudent.OrganTel").style.display = "";
	      document.getElementById("QueryStudent.MobileTel").style.display = "";
	      document.getElementById("QueryStudent.Email").style.display = "";
	      document.getElementById("QueryStudent.OnStudyTime").style.display = "";
	      document.getElementById("QueryStudent.Remark").style.display = "";
	   
	      for (var i=1;i<=len;i++) {
	      
	         document.getElementById("HomeTel"+i).style.display = "";
	         document.getElementById("OrganTel"+i).style.display = "";
	         document.getElementById("MobileTel"+i).style.display = "";
	         document.getElementById("Email"+i).style.display = "";
	         document.getElementById("OnStudyTime"+i).style.display = "";
	         document.getElementById("Remark"+i).style.display = "";
	         document.getElementById("WorkingOrgan"+i).innerHTML = document.getElementById("WorkingOrgan"+i).title;
	         document.getElementById("Duty"+i).innerHTML = document.getElementById("Duty"+i).title;
	         document.getElementById("ClassName"+i).innerHTML = document.getElementById("ClassName"+i).title;
	      }
	   } else {
	       
	      document.getElementById("QueryStudent.HomeTel").style.display = "none";
	      document.getElementById("QueryStudent.OrganTel").style.display = "none";
	      document.getElementById("QueryStudent.MobileTel").style.display = "none";
	      document.getElementById("QueryStudent.Email").style.display = "none";
	      document.getElementById("QueryStudent.OnStudyTime").style.display = "none";
	      document.getElementById("QueryStudent.Remark").style.display = "none";
	   
	      for (var i=1;i<=len;i++) {
	         document.getElementById("HomeTel"+i).style.display = "none";
	         document.getElementById("OrganTel"+i).style.display = "none";
	         document.getElementById("MobileTel"+i).style.display = "none";
	         document.getElementById("Email"+i).style.display = "none";
	         document.getElementById("OnStudyTime"+i).style.display = "none";
	         document.getElementById("Remark"+i).style.display = "none";
	         document.getElementById("WorkingOrgan"+i).innerHTML = document.getElementById("WorkingOrgan"+i).abbr;
	         document.getElementById("Duty"+i).innerHTML = document.getElementById("Duty"+i).abbr;
	         document.getElementById("ClassName"+i).innerHTML = document.getElementById("ClassName"+i).abbr;
	      }
	   }
	}
	
	
		function deal(){
		var frm = document.forms[0];
		var name = frm.elements["QueryStudent/ClassID/criteria/value"];
	    var message = name.options[name.selectedIndex].text;		
		if(message=="--请选择班级--"){
			document.getElementById("printTable").innerHTML="所有学员的信息";
		}
		else{
			document.getElementById("printTable").innerHTML=message;
		}
	}

</script>