<%@include file="/internet/common.jsp"%>
<body>
<form>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
 			<td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;�ʲ�����&gt;<span id="printTable">��Ӧ����Ϣ</span>�鿴</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<html:hidden property="CAPT_PROVIDER/_order/col1/field"/>
		<html:hidden property="CAPT_PROVIDER/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count" value="-1"/>
		<html:hidden property="PageCond/length" />
	  </td>
    </tr>
  </table>
<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
      <tr>
        <td height="15"> </td>
      </tr>
  <tr>
     <td>
	<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" >
      <tr>
        <td valign="top" class="text" >
		   <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
            <tr>
              <td class="td2" width="13%" align="right">��Ӧ�����ƣ�</td>
              <td class="td1" colspan="3"><bean:write property="CAPT_PROVIDER/PROVNAME" />
              </td>
              </tr>
            <tr>
              <td class="td2" align="right">��&nbsp;&nbsp;ϵ&nbsp;&nbsp;�ˣ�</td>
              <td class="td1"><bean:write property="CAPT_PROVIDER/LINKMAN" /></td>
              <td class="td2" align="right">��ϵ�绰��</td>
              <td class="td1">
              <bean:write property="CAPT_PROVIDER/TEL"/></td>
            </tr>
           <tr>
              <td class="td2" align="right">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ַ��</td>
              <td class="td1" width="45%"><bean:write property="CAPT_PROVIDER/ADDRESS"/></td>
              <td class="td2" width="14%" align="right">��&nbsp;&nbsp;&nbsp;&nbsp;�ࣺ</td>
              <td class="td1" width="28%">
             <bean:write  property="CAPT_PROVIDER/ZIPCODE"   />
              </td>
            </tr>
            <tr>
              <td class="td2" align="right">E-mail��</td>
              <td class="td1"><bean:write property="CAPT_PROVIDER/E_MAIL" /></td>
              <td class="td2" align="right">������룺</td>
              <td class="td1"><bean:write property="CAPT_PROVIDER/FAX" /></td>
            </tr>
           <tr>
              <td class="td2" align="right">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ע��</td>
                  <td class="td1" colspan="3"><bean:write property="CAPT_PROVIDER/REMARK" />
                  </td>
            </tr>
          </table> 
            <table width="98%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">
               <input name="Button" type="button" class="button_02" value="�� ��" onClick="javascript:history.go(-1)">
               </td>
            </tr>
          </table>
         </td>
      </tr>
</table>
         </td>
      </tr>
</table>
    </form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title" value="��Ӧ����Ϣ">
<input type="hidden" name="xmlfcc">
</form>