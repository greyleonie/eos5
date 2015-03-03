<%@include file="/internet/common.jsp"%>


<body>
<form name="form1" method="post" action="studentmanage.prAlbum.ablumList.do" enctype="multipart/form-data">
<html:hidden property="QueryStudentSimple/ClassID/criteria/value"/>
<html:hidden property="PageCond/begin"/>
<html:hidden property="PageCond/count"/>
<html:hidden property="PageCond/length" />
<html:hidden property="QueryStudentSimple/operatorname/criteria/value" />
<INPUT value="like" type="hidden" name="QueryStudentSimple/operatorname/criteria/operator">
<INPUT value="center" type="hidden" name="QueryStudentSimple/operatorname/criteria/likeRule">
<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
          <% int tempInt=0; %>
          <tr class="td1" > 
          <logic:iterate id="resultset" property="list[@type='QueryStudentSimple']">
            <td width="20%" height="120" nowrap onClick="changeTDBgColor(this)"> <table width="80" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#F6F6F6">
                <tr> 
                  <td width="80" height="100"><img src='/common/page/viewimgdb/viewFromDB.jsp?table=Student&pkn=StudentID&field=Photo&pkv=<bean:write id="resultset" property="QueryStudentSimple/StudentID"/>' width="80" height="100" onclick="ablumUpload(<bean:write id="resultset" property="QueryStudentSimple/StudentID"/>)"></td>
                </tr>
                <tr class="td1"> 
                  <td width="80" height="25" align="center"><bean:write id="resultset" property="QueryStudentSimple/operatorname"/></td>
                </tr>
              </table></td>
              <%
                  	tempInt=tempInt+1;
                  	if(tempInt==5){
                  		tempInt=0;
                   %>
                   </tr >
                   <tr class="td1" >
                   <%} %>
                  </logic:iterate>
                  <%
                  	if(tempInt!=0){
                  	 for(int i=tempInt;i<5;i++){
                   %>
                   <td class="td1">&nbsp;</td>
                   <%} }%>
            
          </tr>
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
</form>

</body>
<script type="text/javascript">
 function ablumUpload(id){
 	var url="studentmanage.prAlbum.ablumUploadExt.do?QueryStudentSimple/StudentID="+id;
 	window.open(url,"","width=400,height=100,left=300,top=200");
 }
</script>