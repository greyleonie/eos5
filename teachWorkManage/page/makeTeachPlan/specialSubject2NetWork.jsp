<%@include file="/internet/common.jsp"%>

<body>
<style type="text/css">
.td {
	font-size: 12px;
	color: #000000;
	background-color: #F0F0F0;
	line-height: 22px;
}
.td1 {
	background-color: #FFFFFF;
	font-size: 12px;
	line-height: 22px;
	color: #000000;
}
.td2 {
	background-color: #E8F5FF;
	font-size: 12px;
	line-height: 22px;
	color: #000000;
}
.td3 {
	background-color: #F0E68C;
	font-size: 12px;
	line-height: 22px;
	color: #000000;
}
.text {
	font-size: 12px;
	color: #000000;
	line-height: 20px;
}
.td_title {
	background-color: #4A82D1;
	font-size: 12px;
	line-height: 26px;
	color: #FFFFFF;
}
.button_02 {
	font-size: 12px;
	color: #FFFFFF;
	background-attachment: fixed;
	background-image: url('/internet/image/button_bg.gif');
	background-repeat: no-repeat;
	background-position: center center;
	height: 18px;
	width: 54px;
	border: none;
	cursor: hand;
	line-height: 20px;
}
</style>
<title>发送教学计划到外网</title>
<form name="unitForm" method="post">

  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" >
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="" align="center"><input name="B3" type="button" style="border: 0;backcolor:#787878" value="发 送" onClick="save()">    </td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8">          
       </td>
    </tr>   
    
    <tr>
      <td class="text">  
      <table  width="100%" id="listdetail"><tr><td>
      <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" align="center" class="td">         
         <html:hidden property="fileName"/>          
         <html:hidden property="fileSource"/> 
         <html:hidden property="dir" value="teachPlan"/> 
          <html:hidden property="addNews" value="no"/> 
         <bean:write property="TeachingPlan/PlanName"/>       
          </td>
        </tr>       
      </table> 
       <%int count=0; %>
      <logic:iterate id="resultSet" property="list[@type='SpecialSubject']">   
        <table width="100%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolordark="#FFFFFF" bordercolorlight="#A2C4DC" >
          <tr> 
            <td colspan="13"> <table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr>  <%++count;%>
                  <td width="71%" align="left" class="td">
                  专题<%=count%>：&nbsp;&nbsp;<bean:write id="resultSet" property="SpecialSubject/Title"/>&nbsp;&nbsp; 
                    </td>
                  <td  align="center"  class="td" nowrap >&nbsp;
                
               </td>
                </tr>
                
                  <tr> 
                  <td width="71%" align="left" colspan="2" class="td">培训对象：<bean:write id="courseResult" property="SpecialSubject/Partner"/>
                 </td>
                 
                </tr>
              </table></td>
          </tr>
          <tr class="td"> 
            <td width="10%" align="center">日期</td>
            <td width="5%" align="center">时间</td>
            <td width="5%" align="center">午别</td>
            <td width="5%" align="center">星期</td>
            <td width="15%" align="center">学习内容</td>
            <td width="8%" align="center">地　点</td>
            <td width="5%" align="center">考勤</td>
            <td width="8%" align="center">教学形式</td>
            <td width="11%" align="center">课堂模式</td>
            <td width="7%" align="center">授课人</td>
            <td width="6%" align="center">主持人</td>
            <td width="7%" align="center">到会教师</td>
           
          </tr>
        <logic:iterate id="courseResult" property="list[@type='Course']">
             <logic:equal valueType="variable" valueId="resultSet" value="SpecialSubject/SpecialID" propertyId="courseResult" property="Course/SpecialID">
          <logic:equal id="courseResult" value="0" property="Course/ClassNoon">
         <tr class="td1"> 
         </logic:equal>
         <logic:notEqual id="courseResult" value="0" property="Course/ClassNoon">
          <tr class="td3"> 
         </logic:notEqual>
            <td align="center"><bean:write id="courseResult" property="Course/ClassDate" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>&nbsp;</td>
            <td align="center"><bean:write id="courseResult" property="Course/ClassTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="HH:mm"/>&nbsp;</td>
            <td align="center"><dict:write businTypeId="BNDICT_classMoon" property="Course/ClassNoon" id="courseResult"/>&nbsp;</td>
            <td align="center"><bean:write id="courseResult" property="Course/weekDate"/>&nbsp;</td>
                  <td align="middle">&nbsp;<bean:write id="courseResult" property="Course/CourseTitle"/>&nbsp;</td>
                  <td align="middle">&nbsp;<bean:write id="courseResult" property="Course/classRoom"/>&nbsp;</td>
            <td align="middle">
            <logic:equal id="courseResult" value="0" property="Course/IsUseKQJ">否</logic:equal>
            <logic:equal id="courseResult" value="1" property="Course/IsUseKQJ">是</logic:equal>
            </td>
                  <td align="middle">&nbsp;<bean:write id="courseResult" property="Course/TeahchingModelID"/>&nbsp;</td>
                  <td align="middle">&nbsp;<bean:write id="courseResult" property="Course/ClassModelID"/>&nbsp;</td>
                  <td align="middle">&nbsp; <bean:write id="courseResult" property="Course/teachIngMan"/>&nbsp;</td>
                  <td align="middle">&nbsp; <bean:write id="courseResult" property="Course/dj"/>&nbsp;</td>
                  <td align="middle">&nbsp;<bean:write id="courseResult" property="Course/daoHui"/>&nbsp;</td>
          
          </tr>
          </logic:equal>
                 
        </logic:iterate>  
        </table>        
        </logic:iterate>
        </td></tr></table>
      </td>
    </tr>
   
  </table>
</form>
</body>
<script language="javascript">

function table2xml(tableObj) {
	var result = "<table>";
	var allrows = tableObj.rows;
	for(var i = 0; i < allrows.length; i++) {
		var somerow = allrows[i];
		result += "<tr";
		if(somerow.className!=null ) result += " class=\"" + somerow.className + "\"";
		result +=">";
		for(var j = 0; j < somerow.cells.length; j++) {
			var somecell = somerow.cells[j];
			var somecellvalue = somecell.innerHTML;
			
			if(i == 0 ) {
				somecellvalue = somecellvalue.replace(/<br>/gi,"");
				
				
			}else{
				somecellvalue = somecellvalue.replace(/<br>/gi,"");
				somecellvalue = somecellvalue.replace(/<input\s+type=hidden.*?>/gi,"");
				somecellvalue = somecellvalue.replace(/<INPUT .*?>/gi,i);
				//somecellvalue = somecellvalue.replace(/(< *IMG [^>]*>)/gi,"");
			}			
			result += "<td";
			if(somecell.getAttribute("colspan")!=null && somecell.getAttribute("colspan")!=1) result += " colspan=\"" + somecell.getAttribute("colspan") + "\"";
			if(somecell.getAttribute("rowspan")!=null && somecell.getAttribute("rowspan")!=1) result += " rowspan=\"" + somecell.getAttribute("rowspan") + "\"";

			result += ">";
			result += somecellvalue;
			result += "</td>"
		}//for j
		result +="</tr>";
	}//for i

	result += "</table>";
	return result;

}

function save(){
var frm=document.forms[0];
var reportTable = document.all.listdetail;
var  exml = table2xml(reportTable);
frm.elements["fileSource"].value=exml;
frm.action="teachWorkManage.prMakeTeachPlan.sendPage2WebSite.do";
frm.submit();
}
</script>