<%@ include file="/internet/hciHead.jsp" %>
<head>
   <link rel="stylesheet" href="/internet/css/style.css" type="text/css" />
</head>


<body>
<table width="100%" height="100%">
   <tr>
    <td>	
        <eos:OneTab name="业务参数管理" imagePath="/internet/images/tt.gif" >
			  <html:form name="frmList" action="#" method="post">
			  <html:hidden property="BNDICT_V_Dictionary/businTypeID" />
			  <html:hidden property="PageCond/count"/>
			  <html:hidden property="PageCond/length"/>
			  <html:hidden property="PageCond/begin"/>
			  
			  <html:hidden name="BNDICT_T_Dictionary/businTypeID"/> 
			  <html:hidden name="BNDICT_T_Dictionary/businID"/> 
			  <html:hidden name="BNDICT_T_Dictionary/businName"/> 
			  <html:hidden name="BNDICT_T_Dictionary/businTypeName"/>
			  
			  	<html:hidden property="BNOMtag"/>
		     <table class="result" cellpadding=0 cellspacing=0 > 
		           <tr><td width="100%" colspan="2"><b>业务参数列表</b></td></tr>  
			       <tr valign="top">
			             <td colspan="2" class="tb_blue" height="50%" width="100%">
			                  <table width="100%" border="1"  cellpadding="0"  cellspacing="0" bordercolor="#B6B5B5" style="border-collapse: collapse" >
				                <tr class="tableHeadTR"> 
					          <td width="30%">业务类型名称</td>
					          <td width="30%">业务编号</td>
					          <td width="40%">业务参数名称</td>
					        </tr>
		                           <logic:iterate id="dictionary" property="list[@type='BNDICT_V_Dictionary']">
		
					       <tr class=tableContentTR> 
					          <td width="30%" align="center">
					           <input type="radio" name="dict" value="<bean:write id="dictionary" property="BNDICT_V_Dictionary/businTypeID"/>||<bean:write id="dictionary" property="BNDICT_V_Dictionary/businID"/>||<bean:write id="dictionary" property="BNDICT_V_Dictionary/businName"/>||<bean:write id="dictionary" property="BNDICT_V_Dictionary/businTypeName"/>">
					           		<bean:write id="dictionary" property="BNDICT_V_Dictionary/businTypeName"/>
					          </td>
					          <td width="30%" align="center">
					           		<bean:write id="dictionary" property="BNDICT_V_Dictionary/businID"/>
					          </td>
					          <td width="40%" align="center">
					           		<bean:write id="dictionary" property="BNDICT_V_Dictionary/businName"/>
					          </td>
					       </tr>
		                            </logic:iterate>
		                         </table>
		                     </td>
		               </tr>
			       <tr  class=queryLabelTD> 
			         
		        	   <td nowrap width="40%" height="10%" align="left">
		          		<div align="left">
	
					       <input type="button" name="button1" value="&nbsp;修改&nbsp;" onclick="javascript:modify()"/>
					       <input type="button" name="button2" value="&nbsp;删除&nbsp;" onclick="javascript:del()"/>
					        <input type="button" name="button3" value="&nbsp;返回&nbsp;" onclick="javascript:return1()"/>
			               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			               <input type="button" name="button1" value="新增业务参数" onclick="javascript:add()"/>					        
		          		</div>
		          	  </td>
		                  <td align="right" >              	   
		                <!-------------------翻页---------------------------->
					                <input type="button" name="button4" value="上一页" onclick="javascript:prevPage()"/>&nbsp;
							<input type="button" name="button5" value="下一页" onclick="javascript:nextPage()"/>&nbsp;&nbsp;		
			      		<logic:present property="PageCond/count">
				      		第<font id="currentPage"></font>/<font id="totalPage"></font>页 
				      		总共<bean:write property="PageCond/count"/>条
			    		</logic:present>
				  </td>	      	    
			     
			     </tr> </html:form>
			     <tr>
			        <td colspan=2  height="40%" width="100%">
			           &nbsp;
			        </td>
			     </tr>
			     
		   </table>
	</eos:OneTab> 
      </td>
   </tr>
</table>
</body>
<%@include file="/internet/hciTail.jsp" %>
<script language="JavaScript">
function add() {
	var submitFrm = document.frmList;
	submitFrm.action = "BNDICT.pr_automata.BNDICT_P_DictAdd.do";
	submitFrm.target = "_self";
	submitFrm.submit();
}

function modify() {
	var frm = document.frmList;
	var tempS = getRadioValue(frm.dict);
	if(tempS == null || tempS == "" ) {
		alert("请选择一条记录！");
		return;
	}

	var sArr = tempS.split("||");
	if(sArr.length == 4) {
		frm.elements["BNDICT_T_Dictionary/businTypeID"].value  = sArr[0];
		frm.elements["BNDICT_T_Dictionary/businID"].value  = sArr[1];
		frm.elements["BNDICT_T_Dictionary/businName"].value  = sArr[2];
		frm.elements["BNDICT_T_Dictionary/businTypeName"].value  = sArr[3];
		frm.action = "BNDICT.pr_automata.BNDICT_P_DictModify.do";
		frm.target = "_self";
		frm.submit();
	}	
}

function del() {
	var frm = document.frmList;
	var tempS = getRadioValue(frm.dict);
	if(tempS ==null ||tempS =="" ) {
		alert("请选择一条记录！");
		return;
	}
	var sArr = tempS.split("||");
	if(sArr.length == 4) {
		frm.elements["BNDICT_T_Dictionary/businTypeID"].value  = sArr[0];
		frm.elements["BNDICT_T_Dictionary/businID"].value  = sArr[1];
		if(confirm("确定要删除此记录?") == true){
			frm.action = "BNDICT.pr_automata.BNDICT_P_DictRemoveSubmit.do";
			frm.target = "_self";
			frm.elements["PageCond/count"].value = -1;
			frm.submit();
		}	
	}
	return;
}

function return1(){
      var frm = document.frmList;
      	if(frm.elements["BNOMtag"].value=="9999"){
	      	frm.action = "BNOM.pr_automata.BNOM_P_ShowBizOrgMain.do";
      	}else{
      	        frm.action = "BNDICT.pr_automata.BNDICT_P_DictQuery.do";
      	}
	frm.submit();
}

function getRadioValue(obj) {
   	if(obj == null)
    	return "";
  	var len = obj.length;
  	if(len==null) {
  		var s = obj.value;
  		if(s!=null&&obj.checked) return s;
  		return "";
  	}
	for(var i=0;i<len; i++) {
		if(obj[i].checked)
		 return obj[i].value;
	}
	return "";

}
</script>
<script>
var curRecord=<bean:write property="PageCond/begin"/>;
var totRecord=<bean:write property="PageCond/count"/>==0?1:<bean:write property="PageCond/count"/>;
var lenRecord=<bean:write property="PageCond/length"/>;
document.all("currentPage").innerText=Math.floor(curRecord/lenRecord)+1;
document.all("totalPage").innerText=Math.floor(totRecord/lenRecord)+(totRecord%lenRecord>0?1:0);


function prevPage(){
	var frm = document.frmList;
	if(curRecord-lenRecord>0)
		frm.elements["PageCond/begin"].value=curRecord-lenRecord;
	else
		frm.elements["PageCond/begin"].value=0;

	frm.target = "_self";
	frm.action = "BNDICT.pr_automata.BNDICT_P_ShowDict.do";	
	frm.submit();
}
function nextPage(){

	var frm = document.frmList;
	if(curRecord+lenRecord<totRecord)
		frm.elements["PageCond/begin"].value=curRecord+lenRecord;
	frm.target = "_self";
	frm.action = "BNDICT.pr_automata.BNDICT_P_ShowDict.do";
	frm.submit();
}
</script>