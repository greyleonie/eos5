<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/app.tld" prefix="app" %>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<link href="/css/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body >
<html:form action="/thesis.do?action=uploadThesisDo" method="post" enctype="multipart/form-data" onsubmit="return checkForm()">
<html:hidden property="thesisId" name="thesis"/>
<html:hidden property="teachingGroupId" name="thesis"/>
<html:hidden property="studentId" name="thesis"/>
<table width="80%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center">&nbsp;
    <logic:notEmpty property="thesisTitle" name="thesis">
    <font color="red">您的文章已上传成功。如要修改，请再次上传您的新文章，会覆盖原来的文章，谢谢！</font>
    </logic:notEmpty>
    </td>
  </tr>
  <tr>
    <td align="center"><table width="80%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#D8D8D8">
      <tr>
        <td width="10%" align="right" class="td">上传文章：</td>
        <td width="84%" class="td1"><input type="file" name="file1" size="39"   onblur="setFileName(this)"/>
          <span class="STYLE1">*（上传文章请点击浏览）</span></td>
      </tr>
      <tr>
        <td width="16%" align="right" class="td">文章标题：</td>
        <td width="84%" class="td1">
        <html:text property="thesisTitle" name="thesis"   size="39" ></html:text>
        
          <span class="STYLE1">*</span> </td>
      </tr>
     
      <tr>
        <td align="right" class="td">文章观点：</td>
        <td class="td1">
			<html:textarea property="opinion" name="thesis" cols="60" rows="6"></html:textarea>
			</td>
      </tr>
      <tr>
        <td align="right" class="td">备 注：</td>
        <td class="td1"><html:textarea property="remark" name="thesis" cols="60" rows="6"></html:textarea></td>
      </tr>
      <tr>
    <td align="center" colspan="2" class="td1">
      <input name="B1" type="button" value="提 交 文 章" onclick="save()" style="color:FF0000"/>
          &nbsp;
          <input name="B2" type="reset" value="全部重写" /></td>
      </tr>
    </table></td>
  </tr>
  
    </table></td>
  </tr>
  <tr>
    <td align="center">&nbsp;</td>
  </tr>
</table>
</html:form>
</body>
<script type="text/javascript">
<!--
function setFileName(b){
var frm=document.forms(0);
var s=b.value; 
var ss=s.split("\\")[s.split("\\").length-1]; 
var laststr=ss.split(".")[ss.split(".").length-1]; 
var sss= ss.split("."+laststr); 
for(var i=2; i<sss.length;i++){ 
sss[0]+="."+laststr; 

} 
frm.thesisTitle.value=sss[0];
}
function checkForm(){
		var frm=document.forms(0);
		if(frm.thesisTitle.value==""){
			alert("请输入标题");
			return false;
		}
		if(frm.file1.value==""){
			alert("请选择附件");
			return false;
		}
		return true;
}
function save(){
  var frm =document.forms[0];
  var filepath = frm.elements["file1"].value;
  if (filepath.indexOf("doc")<0) {
	         alert("--请上传WORD类型的文档，谢谢！");
	         return false;
	    }else{
	    frm.submit();}
}
//-->
</script>
</html>

