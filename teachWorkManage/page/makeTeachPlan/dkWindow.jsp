<%@include file="/internet/common.jsp"%>
<%@ page import="java.util.*;"%>

<title>调课</title>

<body>
<form name="form1" method="post">

  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;调课</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8" id="hiddens">    
      <html:hidden property="classId"/>    
      </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr  onClick="changeTRBgColor(this)">
            <td width="12%" align="right" class="td2">班级名称：</td>
            <td width="88%" class="td1">
          <bean:write property="className"/> </td>
          </tr>
          <tr >
            <td align="right" nowrap class="td2">课程的时间：</td>
            <td class="td1">
               <html:text property="oldCourse/ClassDate[@pattern='yyyy-MM-dd']"  attributesText='class="input" size="13"' readonly="true"/>
         <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["oldCourse/ClassDate[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
           <html:text property="oldCourse/ClassTime" value="8:45" attributesText='class="input" size="12"'/>
           <html:radio property="oldCourse/ClassNoon" checked="true" onclick="setClassTime('8:45')" value="0"/>   
            上午
             <html:radio property="oldCourse/ClassNoon" onclick="setClassTime('14:30')" value="1"/>   
            下午
             <html:radio property="oldCourse/ClassNoon" onclick="setClassTime('17:30')" value="2"/>   
            晚上
             <html:radio property="oldCourse/ClassNoon" onclick="setClassTime('8:45')"value="3"/>   
            全天          
           <span class="text_red">*</span>
            </td>
          </tr>
          <tr  >
            <td align="right" nowrap class="td2">被互换的课程时间：</td>
            <td class="td1">
         <html:text property="newCourse/ClassDate[@pattern='yyyy-MM-dd']"  attributesText='class="input" size="13"' readonly="true"/>
         <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["newCourse/ClassDate[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
             <html:text property="newCourse/ClassTime" value="8:45" attributesText='class="input" size="12"'/>
           <html:radio property="newCourse/ClassNoon" checked="true"  onclick="setClassTime2('8:45')" value="0"/>   
            上午
             <html:radio property="newCourse/ClassNoon" onclick="setClassTime2('14:30')" value="1"/>   
            下午
             <html:radio property="newCourse/ClassNoon" onclick="setClassTime2('17:30')" value="2"/>   
            晚上
             <html:radio property="newCourse/ClassNoon" onclick="setClassTime2('8:45')"value="3"/>   
            全天 
           <span class="text_red">*</span></td>          
          </tr>
            
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
                <input name="Submit" type="button" class="button_02" value="保 存" onclick="save()">              
                <input name="Submit2" type="button" class="button_02" value="关闭" onclick="window.close()"></td>
            </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
</form>
</body>
<script language="javascript">
 function save(){
 var frm=document.forms[0];
 var oldDate=frm.elements["oldCourse/ClassDate[@pattern='yyyy-MM-dd']"].value;
 var newDate=frm.elements["newCourse/ClassDate[@pattern='yyyy-MM-dd']"].value;
 var oldTime=frm.elements["oldCourse/ClassTime"].value;
 var newTime=frm.elements["newCourse/ClassTime"].value;
   if(oldDate==""||newDate==""||oldTime==""||newTime==""){
     alert("时间不能为空！");
     return;
   }else{
    frm.action="teachWorkManage.prMakeTeachPlan.diaoKe.do";
     frm.submit();
   }
 }
 function setClassTime(time){
  var frm=document.forms[0];
  frm.elements["oldCourse/ClassTime"].value=time;
 }
 
  function setClassTime2(time){
  var frm=document.forms[0];
  frm.elements["newCourse/ClassTime"].value=time;
 }
</script>