<%@ include file="/internet/common.jsp" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
<style type="text/css">
<!--
.STYLE1 {
	font-family: "��������";
	font-size: 24px;
}
-->
</style>
<SCRIPT type="text/javascript">
<%
String msg = base.util.TalentContext.getValue(pageContext,null,"msg");
if (msg != null && !"".equals(msg)) {
%>
alert('<%=msg%>');
<%
}
%>
</SCRIPT>
</head>

<body>
<table width="80%" border="0" align="center" cellpadding="1" cellspacing="1">
<FORM action="talent.pr.dataInitDo.do" method="post">
  <tr>
    <td colspan="2" align="center"><span class="STYLE1">���ݿ��ʼ��</span></td>
  </tr>
  <tr>
    <td align="right"><p>Դ���ݿ⣺</p></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td width="40%" align="right" class="td2">����IP��</td>
    <td width="60%" class="td1">&nbsp;
    <html:text property="dataInit/sourceIp" styleClass="inputOA" attributesText='style="width:90%;" ValidateType="notempty" Msg="Դ����IP����Ϊ��"' />
    </td>
  </tr>
  <tr>
    <td width="40%" align="right" class="td2">���ݿ�����</td>
    <td width="60%" class="td1">&nbsp;
    <html:text property="dataInit/sourceDBName" styleClass="inputOA" attributesText='style="width:90%;" ValidateType="notempty" Msg="Դ���ݿ�������Ϊ��"' />
    </td>
  </tr>
  <tr>
    <td width="40%" align="right" class="td2">�ʺţ�</td>
    <td width="60%" class="td1">&nbsp;
    <html:text property="dataInit/sourceUserName" styleClass="inputOA" attributesText='style="width:90%;" ValidateType="notempty" Msg="Դ���ݿ��ʺŲ���Ϊ��"' />
    </td>
  </tr>
  <tr>
    <td width="40%" align="right" class="td2">���룺</td>
    <td width="60%" class="td1">&nbsp;
    <html:text property="dataInit/sourceDBPsw" styleClass="inputOA" attributesText='style="width:90%;" ValidateType="notempty" Msg="Դ���ݿ����벻��Ϊ��"' />
    </td>
  </tr>
  <tr>
    <td width="40%" align="right">&nbsp;</td>
    <td width="60%" class="text">&nbsp;</td>
  </tr>
  <tr>
    <td width="40%" align="right"><p>Ŀ�����ݿ⣺</p></td>
    <td width="60%">&nbsp;</td>
  </tr>
  <tr>
    <td width="40%" align="right" class="td2">������</td>
    <td width="60%" class="td1">&nbsp;
    <html:text property="dataInit/targetIp" styleClass="inputOA" attributesText='style="width:90%;" ValidateType="notempty" Msg="Ŀ�Ļ���IP����Ϊ��"' />
    </td>
  </tr>
  <tr>
    <td width="40%" align="right" class="td2">���ݿ�����</td>
    <td width="60%" class="td1">&nbsp;
    <html:text property="dataInit/targetDBName" styleClass="inputOA" attributesText='style="width:90%;" ValidateType="notempty" Msg="Ŀ�����ݿ�������Ϊ��"' />
    </td>
  </tr>
  <tr>
    <td width="40%" align="right" class="td2">�ʺţ�</td>
    <td width="60%" class="td1">&nbsp;
    <html:text property="dataInit/targetUserName" styleClass="inputOA" attributesText='style="width:90%;" ValidateType="notempty" Msg="Ŀ�����ݿ��ʺŲ���Ϊ��"' />
    </td>
  </tr>
  <tr>
    <td width="40%" align="right" class="td2">���룺</td>
    <td width="60%" class="td1">&nbsp;
    <html:text property="dataInit/targetDBPsw" styleClass="inputOA" attributesText='style="width:90%;" ValidateType="notempty" Msg="Ŀ�����ݿ����벻��Ϊ��"' />
    </td>
  </tr>
  <tr>
    <td width="40%" align="right" class="td2">ѡ�������ͣ�</td>
    <td width="60%" class="td1">&nbsp;
    <select name="dataInit/type" id="dataInit/type">
    <option value="-1">��ѡ��������</option>
    <option value="clearOpTable">���ҵ�������</option>
    <option value="clearOaTable">����칫ϵͳ������</option>
    <option value="importAll">����ҵ������</option>
    </select></td>
  </tr>
  <tr>
    <td colspan="2" align="center">
   
    <qx:talentButton styleId="bAdd" property="btnAdd" type="button" styleClass="button_02" value="�� ��" onclick="vldForm()" operation="DX_SYSTEM_MANAGE.DX_SYSTEM_MANAGE_op"/>
    </td>
  </tr>
</FORM>
</table>
</body>
<script type="text/javascript">
<!--
function vldForm() {
   var frm = document.forms[0];
   var types = frm.elements["dataInit/type"];
   
   if (validater(frm)) {
      if (types.options[types.selectedIndex].value == '-1') {
         alert("��ѡ�������ͣ�");
         return false;
      }
     if(confirm("ȷ��ִ�иò�����")==true){
      frm.submit();
      }
   }
}
//-->
</script>
</html>