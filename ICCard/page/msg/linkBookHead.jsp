<%@include file="/internet/common.jsp"%>
<style>
<!--
.title{
 font-size:12px;
 background-color:#E8F5FF;
 cursor: hand;
}
-->
</style>
<form name="form1" >
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15">
            <html:hidden property="firstChar" value="0"/>
             </td>
            <td class="text_wirte">首页—&gt;一卡通—&gt;短信管理</td>
          </tr>
      </table></td>
    </tr>
  </table>
<table border="1" width="100%" align="center" cellpadding="0" bordercolor="#808080" style="border-collapse: collapse" >
<tr><td colspan="28" class="td2">
分组查询：
  <select name="sort" onchange="selectSort()">
  <option value="-1">不限</option>
   <logic:iterate id="sortResult" property="list[@type='sortInfo']">
	               <option value='<bean:write id="sortResult" property="sortInfo/sort"/>'><bean:write id="sortResult" property="sortInfo/sort"/></option>
	            </logic:iterate>
  </select>
</td></tr>
	<tr>
		<td width="20" onMouseOver="overAction(this)" onMouseOut="outAction(this)" align="center" class="title" onClick="changeTRBgColor(this,'0')">全部	</td>
		<td width="20" onMouseOver="overAction(this)" onMouseOut="outAction(this)" align="center" class="title" onClick="changeTRBgColor(this,'A')">A</td>
		<td width="20" onMouseOver="overAction(this)" onMouseOut="outAction(this)" align="center" class="title" onClick="changeTRBgColor(this,'B')">B</td>
		<td width="20" onMouseOver="overAction(this)" onMouseOut="outAction(this)" align="center" class="title" onClick="changeTRBgColor(this,'C')">C</td>
		<td width="20" onMouseOver="overAction(this)" onMouseOut="outAction(this)" align="center" class="title" onClick="changeTRBgColor(this,'D')">D</td>
		<td width="20" onMouseOver="overAction(this)" onMouseOut="outAction(this)" align="center" class="title" onClick="changeTRBgColor(this,'E')">E</td>
		<td width="20" onMouseOver="overAction(this)" onMouseOut="outAction(this)" align="center" class="title" onClick="changeTRBgColor(this,'F')">F</td>
		<td width="20" onMouseOver="overAction(this)" onMouseOut="outAction(this)" align="center" class="title" onClick="changeTRBgColor(this,'G')">G</td>
		<td width="20" onMouseOver="overAction(this)" onMouseOut="outAction(this)" align="center" class="title" onClick="changeTRBgColor(this,'H')">H</td>
		<td width="20" onMouseOver="overAction(this)" onMouseOut="outAction(this)" align="center" class="title" onClick="changeTRBgColor(this,'I')">I</td>
		<td width="20" onMouseOver="overAction(this)" onMouseOut="outAction(this)" align="center" class="title" onClick="changeTRBgColor(this,'J')">J</td>
		<td width="20" onMouseOver="overAction(this)" onMouseOut="outAction(this)" align="center" class="title" onClick="changeTRBgColor(this,'K')">K</td>
		<td width="20" onMouseOver="overAction(this)" onMouseOut="outAction(this)" align="center" class="title" onClick="changeTRBgColor(this,'L')">L</td>
		<td width="20" onMouseOver="overAction(this)" onMouseOut="outAction(this)" align="center" class="title" onClick="changeTRBgColor(this,'M')">M</td>
		<td width="20" onMouseOver="overAction(this)" onMouseOut="outAction(this)" align="center" class="title" onClick="changeTRBgColor(this,'N')">N</td>
		<td width="20" onMouseOver="overAction(this)" onMouseOut="outAction(this)" align="center" class="title" onClick="changeTRBgColor(this,'O')">O</td>
		<td width="20" onMouseOver="overAction(this)" onMouseOut="outAction(this)" align="center" class="title" onClick="changeTRBgColor(this,'P')">P</td>
		<td width="20" onMouseOver="overAction(this)" onMouseOut="outAction(this)" align="center" class="title" onClick="changeTRBgColor(this,'Q')">Q</td>
		<td width="20" onMouseOver="overAction(this)" onMouseOut="outAction(this)" align="center" class="title" onClick="changeTRBgColor(this,'R')">R</td>
		<td width="20" onMouseOver="overAction(this)" onMouseOut="outAction(this)" align="center" class="title" onClick="changeTRBgColor(this,'S')">S</td>
		<td width="20" onMouseOver="overAction(this)" onMouseOut="outAction(this)" align="center" class="title" onClick="changeTRBgColor(this,'T')">T</td>
		<td width="20" onMouseOver="overAction(this)" onMouseOut="outAction(this)" align="center" class="title" onClick="changeTRBgColor(this,'U')">U</td>
		<td width="20" onMouseOver="overAction(this)" onMouseOut="outAction(this)" align="center" class="title" onClick="changeTRBgColor(this,'V')">V</td>
		<td width="20" onMouseOver="overAction(this)" onMouseOut="outAction(this)" align="center" class="title" onClick="changeTRBgColor(this,'W')">W</td>
		<td width="20" onMouseOver="overAction(this)" onMouseOut="outAction(this)" align="center" class="title" onClick="changeTRBgColor(this,'X')">X</td>
		<td width="20" onMouseOver="overAction(this)" onMouseOut="outAction(this)" align="center" class="title" onClick="changeTRBgColor(this,'Y')">Y</td>
		<td width="20" onMouseOver="overAction(this)" onMouseOut="outAction(this)" align="center" class="title" onClick="changeTRBgColor(this,'Z')">Z</td>
		<td width="20" onMouseOver="overAction(this)" onMouseOut="outAction(this)" align="center" class="title" onClick="changeTRBgColor(this,'1')">其他</td>
	</tr>
</table>
</form>
<script language="javascript">
function  changeTRBgColor(obj,field) {
 	 obj.style.backgroundColor="#A2C4DC";
 	 document.forms[0].elements["firstChar"].value=field;
	
	selectSort();
}

function selectSort(){ 
  parent.frames["buttomFrame"].document.forms[0].elements["sort"].value=document.forms[0].elements["sort"].value;
  parent.frames["buttomFrame"].document.forms[0].elements["firstChar"].value=document.forms[0].elements["firstChar"].value;
  parent.frames["buttomFrame"].document.forms[0].elements["PageCond/count"].value="";
  parent.frames["buttomFrame"].document.forms[0].elements["PageCond/length"].value="";
  parent.frames["buttomFrame"].document.forms[0].elements["PageCond/begin"].value="";
  parent.frames["buttomFrame"].document.forms[0].target="buttomFrame";
  parent.frames["buttomFrame"].document.forms[0].submit();
}

function overAction(aObject) {
 aObject.style.backgroundColor="#A2C4DC";
}

function outAction(aObject) {
aObject.style.backgroundColor="#E8F5FF";
	
}
</script>