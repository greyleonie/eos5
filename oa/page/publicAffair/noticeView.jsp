<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="oa.prAffair.NoticeView.do">
		<html:hidden property="Notice/_order/col1/field"/>
		<html:hidden property="Notice/_order/col1/desc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />

  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;��������&gt;����֪ͨ�鿴</td>
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
            <td width="13%" height="30" align="right" class="td2">֪ͨ���⣺</td>
            <td width="87%" class="td1">&nbsp;
            <bean:write property="Notice/Title"/>
            </td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="94" align="right" class="td2">֪ͨ���ݣ�</td>
            <td width="87%" class="td1">&nbsp;
             <bean:write property="Notice/Content"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="58" align="right" class="td2">֪ͨ��Ա��</td>
            <td width="87%" class="td1">&nbsp;
            <bean:write property="Notice/ReceiveIDsName"/>
            </td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="30" align="right" class="td2">��Чʱ�䣺</td>
            <td width="87%" class="td1">&nbsp;
            <bean:write property="Notice/ValidTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
            </td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="30" align="right" class="td2">��ֹʱ�䣺</td>
            <td width="87%" class="td1">&nbsp;
            <bean:write property="Notice/InValidTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="30" align="right" class="td2">����ʱ�䣺</td>
            <td width="87%" class="td1">&nbsp;
            <bean:write property="Notice/CreateTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
            </td>
          </tr>
          <logic:present property="Notice/HaveReadIDs">
          <tr  onClick="changeTRBgColor(this)">
            <td width="13%" align="right" height="58" class="td2">�Ѳ鿴��Ա��</td>
            <td width="87%" class="td1">&nbsp;
            <bean:write property="Notice/HaveReadIDsName"/>
            </td>
          </tr>
          </logic:present>
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
 

 