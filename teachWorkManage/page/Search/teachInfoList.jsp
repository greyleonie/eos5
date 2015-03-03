<%@include file="/internet/common.jsp"%>
<%
java.util.Date date = new java.util.Date();
java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
String curdate = sdf.format(date);
%>
<SCRIPT language="jscript" src="/internet/scripts/processCaller.js"></SCRIPT>
<SCRIPT language="jscript" src="/internet/scripts/string.js"></SCRIPT>
<SCRIPT language="jscript" src="/internet/scripts/dynamicSelect.js"></SCRIPT>
 
    

<html>
<head>
<title>广州市委党校信息一体化平台</title>
</head>
<body onload="onLoad()" >
<form name="opeForm" method="post" action="teachWorkManage.prSearch.teachInfoList.do">
<table width="100%"  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页 -&gt; 教务管理 -&gt; 查询统计
              -&gt; 教师上课情况</td> 
          </tr>
      </table></td>
    </tr>
  </table>
  
  <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
    <tr >
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text"> 
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#ffffff" >
        <tr><td class="td1" nowrap="nowrap">
            时间：
            从
            	<html:text property="SearchTeaching/ClassDate/criteria/min"   attributesText='class="input" size="10" ValidateType="notempty" Msg="时间不能为空"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20"  align="absmiddle" onClick=calendar(document.forms[0].elements["SearchTeaching/ClassDate/criteria/min"],"yyyy-MM-dd")> 
           		<font color="red">*</font>
           		到
           		<html:text property="SearchTeaching/ClassDate/criteria/max"  attributesText='class="input" size="10"  ValidateType="notempty" Msg="时间不能为空"' readonly="true"/>
          	    <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["SearchTeaching/ClassDate/criteria/max"],"yyyy-MM-dd")>
			    <font color="red">*</font>
			    <input type="hidden" name="SearchTeaching/ClassDate/criteria/operator" value="between"/>
			    <input type="hidden" name="SearchTeaching/ClassDate/criteria/criteriaPattern" value="yyyy-MM-dd"/>
          教研部：    
         <select  name="SearchTeaching/TeachingGroupID/criteria/value"  id="select1" bizAction="teachWorkManage.bizSearch.selectAllGroup"   paramXML="" listXpath="list[@type='TeachGroup']" entityName="TeachGroup" valueField="orgID"    textField="orgName"        childID="select2"  nullLable="true" nullLableText="<bean:write property='SearchTeaching/TeachingGroupName'/>" nullLableValue="<bean:write property='SearchTeaching/TeachingGroupID/criteria/value'/>"  onchange="refreshChild_DS(this)"></select> 
          教师： 
         <select name="SearchTeaching/TeacherID/criteria/value"        id="select2" bizAction="teachWorkManage.bizSearch.selectTeacher"    paramXML="" listXpath="list[@type='Teacher']"     entityName="Teacher"    valueField="TeacherID" textField="operatorName"  childID=""       mainSelectID="select1" nullLable="true" nullLableText="<bean:write property='SearchTeaching/TeacherName'/>" nullLableValue="<bean:write property='SearchTeaching/TeacherID/criteria/value'/>" onchange="queryTeaching()"></select>
		 <script language="JavaScript" type="text/JavaScript">	 	
			initSel_DS(document.getElementById("select1"));
		 </script>
		 <input type="hidden" name="SearchTeaching/TeacherID/criteria/operator" value="="/>
		 <input type="hidden" name="SearchTeaching/TeachingGroupID/criteria/operator" value="="/>
		 <a title="教师姓名" >关键字：</a>
		 <html:text property="input/searchText"  attributesText='class="input" size="15" '  />	
	    
		</td>
	
	</tr>
        </table> 
        
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="30" class="text" align="center">
			<input name="query" type="button" class="button_02" value="查 询" onClick="search()">	
            <logic:notPresent property="input/isFirst" >
            <input name="view2" type="button" class="button_02" value="打 印" onClick="iePrint()">
            <input name="view" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">     

            </logic:notPresent>
            <input type="hidden" name="queryaction" value="teachWorkManage.prSearch.teachInfoList.do">    
            </td>
          </tr>
        </table> 
          </td>      
        </tr>
         <tr><td>
             <logic:notPresent property="input/isFirst">  
          
         <table width="100%" height="6"  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr>
          <td class="td1"  align="center"><span id="printTable"> <b> 
         教师上课安排情况表
         </b>
          </span></td>
        </tr>
      </table>
      
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC"   id="listdetail">	  
	    <tr class="td_title"> 
                  <td width="10%" align="center" nowrap >日期</td>
                  <td width="10%" align="center" nowrap >星期</td>
                  <td width="10%" align="center" nowrap >时间</td>
                  <td width="20%" align="center" nowrap >班级</td>
                  <td width="20%" align="center" nowrap >地点</td>
                  <td width="30%" align="center" nowrap >课题内容</td>
                  <td width="30%" align="center" nowrap >校内教师</td>
                  <td width="30%" align="center" nowrap >外请课教师</td>
                </tr>
                <logic:equal property="rowNum" value="0"><tr><td align="center" colspan="8" class="td1"><font color="red">无满足条件记录</font></td></tr></logic:equal>
                <logic:greaterThan property="rowNum" value="0"> 
                <%
		             int count=0;
		             int i=0;
		             int j=0;
			           String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="dateresult" property="list[@type='ClassDate']">                
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
						i=0;
						
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)">            
                <td align="center" nowrap rowspan="<bean:write id="dateresult" property="ClassDate/RowSpan"/>"><bean:write id="dateresult" property="ClassDate/ClassDate" formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" /> </td>
                <td align="center" nowrap rowspan="<bean:write id="dateresult" property="ClassDate/RowSpan"/>"><bean:write id="dateresult" property="ClassDate/WeekDay" /> </td>
                <logic:iterate id="timeresult" property="list[@type='ClassTime']"> 
                	<logic:equal id="timeresult" property="ClassTime/ClassDate" value="ClassDate/ClassDate" valueType="variable" valueId="dateresult">	                             
		                              <%i++;j=0; if(i!=1){%>
		               <tr class="<%=trClass%>" onClick="changeTRBgColor(this)"> <%}%>	               
		               <td align="center" nowrap rowspan="<bean:write id="timeresult" property="ClassTime/RowSpan"/>"><bean:write id="timeresult" property="ClassTime/ClassTime" formatType="HH:mm" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" /></td>
	                 
	                <logic:iterate id="teachresult" property="list[@type='SearchTeaching']"> 
                	<logic:equal id="teachresult" property="SearchTeaching/ClassDate" value="ClassTime/ClassDate" valueType="variable" valueId="timeresult">	                             
		            <logic:equal id="teachresult" property="SearchTeaching/ClassTime" value="ClassTime/ClassTime" valueType="variable" valueId="timeresult">	
		                              <%j++; if(j!=1){%>
		               <tr class="<%=trClass%>" onClick="changeTRBgColor(this)"> <%}%>	               
		               <td><bean:write id="teachresult" property="SearchTeaching/ClassName" /></td>
		               <td><bean:write id="teachresult" property="SearchTeaching/RoomName" /></td>
		               <td><bean:write id="teachresult" property="SearchTeaching/CourseTitle" /></td>
		               <td><bean:write id="teachresult" property="SearchTeaching/TeacherName" /></td>
		               <td><bean:write id="teachresult" property="SearchTeaching/OutSider" /></td>
	               </logic:equal>
	               </logic:equal>
                </logic:iterate> 
	               
	               </logic:equal>
                </logic:iterate>             
                </logic:iterate> 
                </logic:greaterThan>
        </table></logic:notPresent>
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
</html>

<script language="javascript">
function queryTeaching(){	
    var teacherID = document.opeForm['SearchTeaching/TeacherID/criteria/value'].value;
    document.opeForm['input/searchText'].value="";
  	var frm = document.forms[0];
  	frm.action = "teachWorkManage.prSearch.teachInfoList.do";
	if(validater(frm)) frm.submit();
}


 function search() {
	var frm = document.forms[0];
	//var ti = frm['SearchTeaching/TeacherID/criteria/value'];
	var obj=frm.elements["input/searchText"].value;
	
	if (obj!=""&&obj.indexOf("'")>-1){
	   alert("关键字不能包含'");
	   return false;
	}
    
    //if (ti.options[ti.selectedIndex].value == "") {
    //   alert("请选择教研部后再选择教师！");
    //   return false;
    //}
    frm['SearchTeaching/TeachingGroupID/criteria/value'].value="";
  	frm['SearchTeaching/TeacherID/criteria/value'].value="";
  	frm.action = "teachWorkManage.prSearch.teachInfoList.do";
	if(validater(frm)) frm.submit();
  
  }
  function onLoad(){
  var isFirst= '<bean:write property="input/isFirst"/>';
  if(isFirst == '1'){
  document.opeForm['SearchTeaching/ClassDate/criteria/min'].value ="<%=curdate%>";
  document.opeForm['SearchTeaching/ClassDate/criteria/max'].value="<%=curdate%>";
  }
  }
</script>