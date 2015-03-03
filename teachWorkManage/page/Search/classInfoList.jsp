<%@include file="/internet/common.jsp"%>
<body>
<style type="text/css">
<!--
.style1 {color: #FF0000}
-->
</style>
<form name="opeForm" method="post" action="teachWorkManage.prSearch.classInfoList.do">
  <table width="100%"  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" id="beforefixtable1">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页 -&gt; 教务管理 -&gt; 查询统计
              -&gt; 办班统计</td> 
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0"  class="table">
    <tr id="beforefixtable2">
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">
      <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" id="beforefixtable3">
        <tr>
          <td height="30" class="text">  
          
			 开班时间：从
            	<html:text property="Class/EndTime/criteria/min" attributesText='class="input" size="12"  ValidateType="notempty" Msg="开班时间不能为空"  ' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["Class/EndTime/criteria/min"],"yyyy-MM-dd")> 
           		到
           		<html:text property="Class/EndTime/criteria/max" attributesText='class="input" size="12"  ValidateType="notempty" Msg="开班时间不能为空"' readonly="true"/>
          	    <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["Class/EndTime/criteria/max"],"yyyy-MM-dd")>
			    <input type="hidden" name="Class/EndTime/criteria/operator" value="between"/> 
			    <input type="hidden" name="Class/EndTime/criteria/criteriaPattern" value="yyyy-MM-dd"/> 
			班级类型：<html:select  property="Class/ClassTypeID/criteria/value">
          			<html:option  value="">--请选择--</html:option>
                   <html:options property="list[@type='ClassType']/ClassType/ClassTypeID" labelProperty="list[@type='ClassType']/ClassType/ClassType"/>
             </html:select>
			<input name="query" type="button" class="button_02" value="统 计" onClick="queryClass()">
            <logic:notPresent property="input/isFirst" >
             <input name="view2" type="button" class="button_02" value="打 印" onClick="iePrint()">
            <input name="view" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">     
           
            </logic:notPresent>
          
          </td>      
        </tr>
      </table>   
        <logic:notPresent property="input/isFirst">     
      <table width="100%" height="6"  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" id="beforefixtable4">
        <tr>
          <td class="td1"  align="center"><span id="printTable"> <b> <bean:write  property="Class/EndTime/criteria/min"/>至<bean:write  property="Class/EndTime/criteria/max"/>办班统计表  </b>(班级数：<span class="style1"><bean:write  property="StatisClass/ClassNum"/></span>&nbsp;&nbsp;&nbsp;&nbsp;人数：<span class="style1"><bean:write  property="StatisClass/StudentNum"/></span>) <br/>
          </span></td>
        </tr>
      </table>

      <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
          <tr class="td_title">
            <td width="15%" align="center" nowrap id="Class.ClassTypeID" onClick="" class="td_title" >班名</td>
            <td width="8%" align="center" nowrap id="Class.Commission" onClick="talentsort()" class="td_title" >调训单位</td>
            <td width="5%" align="center" nowrap id="Class.RecruitNum" onClick="talentsort()" class="td_title" >计划招<br>生人数</td>
            <td width="5%" align="center" nowrap id="Class.factNum" onClick="talentsort()" class="td_title" >实际招<br>生人数</td>
            <td width="6%" align="center" nowrap id="Class.regTime" onClick="talentsort()" class="td_title" >开班时间</td>
            <td width="6%" align="center" nowrap id="ClassreachTime" onClick="talentsort()" class="td_title" >结业时间</td>
            <td width="8%" align="center" nowrap id="Class.ClassroomID" onClick="talentsort()" class="td_title" >上课地点</td>
            <td width="5%" align="center" nowrap id="Class.BuildingID" onClick="talentsort()" class="td_title" >住宿地点</td>
            <td width="5%" align="center" nowrap id="Class.RepastCard" onClick="talentsort()" class="td_title" >就餐类别</td>
            <td width="4%" align="center" nowrap id="Class.Deposit" onClick="talentsort()" class="td_title" >卡内预<br/>存金额</td>
            <td width="5%" align="center" nowrap id="Class.HeadTeacherID" onClick="talentsort()" class="td_title" >班主任</td>
          </tr>
            <%
		             int count=0;
			           String trClass = "result_content"; 
		  		%>
                <logic:iterate id="typeresult" property="list[@type='Type']">                
      
                <td  nowrap  class="td1" colspan="11" align="center"><b><bean:write id="typeresult" property="Type/ClassType"/></b>(班级数：<span class="style1"><bean:write id="typeresult" property="Type/ClassNum"/></span>&nbsp;&nbsp;&nbsp;&nbsp;人数：<span class="style1"><bean:write id="typeresult" property="Type/StudentNum"/></span>) </td>
                <logic:iterate id="classresult" property="list[@type='Class']"> 
                	<logic:equal id="classresult" property="Class/ClassTypeID" value="Type/ClassTypeID" valueType="variable" valueId="typeresult">	                             
		         <%
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;		
			       %>  
		               <tr class="<%=trClass%>" onClick="changeTRBgColor(this)">               
		               <td ><bean:write id="classresult" property="Class/ClassName" /></td> 
		               <td align="center"><bean:write id="classresult" property="Class/Commission" /></td>
		               <td align="center"><bean:write id="classresult" property="Class/RecruitNum" /></td>
		               <td align="center"><bean:write id="classresult" property="Class/factNum" /></td> 
		               <td align="center"><bean:write id="classresult" property="Class/BeginTime"  formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" /></td>
		               <td align="center"><bean:write id="classresult" property="Class/EndTime"  formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" /></td>    
		               <td align="center"><bean:write id="classresult" property="Class/classRoomName" /></td> 
		               <td align="center"><bean:write id="classresult" property="Class/buildingName" /></td>
		               <td align="center"><logic:equal id="classresult" property="Class/RepastCard" value="0">不详</logic:equal>
									       <logic:equal id="classresult" property="Class/RepastCard" value="1">IC卡</logic:equal>
									       <logic:equal id="classresult" property="Class/RepastCard" value="2">纸卡</logic:equal>
									       <logic:equal id="classresult" property="Class/RepastCard" value="3">餐票</logic:equal></td>    
		               <td align="center"><bean:write id="classresult" property="Class/Deposit"/></td> 
		               <td align="center"><bean:write id="classresult"  property="Class/headTeacher"/></td>      
		               </tr>
	               </logic:equal>
                </logic:iterate>             
                </logic:iterate> 
        </table>
        </logic:notPresent>
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
<script language="javascript">
function queryClass(){	
	var frm = document.forms[0];
	if(validater(frm)) frm.submit();
}
</script>