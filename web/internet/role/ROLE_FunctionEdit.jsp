<%@ include file="/internet/BNOM/hciHead.jsp" %>
<html>
<head>
	 <link rel="stylesheet" href="/internet/css/style.css" type="text/css" />
</head>
<body>
<SCRIPT language=JavaScript src="/internet/scripts/check.js"></SCRIPT>
<form name="frmActionFun" action="#333" method="post">
	
	<%
	//因为点击左边的那颗树中的某一值的时候表示修改操作,所以给command为mod
		String strFlag = request.getParameter("command");
		if(strFlag == null) {
			strFlag = "mod";
		}
	%>


	 <html:hidden name="auto" />
<table width="100%" height="100%"  border=0>
  <tr>
    <td width="99%" height="95%">
<eos:OneTab name="功能管理" imagePath="/internet/images/tt.gif" >
     <table border="0" bgcolor="#EEEEEE" height="80%" width="80%">

			<tr class="query_content">
				<td width="25%">功能类别名：</td>
				<td>
					<input type="text" class="fieldtxt" name="EOSBizCatalog/catalogName" size="40" value="<bean:write property="EOSBizCatalog/catalogName"/>"/>
				</td>
			</tr>
			<%if (!(strFlag.equals("mod"))) {%>
			 <tr class="query_content">
	                         <td ><input type="checkbox" name="box" onclick="openReadonly()">输入功能类别ID</td>
	                        <td>(注：如果不选择则系统自动生成ID)</td>
                        </tr>
                        <%}%>			
			<tr class="query_content">
				<td width="25%">功能类别ID：</td>
				<td>
					<input type="text" class="fieldtxt" name="EOSBizCatalog/catalogID" <%if(strFlag.equals("mod")) {%> readOnly <%}%>value="<bean:write property="EOSBizCatalog/catalogID"/>" readonly="true"/>
				</td>
			</tr>						


			<tr class="query_content">
				<td width="25%">备注：</td>
				<td >
					<input type="text" class="fieldtxt" size="60" name="EOSBizCatalog/catalogRemark" value="<bean:write property="EOSBizCatalog/catalogRemark"/>"/>
				</td>
			</tr>
			<tr class="query_content">
		               
		
		      
		                <td  >
			          <a href='ROLE.pr_automata.ROLE_P_FunctionUpdateForBiz.do?EOSBizCatalog/catalogID=<bean:write property="EOSBizCatalog/catalogID"/>&EOSFunction/unitID=9999'>

			          </a>
		                 </td>		
	                </tr>
			<tr>
			  <td align="center" colspan="2">
			       <input type="button" name="button1" value="&nbsp;保存&nbsp;" onclick="javascript:submit1()"/>
		               <input type="button" name="button2" value="&nbsp;重置&nbsp;" onclick="javascript:document.frmActionFun.reset()"/>
		                <input type="button" name="button3" value="&nbsp;返回&nbsp;" onclick="javascript:return1()"/>			  
			</td>
			</tr>
		</table>
	    </form>
	</table>
   </eos:OneTab>
    </td>
   </tr> 
   </table>
</body>
</html>
<%@ include file="/internet/commonTail.jsp" %>
<script language="JavaScript">

function submit1(){
	var frm = document.frmActionFun;
	frm.target="_parent";
	if(frm.elements["EOSBizCatalog/catalogName"].value == "") {
		alert("请添入功能类别名");
		frm.elements["EOSBizCatalog/catalogName"].focus();
		return;
	}	
	
	if(isChinaOrNumbOrLett(frm.elements["EOSBizCatalog/catalogName"].value)==false) {
			alert("输入的功能类别名为非法字符，请重新输入！");
			frm.elements["EOSBizCatalog/catalogName"].focus();
			return;
	}
	if(getTotalBytes(frm.elements["EOSBizCatalog/catalogName"])>40) {
			alert("功能类别名的长度不能超过40个字节，请重新输入!!!");
			frm.elements["EOSBizCatalog/catalogName"].focus();
			return;
	}
	
		
	if(frm.elements["EOSBizCatalog/catalogID"].value == "" && frm.elements["EOSBizCatalog/catalogID"].readOnly == false) {
		alert("请添入功能类别ID");
		frm.elements["EOSBizCatalog/catalogID"].focus();
		return;
	}
	if(frm.elements["EOSBizCatalog/catalogID"].value == "0" && frm.elements["EOSBizCatalog/catalogID"].readOnly == false) {
		alert("功能类别ID不能为0");
		frm.elements["EOSBizCatalog/catalogID"].focus();
		return;
	}
	if(isNumberOrLetter(frm.elements["EOSBizCatalog/catalogID"].value)==false&&frm.elements["EOSBizCatalog/catalogID"].readOnly == false) {
	
		alert("功能类别ID必须是字母或数字！");
		frm.elements["EOSBizCatalog/catalogID"].focus();
		return;
         }
	if(getTotalBytes(frm.elements["EOSBizCatalog/catalogID"]) >20) {
			alert("功能ID的长度长度不能超过20个字节，请重新输入!!!");
			frm.elements["EOSBizCatalog/catalogID"].focus();
			return;
		}	

	
<%if(strFlag.equals("add")) {%>

	 if(frm.elements["box"].checked == true) {  				
	            frm.elements["auto"].value="N";	
	         } else {
	            frm.elements["auto"].value="Y";		
	         }
	frm.action="ROLE.pr_automata.ROLE_P_FunctionAddSubmit.do";
<%} else {%>
	frm.action="ROLE.pr_automata.ROLE_P_FunctionModSubmit.do";
<%}%>
	frm.submit();
}

function openReadonly() {
	var frm = document.frmActionFun;
	if(frm.elements["box"].checked == true) {
				
		frm.elements["EOSBizCatalog/catalogID"].readOnly = false;
		frm.elements["EOSBizCatalog/catalogID"].focus();	
	} else {
		frm.elements["EOSBizCatalog/catalogID"].readOnly = true;
		frm.elements["EOSBizCatalog/catalogName"].focus();				
		frm.elements["EOSBizCatalog/catalogID"].value = "";
		
	}
}

function return1(){
      var frm = document.frmActionFun;
      	frm.target = "_parent";
      	frm.action = "ROLE.pr_automata.ROLE_P_ShowAllFunction.do";
	frm.submit();
}
</script>