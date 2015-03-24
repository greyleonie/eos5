<%@ page language="java" contentType="text/html; charset=GBK"%>
<%
	String meg="";
	try
	{
		meg=request.getAttribute("errorStr").toString();
	}
	catch(Exception e){
	}
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
	var meg = '<%=meg%>';
	if(meg!=''){
		alert(meg);
	}
	 var url='/login.jsp';
   var top = findParent(window);
	 top.open( url, "_top");
</script>