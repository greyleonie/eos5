<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="teachWorkManage.prNetCenter.acceptArrangeReplay.do">
		
        <html:hidden property="fid" />
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������ġ�&gt;���Ĺ�����־��&gt;���չ������š�&gt;�鿴�������Żظ�</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="28"> </td>
    </tr>
    <tr>
      <td class="text">
      <table width="86%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
      <logic:iterate id="resultset" property="list[@type='CenterWorkReply']"> 
          <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="30" align="right" class="td2">�� �� �ˣ�</td>
            <td width="37%" class="td1">&nbsp;
            <bean:write id="resultset" property="CenterWorkReply/UserIDName"/>
            </td>
            <td width="13%" height="30" align="right" class="td2">�ظ�ʱ�䣺</td>
            <td width="37%" class="td1">&nbsp;
             <bean:write id="resultset" property="CenterWorkReply/ReplyTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="94" align="right" class="td2">�� �ݣ�</td>
            <td width="87%" class="td1" colspan="3">&nbsp;
            <bean:write id="resultset" property="CenterWorkReply/Content"/>
            </td>
          </tr>
          </logic:iterate> 
          </table>
          <table width="100%" height="50"  border="0" cellpadding="0" cellspacing="0" >
            <tr>
              <td height="49" align="center">
                <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="javascript:history.go(-1)">
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
 
 