<%
String model = request.getParameter("model");
if( model==null ) model = "normal";
String port = request.getParameter("port");
%>




<script language="JavaScript">
function findParent(obj){
	if(obj.opener == null || obj.opener == undefined){
		return obj;
	}else{
		obj.close();
		return findParent(obj.opener);
	}

}


	var m = '<%=model%>';
	var p = '<%=port%>';
	var url ='';
	if( p=='null' || p=='' )
		url='/internet/login1.jsp?model='+m;
	else
		url='/internet/login1.jsp?model='+m+'&port='+p;
	 //window.open( url, "_top");
     var top = findParent(window);
	 top.open( url, "_top");
</script>