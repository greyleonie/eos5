<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prCarManage.carInfoList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;�������&gt;����һ���������� </td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prCarManage.carInfoList.do">
		<input type="hidden" name="viewaction" value="oa.prCarManage.carInfoView.do">
		<input type="hidden" name="addaction" value="oa.prCarManage.carInfoAdd.do">
		<input type="hidden" name="modifyaction" value="oa.prCarManage.carInfoModify.do">
		<input type="hidden" name="deleteaction" value="oa.prCarManage.carInfoDelete.do">
		<html:hidden property="CAR_CARINFO/_order/col1/field"/>
		<html:hidden property="CAR_CARINFO/_order/col1/asc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		</td>
    </tr>
  </table>


<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
      
      <tr>
        <td valign="top" class="text"><table width="80%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
          <tr class="td_title">
            <td width="72%" height="25" align="center" nowrap >��������</td>
            <td width="28%" align="center" nowrap >��ز���</td>
          </tr>
          <tr class="td1">
	             <td height="25" align="center" nowrap>��������</td>
	             <td nowrap align="center"><a href="oa.prReceiveArchive.receiveAdd.do?temptype=0">��������</a></td>
          </tr>
          <tr class="td2">
            <td height="25" align="center" nowrap>��������</td>
            <td nowrap align="center"><a href="oa.prSendArchive.sendAdd.do?temptype=0">��������</a></td>
          </tr>
          <tr class="td1">
            <td height="25" align="center" nowrap>��Ʒ�ɹ�����</td>
            <td nowrap align="center"><a href="oa.prThingsManage.purchaseAdd.do?temptype=0">��������</a></td>
          </tr>
          <tr class="td2">
            <td height="25" align="center" nowrap>��Ʒ��������</td>
            <td nowrap align="center"><a href="oa.prThingsManage.storeOutAdd.do?temptype=0">��������</a></td>
          </tr>
          <tr class="td1">
            <td height="25" align="center" nowrap>�ʲ��ɹ�����</td>
            <td nowrap align="center"><a href="oa.prAssetsManage.purchaseAdd.do?temptype=0">��������</a></td>
          </tr>
          <tr class="td1">
            <td height="25" align="center" nowrap>�ʲ���������</td>
            <td nowrap align="center"><a href="oa.prAssetsManage.borrowAdd.do?temptype=0">��������</a></td>
          </tr>
          <tr class="td2">
            <td height="25" align="center" nowrap>�ʲ���������</td>
            <td nowrap align="center"><a href="oa.prAssetsManage.writeOffAdd.do?temptype=0">��������</a></td>
          </tr>
          <tr class="td1">
            <td height="25" align="center" nowrap>��������</td>
            <td nowrap align="center"><a href="oa.prMeetingManage.mrApplyAdd.do?temptype=0">��������</a></td>
          </tr>
          <tr class="td2">
            <td height="25" align="center" nowrap>�ó�����</td>
            <td nowrap align="center"><a href="oa.prCarManage.useCarAdd.do?temptype=0">��������</a></td>
          </tr>
          <tr class="td1">
            <td height="25" align="center" nowrap>���ñ���</td>
            <td nowrap align="center"><a href="oa.prFinance.costClaimAdd.do?temptype=0">��������</a></td>
          </tr>
          <tr class="td2">
            <td height="25" align="center" nowrap>���÷ѱ���</td>
            <td nowrap align="center"><a href="oa.prFinance.travelCostClaimAdd.do?temptype=0">��������</a></td>
          </tr>
          <tr class="td1">
            <td height="25" align="center" nowrap>����֧Ʊ����</td>
            <td nowrap align="center"><a href="oa.prFinance.checkRequestAdd.do?temptype=0">��������</a></td>
          </tr>
          <tr class="td2">
            <td height="25" align="center" nowrap>�������</td>
            <td nowrap align="center"><a href="oa.prFinance.borrowRequestAdd.do?temptype=0">��������</a></td>
          </tr>
         
        </table>
        </td>
      </tr>
      <tr>
        <td class="text">&nbsp;&nbsp;&nbsp;&nbsp;</td>
      </tr>
    </table>    </td>
  </tr>
</table>
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>
<script>

</script>