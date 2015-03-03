<%@include file="/internet/common.jsp"%>
<script>
function menu3(t) {
    for (var i=0; i<t.rows.length; i++)
    for (var j=0; j<t.rows[i].cells.length; j++)
    t.rows[i].cells[j].className= t.rows[i].cells[j] == event.srcElement ? 'menu32' : 'menu31';
}

function overAction(aObject) {
	//alert("over")
	var tObject = aObject.childNodes[0];
	tObject.className = "menu33";
	tObject.setAttribute("state","0");

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
}

function clickAction(aObject) {
	//alert("click")
	var tObject = aObject.childNodes[0];
	tObject.setAttribute("state","3");
	tObject.className = "menu32";
	
}

</script>
</head>

<body bgcolor="#D6EEFF">
<table width="170"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="image/left_menu_01.gif" width="170" height="32"></td>
  </tr>
  <tr>
    <td><img src="image/left_menu_02.gif" width="170" height="20"></td>
  </tr>
  <tr>
    <td background="image/left_menu_bg.gif">
	<table width="90%"  border="0" align="center" cellpadding="0" cellspacing="0" onClick="menu3(this)">
      <tr>
        <td width="21%" ><img src="image/jxjh_01.gif" width="22" height="22" hspace="4" align="absmiddle"></td>
        <a href="teachWorkManage.prMakeTeachPlan.teachPlanFrame.do?TeachingPlan=&PageCond=" target="mainframe" onMouseOver="overAction(this)" onMouseOut="outAction(this)" onClick="clickAction(this)">
		<td width="79%" class="menu31">教学计划框架</td>
		</a>
      </tr>
      <tr bgcolor="#A2A2A2" class="menu_line">
        <td height="1" colspan="2" > </td>
        </tr>
      <tr>
        <td width="21%" ><img src="image/jxjh_02.gif" width="22" height="22" hspace="4" align="absmiddle"></td>
        <a href="teachWorkManage.prMakeTeachPlan.reportFrames.do?loc=4" target="mainframe" onMouseOver="overAction(this)" onMouseOut="outAction(this)" onClick="clickAction(this)">
		<td width="79%" class="menu31" onMouseOver="this.className='menu33'">征求意见稿</td>
        </a>
      </tr>
      <tr bgcolor="#A2A2A2" class="menu_line">
        <td height="1" colspan="2" > </td>
		</tr>
      <tr>
        <td width="21%" ><img src="image/jxjh_03.gif" width="22" height="22" hspace="4" align="absmiddle"></td>
        <a href="teachWorkManage.prMakeTeachPlan.reportFrames.do?loc=5" target="mainframe" onMouseOver="overAction(this)" onMouseOut="outAction(this)" onClick="clickAction(this)">
		<td width="79%" class="menu31">课题筛选</td>
		</a>
	  </tr>
      <tr bgcolor="#A2A2A2" class="menu_line">
        <td height="1" colspan="2" > </td>
        </tr>
      <tr>
        <td width="21%" ><img src="image/jxjh_04.gif" width="22" height="22" hspace="4" align="absmiddle"></td>
        <a href="teachWorkManage.prMakeTeachPlan.leaderCheckFrame.do?TeachingPlan=" target="mainframe" onMouseOver="overAction(this)" onMouseOut="outAction(this)" onClick="clickAction(this)">
		<td width="79%" class="menu31">领导审批</td>
		</a>
	  </tr>
      <tr bgcolor="#A2A2A2" class="menu_line">
        <td height="1" colspan="2" > </td>
        </tr>
      <tr>
        <td width="21%" ><img src="image/jxjh_05.gif" width="22" height="22" hspace="4" align="absmiddle"></td>
        <a href="teachWorkManage.prMakeTeachPlan.finalPlanFrames.do" target="mainframe" onMouseOver="overAction(this)" onMouseOut="outAction(this)" onClick="clickAction(this)">
		<td width="79%" class="menu31">教学计划定稿</td>
		</a>
      </tr>
      <tr bgcolor="#A2A2A2" class="menu_line">
        <td height="1" colspan="2" > </td>
        </tr>
      <tr>
        <td width="21%" ><img src="image/jxjh_06.gif" width="22" height="22" hspace="4" align="absmiddle"></td>
       <td width="79%" class="menu31"> <a href="teachWorkManage.prMakeTeachPlan.specialSubjectPlan.do" target="mainframe" onMouseOver="overAction(this)" onMouseOut="outAction(this)" onClick="clickAction(this)">
		自选班教学计划</a></td>
		
	 </tr>
      <tr bgcolor="#A2A2A2" class="menu_line">
        <td height="1" colspan="2" > </td>
        </tr>
      <tr>
        <td width="21%" ><img src="image/jxjh_07.gif" width="22" height="22" hspace="4" align="absmiddle"></td>
        <a href="teachWorkManage.prNetCenter.remoteTeachList.do" target="mainframe" onMouseOver="overAction(this)" onMouseOut="outAction(this)" onClick="clickAction(this)">
		<td width="79%" class="menu31">远程教学收录安排</td>
		</a>
	 </tr>
      <tr bgcolor="#A2A2A2" class="menu_line">
        <td height="1" colspan="2" > </td>
        </tr>
      <tr>
        <td width="21%" ><img src="image/jxjh_08.gif" width="22" height="22" hspace="4" align="absmiddle"></td>
        <a href="teachWorkManage.prMakeTeachPlan.noticeList.do?PageCond=&CourseAdjust=" target="mainframe" onMouseOver="overAction(this)" onMouseOut="outAction(this)" onClick="clickAction(this)">
	    <td width="79%" class="menu31">课程调整通知</td>
		</a>
	  </tr>
	    <tr bgcolor="#A2A2A2" class="menu_line">
        <td height="1" colspan="2" > </td>
        </tr>
	   <tr>
        <td width="21%" ><img src="image/jxjh_01.gif" width="22" height="22" hspace="4" align="absmiddle"></td>
        <a href="teachWorkManage.prMakeTeachPlan.subjectManage.do?PageCond=&isHistory=0&keyWord=&group=-1" target="mainframe" onMouseOver="overAction(this)" onMouseOut="outAction(this)" onClick="clickAction(this)">
	    <td width="79%" class="menu31">课题库管理</td>
		</a>
	  </tr>
	    <tr bgcolor="#A2A2A2" class="menu_line">
        <td height="1" colspan="2" > </td>
        </tr>
	   <tr>
        <td width="21%" ><img src="image/jxjh_01.gif" width="22" height="22" hspace="4" align="absmiddle"></td>
        <a href="" target="mainframe" onMouseOver="overAction(this)" onMouseOut="outAction(this)" onClick="clickAction(this)">
	    <td width="79%" class="menu31">教学模式维护</td>
		</a>
	  </tr>
      <tr bgcolor="#A2A2A2" class="menu_line">
        <td height="1" colspan="2" > </td>
        </tr>
      <tr>
        <td height="40" colspan="2" > </td>
        </tr>



    </table></td>
  </tr>
  <tr>
    <td><img src="image/left_menu_03.gif" width="170" height="25"></td>
  </tr>
</table>
</body>