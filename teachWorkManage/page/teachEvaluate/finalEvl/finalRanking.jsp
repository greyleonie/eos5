<%@include file="/internet/common.jsp"%>
<%@page import="java.util.Calendar,java.util.Date;" %>
<%
Calendar now = Calendar.getInstance();
Date time = new Date();
%>

<head>
<title>主体班排名汇总</title>
<style type="text/css">
<!--
.STYLE1 {
	font-family: "华文中宋";
	font-size: 24px;
	font-weight: bold;
}
.STYLE2 {
	font-family: "华文行楷";
	font-size: 24px;
	font-weight: bold;
}
.STYLE3 {
	font-size: 14px;
	font-weight: bold;
}
.STYLE5 {
	font-size: 18px;
	font-weight: bold;
}
.STYLE6 {
font-size: 16px;
font-weight: bold;
}
-->
</style>
<script type="text/javascript">
function addClass() {
var flag = false;
var classobj = document.forms[0].elements["Classes"];
var classid = classobj.options[classobj.selectedIndex].value;
var classname = classobj.options[classobj.selectedIndex].innerText;

if (classid != 0) {
if (document.getElementById("choose").rows.length>0) {
   var tbobj = document.getElementById("choose");
   var trobjs = tbobj.rows;
   var rowlen = trobjs.length;
   
   for (var i=0;i<trobjs.length;i++) {
      var cid = trobjs[0].children[0].children[1].value;
      if (classid == cid) {
         alert("当前班级已在你的选择列表中！");
         return;
      }
   }
   if (!flag) {
      var trobj = tbobj.insertRow();
      var tdobj0 = trobj.insertCell();
      var tdobj2 = trobj.insertCell();
      var tdobj1 = trobj.insertCell();
      var inputs = "<div>"+classname+"</div>"+"<input type='hidden' name='chooseClasses"+i+"' value='"+classid+"'>";
      var button = "<input type='button' class='button_02' name='b"+i+"' value='－' onClick=delClass(this)>";
      var button1 = "<input type='button' class='button_02' name='p"+i+"' value='排名' onClick=goRanking("+classid+")>";
      
      if (trobj.previousSibling.className == "td1") trobj.className = "td2"; else trobj.className = "td1";
      trobj.onclick =  "changeTRBgColor(this);";
      tdobj0.align = "left";
      tdobj1.align = "center";
      tdobj2.align = "center";
      tdobj0.className = "text";
      tdobj1.className = "text";
      tdobj2.className = "text";
      tdobj0.width = "50%";
      tdobj1.width = "25%";
      tdobj2.width = "25%";
      tdobj0.insertAdjacentHTML("afterBegin",inputs);
      tdobj1.insertAdjacentHTML("afterBegin",button);
      tdobj2.insertAdjacentHTML("afterBegin",button1);
   }
} else {
   var tbobj = document.getElementById("choose");
   var trobj = tbobj.insertRow();
   var tdobj0 = trobj.insertCell();
   var tdobj2 = trobj.insertCell();
   var tdobj1 = trobj.insertCell();
   var inputs = "<div>"+classname+"</div>"+"<input type='hidden' name='chooseClasses0' value='"+classid+"'>";
   var button = "<input type='button' class='button_02' name='b0' value='－' onClick=delClass(this)>";
   var button1 = "<input type='button' class='button_02' name='p0' value='排名' onClick=goRanking("+classid+")>";
   
   trobj.className = "td1";
   trobj.onclick =  "changeTRBgColor(this);";
   tdobj0.align = "left";
   tdobj1.align = "center";
   tdobj2.align = "center";
   tdobj0.className = "text";
   tdobj1.className = "text";
   tdobj2.className = "text";
   tdobj0.width = "50%";
   tdobj1.width = "25%";
   tdobj2.width = "25%";
   tdobj0.insertAdjacentHTML("afterBegin",inputs);
   tdobj1.insertAdjacentHTML("afterBegin",button);
   tdobj2.insertAdjacentHTML("afterBegin",button1);
} }
else {
   var tbobj = document.getElementById("choose");
   var trobjs = tbobj.rows;
   var rowlen = trobjs.length;
      
   for (var i=0;i<rowlen;i++) {
       tbobj.deleteRow();
   }
}

}

function delClass(obj) {
   obj.parentNode.parentNode.removeNode(true);
   if (document.getElementById("choose").rows.length>0) {
      var tbobj = document.getElementById("choose");
      var trobjs = tbobj.rows;
      var rowlen = trobjs.length;
      
      for (var i=0;i<rowlen;i++) {
         if (i % 2 == 0) trobjs[i].className = "td1"; else trobjs[i].className = "td2";
      }
   }
}

function submitForm() {
   var classes = "";
   var tbobj = document.getElementById("choose");
   var trobjs = tbobj.rows;
   var rowlen = trobjs.length;
   
   if (rowlen>0) {
      for (var i=0;i<rowlen;i++) {
         var cid = trobjs[i].children[0].children[1].value;
         if (i < rowlen-1)
            classes = classes + cid + ",";
         else
            classes = classes + cid;
      }
   }
   if (classes == "") 
      alert("请至少选择一个班级！");
   else {
      document.forms[0].target = "_self";
      document.forms[0].action = "teachWorkManage.prTeachEvaluate.prMainClassRanking.do";
      document.forms[0].elements["QueryClassEvl/Classes"].value = classes;
      document.forms[0].elements["Classes"].options[0].selected = true;
      for (var i=rowlen-1;i>=0;i--) {
         trobjs[i].removeNode();
      }
      if (validater(document.forms[0])) {
         document.forms[0].submit();
      }
   }
}

function exportoword() {
document.forms[0].action = "teachWorkManage.prTeachEvaluate.prClassRankReport.do";
document.forms[0].target = "_blank";
document.forms[0].submit();
}

function dayPopUpCalendarDlg(ctrlobj){
showx = event.screenX - event.offsetX+10; // + deltaX;
showy = event.screenY - event.offsetY+10; // + deltaY;
newWINwidth = 220 + 4 + 18;
retval = window.showModalDialog("ICCard.prFinance.prCalendar.do", "", "dialogWidth:197px; dialogHeight:210px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );

	if( retval!= null ){
	    document.forms[0].elements[ctrlobj].value = formatDate(retval);
	    if (ctrlobj == "begin") {
	        document.forms[0].elements["begin"].style.display = "none";
	        document.forms[0].elements["beginimg"].style.display = "none";
			document.forms[0].elements["begin"].value=formatDate(retval);
			document.getElementById("fromdate").innerText = formatDate(retval);
			document.getElementById("fromdate").style.display = "inline";
		}
	    else {
	        document.forms[0].elements["end"].style.display = "none";
	        document.forms[0].elements["endimg"].style.display = "none";
	        document.forms[0].elements["end"].value=formatDate(retval);
	        document.getElementById("todate").innerText = formatDate(retval);
	        document.getElementById("todate").style.display = "inline";
	    }
	}
}

function formatDate(date) {
   var year = date.substr(0,4);
   var month = date.substr(5,2);
   var day = date.substr(8,2);
   
   if (month.indexOf("0")==0) month = month.substr(1,1);
   if (day.indexOf("0")==0) day = day.substr(1,1);
   
   return year + "年" + month + "月" + day + "日";
}

function hiddenFrom(obj) {
   obj.style.display = "none";
   document.forms[0].elements["begin"].style.display = "inline";
   document.forms[0].elements["beginimg"].style.display = "inline";
}
function hiddenTo(obj) {
   obj.style.display = "none";
   document.forms[0].elements["end"].style.display = "inline";
   document.forms[0].elements["endimg"].style.display = "inline";
}
function hiddenYear(obj) {
   document.getElementById("yeartext").innerText = obj.options[obj.selectedIndex].value;
   document.getElementById("yeartext").style.display = "inline";
   obj.style.display = "none";
}
function hiddenYeartext(obj) {
   obj.style.display = "none";
   document.getElementById("QueryClassEvl/year").style.display = "inline";
}
function hiddenSeason(obj) {
   document.getElementById("seasontext").innerText = obj.options[obj.selectedIndex].value;
   document.getElementById("seasontext").style.display = "inline";
   obj.style.display = "none";
}
function hiddenSeasontext(obj) {
   obj.style.display = "none";
   document.getElementById("QueryClassEvl/season").style.display = "inline";
}

function goRanking(cid) {
if (cid != '') {
   window.location.href="teachWorkManage.prTeachEvaluate.prWeekDetailReport.do?AssignMark/ClassID="+cid+"&week/begin=0"; 
}
}
</script>
</head>

<body>
<form method="post">
<html:hidden property="QueryClassEvl/Classes"/>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;教学质量评估—&gt;主体班排名汇总</td>
          </tr>
      </table></td>
    </tr>
  </table>
<table width="90%" border="0" cellpadding="1" cellspacing="1">
<tr><td>
<html:select property="Classes" onchange="addClass()">
<html:option value="0">&lt;请选择&gt;</html:option>
<html:options property="list[@type='studentclass']/Class/ClassID" labelProperty="list[@type='studentclass']/Class/ClassName"/>
</html:select>&nbsp;<input name="B1" type="button" class="button_02" value="汇 总" onClick="submitForm();">
<input name="B3" type="button" class="button_02" value="导 出" onClick="exportoword();">
<input name="B3" type="button" class="button_02" value="打 印" onClick="exportoword();">
</td></tr>
<tr><td>
<table id="choose" width="56%" border="0" cellpadding="1" cellspacing="1" bgcolor="#A2C4DC">
<%int j=1; %>
<logic:iterate id="countList" property="list[@type='ClassCountList']">
<tr <% if (j%2==1) { out.print("class='td1'"); } else { out.print("class='td2'"); }  %> onclick="changeTRBgColor(this)">
  <td width="50%"><div><bean:write id="countList" property="ClassCountList/ClassName"/></div><input type='hidden' name='chooseClasses<logic:iterateIndex/>' value='<bean:write id="countList" property="ClassCountList/ClassID"/>'></td>
  <td width="25%" align="center"><input type='button' class="button_02" name='p<logic:iterateIndex/>' value='排名' onClick=goRanking(<bean:write id='countList' property='ClassCountList/ClassID'/>)></td>
  <td width="25%" align="center"><input type='button' class="button_02" name='b<logic:iterateIndex/>' value='－' onClick=delClass(this)></td>
</tr>
<%j++; %>
</logic:iterate>
</table>
</td></tr>
</table>

<table width="90%" border="0" align="center" cellpadding="1" cellspacing="1"  id="listdetail">
<tr><td>
<table width="90%" border="0" align="center" cellpadding="1" cellspacing="1">
  <tr>
    <td height="50" align="center" class="STYLE1" id="printTable">
      <select name="QueryClassEvl/year" style="display:none;" onchange="hiddenYear(this);">
      <%
        int year = now.get(Calendar.YEAR);
        if (base.util.TalentContext.getValue(pageContext,null,"QueryClassEvl/year") != null)
             year = Integer.parseInt(base.util.TalentContext.getValue(pageContext,null,"QueryClassEvl/year"));
        for (int i=1980;i<=year;i++) {
      %>
      <OPTION value="<%=i%>" <%if (i==year) {out.print("selected");} %>><%=i%></OPTION>
      <% } %>
      </select><span id="yeartext" ondblclick="hiddenYeartext(this);" class="STYLE1">2007</span>年<select name="QueryClassEvl/season" style="display:none;" onchange="hiddenSeason(this);">
     <%
        String season = "春";
       if (base.util.TalentContext.getValue(pageContext,null,"QueryClassEvl/season") != null) 
            season = base.util.TalentContext.getValue(pageContext,null,"QueryClassEvl/season");
      %>
     <OPTION value="春" <%if (season.equals("春")) {out.print("selected");}%>>春</OPTION>
     <OPTION value="夏" <%if (season.equals("夏")) {out.print("selected");}%>>夏</OPTION>
     <OPTION value="秋" <%if (season.equals("秋")) {out.print("selected");}%>>秋</OPTION>
     <OPTION value="冬" <%if (season.equals("冬")) {out.print("selected");}%>>冬</OPTION>
     </select><span id="seasontext" ondblclick="hiddenSeasontext(this);">春</span>季主体班课堂教学质量评估
    </td>
  </tr>
  <tr><td height="30" align="center" class="STYLE2">排 名 一 览</td></tr>
  <tr><td height="30" align="center" class="STYLE3">（<span id="fromdate" ondblclick="hiddenFrom(this);">2007年01月01日</span>
	<input type="text" name="begin" value="2007年01月01日" readonly="readonly" class="input" size="13" style="display:none;"/>
	<img name="beginimg" src="/internet/image/date.gif" width="13" height="20" style="display:none;" align="absmiddle" onClick=dayPopUpCalendarDlg("begin")>至<input type="text" name="end" value="2007年01月01日" readonly="readonly" class="input" size="13" style="display:none;"/>
	<img name="endimg" src="/internet/image/date.gif" width="13" height="20" align="absmiddle" style="display:none;" onClick=dayPopUpCalendarDlg("end")>
    <span id="todate" ondblclick="hiddenTo(this);">2007年01月01日</span>）
  </td></tr>
  <tr><td height="30" align="center" class="STYLE5">教 务 处<br><br><br><br></td></tr>
</table>
<table width="90%" border="0" align="center" cellpadding="1" cellspacing="1">
  <tr>
    <td width="15%" align="left" class="STYLE6" valign="top">学员人数：</td>
    <td width="90%" class="STYLE6" align="left" valign="top">
    <logic:iterate id="countList" property="list[@type='ClassCountList']">
	<p><bean:write id="countList" property="ClassCountList/ClassName"/>&nbsp;<bean:write id="countList" property="ClassCountList/amount"/>&nbsp;人。</p>
	</logic:iterate>
	</td>
  </tr>
  <tr><td colspan="2" height="20"></td></tr>
  <tr>
    <td width="20%" align="left" class="STYLE6" valign="top">评估结果展示：</td>
    <td width="90%" class="STYLE6" align="left" valign="top">
    <logic:iterate id="satRankList" property="list[@type='EvlSatList']">
	<p><bean:write id="satRankList" property="EvlSatList/ClassShortName"/>学员评教满意率为&nbsp;<bean:write id="satRankList" property="EvlSatList/rank"/>&nbsp;%。</p>
	</logic:iterate>
	</td>
  </tr>
  <tr><td colspan="2" height="20"></td></tr>
  <tr align="center"><td align="left" colspan="2" class="STYLE6">（注：每课题所得平均分在<html:text property="QueryClassEvl/satisfyScore" size="2" style="text-align:center" styleClass="input" attributesText='ValidateType="notempty,int" Msg="平均分不能为空;平均分必须是整型"'/>上的，纳入满意率。）</td></tr>
</table>
</td></tr></table>
</form>
</body>