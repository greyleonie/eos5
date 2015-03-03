 <%@include file="/internet/common.jsp"%>
 <SCRIPT language="JavaScript" src="/internet/scripts/autoSelect2.js" ></SCRIPT>
  <logic:present property="Msg">
	 <script>
	 	alert("<bean:write property="Msg"/>");
	 </script>
 </logic:present>
<SCRIPT language="jscript" src="/internet/scripts/processCaller.js"></SCRIPT>
<SCRIPT language="jscript" src="/internet/scripts/string.js"></SCRIPT>
<SCRIPT language="jscript" src="/internet/scripts/dynamicSelect.js"></SCRIPT>
<body>
<form method="post" action="oa.prAssetsManage.borrowAddDo.do">
 
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">办公系统—&gt;资产管理—&gt;<span id="printTable">资产调拨</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<html:hidden  property="CAPT_BORROW/_order/col1/field"/>
		<html:hidden  property="CAPT_BORROW/_order/col1/asc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		<html:hidden name="CAPT_BORROW/BORROWID"  property="CAPT_BORROWVIEW/BORROWID" />
	
		<html:hidden property="CAPT_BORROW/BORROWCODE" />
		<html:hidden property="pd" value="0"/>
		
						<!--传递给选择用品层的参数-->
		<html:hidden property="detailName"/>
		<html:hidden property="index"/>
		<html:hidden property="goodIDs" />
		
	  </td>
    </tr>
  </table>
      <table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0" class="table">
      <tr>
      <td height="8"></td>
      </tr>
      
        <tr>
          <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
                
               <tr > 
                  <td width="10%"  align="right" class="td2" nowrap="nowrap">调拨到部门：</td>
                  <td width="15%"  class="td1" nowrap="nowrap"><select  name="CAPT_BORROW/DepID"   id="select1" bizAction="oa.bizAssetsManage.selectAllGroup"   paramXML="" listXpath="list[@type='TeachGroup']" entityName="TeachGroup" valueField="orgID"    textField="orgName"        childID="select2"  nullLable="true" nullLableText="<bean:write property="SessionEntity/orgName"/>" nullLableValue="<bean:write property="SessionEntity/orgID"/>" onchange="refreshChild_DS(this)" ></select> 
                   </td>
                  <td width="10%"  align="right" class="td2" nowrap="nowrap">使 用 人：</td>
                  <td width="15%"  class="td1"><select name="CAPT_BORROW/BORROWERID"        id="select2" bizAction="oa.bizAssetsManage.selectTeacher"    paramXML="" listXpath="list[@type='Teacher']"     entityName="Teacher"    valueField="TeacherID" textField="operatorName"  childID=""       mainSelectID="select1" nullLable="true" nullLableText="<bean:write property="SessionEntity/userID" formatClass="username" formatType="userid"/> " nullLableValue=" <bean:write property="SessionEntity/operatorID" /> "   onchange="queryTeaching()"></select>
                  </td>
				 <script language="JavaScript" type="text/JavaScript">	 	
					initSel_DS(document.getElementById("select1"));
				</script>
                  <td width="10%" align="right" class="td2" nowrap="nowrap">调拨日期：</td>
                  <td width="15%" class="td1" nowrap="nowrap">
                  <html:text name="CAPT_BORROW/BORROWDATE[@pattern='yyyy-MM-dd']" property="CAPT_BORROWVIEW/BORROWDATE" attributesText='class="input" size="12" ValidateType="notempty" Msg="借用日期不能为空"' readonly="true"/>
             	  <img src="/internet/image/date.gif" width="13" height="20"  align="absmiddle" onClick=calendar(document.forms[0].elements["CAPT_BORROW/BORROWDATE[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")> 
                  
                  </td>
               
                </tr>
              </table>
              </td></tr>  
            <tr><td>
              <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CBCBCB" id="listdetail">
                <tr class="td_title">
                  <td width="37%" align="center">品名</td>
                  <td width="10%" align="center">编码</td>
                  <td width="20%" align="center">规格</td>
                  <td width="10%" align="center">单价（元）</td>
                  <td width="*" align="center">备注</td>
                  
                </tr>
                    <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type=CAPT_BORROWDETAILVIEW']"> 
                
                	<html:hidden name="listOld/CAPT_BORROWDETAIL/DETAILID" id="resultset" property="CAPT_BORROWDETAILVIEW/DETAILID" indexed="true"/>
               		<html:hidden name="listOld/CAPT_BORROWDETAIL/CAPTID" id="resultset" property="CAPT_BORROWDETAILVIEW/CAPTID" indexed="true"/>
               		
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
               <tr class="td1" onClick="changeTRBgColor(this)" id="row_<%=count %>"> 
                <td nowrap><input type="text" name="listInsert/CAPT_BORROWDETAIL[@hciTagIndex='<%=count%>']/CAPTNAME" value="<bean:write id="resultset" property='CAPT_BORROWDETAILVIEW/CAPTNAME'/>" style="width:100%"  readonly="readonly"  class="inputOA" />
               				<input type="hidden" id="goodID"   name="listInsert/CAPT_BORROWDETAIL[@hciTagIndex='<%=count%>']/CAPTID"  value="<bean:write id="resultset" property='CAPT_BORROWDETAILVIEW/CAPTID'/>"   />
               				<input type="hidden" name="listInsert/CAPT_BORROWDETAIL[@hciTagIndex='<%=count%>']/GOODNAME"  value="<bean:write id="resultset" property='CAPT_BORROWDETAILVIEW/GOODNAME'/>"   />
               				</td> 
                <td nowrap> <input type="text" name="listInsert/CAPT_BORROWDETAIL[@hciTagIndex='<%=count%>']/CAPTCODE"  value="<bean:write id="resultset" property='CAPT_BORROWDETAILVIEW/CAPTCODE'/>"  style="width:100%" readonly="readonly" class="inputOA" /></td>
                <td nowrap><input type="text" name="listInsert/CAPT_BORROWDETAIL[@hciTagIndex='<%=count%>']/SPECIA"  value="<bean:write id="resultset" property='CAPT_BORROWDETAILVIEW/SPECIA' />" style="width:100%"  readonly="readonly" class="inputOA"/></td>
                <td nowrap><input type="text" name="listInsert/CAPT_BORROWDETAIL[@hciTagIndex='<%=count%>']/PRICE"  value="<bean:write id="resultset" property='CAPT_BORROWDETAILVIEW/PRICE'/>"  style="width:100%" class="inputOA" readonly="readonly" /></td>
                <td nowrap> <input type="text" name="listInsert/CAPT_BORROWDETAIL[@hciTagIndex='<%=count%>']/REMARK" value="<bean:write id="resultset" property='CAPT_BORROWDETAILVIEW/REMARK'/>"   maxlength="50" style="width:100%" class="inputOA"/></td>
             	
              </tr>
				</logic:iterate>
                
                
              </table>
              
                 <table width="96%" height="30"  border="0" align="center" cellpadding="0" cellspacing="1" >
     <tr class="td2"> 
                  <td align="right" class="td1">备注：</td>
                  <td  class="td1"><html:textarea name="CAPT_BORROW/REMARK" property="CAPT_BORROWVIEW/REMARK" attributesText='class="input" cols="80" rows="3"'/>     
                  </td>
                
                </tr>
  </table>
			  </td>
        </tr>
</table>

	<table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
				<tr>
				  <td align="center">
				  <input name="wfsave" type="button" class="button_02" value="保 存" onClick="save()">
				  <input name="wfcancel" type="button" class="button_02" value="返 回" onClick="goBack()"></td>
				</tr>
     </table>
</form>
</body>
<script language="JavaScript" type="text/javascript">
  var listName = "listInsert/CAPT_BORROWDETAIL[@hciTagIndex='"; 
  function save() {
  	var frm = document.forms[0];
  
	    frm.submit();
	 
  
  }
  
  function goBack() {
  	var frm = document.forms[0];
  	frm.action = "oa.prAssetsManage.borrowList.do";
	frm.submit();
  }
   

 function getGoodIDs() {  //得到已加入的物品
	var goodIDs = document.all['goodID'];
	var goodIDArray = new Array();
	if(goodIDs != null) {
		if(typeof(goodIDs.length) == "undefined") {
			return document.all['goodID'].value;
		} else {
			for(var i=0 ;i< goodIDs.length ; i++) {
				if(goodIDs[i].value != ""){
					goodIDArray[i] = goodIDs[i].value;
				}
			}
		}
	}
	return goodIDArray.join();
}
  /*选择物品
  */
   function selectGood(obj,index) {  //选择物品
   var frm = document.forms[0];
   var goodIDs = getGoodIDs();
	frm["detailName"].value = "CAPT_BORROWDETAIL";
	frm["index"].value = index;
	frm["goodIDs"].value = goodIDs;
	f_InitDivData(obj); //此函数在autoSelect文件中
	
	
}
	
 
		
</script>