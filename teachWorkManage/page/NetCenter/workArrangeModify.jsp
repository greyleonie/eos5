<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="teachWorkManage.prNetCenter.workArrangeModifyDo.do">
		<html:hidden property="CenterWorkPlan/_order/col1/field"/>
		<html:hidden property="CenterWorkPlan/_order/col1/desc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������ġ�&gt;���Ĺ�����־��&gt;���ɹ������š�&gt;���������޸�</td>
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
          <html:hidden property="CenterWorkPlan/WorkID"/>
          <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="30" align="right" class="td2">������Ҫ��</td>
            <td width="87%" class="td1">&nbsp;
            <html:text property="CenterWorkPlan/Summary" maxlength="50" attributesText='class="input" size="80" ValidateType="notempty" Msg="������Ҫ����Ϊ��"'/>
            <span class="text_red">*</span></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="30" align="right" class="td2">�����ص㣺</td>
            <td width="87%" class="td1">&nbsp;
            <html:text property="CenterWorkPlan/Place" attributesText='class="input" size="80"'/>
            </td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="94" align="right" class="td2">�������ݣ�</td>
            <td width="87%" class="td1">&nbsp;
            <html:textarea property="CenterWorkPlan/Content" attributesText='class="input" cols="70" rows="6"'/>
            </td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="94" align="right" class="td2">��ע��</td>
            <td width="87%" class="td1">&nbsp;
            <html:textarea property="CenterWorkPlan/Remark" attributesText='class="input" cols="70" rows="6"'/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="58" align="right" class="td2">������Ա��</td>
            <td width="87%" class="td1">&nbsp;
            <html:textarea property="CenterWorkPlan/DirectorName" attributesText='class="input" cols="70" rows=3" readOnly="fcc"'/>
            <html:hidden property="CenterWorkPlan/Director"/><input name="Button" type="button" class="button_02" value="ѡ ��" elname="CenterWorkPlan/Director,CenterWorkPlan/DirectorName" onClick="selectSysUser()"> 
		    </td>
          </tr>
          </table>
          <table width="100%" height="50"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="49" align="center"><input name="Button" type="button" class="button_02" value="�� ��" onClick="save()">
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
  	
	if(validater(frm)) frm.submit();
  
  }
  </script>
 