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
            <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;��������&gt;�������š�&gt;���ɹ������š�&gt;���ɹ������š�&gt;������������</td>
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
            <html:text property="WorkArrange/TASKSUM" maxlength="50" attributesText='class="input" size="80" ValidateType="notempty" Msg="������Ҫ����Ϊ��"'/>
            <span class="text_red">*</span></td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="94" align="right" class="td2">�������ݣ�</td>
            <td width="87%" class="td1">&nbsp;
            <html:textarea property="WorkArrange/TASKCONTENT" attributesText='class="input" cols="70" rows="6"'/>
            </td>
          </tr>
          <!--
		  <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="30" align="right" class="td2">����ʱ�䣺</td>
            <td width="87%" class="td1">&nbsp;
            <html:text property="WorkArrange/CALENDAR[@pattern='yyyy-MM-dd']" attributesText='class="input" size="30"'/>
			<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["WorkArrange/CALENDAR[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")> 	
            </td>
          </tr>-->
          <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="58" align="right" class="td2">������Ա��</td>
            <td width="87%" class="td1">&nbsp;
            <html:textarea property="WorkArrange/BeArrangedIDsName" attributesText='class="input" cols="70" rows=3" readOnly="fcc"'/>
            <html:hidden property="WorkArrange/BeArrangedIDs"/><input name="Button" type="button" class="button_02" value="ѡ ��" elname="WorkArrange/BeArrangedIDs,WorkArrange/BeArrangedIDsName" onClick="selectSysUser()"> 
		    </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="13%" align="right" height="30" class="td2">�Ƿ����ѣ�</td>
            <td width="87%" class="td1">&nbsp;
            <input type="radio" name="WorkArrange/ISREMIND" value='Y' onClick="setDisplay()">��&nbsp;
            <input type="radio" name="WorkArrange/ISREMIND" value='N' checked onClick="setDisplay()">��
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)" id="time" style="display:none">
            <td width="13%" align="right" height="30" class="td2">����ʱ�䣺</td>
            <td width="87%" class="td1">&nbsp;
            <html:text property="WorkArrange/AWOKETIME[@pattern='yyyy-MM-dd']" attributesText='class="input" size="30"'/>
			<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["WorkArrange/AWOKETIME[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")> 	
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
  

	function setDisplay(){
	  var isremind = document.forms[0].elements["WorkArrange/ISREMIND"];
	  
	  for(var i=0;i<isremind.length;i++){
		  if(isremind[i].checked){
			  if(isremind[i].value == 'Y') {
				document.getElementById("time").style.display = '';
			  }else{
			  	document.getElementById("time").style.display = 'none';
			  }
		  }
	  }
	}
  </script>
 