<%@ include file="/internet/common.jsp" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
<style type="text/css">
<!--
.STYLE1 {
	font-family: "华文中宋";
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
    <td colspan="2" align="center"><span class="STYLE1">数据库初始化</span></td>
  </tr>
  <tr>
    <td align="right"><p>源数据库：</p></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td width="40%" align="right" class="td2">机器IP：</td>
    <td width="60%" class="td1">&nbsp;
    <html:text property="dataInit/sourceIp" styleClass="inputOA" attributesText='style="width:90%;" ValidateType="notempty" Msg="源机器IP不能为空"' />
    </td>
  </tr>
  <tr>
    <td width="40%" align="right" class="td2">数据库名：</td>
    <td width="60%" class="td1">&nbsp;
    <html:text property="dataInit/sourceDBName" styleClass="inputOA" attributesText='style="width:90%;" ValidateType="notempty" Msg="源数据库名不能为空"' />
    </td>
  </tr>
  <tr>
    <td width="40%" align="right" class="td2">帐号：</td>
    <td width="60%" class="td1">&nbsp;
    <html:text property="dataInit/sourceUserName" styleClass="inputOA" attributesText='style="width:90%;" ValidateType="notempty" Msg="源数据库帐号不能为空"' />
    </td>
  </tr>
  <tr>
    <td width="40%" align="right" class="td2">密码：</td>
    <td width="60%" class="td1">&nbsp;
    <html:text property="dataInit/sourceDBPsw" styleClass="inputOA" attributesText='style="width:90%;" ValidateType="notempty" Msg="源数据库密码不能为空"' />
    </td>
  </tr>
  <tr>
    <td width="40%" align="right">&nbsp;</td>
    <td width="60%" class="text">&nbsp;</td>
  </tr>
  <tr>
    <td width="40%" align="right"><p>目的数据库：</p></td>
    <td width="60%">&nbsp;</td>
  </tr>
  <tr>
    <td width="40%" align="right" class="td2">机器：</td>
    <td width="60%" class="td1">&nbsp;
    <html:text property="dataInit/targetIp" styleClass="inputOA" attributesText='style="width:90%;" ValidateType="notempty" Msg="目的机器IP不能为空"' />
    </td>
  </tr>
  <tr>
    <td width="40%" align="right" class="td2">数据库名：</td>
    <td width="60%" class="td1">&nbsp;
    <html:text property="dataInit/targetDBName" styleClass="inputOA" attributesText='style="width:90%;" ValidateType="notempty" Msg="目的数据库名不能为空"' />
    </td>
  </tr>
  <tr>
    <td width="40%" align="right" class="td2">帐号：</td>
    <td width="60%" class="td1">&nbsp;
    <html:text property="dataInit/targetUserName" styleClass="inputOA" attributesText='style="width:90%;" ValidateType="notempty" Msg="目的数据库帐号不能为空"' />
    </td>
  </tr>
  <tr>
    <td width="40%" align="right" class="td2">密码：</td>
    <td width="60%" class="td1">&nbsp;
    <html:text property="dataInit/targetDBPsw" styleClass="inputOA" attributesText='style="width:90%;" ValidateType="notempty" Msg="目的数据库密码不能为空"' />
    </td>
  </tr>
  <tr>
    <td width="40%" align="right" class="td2">选择处理类型：</td>
    <td width="60%" class="td1">&nbsp;
    <select name="dataInit/type" id="dataInit/type">
    <option value="-1">请选择处理类型</option>
    <option value="clearOpTable">清除业务表数据</option>
    <option value="clearOaTable">清除办公系统表数据</option>
    <option value="importAll">导入业务数据</option>
    </select></td>
  </tr>
  <tr>
    <td colspan="2" align="center">
   
    <qx:talentButton styleId="bAdd" property="btnAdd" type="button" styleClass="button_02" value="处 理" onclick="vldForm()" operation="DX_SYSTEM_MANAGE.DX_SYSTEM_MANAGE_op"/>
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
         alert("请选择处理类型！");
         return false;
      }
     if(confirm("确定执行该操作吗？")==true){
      frm.submit();
      }
   }
}
//-->
</script>
</html>