<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="oa.prAffair.acceptArrangeReplayDo.do">

  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;办公系统—&gt;公共事务—&gt;工作安排—&gt;接收工作安排—&gt;工作安排回复</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="28"> </td>
    </tr>
    <tr>
      <td class="text"><table width="86%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="30" align="right" class="td2">工作概要：</td>
            <td width="87%" class="td1">&nbsp;
            <bean:write property="WorkArrange/TASKSUM"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="80" align="right" class="td2">工作内容：</td>
            <td width="87%" class="td1">&nbsp;
            <bean:write property="WorkArrange/TASKCONTENT"/>
            </td>
          </tr>
          <html:hidden name="WorkArrangeReplay/ArrangeID" property="WorkArrange/ArrangeID" />
		  <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="94" align="right" class="td2">回 复：</td>
            <td width="87%" class="td1">&nbsp;
            <html:textarea property="WorkArrangeReplay/Reply" attributesText='class="input" cols="70" rows="6"'/>
            </td>
          </tr>
          </table>
          <table width="100%" height="50"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="49" align="center"><input name="Button" type="button" class="button_02" value="保 存" onClick="save()">
                <input name="Submit2" type="button" class="button_02" value="返 回" onClick="javascript:document.location.href='oa.prAffair.acceptArrangeList.do'">
              </td>
            </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;
        </td>
    </tr>
  </table>
  </form>
 
  <script>

  function save() {
  	var frm = document.forms[0];
  	
	if(validater(frm)) frm.submit();
  
  }
  
  </script>
 