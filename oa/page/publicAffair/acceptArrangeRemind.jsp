<%@include file="/internet/common.jsp"%>
<SCRIPT LANGUAGE="JavaScript">
	<!--
	function leaveThing()
	{}
	function jumppage(src)
	{
	//frame_inner_from.action=src+".jsp";
	//frame_inner_from.submit();
		try{
			if (parent)
			{
			  parent.selectLayer(src,'layFrame');
			}	
		}catch (e){}		
	}  

	function gotoForm(name)
	{
		frame_inner_from.popKey.value=name;
		jumppage("form");
	}
	var oPopup = window.createPopup();
	var oPopupBody = oPopup.document.body;
	var oPopup_X=screen.width-300;
	var oPopup_Y=screen.height-200;

	function popup()
	{
	  oPopupBody.innerHTML = document.body.innerHTML;
	  oPopup.show(oPopup_X , oPopup_Y, 280, 160);
	}
	function move(x,y){
		try {  
				oPopup_X += x;
				oPopup_Y += y;
				oPopup.show(oPopup_X, oPopup_Y, 280,160); 
		}catch (e){}
	}
	//-->
</SCRIPT>
<BODY style="margin:10" class="archiveBody" onLoad="popup()"> 
<TABLE width="280" border=0 cellpadding="0" cellspacing="0" style="width: 200; height:150; border:gray 1px outset;" >
<TR class=td1 height="20" >
	<TD width="6%"  bgcolor="#DBE8F2">
	<TABLE border =0  cellpadding=0 cellspacing=0 >
<TR height=5>
	<TD style="height:5;width:5" onMouseOver="parent.move(-5,-5)"></TD>
	<TD style="background:yellow;height:5;width:5"  onmouseover="parent.move(0,-5)"></TD>
	<TD style="height:5;width:5" onMouseOver="parent.move(5,-5)"></TD>
</TR>
<TR height=5>
	<TD style="background:blue;height:5;width:5"  onmouseover="parent.move(-5,0)" ></TD>
	<TD style="height:5;width:5"></TD>
	<TD style="background:red;height:5;width:5"  onmouseover="parent.move(5,0)"></TD>
</TR>
<TR height=5>
	<TD style="height:5;width:5" onMouseOver="parent.move(-5,5)"></TD>
	<TD style="background:green;height:5;width:5"  onmouseover="parent.move(0,5)"></TD>
	<TD style="height:5;width:5" onMouseOver="parent.move(5,5)"></TD>
</TR>
</TABLE>
	</TD>
	<td class=td1  bgcolor="#DBE8F2"><IMG SRC="/internet/images/x.gif"  BORDER=0 ALT="提示" align=right  onclick = "parent.oPopup.hide();"><font size="2">工作安排提醒</font></td>
</TR>
<TR class=td2  >
	<TD height="133" colspan="2">	
		<TABLE width="211" height="131" align=center >
			<TR>
			<TD height="102" colspan="2">
			  <DIV style="width:270; height: 100; overflow:auto" align=left >
			  <font size="2" color="red">注意工作安排:<br></font>
			  <logic:iterate id="resultset" property="list[@type='WorkArrangeRemind']">
                &nbsp;&nbsp;<font size="2">
                  <bean:write id="resultset" property="WorkArrangeRemind/TASKSUM"/> .</font>
               </logic:iterate>
            </DIV>
        </TD>
		</TR>
		<!--<tr>
		   <td align="center">
		   <input type='button' name='cl' onClick='parent.oPopup.hide();' value='关闭'>
		   </td>
		</tr>-->
	  </TABLE>
	
	</TD>
</TR>
</TABLE>

</BODY>