<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="teachWorkManage.prBookManage.destroyModifyDo.do" name="opeForm">
<table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable" >
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;�̲Ĺ���&gt;�̲ı����޸�</td>
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
		<html:hidden property="TextbookDestroyDetail/_order/col1/field"/>
		<html:hidden property="TextbookDestroyDetail/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/length" />
		<html:hidden name="TextbookDestroy/BalanceNum" property="TextbookDestroyDetail/DestroyIDNum"/>
		<html:hidden name="TextbookDestroy/TextbookID"   property="TextbookDestroyDetail/TextbookID"/>
	  </td>
    </tr>
  </table>
  
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table" >
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">

        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC"  id="sortTable">
        
             
         <tr class="td_title"> 
                  <td width="32%" align="center" nowrap id="TextbookDestroyDetail.Title" onClick="talentsort()">�� ��</td>
                  <td width="20%" align="center" nowrap id="TextbookDestroyDetail.Publisher" onClick="talentsort()">������</td>
                  <td width="10%" align="center" nowrap id="TextbookDestroyDetail.PublishTime" onClick="talentsort()">����ʱ��</td>
                  <td width="5%" align="center" nowrap id="TextbookDestroyDetail.Price" onClick="talentsort()">����</td>
                  <td width="5%" align="center" nowrap id="TextbookDestroyDetail.Stock" onClick="talentsort()">�����</td>
                  <td width="5%" align="center" nowrap id="TextbookDestroyDetail.DestroyIDNum" onClick="talentsort()">������</td>
                  <td width="20%" align="center" nowrap id="TextbookDestroyDetail.Remarks" onClick="talentsort()">�� ע</td>
                </tr>

              <tr class="td1" onClick="changeTRBgColor(this)" >  
              <html:hidden name="TextbookDestroy/DestroyID" property="TextbookDestroyDetail/DestroyID"/>
                <td nowrap>&nbsp;<bean:write  property='TextbookDestroyDetail/Title'/></td>
                <td nowrap>&nbsp;<bean:write  property='TextbookDestroyDetail/Publisher'/></td>
                <td nowrap>&nbsp;<bean:write  property='TextbookDestroyDetail/PublishTime' formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                <td nowrap>&nbsp;<html:text  name="TextbookDestroy/Price" property='TextbookDestroyDetail/Price' attributesText='class="input" width="100%" ValidateType="money" Msg="�������벻��ȷ"'/></td>
                <td nowrap>&nbsp;<bean:write  property="TextbookDestroyDetail/StockNum"/></td>
                <td nowrap>&nbsp;<html:text name="TextbookDestroy/DestroyIDNum" property="TextbookDestroyDetail/DestroyIDNum" attributesText='class="input" width="100%" ValidateType="notempty,int" Msg="����������Ϊ��;������ֻ��Ϊ����"' /></td>
                <td nowrap>&nbsp;<html:text  name="TextbookDestroy/Remarks" property="TextbookDestroyDetail/Remarks" maxlength="50" attributesText='class="input"' /></td>
              </tr>

                
        </table>
        
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="�� ��" onClick="javascript:save()">
              <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="history.back()"></td>
            </tr>
          </table>
          
          
          
          </td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
  </form>
</body>


<script language="JavaScript" type="text/javascript">

  function save() {
  	var frm = document.forms[0];
  	if(validater(frm)){
  	    countBalance()
	 	frm.submit();
	 }
  
  }
	function countBalance(){
	var frm = document.forms[0];
	frm["TextbookDestroy/BalanceNum"].value = frm["TextbookDestroy/DestroyIDNum"].value - frm["TextbookDestroy/BalanceNum"].value;

}
	// ���ص���ѯҳ��
	function goBack() {
		window.location.href = "teachWorkManage.prBookManage.destroyList.do";
	}

</script>