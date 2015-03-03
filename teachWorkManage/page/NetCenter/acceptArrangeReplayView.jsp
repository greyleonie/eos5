<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="teachWorkManage.prNetCenter.acceptArrangeReplay.do">
		
        <html:hidden property="fid" />
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;网络中心—&gt;中心工作日志—&gt;接收工作安排—&gt;查看工作安排回复</td>
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
            <td width="13%" height="30" align="right" class="td2">回 复 人：</td>
            <td width="37%" class="td1">&nbsp;
            <bean:write id="resultset" property="CenterWorkReply/UserIDName"/>
            </td>
            <td width="13%" height="30" align="right" class="td2">回复时间：</td>
            <td width="37%" class="td1">&nbsp;
             <bean:write id="resultset" property="CenterWorkReply/ReplyTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="94" align="right" class="td2">内 容：</td>
            <td width="87%" class="td1" colspan="3">&nbsp;
            <bean:write id="resultset" property="CenterWorkReply/Content"/>
            </td>
          </tr>
          </logic:iterate> 
          </table>
          <table width="100%" height="50"  border="0" cellpadding="0" cellspacing="0" >
            <tr>
              <td height="49" align="center">
                <input name="Submit2" type="button" class="button_02" value="返 回" onClick="javascript:history.go(-1)">
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
 
 