<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="teachWorkManage.prNetCenter.acceptArrangeReplayDo.do">

  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������ġ�&gt;���Ĺ�����־��&gt;���չ������š�&gt;�������Żظ�</td>
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
            <td width="13%" height="30" align="right" class="td2">������Ҫ��</td>
            <td width="87%" class="td1">&nbsp;
            <bean:write property="CenterWorkPlan/Summary"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="30" align="right" class="td2">�����ص㣺</td>
            <td width="87%" class="td1">&nbsp;
            <bean:write property="CenterWorkPlan/Place"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="80" align="right" class="td2">�������ݣ�</td>
            <td width="87%" class="td1">&nbsp;
            <bean:write property="CenterWorkPlan/Content"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="80" align="right" class="td2">��ע��</td>
            <td width="87%" class="td1">&nbsp;
            <bean:write property="CenterWorkPlan/Remark"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="30" align="right" class="td2">��������</td>
            <td width="87%" class="td1">&nbsp;
            <html:radio property="CenterWorkPlan/Status" value="0"/>����&nbsp;&nbsp;
            <html:radio property="CenterWorkPlan/Status" value="1"/>����&nbsp;&nbsp;
            <html:radio property="CenterWorkPlan/Status" value="2"/>���&nbsp;&nbsp;
            </td>
          </tr>
          <html:hidden name="type" value="0"/>
          <html:hidden property="CenterWorkPlan/WorkID" />
          <html:hidden name="CenterWorkReply/PlanID" property="CenterWorkPlan/WorkID" />
          <html:hidden name="CenterWorkReply/ToUserID" property="CenterWorkPlan/UserID" />
		  <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="94" align="right" class="td2">�� ����</td>
            <td width="87%" class="td1">&nbsp;
            <html:textarea property="CenterWorkReply/Content" attributesText='class="input" cols="70" rows="6"'/>
            </td>
          </tr>
          </table>
          <table width="100%" height="50"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="49" align="center"><input name="Button" type="button" class="button_02" value="�� ��" onClick="save()">
                <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="javascript:document.location.href='teachWorkManage.prNetCenter.acceptArrangeList.do'">
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
 