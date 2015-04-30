<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="teachWorkManage.prSearch.studentByOrganList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">教务管理—&gt;查询统计—&gt;参训名册查询</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
      	<input type="hidden" name="queryaction" value="teachWorkManage.prSearch.studentByOrganList.do">
		<html:hidden property="StudentByOrgan/_order/col1/field"/>
		<html:hidden property="StudentByOrgan/_order/col1/asc" />
		<html:hidden property="StudentByOrgan/IsQuit" value="0"/>
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
	  </td>
    </tr>
  </table>


<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
    
    <tr><td>
    
       <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" >
         <tr>
          
		   <td class="td2" align="right">班&nbsp;&nbsp;&nbsp;&nbsp;级：</td> 
			<td class="td1"  >
				       <input type='text' name="StudentByOrgan/ClassName"  value='<bean:write  property="StudentByOrgan/ClassName"/>'   id="text1"  size="35" class="input"  />
				       &nbsp;<input class="button_02" type="button" id="bt1" value="选择" onclick="selectClass()"/>

             	</td>
             	  <td  class="td2" align="right" width="20%">	 姓&nbsp;&nbsp;&nbsp;&nbsp;名： </td>
			   <td class="td1"  width="30%"><html:text property="StudentByOrgan/StudentName" attributesText='class="input"' size="35"/>
</td>
             	
             	</tr>
           <tr>

		  <td class="td2" align="right">职&nbsp;&nbsp;&nbsp;&nbsp;务： </td> 
			<td class="td1" ><html:text property="StudentByOrgan/Duty" attributesText='class="input" size="35"'/>

             	</td>
			 <td  class="td2" align="right">职&nbsp;&nbsp;&nbsp;&nbsp;级： </td>
			<td class="td1" colspan="3"><dict:select businTypeId="dx_dutylevel" property="StudentByOrgan/DutyLevel" nullOption="true" nullLabel="--请选择--" /> 
			   </td>
			   
           </tr>
           <tr>
            <td  class="td2" align="right"> 参训单位： </td>
			<td class="td1"><input type='text' name="StudentByOrgan/WorkingOrgan"  value='<bean:write  property="StudentByOrgan/WorkingOrgan"/>'   id="text2"  size="35" class="input"  />
				       &nbsp;<input class="button_02" type="button" id="bt2" value="选择" onclick="selectOrgan()"/>
			</td>
		  <td class="td2" align="right">参训时间：</td> 
			<td class="td1" >从<html:text property="StudentByOrgan/min" attributesText='class="input" size="10"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["StudentByOrgan/min"],"yyyy-MM-dd")> 
                到<html:text property="StudentByOrgan/max" attributesText='class="input" size="10"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["StudentByOrgan/max"],"yyyy-MM-dd")> 
             	</td></tr>
        </table>
    
    
    </td></tr>
      <tr>
        <td class="text">
          <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" >
          <tr> 
            <td  align="left" nowrap class="text">
            
			    服务端排序：<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""> 
			    <input name="query" type="button" class="button_02" value="查 询" onclick="talentquery()"> 
				<input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
				
			</td>
          </tr>
        </table>
         </td>
      </tr>
     
	  <tr>
            <td  class="reportTitle" align="center" >
            <span id="printTable">参加党校培训人员表</span>
            

            </td>
    </tr>
     
      <tr>
        <td valign="top" class="text">

		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
		<tr>
		<td colspan="12" class="td1">
		<b>领导职务：</b>&nbsp;&nbsp;正局(<bean:write property="DutyLevel/DutyLevel1"/>)
				&nbsp;&nbsp;副局(<bean:write property="DutyLevel/DutyLevel3"/>)
				&nbsp;&nbsp;正处(<bean:write property="DutyLevel/DutyLevel5"/>)
				&nbsp;&nbsp;副处(<bean:write property="DutyLevel/DutyLevel7"/>)
				&nbsp;&nbsp;正科(<bean:write property="DutyLevel/DutyLevel9"/>)
				&nbsp;&nbsp;副科(<bean:write property="DutyLevel/DutyLevel11"/>)
				
		<br/><b>非领导职务：</b>
				&nbsp;&nbsp;巡视员(<bean:write property="DutyLevel/DutyLevel2"/>)
				&nbsp;&nbsp;助理巡视员(<bean:write property="DutyLevel/DutyLevel4"/>)
				&nbsp;&nbsp;调研员(<bean:write property="DutyLevel/DutyLevel6"/>)
				&nbsp;&nbsp;助理调研员(<bean:write property="DutyLevel/DutyLevel8"/>)
				&nbsp;&nbsp;主任科员(<bean:write property="DutyLevel/DutyLevel10"/>)
				&nbsp;&nbsp;副主任科员(<bean:write property="DutyLevel/DutyLevel12"/>)
				&nbsp;&nbsp;科员(<bean:write property="DutyLevel/DutyLevel13"/>)
				&nbsp;&nbsp;办事员(<bean:write property="DutyLevel/DutyLevel14"/>)
				&nbsp;&nbsp;其它(<bean:write property="DutyLevel/DutyLevel15"/>)

		
		</td>
		
		</tr>
                <tr class="td_title"> 
                  <td width="5%" align="center" nowrap id="StudentByOrgan.StudentName" onClick="talentsort()">姓名</td>
                  <td width="20%" align="center" nowrap id="StudentByOrgan.WorkingOrgan" onClick="talentsort()">工作单位</td>
                  <td width="5%" align="center" nowrap id="StudentByOrgan.Duty" onClick="talentsort()">职务</td>
                  <td width="5%" align="center" nowrap id="StudentByOrgan.DutyLevel" onClick="talentsort()">级别</td>
                  <td width="5%" align="center" nowrap id="StudentByOrgan.Sex" onClick="talentsort()">性别</td>
                  <td width="5%" align="center" nowrap id="StudentByOrgan.Age" onClick="talentsort()">年龄</td>
                  <td width="5%" align="center" nowrap id="StudentByOrgan.DegreeID" onClick="talentsort()">文化程度</td>
                  <td width="25%" align="center" nowrap id="StudentByOrgan.ClassName" onClick="talentsort()">所在班级</td>
                  <td width="5%" align="center" nowrap id="StudentByOrgan.HeadTeacherName" onClick="talentsort()">班主任</td>
                  <td width="10%" align="center" nowrap id="StudentByOrgan.BeginTime" onClick="talentsort()">参训时间</td>
                  <td width="5%" align="center" nowrap id="StudentByOrgan.StudyDay" onClick="talentsort()">学习日</td>
                  <td width="5%" align="center" nowrap id="StudentByOrgan.Remark" onClick="talentsort()">备注</td>
                </tr>
				<%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
				<logic:iterate id="resultset" property="list[@type='StudentByOrgan']">
					<%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
                 <tr class="<%=trClass%>" onClick="changeTRBgColor(this)"> 
                  <td nowrap="nowrap" >&nbsp;<bean:write id="resultset" property="StudentByOrgan/StudentName"/></td>
                  <td >&nbsp;<bean:write id="resultset" property="StudentByOrgan/WorkingOrgan"/></td>
                  <td >&nbsp;<bean:write id="resultset" property="StudentByOrgan/Duty" /></td>
                  <td >&nbsp;<dict:write businTypeId="dx_dutylevel" id="resultset" property="StudentByOrgan/DutyLevel"  /></td>
                  <td >&nbsp;<dict:write businTypeId="BNDICT_gender" property="StudentByOrgan/Sex" id="resultset"/></td>
                  <td >&nbsp;<bean:write id="resultset" property="StudentByOrgan/Age" /></td>
                  <td >&nbsp;<dict:write businTypeId="dx_education" id="resultset" property="StudentByOrgan/DegreeID"  /></td>
                  <td >&nbsp;<bean:write id="resultset" property="StudentByOrgan/ClassName" /></td>
                  <td nowrap="nowrap">&nbsp;<bean:write id="resultset" property="StudentByOrgan/HeadTeacherName" /></td>
				  <td >&nbsp;<bean:write id="resultset" property="StudentByOrgan/BeginTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
				  	至 <bean:write id="resultset" property="StudentByOrgan/EndTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
				  </td>
                  <td nowrap="nowrap">&nbsp;<bean:write id="resultset" property="StudentByOrgan/StudyDay" /></td>
                   <td nowrap="nowrap">&nbsp;<bean:write id="resultset" property="StudentByOrgan/Remark" /></td>
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
	loadOrderImg(document.forms[0],'StudentByOrgan');
</script>


<script>

  function selectOrgan(){ 
   	var frm =document.forms[0];
     var refreshMark = new Date().getTime();
     var loc="teachWorkManage.prSearch.selectOrgan.do?refreshMark="+refreshMark;
     var acceptValue="";
     try{
    acceptValue= window.showModalDialog(loc,"","dialogWidth:400px;DialogHeight=550px;status:no;scroll:auto");      
        }catch(e){}
        
    if(acceptValue == "undefined"){
    	acceptValue="";
    }
        frm["StudentByOrgan/WorkingOrgan"].value=acceptValue;

 
 }
 

  function selectClass(){ 
   	var frm =document.forms[0];
     var refreshMark = new Date().getTime();
     var loc="teachWorkManage.prSearch.selectClass.do?refreshMark="+refreshMark;
     var acceptValue="";
     try{
    acceptValue= window.showModalDialog(loc,"","dialogWidth:400px;DialogHeight=550px;status:no;scroll:auto");      
        }catch(e){}
        frm["StudentByOrgan/ClassName"].value=acceptValue;
    if(acceptValue == "undefined"){
    	acceptValue="";
    }
 
 }
</script>