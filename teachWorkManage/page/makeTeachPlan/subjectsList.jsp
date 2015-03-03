<%@include file="/internet/common.jsp"%>

<title>各专题以及课程</title>
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

<form name="frm" method="post">

  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8">       
      <html:hidden property="fileName"/>
      <html:hidden property="fileSource"/>
      <html:hidden property="dir" value="subjectCourse"/>
      <html:hidden property="addNews" value="yes"/>
      
      <html:hidden name="subjectNews/startTime[@pattern='yyyy-MM-dd']" property="subjectNews/startTime" />
      <html:hidden name="subjectNews/endTime[@pattern='yyyy-MM-dd']" property="subjectNews/endTime" />
      </td>
    </tr>
    <tr>
      <td class="text">    
      <%
      int count=0; 
       String array[]=new String[10];
       array[0]="一";
       array[1]="二";
       array[2]="三";
       array[3]="四";
       array[4]="五";
       array[5]="六";
       array[6]="七";
       array[7]="八";
       array[8]="九";
       array[9]="十";
       
      
      %>
      <table width="100%" id="listdetail"><tr><td>
	    <table width="98%"  border="0" align="center" cellpadding="0"   cellspacing="0"  bordercolorlight="#787878" bgcolor="#787878">
         <tr class="td1"><td nowrap>&nbsp;&nbsp;<font size="3"><STRONG>通知：<bean:write property="fileName"/>已制定完毕，各专题以及相应的课程如下表，并接受报名！</STRONG></font></td></tr>
	  </table>
	  </td></tr><tr><td>
      <logic:iterate id="subjectList" property="list[@type='SpecialSubject']">       
        <table width="100%"  border="1" align="center" cellpadding="0"   cellspacing="0"  bordercolorlight="#787878" bgcolor="#787878">
         <tr  align="left" class="td">
         <td colspan="2" align="left" nowrap>教研部：<bean:write id="subjectList" property="SpecialSubject/TeachingGroupID"/></td><td colspan="7" align="right">
       
         </td></tr>
         <tr align="center" class="td">
            <td width="7%" height="20">&nbsp;</td>
            <td width="7%" height="20">专题号</td>
            <td width="15%" height="20">专题题目</td>
            <td width="9%" height="20">开班时间</td>
            <td width="5%" height="20">学时</td>
            <td width="25%" height="20">课程内容</td>
            <td width="11%" height="20">授课人</td>
            <td width="6%" height="20">学时</td>
            <td width="9%" height="20">教学形式</td>
           
          </tr>
          <tr class="td1">
             <td width="7%" rowspan='<bean:write id="subjectList" property="SpecialSubject/rowspan"/>' nowrap>           
            <a href="../sign.do?action=toSignPage&specialID=<bean:write id="subjectList" property="SpecialSubject/SpecialID"/>&subjectName=<bean:write id="subjectList" property="SpecialSubject/Title"/>"><font color="#F83818">报名</font></a></td>
            <td width="7%" rowspan='<bean:write id="subjectList" property="SpecialSubject/rowspan"/>' nowrap>
           
            专题<%=array[count]%></td>
            <td width="15%" rowspan='<bean:write id="subjectList" property="SpecialSubject/rowspan"/>'>
               <bean:write id="subjectList" property="SpecialSubject/Title"/>&nbsp;
            </td>
            <td width="9%" rowspan='<bean:write id="subjectList" property="SpecialSubject/rowspan"/>'>
                <bean:write id="subjectList" property="SpecialSubject/ClassTime"/>&nbsp;
            </td>
            <td width="5%" rowspan='<bean:write id="subjectList" property="SpecialSubject/rowspan"/>'>
                <bean:write id="subjectList" property="SpecialSubject/ClassHour"/>&nbsp;
            </td>
           <%          
             String classHour="";
             String teacher="";
             String teahchingModelID="";
             String courseId="";
           int    hasCourse=0; 
             String state="";
           %>
            <logic:iterate id="forCourse" property="list[@type='Course']">
                <logic:equal propertyId="subjectList" property="SpecialSubject/SpecialID" valueType="variable" valueId="forCourse" value="Course/SpecialID">
                 <%               
                 
                 if(hasCourse==0){ %>
               <td width="25%" height="20"><bean:write id="forCourse" property="Course/CourseTitle"/>&nbsp;</td>
                 <%
                 
                
                 try{
                 String title=base.util.TalentContext.getValue(pageContext,"forCourse","Course/CourseTitle");
                 courseId=base.util.TalentContext.getValue(pageContext,"forCourse","Course/CourseID");
                 classHour=base.util.TalentContext.getValue(pageContext,"forCourse","Course/ClassHour");
                 teacher=base.util.TalentContext.getValue(pageContext,"forCourse","Course/Teachers");
                 teahchingModelID=base.util.TalentContext.getValue(pageContext,"forCourse","Course/TeahchingModelID");
                 String adopted=base.util.TalentContext.getValue(pageContext,"forCourse","Course/IsAdopted");
                if(adopted==null)adopted="";
                
               if(adopted.equals("1"))  state="checked";      
               if(classHour==null){
                   classHour="";
                 }
               if(teacher==null){
                   teacher="";
                 }
               if(teahchingModelID==null){
                   teahchingModelID="";
                 }
                 }catch(Exception e){
                  System.out.println("============错误："+e);
                 }
                 session.setAttribute("courseId",courseId);
                 hasCourse++; 
                 
                  } 
                 %>
                 </logic:equal>
            </logic:iterate>
            <%
              String status="";
            if(hasCourse==0){ %>
              <td width="25%" height="20">没有课程！</td>
            <%} %>
            <td width="11%" height="20"><%=teacher %>&nbsp;</td>
            <td width="6%" height="20"><%=classHour %>&nbsp;</td>
            <td width="9%" height="20"><%=teahchingModelID %>&nbsp;</td>
           
             <%if(hasCourse==0){ %>
               &nbsp;
             <%}      
               
               %>
                       
            
            
           
          </tr>
         
          <logic:iterate id="otherCourse" property="list[@type='Course']">
             <logic:equal propertyId="subjectList" property="SpecialSubject/SpecialID" valueType="variable" valueId="otherCourse" value="Course/SpecialID">
                
           <%
           String courseID="";
           String lastCourseID="";         
           try{
           courseID=base.util.TalentContext.getValue(pageContext,"otherCourse","Course/CourseID");
           }catch(Exception e){
            System.out.println("===========错误："+e);
           }
                
         if((String)session.getAttribute("courseId")!=null){
             lastCourseID=(String)session.getAttribute("courseId");
           }
           if(!lastCourseID.equals(courseID)){              
            %>
          <tr class="td1">
            <td width="25%" height="15" ><bean:write id="otherCourse" property="Course/CourseTitle"/>&nbsp;</td>
            <td width="11%" height="15" ><bean:write id="otherCourse" property="Course/Teachers"/>&nbsp;</td>
            <td width="6%" height="15" ><bean:write id="otherCourse" property="Course/ClassHour"/>&nbsp;</td>
            <td width="9%" height="15" ><bean:write id="otherCourse" property="Course/TeahchingModelID"/>&nbsp;</td>
           
               <%
               try{
                  String isAdopted=base.util.TalentContext.getValue(pageContext,"otherCourse","Course/IsAdopted");                 
                if(isAdopted==null)isAdopted="";
                
               if(isAdopted.equals("1"))  status="checked";              
               
               }catch(Exception e){
                System.out.println("===============:error:"+e);
               }  
               
                       
               %>
              
          
          </tr> 
          <%} %>
          </logic:equal>
          </logic:iterate>    
        </table>
        <%count++; %>
        </logic:iterate> 
        <%if(count==0){ %>
        <table width="98%"  border="1" align="center" cellpadding="0"   cellspacing="0" bordercolordark="#FFFFFF" bordercolorlight="#A2C4DC" bgcolor="#A2C4DC">
          <tr><td class="td1" align="center">&nbsp;
        
           </td></tr>
            <tr><td class="td1" align="center">&nbsp;
        
           </td></tr>
            <tr><td class="td1" align="center">&nbsp;
        
           </td></tr>
         <tr><td class="td1" align="center">
         没有专题!
           </td></tr>    
        </table>
        <%} %>        
       </td></tr></table>
        </td>
    </tr>
    <tr>
      <td class="text">

</td>
    </tr>
       <tr>
      <td class="text"><table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
              <input name="btnSave" type="button" border="0" value="保 存" onclick='save()'>
              <input name="btnSave" type="button" border="0" value="关 闭" onclick='window.close()'>
              </td>
            </tr>
        </table></td>
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
				
				somecellvalue = somecellvalue.replace(/<INPUT .*?>/gi,"序号");
				somecellvalue = somecellvalue.replace(/(< *IMG [^>]*>)/gi,"序号");
			}else{
				somecellvalue = somecellvalue.replace(/<br>/gi,"");
				somecellvalue = somecellvalue.replace(/<input\s+type=hidden.*?>/gi,"");
				somecellvalue = somecellvalue.replace(/<INPUT .*?>/gi,i);
				//somecellvalue = somecellvalue.replace(/(< *IMG [^>]*>)/gi,"");
			}

			somecellvalue = somecellvalue.replace(/&nbsp;/gi,"");
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