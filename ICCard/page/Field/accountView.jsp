<%@include file="/internet/common.jsp"%>
<form method="post"  action="ICCard.prField.receptionModifyDo.do">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;һ��ͨ��&gt;���ع���&gt;<span id="printTable">���Ӱ�鿴</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction">
		<input type="hidden" name="addaction">
		<input type="hidden" name="modifyaction">
		<input type="hidden" name="deleteaction">
		<input type="hidden" name="viewaction">
		<html:hidden property="tblReceptionChangeRec/_order/col1/field"/>
		<html:hidden property="tblReceptionChangeRec/_order/col1/asc" />
		<html:hidden property="tblReceptionChangeRec/ID" />
	  </td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text"> 
      <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="5%" align="left" bgcolor="#4A82D1"><img src="image/left_01.gif" width="12" height="23"></td>
      <td width="20%" align="center" bgcolor="#4A82D1" class="textb_wirte">�鿴���Ӱ�</td>
      <td width="5%" align="right" bgcolor="#4A82D1"><img src="image/left_02.gif" width="12" height="23"></td>
      <td width="70%" align="right" valign="bottom"><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#4A82D1">
          <tr>
            <td height="4"> </td>
          </tr>
      </table></td>
    </tr>
    
    <tr>
      <td height="2" colspan="4" align="left"> </td>
    </tr>
  </table>
      
      
       
	  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
        <tr>
    <td  class="td2" align="right" >�Ǽ��ˣ�</td>
    <td  class="td1">
    <bean:write property="tblReceptionChangeRec/Author"/></td>
    <td class="td2" align="right"> ��� ��</td>
    <td class="td1" colspan="2">
    	
    	<logic:equal property="tblReceptionChangeRec/Range" value="0">
    		���
    	</logic:equal>
    	<logic:equal property="tblReceptionChangeRec/Range"value="1">
    		�а�
    	</logic:equal>
    	<logic:equal property="tblReceptionChangeRec/Range"  value="2">
    		ҹ��
    	</logic:equal>
    </td>

    <td  class="td2" align="right" >ʱ�䣺</td>
    <td class="td1" >
    	
    	<bean:write property="tblReceptionChangeRec/CreatedTime"  formatType="yyyy-MM-dd HH:mm" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/>
    </td>
  </tr>

  <tr>
    <td class="td2" align="right" rowspan="7"> �ֽ���֧ </td>
    <td class="td2" align="right" rowspan="2"> Ѻ�� ��</td>
    <td class="td2" align="right" > ɢ��</td>
    <td class="td1" colspan="4" ><bean:write property="tblReceptionChangeRec/PreGuestNum"  />��&nbsp;
    <bean:write property="tblReceptionChangeRec/PreGuestMoney"    language="zh" country="CN"/>Ԫ</td>
  </tr>
  <tr>
    <td class="td2" align="right"> ѧԱ</td>
	<td class="td1" colspan="4" ><bean:write property="tblReceptionChangeRec/PreStuNum"  />��&nbsp;
	<bean:write property="tblReceptionChangeRec/PreStuMoney"    language="zh" country="CN"/>Ԫ</td>
  </tr>
  <tr>
    <td class="td2" align="right" rowspan="2">ס�޷ѣ�</td>
    <td class="td2" align="right">֧Ʊ</td>
    <td class="td1"> <bean:write property="tblReceptionChangeRec/HousingCheck"    language="zh" country="CN" />Ԫ</td>
    <td  rowspan="2" class="td2" align="right">����</td>
    <td class="td2" align="right">֧Ʊ</td>
    <td class="td1"><bean:write property="tblReceptionChangeRec/SubmitCheck"     language="zh" country="CN"  />Ԫ</td>
  </tr>
  <tr>
    <td class="td2" align="right">�ֽ�</td>
    <td class="td1"><bean:write property="tblReceptionChangeRec/HousingCash"     language="zh" country="CN"/>Ԫ</td>
    <td class="td2" align="right">�ֽ�</td>
    <td class="td1"><bean:write property="tblReceptionChangeRec/SubmitCash"     language="zh" country="CN"/>Ԫ</td>
  </tr>
  <tr>
    <td class="td2" align="right">����� ��</td>
    <td class="td1" colspan="5"><bean:write property="tblReceptionChangeRec/MeetingCost"  language="zh" country="CN"/>Ԫ</td>
  </tr>
  <tr>
    <td class="td2" align="right">�绰�ѡ����� ��</td>
    <td class="td1" colspan="5"><bean:write property="tblReceptionChangeRec/TelecomCost"  language="zh" country="CN" />Ԫ</td>
  </tr>
  <tr>
    <td class="td2" align="right">�����ӷ� ��</td>
    <td class="td1" colspan="5"><bean:write property="tblReceptionChangeRec/OtherCost"  language="zh" country="CN" />Ԫ</td>
  </tr>
  <tr>
    <td class="td2" align="right">���޷��ż���Ŀ ��</td>
    <td class="td1" colspan="6"><bean:write  property="tblReceptionChangeRec/WaitFixItem" /></td>
  </tr>
  <tr>
    <td class="td2" align="right">���õǼ� ��</td>
    <td class="td1" colspan="6"><bean:write  property="tblReceptionChangeRec/VisitItem" /></td>
  </tr>
  <tr>
    <td class="td2" align="right">�ر�������ע ��</td>
    <td class="td1" colspan="6"><bean:write  property="tblReceptionChangeRec/SpecEvent" /></td>
  </tr>
      </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
              <input name="Button" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">
              <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="goBack()"></td>
            </tr>
          </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
  </form>
  <form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
  <script>


  </script>
  