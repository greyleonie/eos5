<%@include file="/internet/common.jsp"%>
<style media=print>
.Noprint{display:none;}
.PageNext{page-break-after: always;}
</style>
<style type="text/css">
<!--
.STYLE1 {font-size: 14px}
-->
</style>

<body >
<form name="form1" method="post" action="studentmanage.prAlbum.ablumList.do" enctype="multipart/form-data">
<html:hidden property="QueryStudentSimple/ClassID/criteria/value"/>
<html:hidden property="PageCond/begin"/>
<html:hidden property="PageCond/count"/>
<html:hidden property="PageCond/length" />
<html:hidden property="QueryStudentSimple/operatorname/criteria/value" />
<INPUT value="like" type="hidden" name="QueryStudentSimple/operatorname/criteria/operator">
<INPUT value="center" type="hidden" name="QueryStudentSimple/operatorname/criteria/likeRule">
<center>
  <OBJECT  id=WebBrowser  classid=CLSID:8856F961-340A-11D0-A96B-00C04FD705A2  height=0  width=0>
  </OBJECT>
  <div id="printsub" style='background-color:#4A59BD' class="Noprint">
  <a href="#" class="write" onclick="document.all.WebBrowser.ExecWB(6,1)">打印</a>
  <a href="#" class="write" onclick="document.all.WebBrowser.ExecWB(8,1)">页面设置</a>
  <a href="#" class="write" onclick="document.all.WebBrowser.ExecWB(7,1)">预览</a>
  </div>
</center>

<table width="98%"   border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" class="PageNext">
          <% int tempInt=0; %>
          <tr class="td1" onClick="changeTRBgColor(this)"> 
          <logic:iterate id="resultset" property="list[@type='QueryStudentSimple']">
            <td width="40%" height="322" valign="center" nowrap>
            <br><br>
             <table width="90" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#F6F6F6">
                <tr> 
                  <td width="90" height="100"><table width="80" height="100" border="1" cellpadding="0" cellspacing="0">
                    <tr class="td1">
                      <td align="center" >
					 <span class="STYLE1">
					  相<br><br>
					  片
					  </span>
					  </td>
                    </tr>
                  </table>				  </td>
                </tr>
                <tr class="td1"> 
                  <td width="90" height="70" align="center">
                   <span class="STYLE1">
				  <FONT face="宋体" size="4px"><bean:write id="resultset" property="QueryStudentSimple/PhotoID"/>_<bean:write id="resultset" property="QueryStudentSimple/operatorname"/></FONT>
				  </span>
				  </td>
                
                </tr>
            </table></td>
              <%
                  	tempInt=tempInt+1;
                  	if(tempInt%3==0&&tempInt%9!=0){
                  		
                   %>
    </tr >
                   <tr class="td1" >
                   <%} 
                   if(tempInt%9==0){
                   %>
                   
    				</tr >
                   </table>
                   <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" class="PageNext">
                   	<tr class="td1" >
                   <%} %>
                  </logic:iterate>
                  <%
                  	if(tempInt%3!=0){
                  	 for(int i=tempInt%3;i<3;i++){
                   %>
                   <td class="td1" width="33%">&nbsp;</td>
                   <%} }%>
            
          </tr>
        </table>
        
        
</form>

</body>
<script type="text/javascript">
 function upload1(){
 	if(document.form1.Photo.value==""){
 		alert("请选择上传文件");
 		return;
 	}
 	form1.submit();
 }
</script>