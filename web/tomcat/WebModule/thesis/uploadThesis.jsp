<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/app.tld" prefix="app" %>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ޱ����ĵ�</title>
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
    <font color="red">�����������ϴ��ɹ�����Ҫ�޸ģ����ٴ��ϴ����������£��Ḳ��ԭ�������£�лл��</font>
    </logic:notEmpty>
    </td>
  </tr>
  <tr>
    <td align="center"><table width="80%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#D8D8D8">
      <tr>
        <td width="10%" align="right" class="td">�ϴ����£�</td>
        <td width="84%" class="td1"><input type="file" name="file1" size="39"   onblur="setFileName(this)"/>
          <span class="STYLE1">*���ϴ��������������</span></td>
      </tr>
      <tr>
        <td width="16%" align="right" class="td">���±��⣺</td>
        <td width="84%" class="td1">
        <html:text property="thesisTitle" name="thesis"   size="39" ></html:text>
        
          <span class="STYLE1">*</span> </td>
      </tr>
     
      <tr>
        <td align="right" class="td">���¹۵㣺</td>
        <td class="td1">
			<html:textarea property="opinion" name="thesis" cols="60" rows="6"></html:textarea>
			</td>
      </tr>
      <tr>
        <td align="right" class="td">�� ע��</td>
        <td class="td1"><html:textarea property="remark" name="thesis" cols="60" rows="6"></html:textarea></td>
      </tr>
      <tr>
    <td align="center" colspan="2" class="td1">
      <input name="B1" type="button" value="�� �� �� ��" onclick="save()" style="color:FF0000"/>
          &nbsp;
          <input name="B2" type="reset" value="ȫ����д" /></td>
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
			alert("���������");
			return false;
		}
		if(frm.file1.value==""){
			alert("��ѡ�񸽼�");
			return false;
		}
		return true;
}
function save(){
  var frm =document.forms[0];
  var filepath = frm.elements["file1"].value;
  if (filepath.indexOf("doc")<0) {
	         alert("--���ϴ�WORD���͵��ĵ���лл��");
	         return false;
	    }else{
	    frm.submit();}
}
//-->
</script>
</html>

