<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="teachWorkManage.prBookManage.buyModifyDo.do" name="opeForm">
<table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable" >
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;�̲Ĺ���&gt;�̲Ĳɹ��޸�</td>
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
		<html:hidden property="TextbookBuyDetail/_order/col1/field"/>
		<html:hidden property="TextbookBuyDetail/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/length" />
		<html:hidden name="TextbookBuy/BalanceNum" property="TextbookBuyDetail/BuyNum"/>
		<html:hidden name="TextbookBuy/TextbookID"   property="TextbookBuyDetail/TextbookID"/>
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
                  <td width="32%" align="center" nowrap id="TextbookBuyDetail.Title" onClick="talentsort()">�� ��</td>
                  <td width="20%" align="center" nowrap id="TextbookBuyDetail.Publisher" onClick="talentsort()">������</td>
                  <td width="10%" align="center" nowrap id="TextbookBuyDetail.PublishTime" onClick="talentsort()">����ʱ��</td>
                  <td width="10%" align="center" nowrap id="TextbookBuyDetail.Price" onClick="talentsort()">����</td>
                  <td width="5%" align="center" nowrap id="TextbookBuyDetail.BuyNum" onClick="talentsort()">�ɹ���</td>
                  <td width="20%" align="center" nowrap id="TextbookBuyDetail.Remarks" onClick="talentsort()">�� ע</td>
                </tr>

              <tr class="td1" onClick="changeTRBgColor(this)" >  
              <html:hidden name="TextbookBuy/BuyID" property="TextbookBuyDetail/BuyID"/>
                <td nowrap>&nbsp;<bean:write  property='TextbookBuyDetail/Title'/></td>
                <td nowrap>&nbsp;<bean:write  property='TextbookBuyDetail/Publisher'/></td>
                <td nowrap>&nbsp;<bean:write  property='TextbookBuyDetail/PublishTime' formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                <td nowrap>&nbsp;<html:text  name="TextbookBuy/Price" property='TextbookBuyDetail/Price' attributesText='class="input" width="100%" ValidateType="int" Msg="�������벻��ȷ"'/></td>
                <td nowrap>&nbsp;<html:text name="TextbookBuy/BuyNum" property="TextbookBuyDetail/BuyNum" attributesText='class="input" width="100%" ValidateType="notempty,int" Msg="�ɹ�������Ϊ��;�ɹ���ֻ��Ϊ����"' /></td>
                <td nowrap>&nbsp;<html:text  name="TextbookBuy/Remarks" property="TextbookBuyDetail/Remarks" maxlength="50" attributesText='class="input"' /></td>
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
  		 countBalance();
	 	frm.submit();
	 }
  
  }
function countBalance(){
	var frm = document.forms[0];
	frm["TextbookBuy/BalanceNum"].value = frm["TextbookBuy/BuyNum"].value - frm["TextbookBuy/BalanceNum"].value;

}
	// ���ص���ѯҳ��
	function goBack() {
		window.location.href = "teachWorkManage.prBookManage.buyList.do";
	}

</script>