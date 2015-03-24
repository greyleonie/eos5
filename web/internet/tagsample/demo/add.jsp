<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/hci-dict.tld" prefix="dict" %>


<body bgcolor="#FFFFFF" text="#000000">
<form name="form1" method="post" action="">
  <table width="100%" border="1" align="center" cellpadding="1" cellspacing="0" bordercolor="#BFC2C6" style="border-collapse: collapse">
    <tr > 
      <td colspan="4"> 
        <div class="Result-title">增加客户资料</div>
      </td>
    </tr>
    <tr> 
      <td width="16%" class="Input-text">客户名称</td>
      <td width="33%">
        <input type="text" name="textfield" class="Result-box">
      </td>
      <td width="7%" class="Input-text">电话</td>
      <td width="44%">
        <input type="text" name="textfield2" class="Result-box">
      </td>
    </tr>
    <tr> 
      <td width="16%" class="Input-text">性别</td>
      <td width="33%"><dict:radio name="sex"  businTypeId="BNDICT_gender" modifiable="true" value="1"/></td>
            <td width="16%" class="Input-text">教育程度</td>
      <td width="33%"><dict:select name="zhiye" businTypeId="BNDICT_education"  businessId="1" /></td>

      </td>
    </tr>
    <tr> 
      <td width="7%" class="Input-text">地址</td>
      <td width="44%" colspan="3">
        <textarea name="textfield3" class="text-area"></textarea></td>

    </tr>
    <tr> 
      <td colspan="4"> 
        <div align="center">
          <input type="submit" name="Submit" value="提交">
        </div>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
