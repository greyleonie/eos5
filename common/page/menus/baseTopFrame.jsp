<%@include file="/internet/common.jsp"%>
<%
String subid = request.getParameter("subid"); 
String subaction = request.getParameter("subaction"); 
String flag = request.getParameter("flag"); 
if(subaction!=null){
	subaction = subaction.replaceAll("@","&");
}
int iflag = 0;
if(flag!=null){
	iflag = Integer.parseInt(flag);
}
 %>
<script>
	<%if(subid!=null&&subaction!=null){%>
	var tabbox1=new TabControl("tab1c",<%=iflag%>);
	<%}else{%>
	var tabbox1=new TabControl("tab1c",0);
	<%}%>
	<%
	String parentsID = talent.core.TalentFunctions.getAvailStr(base.util.TalentContext.getValue(pageContext,null,"PID"));
	talent.util.EOSMenuMap menuMap = new talent.util.EOSMenuMap();
	java.util.List list = menuMap.getEOSMenuListByParentsID(pageContext.getServletContext(),parentsID);
	java.util.HashMap rightMap = (java.util.HashMap) session.getAttribute("userPermissions");
		
	for(int i=0;i<list.size();i++){
		talent.util.EOSMenu eosMenu = (talent.util.EOSMenu ) list.get(i);
		String menuID = eosMenu.getMenuID();
		if(rightMap.get(menuID)!=null&&!"".equals(rightMap.get(menuID))){
 %>

			<%
    			String menuAction= talent.core.TalentFunctions.getAvailStr(eosMenu.getMenuAction()) ;
    		%>
			
			tabbox1.add('<%=i+1%>','<%= eosMenu.getMenuName() %>','<%=menuAction%>','testframe',0)
<%}} %>
	
</script>

<html>
<body>

<table width="100%" height="5" border="0">
  <tr>
    <td height="5"></td>
  </tr>
</table>

<table border="0" align="center" cellpadding="0" bordercolor="#808080" style="border-collapse: collapse" >
	<tr>
		<td>
			<script>
			 tabbox1.init()
			</script>
		</td>
	</tr>
	<tr>
		<td style="border:1px #DCDCDC solid;border-top:none" nowrap>
		
			<table border="0">
			  <tr>
				<td align="center">
				<iframe src="" name="testframe" frameborder="0" ></iframe>
				
				</td>
				
			  </tr>
			</table>
		</td>
	</tr>
	
</table> 
	
<script>
	tabbox1.initPage(1,'testframe');
	
	<%if(subid!=null&&subaction!=null){%>
	   document.all.testframe.src = '<%=subaction%>';
	<%}%>
</script>
</body>
</html>