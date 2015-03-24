<%--
	---------------------------------------------------------------------------------
	Revision           Revision Date    Revision Man         Reason/Statement 
	1.0                2003/03/22       xuyb                create
--%>
<%@include file="/internet/common.jsp" %>
<SCRIPT language=JavaScript src="/internet/scripts/check.js"></SCRIPT>
   <link rel="stylesheet" href="/internet/css/style.css" type="text/css" />
<html:form name="addFrm" action="BNDICT.pr_automata.BNDICT_P_UpdateDictType.do" target='_parent' method="post">
  <html:hidden name="BNDICT_T_BusinType/businTypeID" property="BNDICT_T_BusinType/businTypeID" />
  <table align="center" border="0" bgcolor="#eeeeee" width="100%" height="80%">
    <tr class="query_content"> 
      <td colspan="2" height="5%">【修改业务类型】</td>
    </tr>
    <tr class="query_content">
      <td align="right"  height="10%">业务类型ID：</td>
      <td >
        <bean:write property="BNDICT_T_BusinType/businTypeID"/>
      </td>
    </tr>
    <tr class="query_content">  
      <td align="right" height="10%">业务类型名：</td>
      <td> 
        <html:text name="BNDICT_T_BusinType/businTypeName" property="BNDICT_T_BusinType/businTypeName" size="40"/>
      </td>      
    </tr>

    <!--
    <tr class="add_content">
      <td align="right" class="add_head">业务类型级别：</td>
      <td>
        <html:text name="BNDICT_T_BusinType/roleClass" property="BNDICT_T_BusinType/roleClass"  size="20"/>
      </td>
    </tr>
    -->
	    <tr valign="top">
		      <td  align="left" height="30%">
		               <input type="button" name="button1" value="保存" onclick="javascript:submit1()"/>
		               <input type="button" name="button2" value="重置" onclick="javascript:document.addFrm.reset()"/>
		                <input type="button" name="button3" value="返回" onclick="javascript:return1()"/>      
        </a> 
    </td>
    </tr>
  </table>
</html:form>


<script languange="javascript">

	function submit1() {
		var frm = document.addFrm;
		if(frm.elements["BNDICT_T_BusinType/businTypeID"].value=="") {
			alert("业务类型ID必须输入！");
			return;
		}
		if(getTotalBytes(frm.elements["BNDICT_T_BusinType/businTypeID"])>20) {
			alert("业务类型ID输入过长！");
			return;
		}
		if(frm.elements["BNDICT_T_BusinType/businTypeName"].value=="") {
			alert("业务类型名必须输入！");
			return;
		}
		if(getTotalBytes(frm.elements["BNDICT_T_BusinType/businTypeName"])>40) {
			alert("业务类型名输入过长！");
			return;
		}
			frm.target="_parent";
		frm.submit();
	}


function return1(){
      var frm = document.addFrm;
      	frm.target = "_parent";
      	frm.action = "BNDICT.pr_automata.BNDICT_P_DictQuery.do";
	frm.submit();
}
	
</script>
<%@include file="/internet/commonTail.jsp" %>
