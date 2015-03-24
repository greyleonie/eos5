<%@include file="/internet/common.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>广州市委党校信息一体化平台</title>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
//-->
</script>

<script language="javascript">
function menuControl(show)
{
window.event.cancelBubble=true;
var objID=event.srcElement.id;
var index=objID.indexOf("_");
var mainID=objID.substring(0,index);
var numID=objID.substring(index+1,objID.length);
if(mainID=="menubar")
{
if(show==1)
{
eval("showMenu("+"menu_"+numID+")");
}
else
{
eval("hideMenu("+"menu_"+numID+")");
}
}

}

var nbottom=0,speed=1;
function displayMenu(obj)
{
obj.style.clip="rect(0 100% "+nbottom+"% 0)";
nbottom+=speed;
if(nbottom<=100) 
{
timerID=setTimeout("displayMenu("+obj.id+"),70");
}
else clearTimeout(timerID);
}
function showMenu(obj)
{
obj.style.display="block";
obj.style.clip="rect(0 0 0 0)";
nbottom=5;
displayMenu(obj);
}
function hideMenu(obj)
{
nbottom=0;
obj.style.display="none";
}
function keepMenu(obj)
{
obj.style.display="block";
}
</script>

</head>

<body >
<script language="JavaScript">
function doShow(obj,num)
{
if(num==1)
{ obj.style.display="block"}
else
{obj.style.display="none"}
}
function menu(t) {
    for (var i=0; i<t.rows.length; i++)
    for (var j=0; j<t.rows[i].cells.length; j++)
    t.rows[i].cells[j].className= t.rows[i].cells[j] == event.srcElement ? 'menu22' : 'menu21';
}

</script>

<table width="100%"  border="0"  height="23" align="center" cellpadding="0" cellspacing="0" background="/internet/image/menu2_bg.gif" onClick="menu(this)">
  <tr>
    <td width="11" align="right"  >&nbsp;</td>
<%
	String parentsID = talent.core.TalentFunctions.getAvailStr(base.util.TalentContext.getValue(pageContext,null,"TEOSMENU/parentsid"));
	talent.util.EOSMenuMap menuMap = new talent.util.EOSMenuMap();
	java.util.List list = menuMap.getEOSMenuListByParentsID(pageContext.getServletContext(),parentsID);
	java.util.HashMap rightMap = (java.util.HashMap) session.getAttribute("userPermissions");
		
	for(int i=0;i<list.size();i++){
		talent.util.EOSMenu eosMenu = (talent.util.EOSMenu ) list.get(i);
		String menuID = eosMenu.getMenuID();
		if(rightMap.get(menuID)!=null&&!"".equals(rightMap.get(menuID))){
 %>
    <td width="3" align="center" nowrap class="text">|&nbsp;</td>
    <%
    	String menuAction= talent.core.TalentFunctions.getAvailStr(eosMenu.getMenuAction()) ;
    	if(menuAction.indexOf("?")>0)
    	 	menuAction += "&";
    	else
    	  	menuAction += "?";
    	menuAction += "menuID="+menuID;  
	%>
    <a href="<%= menuAction%>" target="main">
    <td align="center" nowrap class="menu21"><%= eosMenu.getMenuName() %></td>
	</a>
	
<%}}

 %>
    
	<td align="right" width="102%">
	<script language="JavaScript">
		var thisMenuParentId = '<bean:write property="TEOSMENU/parentsid"/>';
		//alert(parent.parent.menuFrame.document.getElementById(thisMenuParentId))
		function setClassName() {
			if(parent.parent.menuFrame.document.getElementById(thisMenuParentId)) {
				var menuid = parent.parent.menuFrame.document.getElementById(thisMenuParentId);
				var t = parent.parent.menuFrame.document.getElementById("eosmenutable");
				
				var trows = t.rows[0];
				for(var i = 0; i < trows.cells.length; i++) {
					trows.cells[i].className = trows.cells[i]== menuid ? 'button_under' : 'button';	
				}
			}
			//setTimeout("setClassName()",10000);
		}
		setClassName();
	</script>
	</td>
  </tr>
</table>
</body>
</html>
<script  type="text/javascript">
//alert(parent.main.document.location.href)
//if(document.links.length > 0) {
	
	//if(parent.main.document.location.href!=document.links[0].href) {
		//firstLinkHot("menu22");
	//}

//}

	firstLinkHot("menu22");
</script>