<%@ include file="/internet/common.jsp" %>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;网络中心教学管理—&gt;远程教学录制安排导入</td>
          </tr>
      </table></td>
    </tr>
  </table>
<br/>
<div align="center" class="td1">导入失败，<bean:write property="ExcStr"/>
<br/>
<br/>
<input name="Submit2" type="button" class="button_02" value="返 回" onClick="javascript:history.go(-1)">
</div>