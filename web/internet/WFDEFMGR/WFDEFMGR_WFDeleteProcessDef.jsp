<%@ include file="/internet/WFCOMMON/wfappbase.jsp" %> 
<%
	String processDefID=request.getParameter("processDefID");
	//System.out.println(processDefID);
%>
<html>
<head>
	<title>删除流程定义</title>
	<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body>
<form name="queryForm" action="WFDEFMGR.pr_automata.WFDEFMGR_P_DeleteProcDef.do" target="moonpiazza" method="POST">
	<html:hidden name="processDefID" value="<%=processDefID%>"/>
	<input type="hidden" name="n1"  value="true">
	<input type="hidden" name="test" value="false">
</form>
</body>

<script  language="JavaScript">

//   alert("aaa");

   <logic:greaterThan property="list/WFProcessInstView/processInstID" value="0">

	if(confirm("该业务流程下已存在流程实例,如果执行删除操作,则这些实例将会被一起删除,确认删除吗?"))
	{
		//alert("1");
	   queryForm.submit();
	//   window.close();	
	}else{
		//	alert("2");
    //   window.close();	
    history.go(-1);
	}

   </logic:greaterThan>
          
   <logic:notPresent property="list/WFProcessInstView/processInstID" >
   		//alert("3");
	   queryForm.submit();	
  //     window.close();	

//    history.go(-1);
   </logic:notPresent>
</script>