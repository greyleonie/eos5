<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/app.tld" prefix="app" %>

<html>
<head><%String path=request.getContextPath();%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�й�������ί��У</title>
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
    <td width="100%" height="31" class="td">ר��౨����----------ר�����ƣ�<bean:write name="subjectName"/></td>
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
        <td width="8%" align="right" class="td">������</td> 
	    <td  align="left" class="td1"><html:text maxlength = "25"  property="name"/>�����</td>         
      </tr>
	   <tr>
        <td width="8%" align="right" class="td">�Ա�</td> 
	    <td  align="left" class="td1"><input type="radio" name="sex" checked value="0">��<input type="radio" name="sex" value="1">Ů</td>         
      </tr>
	    <tr>
        <td width="8%" nowrap align="right" class="td">�Ļ��̶ȣ�</td> 
	    <td  align="left" class="td1">
		<select name="education">
		   <option value="��ѡ��">��ѡ��</option>
		   <option value="����">����</option>
		   <option value="����">����</option>
		   <option value="��ר">��ר</option>
		   <option value="ר��">ר��</option>
		   <option value="��ר" selected>��ר</option>
		   <option value="��У��ר��">��У��ר��</option>	
		   <option value="��ѧ">��ѧ</option>
		   <option value="����">����</option>
		   <option value="����">����</option>
		   <option value="��У������">��У������</option>	
		   <option value="�о���">�о���</option>	
		   <option value="˶ʿ�о���">˶ʿ�о���</option>
		   <option value="˶ʿ">˶ʿ</option>
		   <option value="��ְ�о���">��ְ�о���</option>
		   <option value="��У�о���">��У�о���</option>
		   <option value="��ʿ�о���">��ʿ�о���</option>	
		   <option value="��ʿ">��ʿ</option>
		   <option value="��ʿ��">��ʿ��</option>
		   <option value="��ȷ��">��ȷ��</option>
		   <option value="����">����</option>
		</select>����ѡ��
		</td>         
      </tr>
      <tr>
        <td width="8%" nowrap align="right" class="td">��λ��</td> 
	    <td  align="left" class="td1"><html:text maxlength = "25" property="organ" size="50"/></td>         
      </tr>
	   <tr>
        <td width="8%" nowrap align="right" class="td">���ţ�</td> 
	    <td  align="left" class="td1"><html:text maxlength = "25" property="department"/></td>         
      </tr>
	   <tr>
        <td width="8%" nowrap align="right" class="td">ְ��</td> 
	    <td  align="left" class="td1"><html:text maxlength = "25" property="post"/></td>         
      </tr>
	    <tr>
        <td width="8%" nowrap align="right" class="td">ְ����</td> 
	    <td  align="left" class="td1">
		<select name="postLevel">
		   <option value="��ѡ��">��ѡ��</option>
		   <option value="����Ա">����Ա</option>
		   <option value="�������Ա">�������Ա</option>
		   <option value="����Ա">����Ա</option>
		   <option value="��Ա">��Ա</option>
		   <option value="����">����</option>
		   <option value="����">����</option>
		   <option value="�����ο�Ա">�����ο�Ա</option>
		   <option value="���ο�Ա">���ο�Ա</option>		  
		   <option value="����Ѳ��Ա">����Ѳ��Ա</option>
		   <option value="Ѳ��Ա">Ѳ��Ա</option>		   
		   <option value="����">����</option>
		   <option value="����">����</option>		  
		   <option value="����">����</option>
		   <option value="����">����</option>		   
		   <option value="����">����</option>
		</select>
		����ѡ��
		
		</td>         
      </tr>
     
	   <tr>
        <td nowrap align="center" colspan="2" class="td1">
		<input style="border:0" type="button" name="saveBtn" value="�� ��" onclick="save()">
		<input style="border:0" type="button" name="saveBtn" value="�� ��" onclick="return2SubjectPage()">
		<input style="border:0;courser:hand" type="button" value="�� ��" onclick="window.close()">
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
    alert("����������д��");
	return;
  }
   if(frm.elements["education"].selectedIndex=="0"){
    alert("����ѡ���Ļ��̶ȣ�");
	return;
  }
  if(frm.elements["postLevel"].selectedIndex=="0"){
    alert("����ѡ��ְ����");
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
