<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="oa.prAffair.workArrangeAddDo.do">
		<html:hidden property="WorkArrange/_order/col1/field"/>
		<html:hidden property="WorkArrange/_order/col1/desc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />

  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;��������&gt;�������š�&gt;���ɹ������š�&gt;�������Ų鿴</td>
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
            <bean:write property="WorkArrange/TASKSUM"/>
            </td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="94" align="right" class="td2">�������ݣ�</td>
            <td width="87%" class="td1">&nbsp;
             <bean:write property="WorkArrange/TASKCONTENT"/>
            </td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="30" align="right" class="td2">����ʱ�䣺</td>
            <td width="87%" class="td1">&nbsp;
            <bean:write property="WorkArrange/CALENDAR" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="58" align="right" class="td2">������Ա��</td>
            <td width="87%" class="td1">&nbsp;
            <bean:write property="WorkArrange/BeArrangedIDsName"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="13%" align="right" height="30" class="td2">�Ƿ����ѣ�</td>
            <td width="87%" class="td1">&nbsp;
            <logic:equal property="WorkArrange/ISREMIND" value='Y'>��</logic:equal>
            <logic:equal property="WorkArrange/ISREMIND" value='N'>��</logic:equal>
            </td>
          </tr>
          <logic:equal property="WorkArrange/ISREMIND" value='Y'>
          <tr  onClick="changeTRBgColor(this)">
            <td width="13%" align="right" height="30" class="td2">����ʱ�䣺</td>
            <td width="87%" class="td1">&nbsp;
            <bean:write property="WorkArrange/AWOKETIME" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
            </td>
          </tr>
          </logic:equal>
          <logic:present property="WorkArrange/HaveReadIDs">
          <tr  onClick="changeTRBgColor(this)">
            <td width="13%" align="right" height="58" class="td2">�Ѳ鿴��Ա��</td>
            <td width="87%" class="td1">&nbsp;
            <bean:write property="WorkArrange/HaveReadIDsName"/>
            </td>
          </tr>
          </logic:present>
          <logic:present property="WorkArrange/Reply">
          <tr  onClick="changeTRBgColor(this)">
            <td width="13%" align="right" height="94" class="td2">�� ����</td>
            <td width="87%" class="td1">&nbsp;
            <bean:write property="WorkArrange/Reply"/>
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
 

 