<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/app.tld" prefix="app" %>

<html>
<head><%String path=request.getContextPath();%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>中共广州市委党校</title>
<link href="<%=path%>/css/css.css" rel="stylesheet" type="text/css">
</head>

<body>
<html:form method="post" action="/sign.do?action=save">
<table width="100%" height="224" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="100%" height="18">
	<html:hidden property="specialID"/>
	<input type="hidden" name="subjectName" value='<bean:write name="subjectName"/>'>
	
	</td>
  </tr>
  <tr>
    <td width="100%" height="31" class="td">专题班报名表----------专题名称：<bean:write name="subjectName"/></td>
  </tr>
   <tr>
    <td width="100%" height="31" align="center" class="td1">

	<logic:present name="msg">
	   <font color="#FF3366"><bean:write name="msg"/></font>
	</logic:present>
	</td>
  </tr>
  <tr>
    <td width="98%" height="10"><table width="68%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#D8D8D8">
      <tr>
        <td width="8%" align="right" class="td">姓名：</td> 
	    <td  align="left" class="td1"><html:text maxlength = "25"  property="name"/>（必填）</td>         
      </tr>
	   <tr>
        <td width="8%" align="right" class="td">性别：</td> 
	    <td  align="left" class="td1"><input type="radio" name="sex" checked value="0">男<input type="radio" name="sex" value="1">女</td>         
      </tr>
	    <tr>
        <td width="8%" nowrap align="right" class="td">文化程度：</td> 
	    <td  align="left" class="td1">
		<select name="education">
		   <option value="请选择">请选择</option>
		   <option value="初中">初中</option>
		   <option value="高中">高中</option>
		   <option value="中专">中专</option>
		   <option value="专科">专科</option>
		   <option value="大专" selected>大专</option>
		   <option value="党校大专生">党校大专生</option>	
		   <option value="大学">大学</option>
		   <option value="大普">大普</option>
		   <option value="本科">本科</option>
		   <option value="党校本科生">党校本科生</option>	
		   <option value="研究生">研究生</option>	
		   <option value="硕士研究生">硕士研究生</option>
		   <option value="硕士">硕士</option>
		   <option value="在职研究生">在职研究生</option>
		   <option value="党校研究生">党校研究生</option>
		   <option value="博士研究生">博士研究生</option>	
		   <option value="博士">博士</option>
		   <option value="博士后">博士后</option>
		   <option value="不确定">不确定</option>
		   <option value="其他">其他</option>
		</select>（必选）
		</td>         
      </tr>
      <tr>
        <td width="8%" nowrap align="right" class="td">单位：</td> 
	    <td  align="left" class="td1"><html:text maxlength = "25" property="organ" size="50"/></td>         
      </tr>
	   <tr>
        <td width="8%" nowrap align="right" class="td">部门：</td> 
	    <td  align="left" class="td1"><html:text maxlength = "25" property="department"/></td>         
      </tr>
	   <tr>
        <td width="8%" nowrap align="right" class="td">职务：</td> 
	    <td  align="left" class="td1"><html:text maxlength = "25" property="post"/></td>         
      </tr>
	    <tr>
        <td width="8%" nowrap align="right" class="td">职级：</td> 
	    <td  align="left" class="td1">
		<select name="postLevel">
		   <option value="请选择">请选择</option>
		   <option value="办事员">办事员</option>
		   <option value="助理调研员">助理调研员</option>
		   <option value="调研员">调研员</option>
		   <option value="科员">科员</option>
		   <option value="副科">副科</option>
		   <option value="正科">正科</option>
		   <option value="副主任科员">副主任科员</option>
		   <option value="主任科员">主任科员</option>		  
		   <option value="助理巡视员">助理巡视员</option>
		   <option value="巡视员">巡视员</option>		   
		   <option value="副处">副处</option>
		   <option value="正处">正处</option>		  
		   <option value="副局">副局</option>
		   <option value="正局">正局</option>		   
		   <option value="其他">其他</option>
		</select>
		（必选）
		
		</td>         
      </tr>
     
	   <tr>
        <td nowrap align="center" colspan="2" class="td1">
		<input style="border:0" type="button" name="saveBtn" value="保 存" onclick="save()">
		<input style="border:0" type="button" name="saveBtn" value="返 回" onclick="return2SubjectPage()">
		<input style="border:0;courser:hand" type="button" value="关 闭" onclick="window.close()">
		</td> 	           
      </tr>
    </table></td>
  </tr>
  <tr>
    <td width="100%" height="63" class="text"></td>
  </tr>
  <tr>
    <td width="100%" height="18"></td>
  </tr>
</table></html:form>
</body>
</html>
<script language="javascript">
var frm=document.forms[0];
function save(){    
  if(frm.elements["name"].value==""){
    alert("姓名必须填写！");
	return;
  }
   if(frm.elements["education"].selectedIndex=="0"){
    alert("必须选择文化程度！");
	return;
  }
  if(frm.elements["postLevel"].selectedIndex=="0"){
    alert("必须选择职级！");
	return;
  }
  frm.elements["saveBtn"].disabled=true;
  frm.submit();
}

function return2SubjectPage(){
  var path='<%=path%>';
  frm.action=path+"/specialSubject/course.jsp";
  frm.submit();
}
</script>
