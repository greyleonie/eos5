<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="teachWorkManage.prBookManage.issueModifyDo.do" name="opeForm">
<table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable" >
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;教材管理—&gt;教材发放修改</td>
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
		<html:hidden property="TextbookIssueDetail/_order/col1/field"/>
		<html:hidden property="TextbookIssueDetail/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/length" />
		<html:hidden name="TextbookIssue/BalanceNum" property="TextbookIssueDetail/IssueNum"/>
		<html:hidden name="TextbookIssue/TextbookID"   property="TextbookIssueDetail/TextbookID"/>
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
                  <td width="32%" align="center" nowrap id="TextbookIssueDetail.Title" onClick="talentsort()">书 名</td>
                  <td width="20%" align="center" nowrap id="TextbookIssueDetail.Publisher" onClick="talentsort()">出版社</td>
                  <td width="10%" align="center" nowrap id="TextbookIssueDetail.PublishTime" onClick="talentsort()">出版时间</td>
                  <td width="5%" align="center" nowrap id="TextbookIssueDetail.Price" onClick="talentsort()">单价</td>
                  <td width="5%" align="center" nowrap id="TextbookIssueDetail.Stock" onClick="talentsort()">库存数</td>
                  <td width="5%" align="center" nowrap id="TextbookIssueDetail.IssueNum" onClick="talentsort()">发放数</td>
                  <td width="20%" align="center" nowrap id="TextbookIssueDetail.Remarks" onClick="talentsort()">备 注</td>
                </tr>

              <tr class="td1" onClick="changeTRBgColor(this)" >  
              <html:hidden name="TextbookIssue/IssueID" property="TextbookIssueDetail/IssueID"/>
                <td nowrap>&nbsp;<bean:write  property='TextbookIssueDetail/Title'/></td>
                <td nowrap>&nbsp;<bean:write  property='TextbookIssueDetail/Publisher'/></td>
                <td nowrap>&nbsp;<bean:write  property='TextbookIssueDetail/PublishTime' formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                <td nowrap>&nbsp;<html:text  name="TextbookIssue/Price" property='TextbookIssueDetail/Price' attributesText='class="input" width="100%" ValidateType="money" Msg="单价输入不正确"'/></td>
                <td nowrap>&nbsp;<bean:write  property="TextbookIssueDetail/StockNum"/></td>
                <td nowrap>&nbsp;<html:text name="TextbookIssue/IssueNum" property="TextbookIssueDetail/IssueNum" attributesText='class="input" width="100%" ValidateType="notempty,int" Msg="发放数不能为空;发放数只能为数字"' /></td>
                <td nowrap>&nbsp;<html:text  name="TextbookIssue/Remarks" property="TextbookIssueDetail/Remarks" maxlength="50" attributesText='class="input"' /></td>
              </tr>

                
        </table>
        
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="保 存" onClick="javascript:save()">
              <input name="Submit2" type="button" class="button_02" value="返 回" onClick="history.back()"></td>
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
	frm["TextbookIssue/BalanceNum"].value = frm["TextbookIssue/IssueNum"].value - frm["TextbookIssue/BalanceNum"].value;

}
	// 返回到查询页面
	function goBack() {
		window.location.href = "teachWorkManage.prBookManage.issueList.do";
	}

</script>