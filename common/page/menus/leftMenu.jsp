<%@include file="/internet/common.jsp"%>

<html>
<head>

<title>广州市委党校信息一体化平台</title>

<script>
var selected;
function menu3(t) {
    for (var i=0; i<t.rows.length; i++)
    for (var j=0; j<t.rows[i].cells.length; j++)
    t.rows[i].cells[j].className= t.rows[i].cells[j] == event.srcElement ? 'menu32' : 'menu31';
}

function overAction(aObject) {
	//alert("over")
	var tObject = aObject.childNodes[0];
	if (aObject.id != selected) {
	   tObject.className = "menu33";
	   tObject.setAttribute("state","0");
	} else {
	   tObject.className = "menu34";
	   tObject.setAttribute("state","0");
	}
}

function outAction(aObject) {
	//alert("out")
	var tObject = aObject.childNodes[0];
	
	if(tObject.getAttribute("state") == "3") {
		tObject.className = "menu32";
	}else{
		tObject.setAttribute("state","0");
		tObject.className = "menu31";
	}
	if (aObject.id == selected) {
	   tObject.setAttribute("state","3");
	   tObject.className = "menu32";
	}
}

function clickAction(aObject) {
	//alert("click")
	var tObject = aObject.childNodes[0];
	selected = aObject.id;
	tObject.setAttribute("state","3");
	tObject.className = "menu32";
	
}

</script>
</head>

<body bgcolor="#D6EEFF">
<table width="170"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="/internet/image/left_menu_01.gif" width="170" height="32"></td>
  </tr>
  <tr>
    <td><img src="/internet/image/left_menu_02.gif" width="170" height="20"></td>
  </tr>
  <tr>
    <td background="/internet/image/left_menu_bg.gif">
	<table width="90%" height="300"  border="0" align="center" cellpadding="0" cellspacing="0" onClick="menu3(this)">
      <tr bgcolor="#A2A2A2" class="menu_line">
        <td height="1" colspan="2" > </td>
		</tr>
		<%
	String parentsID = talent.core.TalentFunctions.getAvailStr(base.util.TalentContext.getValue(pageContext,null,"PID"));
	talent.util.EOSMenuMap menuMap = new talent.util.EOSMenuMap();
	java.util.List list = menuMap.getEOSMenuListByParentsID(pageContext.getServletContext(),parentsID);
	java.util.HashMap rightMap = (java.util.HashMap) session.getAttribute("userPermissions");
		
	for(int i=0;i<list.size();i++){
		talent.util.EOSMenu eosMenu = (talent.util.EOSMenu ) list.get(i);
		String menuID = eosMenu.getMenuID();
		if(rightMap.get(menuID)!=null&&!"".equals(rightMap.get(menuID))){
			String menuAction= talent.core.TalentFunctions.getAvailStr(eosMenu.getMenuAction()) ;
			if(menuAction.indexOf("?")>0)
	    	 	menuAction += "&";
	    	else
	    	  	menuAction += "?";
	    	menuAction += "menuID="+menuID;  
 %>
		        <td width="21%" ><img src="/internet/image/leftMenu_<%=i+1 %>.gif" width="22" height="17" hspace="4" align="absmiddle"></td>
		        <a id="menu<%=i%>" href='<%=menuAction %>' target="mainFrame"   onMouseOver="overAction(this)" onMouseOut="outAction(this)" onClick="clickAction(this)">
					<td width="79%" class="menu31"><%= eosMenu.getMenuName() %></td>
		        </a>      
	        </tr>
	      	<tr bgcolor="#A2A2A2" class="menu_line">
	        	<td height="1" colspan="2" > </td>
			</tr>
	<%}} %>
    
		
      <tr>
        <td height="260" colspan="2" > </td>
        </tr>
    </table></td>
  </tr>
  <tr>
    <td><img src="/internet/image/left_menu_03.gif" width="170" height="25"></td>
  </tr>
</table>
</body>
</html>
<script language="JavaScript">
	var linkObj = document.links[0];
	window.parent.mainFrame.location.href = linkObj;
	clickAction(linkObj);
</script>