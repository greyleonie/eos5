<%@include file="/internet/common.jsp"%>
<body>
<form name="messageForm" method="post">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">������ϵ��</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8">
       <html:hidden property="TelBook/TelBookID"/>
       <html:hidden property="TelBook/HolderID"/>
       <html:hidden property="isAdd" />
       </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr  onClick="changeTRBgColor(this)">
            <td  align="right" class="td2">������</td>
            <td  class="td1"><html:text property="TelBook/UserName" maxlength="50"/><span class="text_red">*</span></td>
          </tr>
          <tr   >
            <td align="right" class="td2" >���飺</td>
            <td class="td1" >
        <html:select property="TelBook/Sort" onkeydown="catch_keydown(this);" onkeypress="catch_press(this);">
               <html:option value=""></html:option> 
               <html:options property="list[@type='sortInfo']/sortInfo/sort" labelProperty="list[@type='sortInfo']/sortInfo/sort"/> 
         </html:select>  ��ʾ��ѡ������ʱ����ֱ�ӱ༭�����س�������·��飬��DEL��ɾ��ѡ�з���
			</td>
          </tr>
          <tr  >
            <td align="right" class="td2">�ֻ����룺</td>
            <td class="td1"><html:text property="TelBook/MobileTel" maxlength="20"/></td>
          </tr>
		  <TR>
					
            <TD width="8%" class="td2" nowrap align="right"> �������䣺 </TD>
					<TD class="td1">
					<html:text property="TelBook/Email" maxlength="25"/>
					</TD>
				</TR>
          
          <tr  >
            <td align="right" class="td2">�� ע��</td>
            <td class="td1"><html:textarea rows="6" cols="50"/></td>
          </tr>
          
          
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
              <input name="Submit" type="button" class="button_02" value="�� ��" onclick="save()">			 
			  <td align="center">
            </td>
            </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
</form>
</body>

<script language="javascript">
var frm=document.forms[0];
 function catch_keydown(sel){
	switch(event.keyCode)
	{
		case 13:
			//Enter;
			sel.options[sel.length] = new Option("","",false,true);
			event.returnValue = false;
			break;
		case 27:
			//Esc;
			alert("text:" + sel.options[sel.selectedIndex].text + ", value:" + sel.options[sel.selectedIndex].value + ";");
			event.returnValue = false;
			break;
		case 46:
			//Delete;
			if(confirm("ȷ��ɾ����ǰѡ����?"))
			{
				sel.options[sel.selectedIndex] = null;
				if(sel.length>0)
				{
					sel.options[0].selected = true;
				}
			}
			event.returnValue = false;
			break;
		case 8:
			//Back Space;
			var s = sel.options[sel.selectedIndex].text;
			sel.options[sel.selectedIndex].text = s.substr(0,s.length-1);
			event.returnValue = false;
			break;
	}	
}

function catch_press(sel){
try{
	sel.options[sel.selectedIndex].text = sel.options[sel.selectedIndex].text + String.fromCharCode(event.keyCode);
	sel.options[sel.selectedIndex].value=sel.options[sel.selectedIndex].text;
	event.returnValue = false;
	}catch(e){}
}

function save(){
if(frm.elements["TelBook/Sort"].value.length>50){
 alert("�������̫����");
 return;
}
 frm.action="ICCard.prMsg.saveLinkBook.do";
 frm.submit();
}
</script>