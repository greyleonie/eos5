<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="studentmanage.prNotify.notifyAddDo.do">
  <html:hidden property="QueryClassNotify/ClassID/criteria/value" name="ClassNotify/ClassID"/>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">ѧԱ����&gt;�༶֪ͨ��&gt;֪ͨ����</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          
          <tr  onClick="changeTRBgColor(this)">
            <td width="15%" align="right" class="td2">�� ����</td>
            <td width="85" colspan="3" class="td1">&nbsp;
            <bean:write property="ClassNotify/ClassName"/>			</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">����ʱ�䣺</td>
            <td class="td1">&nbsp;
            <html:text property="ClassNotify/PublishTime[@pattern='yyyy-MM-dd']" attributesText='class="input" size="30"  ValidateType="notempty" Msg="����ʱ�䲻��Ϊ��" onfocus="textValidate()"' readonly="true"/>
            <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["ClassNotify/PublishTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
            </td>
            <td align="right" class="td2">����ʱ�䣺</td>
            <td class="td1">&nbsp;
            <html:text property="ClassNotify/endTime[@pattern='yyyy-MM-dd']" attributesText='class="input" size="30"  ValidateType="notempty" Msg="����ʱ�䲻��Ϊ��" onfocus="textValidate()"' readonly="true"/>
            <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["ClassNotify/endTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">֪ͨ���ݣ�</td>
            <td colspan="3" class="td1">&nbsp;
			<html:textarea property="ClassNotify/Content" rows="8" size="80"  attributesText='class="input"  ValidateType="notempty" Msg="���ݲ���Ϊ��" onfocus="textValidate()" maxlength="1000"'/>
			</td>
          </tr>
          
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="�� ��" onClick="save()">
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
 
  <script>

  function save() {
  	var frm = document.forms[0];
  	var createtime=frm.elements["ClassNotify/PublishTime[@pattern='yyyy-MM-dd']"].value;
  	var endtime=frm.elements["ClassNotify/endTime[@pattern='yyyy-MM-dd']"].value;
  	if(endtime<createtime) 
  	{
  		alert('����ʱ�������ڷ���ʱ��');
  		return ;
  	}
	if(validater(frm)) frm.submit();
  
  }
  
  </script>
 