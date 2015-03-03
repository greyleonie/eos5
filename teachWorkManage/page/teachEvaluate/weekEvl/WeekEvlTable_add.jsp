<%@include file="/internet/common.jsp"%>
<%
String oldversion = base.util.TalentContext.getValue(pageContext,null,"Evaluation/Version");
%>
<STYLE type="text/css">
	.style2 {
		FONT-FAMILY: "宋体";
		FONT-SIZE: 13px;
	}
	
	.STYLE3 {
		FONT-WEIGHT: bold;
		FONT-SIZE: 24px;
		FONT-FAMILY: "新宋体"
	}
	
	.STYLE4 {
		FONT-WEIGHT: bold;
		FONT-SIZE: x-large;
		FONT-FAMILY: "新宋体"
	}
	
	.STYLE5 {
		FONT-WEIGHT: bold;
		FONT-SIZE: 16px;
		FONT-FAMILY: "新宋体"
	}
	
	.STYLE6 {
		FONT-WEIGHT: bold;
		FONT-SIZE: 14px;
		FONT-FAMILY: "新宋体"
	}
	
	.STYLE9 {
		FONT-SIZE: 14px
	}
	
	.noinput {
		BORDER-RIGHT: #a3a3a3 1px solid;
		BORDER-TOP: #636562 1px solid;
		DISPLAY: none;
		FONT-SIZE: 12px;
		BORDER-LEFT: #636562 1px solid;
		WIDTH: 600px;
		COLOR: #000000;
		BORDER-BOTTOM: #a3a3a3 1px solid;
		HEIGHT: 25px
	}
	
	.showinput {
		BORDER-RIGHT: #a3a3a3 1px solid;
		BORDER-TOP: #636562 1px solid;
		DISPLAY: block;
		FONT-SIZE: 12px;
		BORDER-LEFT: #636562 1px solid;
		WIDTH: 600px;
		COLOR: #000000;
		BORDER-BOTTOM: #a3a3a3 1px solid;
		HEIGHT: 25px
	}
	
	.showversion {
		FONT-SIZE: 12px;
		WIDTH: 50px;
		COLOR: #000000;
	}
	
	.noversion {
	    DISPLAY: none;
		FONT-SIZE: 12px;
		WIDTH: 50px;
		COLOR: #000000;
	}
	</STYLE>
<SCRIPT language="javascript" type="text/javascript">

	function modify_item(objname) {
		var path = "teachWorkManage.prTeachEvaluate.prWeekItemFix.do?objname=" + objname;
		modifywindow = window.open(path,"modify_window","width=250,height=230");
	}

	function del_item(objname) {
	    var now = new Date();
		var itemLen = getItemLen(objname);
		var no = parseInt(objname.substr(objname.length-1,1));
		var nextno = no + 1;
		var nextObj = objname.substring(0, objname.length-1) + nextno + "_td";
		
		//提交删除项目
		var path = "teachWorkManage.prTeachEvaluate.prEvlItemDel.do?nowtime="+now.toUTCString();
		path = path + "&EvaluateItems/ItemID="+document.all[objname+"_itemId"].value;
		if (confirm("确认删除当前项目吗？")) {
		document.getElementById("modifyframe").src = path;
		
		eval(objname + "_td").removeNode(true);
		eval(objname + "_lev_td").removeNode(true);
		eval("row1_"+objname+"_checkboxes").removeNode(true);
		eval("row2_"+objname+"_checkboxes").removeNode(true);
		
		if (document.getElementById(nextObj) != null) {
			for (var i=parseInt(nextno);i<=itemLen;i++) {
				//转换评估项目
				//alert(objname.substring(0, objname.length-1) + i + "_td");
				preno = i - 1;
				document.getElementById(objname.substring(0, objname.length-1) + i + "_td").id = objname.substring(0, objname.length-1) + preno + "_td";
				document.getElementById(objname.substring(0, objname.length-1) + i + "_input").id = objname.substring(0, objname.length-1) + preno + "_input";
				document.getElementById(objname.substring(0, objname.length-1) + i + "_desc").id = objname.substring(0, objname.length-1) + preno + "_desc";
				document.getElementById(objname.substring(0, objname.length-1) + i + "_score").id = objname.substring(0, objname.length-1) + preno + "_score";
				document.getElementById(objname.substring(0, objname.length-1) + i + "_courseid").id = objname.substring(0, objname.length-1) + preno + "_courseid";
				//alert(parseInt(document.getElementById(objname.substring(0, objname.length-1) + i + "_no").value) - 1);
				document.getElementById(objname.substring(0, objname.length-1) + i + "_no").value = parseInt(document.getElementById(objname.substring(0, objname.length-1) + i + "_no").value) - 1;
				document.getElementById(objname.substring(0, objname.length-1) + i + "_no").id = objname.substring(0, objname.length-1) + preno + "_no";
				document.getElementById(objname.substring(0, objname.length-1) + i + "_text").id = objname.substring(0, objname.length-1) + preno + "_text";
				document.getElementById(objname.substring(0, objname.length-1) + i + "_descText").id = objname.substring(0, objname.length-1) + preno + "_descText";
				document.getElementById(objname.substring(0, objname.length-1) + i + "_scoreText").id = objname.substring(0, objname.length-1) + preno + "_scoreText";
				document.getElementById(objname.substring(0, objname.length-1) + i + "_item_link").id = objname.substring(0, objname.length-1) + preno + "_item_link";
				document.getElementById(objname.substring(0, objname.length-1) + i + "_add_td").id = objname.substring(0, objname.length-1) + preno + "_add_td";
				document.getElementById(objname.substring(0, objname.length-1) + i + "_add_link").href = "javascript:add_lev('" + objname.substring(0, objname.length-1) + preno + "');";
				document.getElementById(objname.substring(0, objname.length-1) + i + "_add_link").id = objname.substring(0, objname.length-1) + preno + "_add_link";
				document.getElementById(objname.substring(0, objname.length-1) + i + "_modify_td").id = objname.substring(0, objname.length-1) + preno + "_modify_td";
				document.getElementById(objname.substring(0, objname.length-1) + i + "_modify_link").href = "javascript:modify_item('" + objname.substring(0, objname.length-1) + preno + "');";
				document.getElementById(objname.substring(0, objname.length-1) + i + "_modify_link").id = objname.substring(0, objname.length-1) + preno + "_modify_link";
				if (document.getElementById(objname.substring(0, objname.length-1) + i + "_del_td") != null) {
					document.getElementById(objname.substring(0, objname.length-1) + i + "_del_link").href = "javascript:del_item('" + objname.substring(0, objname.length-1) + preno + "');";
					document.getElementById(objname.substring(0, objname.length-1) + i + "_del_td").id = objname.substring(0, objname.length-1) + preno + "_del_td";
					document.getElementById(objname.substring(0, objname.length-1) + i + "_del_link").id = objname.substring(0, objname.length-1) + preno + "_del_link";
				}
				document.getElementById(objname.substring(0, objname.length-1) + i + "_lev_td").id = objname.substring(0, objname.length-1) + preno + "_lev_td";
				document.getElementById("row1_"+ objname.substring(0, objname.length-1) + i +"_checkboxes").id = "row1_"+ objname.substring(0, objname.length-1) + preno +"_checkboxes";
				document.getElementById("row2_"+ objname.substring(0, objname.length-1) + i +"_checkboxes").id = "row2_"+ objname.substring(0, objname.length-1) + preno +"_checkboxes";
				//转换评估等级
				var levlen = getLevLen(objname);
				for (var j=1;j<=levlen;j++) {
					document.getElementById(objname.substring(0, objname.length-1) + i + "_lev" + j + "_td").id = objname.substring(0, objname.length-1) + preno + "_lev" + j + "_td";
					document.getElementById(objname.substring(0, objname.length-1) + i + "_lev" + j + "_text").id = objname.substring(0, objname.length-1) + preno + "_lev" + j + "_text";
					document.getElementById(objname.substring(0, objname.length-1) + i + "_lev" + j + "_scoreText").id = objname.substring(0, objname.length-1) + preno + "_lev" + j + "_scoreText";
					document.getElementById(objname.substring(0, objname.length-1) + i + "_lev" + j + "_input").id = objname.substring(0, objname.length-1) + preno + "_lev" + j + "_input";
					document.getElementById(objname.substring(0, objname.length-1) + i + "_lev" + j + "_score").id = objname.substring(0, objname.length-1) + preno + "_lev" + j + "_score";
					document.getElementById(objname.substring(0, objname.length-1) + i + "_lev" + j + "_no").id = objname.substring(0, objname.length-1) + preno + "_lev" + j + "_no";
					document.getElementById(objname.substring(0, objname.length-1) + i + "_lev" + j + "_link").id = objname.substring(0, objname.length-1) + preno + "_lev" + j + "_link";
					document.getElementById(objname.substring(0, objname.length-1) + i + "_lev" + j + "_modify").id = objname.substring(0, objname.length-1) + preno + "_lev" + j + "_modify";
					document.getElementById(objname.substring(0, objname.length-1) + i + "_lev" + j + "_modifylink").href = "javascript:modify_lev('" + objname.substring(0, objname.length-1) + preno + "_lev" + j +"')"
					document.getElementById(objname.substring(0, objname.length-1) + i + "_lev" + j + "_modifylink").id = objname.substring(0, objname.length-1) + preno + "_lev" + j + "_modifylink";
					if (document.getElementById(objname.substring(0, objname.length-1) + i + "_lev" + j + "_dellink") != null) {
						document.getElementById(objname.substring(0, objname.length-1) + i + "_lev" + j + "_dellink").href = "javascript:del_lev('" + objname.substring(0, objname.length-1) + preno + "_lev" + j +"')"
						document.getElementById(objname.substring(0, objname.length-1) + i + "_lev" + j + "_dellink").id = objname.substring(0, objname.length-1) + preno + "_lev" + j + "_dellink";
					}
				}
			}
		}
		}
	}

	function add_item(objname) {
		var path = "teachWorkManage.prTeachEvaluate.prWeekItemAdd.do?objname=" + objname;
		addwindow = window.open(path,"add_window","width=250,height=160");
	}

	function add_lev(objname) {
		var path = "teachWorkManage.prTeachEvaluate.prWeekLevAdd.do?objname=" + objname;
		addwindow = window.open(path,"add_window","width=200,height=120");
	}

	function modify_lev(objname) {
		var path = "teachWorkManage.prTeachEvaluate.prWeekLevFix.do?objname=" + objname;
		addwindow = window.open(path,"add_window","width=200,height=200");
	}

	function del_lev(objname) {
	    var now = new Date();
		var no = objname.substr(objname.length-1,1);
		var itemname = objname.substring(0, objname.indexOf("_"));
		
		//提交删除等级
		var path = "teachWorkManage.prTeachEvaluate.prEvlLevDel.do?nowtime="+now.toUTCString();
		path = path + "&EvaluateItemScore/LevelID="+document.all[objname+"_levId"].value;
		
		if (confirm("确认删除当前等级吗？")) {
		document.getElementById("modifyframe").src = path;
		
		eval(objname + "_td").removeNode(true);
		eval("row1_"+itemname+"_tb").rows[0].deleteCell(no-1);
		eval("row2_"+itemname+"_tb").rows[0].deleteCell(no-1);
		}
	}

	function getItemLen(objname) {
		var len=1;
		var itemname=objname.substring(0, objname.length-1)+"1_td";
		while (window.document.getElementById(itemname)!=null) {
			len = len+1;
			itemname=objname.substring(0, objname.length-1) + len + "_td";
		}
		len = len-1;
		return parseInt(len);
	}

	function getLevLen(objname) {
		var len=1;
		var levname=objname+"_lev1_td";
		while (document.getElementById(levname)!=null) {
			len = len+1;
			levname=objname+"_lev"+len+"_td";
		}
		len = len-1;
		return parseInt(len);
	}

	function fixTitle() {
		document.getElementById("titleText").style.display = "none";
		document.getElementById("Evaluation/Title").className = "showinput";
		document.getElementById("oldvalue").value = document.getElementById("Evaluation/Title").value;
	}

	function saveTitle() {
	  var path = "teachWorkManage.prTeachEvaluate.prWeekEvlFixDo.do?";
	  var evlId = document.all["Evaluation/EvaluationID"].value;
	  var ov = document.getElementById("oldvalue").value;
	  var nv = document.getElementById("Evaluation/Title").value;
	  
	  if (document.getElementById("Evaluation/Title").value != "") {
		document.getElementById("titleText").innerHTML = document.getElementById("Evaluation/Title").value;
		document.getElementById("titleText").style.display = "inline-block";
		document.getElementById("Evaluation/Title").className = "noinput";
		
		if (nv != ov) {
		   path = path + "Evaluation/EvaluationID=" + evlId + "&Evaluation/Title=" + document.getElementById("Evaluation/Title").value;
		   document.getElementById("modifyframe").src = path;
		}
	  } else {
	    alert("评估表类型名称不能为空！");
	  }
	}

	function fixRemarks() {
		document.getElementById("remarksText").style.display = "none";
		document.getElementById("Evaluation/Remarks").className = "showinput";
		document.getElementById("oldvalue").value = document.getElementById("Evaluation/Remarks").value;
	}

	function saveRemarks() {
	    var path = "teachWorkManage.prTeachEvaluate.prWeekEvlFixDo.do?";
	    var evlId = document.all["Evaluation/EvaluationID"].value;
	    var ov = document.getElementById("oldvalue").value;
	    var nv = document.getElementById("Evaluation/Remarks").value;
	    
		document.getElementById("remarksText").innerHTML = nv;
		document.getElementById("remarksText").style.display = "inline-block";
		document.getElementById("Evaluation/Remarks").className = "noinput";
		
		if (nv != ov) {
		   path = path + "Evaluation/EvaluationID=" + evlId + "&Evaluation/Remarks=" + document.getElementById("Evaluation/Remarks").value;
		   document.getElementById("modifyframe").src = path;
		}
	}

	function saveSuggest() {
		var selObj = document.getElementById("suggest");
	    var path = "teachWorkManage.prTeachEvaluate.prWeekEvlFixDo.do?";
	    var evlId = document.all["Evaluation/EvaluationID"].value;
	    
		if (selObj.options[selObj.selectedIndex].value=='否') {
		    document.getElementsByName("Evaluation/IsNeedAdvice")[0].value = "0";
			document.getElementById("tutorship_suggest").style.display = "none";
			document.getElementById("row1_tutorship_suggest").style.display = "none";
			document.getElementById("row2_tutorship_suggest").style.display = "none";
			document.getElementById("active_suggest").style.display = "none";
			document.getElementById("row1_active_suggest").style.display = "none";
			document.getElementById("row2_active_suggest").style.display = "none";
			
			path = path + "Evaluation/EvaluationID=" + evlId + "&Evaluation/IsNeedAdvice=0";
		    document.getElementById("modifyframe").src = path;
		} else{
		    document.getElementsByName("Evaluation/IsNeedAdvice")[0].value = "1";
			document.getElementById("tutorship_suggest").style.display = "block";
			document.getElementById("row1_tutorship_suggest").style.display = "block";
			document.getElementById("row2_tutorship_suggest").style.display = "block";
			document.getElementById("active_suggest").style.display = "block";
			document.getElementById("row1_active_suggest").style.display = "block";
			document.getElementById("row2_active_suggest").style.display = "block";
			
			path = path + "Evaluation/EvaluationID=" + evlId + "&Evaluation/IsNeedAdvice=1";
		    document.getElementById("modifyframe").src = path;
		}
		
	}
	
	function dispSuggest() {
	   var itemLen = 0;
	   var suggest = "allCourse_item0_suggest";
	   var selObj = document.getElementById("suggest");
	   var isuggest = <bean:write property="Evaluation/IsNeedAdvice"/>;
	   
	   if (isuggest == 0) {
	        selObj.options[1].selected = true;
		    
			document.getElementById("tutorship_suggest").style.display = "none";
			document.getElementById("row1_tutorship_suggest").style.display = "none";
			document.getElementById("row2_tutorship_suggest").style.display = "none";
			document.getElementById("active_suggest").style.display = "none";
			document.getElementById("row1_active_suggest").style.display = "none";
			document.getElementById("row2_active_suggest").style.display = "none";
		} else{
		    selObj.options[0].selected = true;
		    
		    document.getElementById("tutorship_suggest").style.display = "block";
			document.getElementById("row1_tutorship_suggest").style.display = "block";
			document.getElementById("row2_tutorship_suggest").style.display = "block";
			document.getElementById("active_suggest").style.display = "block";
			document.getElementById("row1_active_suggest").style.display = "block";
			document.getElementById("row2_active_suggest").style.display = "block";
		}
	} 
	
	function fixVersion() {
		document.getElementById("version").style.display = "none";
		document.getElementById("Evaluation/Version").className = "showversion";
		document.getElementById("oldvalue").value = document.getElementById("Evaluation/Version").value;
	}
	
	function saveVersion() {
	    var path = "teachWorkManage.prTeachEvaluate.prWeekEvlFixDo.do?";
	    var evlId = document.all["Evaluation/EvaluationID"].value;
	    var ov = document.getElementById("oldvalue").value;
	    var nv = document.getElementById("Evaluation/Version").value;
	    
	    document.getElementById("version").innerHTML = "版本 ：" + document.getElementById("Evaluation/Version").value;
		document.getElementById("version").style.display = "inline-block";
		document.getElementById("Evaluation/Version").className = "noversion";
		
		if (nv != ov) {
		   path = path + "Evaluation/EvaluationID=" + evlId + "&Evaluation/Version=" + document.getElementById("Evaluation/Version").value;
		   document.getElementById("modifyframe").src = path;
		}
	}
	
	function formatLevText(objname,levname) {
	   var tmpText = "";
	   for (var i=0;i<levname.length;i++) {
         tmpText += levname.substr(i, 1) + "<br>";
       }
       document.getElementById(objname).innerHTML = tmpText;
	}
	
	function formatItemText(objname,itemName) {
	   var name_tmp = "";
	   if (itemName.length <= 6) {
          for (var i=0;i < itemName.length;i++) {
             name_tmp = name_tmp + itemName.substr(i,1) + " ";
          }
          document.getElementById(objname).innerHTML = name_tmp + "<br>";
          return;
       }
       if (itemName.length > 8) {
          document.getElementById(objname).innerHTML = itemName.substring(0,Math.floor(itemName.length/2)) + "<br>" + itemName.substring(Math.floor(itemName.length/2),itemName.length) + "<br>";
          return;
       }
       document.getElementById(objname).innerHTML = itemName + "<br>";
	}
</SCRIPT>
<body>
<FORM id="addWeekEvlForm" method="post" action="">
<html:hidden property="Evaluation/EvaluationID" />
<html:hidden property="Evaluation/Period" />
<html:hidden property="Evaluation/IsNeedAdvice" />
<html:hidden property="oldVersion" value="<%=oldversion%>"/>
<html:hidden property="status"/>
<input type="hidden" id="oldvalue" value=""> 
<IFRAME id="modifyframe" src="" style="display: none;"></IFRAME>
	<TABLE width="100%" cellPadding="0" border="0" cellSpacing="0">
		<TBODY>
			<TR>
				<TD height="24" background="/internet/image/lz_bg.gif">
					<TABLE width="100%" cellPadding="0" border="0" cellSpacing="0">
						<TBODY>
							<TR>
								<TD width="15"></TD>
								<TD class="text_wirte">首页—&gt;教务管理—&gt;教学质量评估—&gt;维护主体班每周评估表</TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
			</TR>
		</TBODY>
	</TABLE>
	<TABLE width="1000" cellPadding="0" align="center" border="0" cellSpacing="0">
		<TBODY>
			<TR>
				<TD align="center" height="20" valign="middle"><p class="STYLE3">中共广州市委党校&nbsp;&nbsp;广州行政学院</p>
<html:text onblur="saveTitle();" property="Evaluation/Title" attributesText='class="noinput" Msg="评估表类型名称不能为空"'/>
<SPAN class="STYLE4" id="titleText" ondblclick="fixTitle();"><bean:write property="Evaluation/Title"/></SPAN><BR>
第**期******班（第*周：**月**日至**月**日）<BR>
<html:text onblur="saveRemarks();" property="Evaluation/Remarks" attributesText='class="noinput"'/>
<div id="remarksText" ondblclick="fixRemarks();" align="left">&nbsp;&nbsp;&nbsp;&nbsp;<bean:write property="Evaluation/Remarks"/></div>
<div id="version" width="100%" align="right">版本:<bean:write property="Evaluation/Version"/></div>
<div align="right"><html:text onblur="saveVersion();" property="Evaluation/Version" attributesText='class="noversion"'/></div>
</TD>
			</TR>
			<TR>
				<TD valign="top" class="text">
					<TABLE width="100%" cellPadding="1" height="100%" border="0" cellSpacing="1" id="weekEvl" bgColor="#000000">
						<TBODY>
							<TR>
								<TD class="STYLE6" align="center" width="120" valign="middle" bgColor="#ffffff">
									<DIV align="center">教师及课题<BR>
										（辅导课）</DIV>
									<BR>
									<INPUT value="新增项目" type="button" onclick="add_item('tutorship');" id="tutorship_additem"> <BR>
									<BR>
									<SELECT id="suggest" onchange="saveSuggest();">
										<OPTION value="是" selected>保留意见栏</OPTION>
										<OPTION value="否">去除意见栏</OPTION>
									</SELECT></TD>
								<TD width="880" valign="top" align="center" bgColor="#ffffff">
									<TABLE width="100%" cellPadding="0" height="100%" border="0" cellSpacing="0" id="tutorship" bgColor="#000000">
										<TBODY>
											<TR class="STYLE6">
											  <% 
											    int fdkLen = 0;
											    int fwidth = 0;
											    int fdkItemLen = Integer.parseInt(base.util.TalentContext.getValue(pageContext,null,"ItemsLen/fdklen"));
											  %>
											  <logic:iterate id="fdkItem" property="list[@type='fdkItems']">
											  <% fdkLen++; 
											     fwidth = 880/fdkItemLen;%>
												<TD width="<%=fwidth%>" align="center" id="tutorship<%=fdkLen%>_td" bgColor="#ffffff">
												<INPUT value="<bean:write id="fdkItem" property="fdkItems/ItemID"/>" type="hidden" id="tutorship<%=fdkLen%>_itemId">
												<INPUT value="<bean:write id="fdkItem" property="fdkItems/Name"/>" type="hidden" id="tutorship<%=fdkLen%>_input">
												<INPUT value="<bean:write id="fdkItem" property="fdkItems/Explain"/>" type="hidden" id="tutorship<%=fdkLen%>_desc">
												<INPUT value="<bean:write id="fdkItem" property="fdkItems/Score"/>" type="hidden" id="tutorship<%=fdkLen%>_score">
												<INPUT value="<bean:write id="fdkItem" property="fdkItems/CourseType"/>" type="hidden" id="tutorship<%=fdkLen%>_courseid">
												<INPUT value="<bean:write id="fdkItem" property="fdkItems/OrderNO"/>" type="hidden" id="tutorship<%=fdkLen%>_no">
												<TABLE height="100%" width="100%" cellPadding="0" align="center" border="0" cellSpacing="1" bgColor="#000000">
											    <tr><td width="100%" height="25%" align="center" bgColor="#ffffff">
											    <SPAN id="tutorship<%=fdkLen%>_text">
												<script>formatItemText("tutorship<%=fdkLen%>_text","<bean:write id="fdkItem" property="fdkItems/Name"/>");</script>
												</SPAN>
											    </td></tr>
											    <tr><td width="100%" height="50%" align="center" bgColor="#ffffff" class="style2">
											    <SPAN class="STYLE9" id="tutorship<%=fdkLen%>_descText">
												<logic:notEqual id="fdkItem" property="fdkItems/Explain" value="">
												<bean:write id="fdkItem" property="fdkItems/Explain"/><BR>
												</logic:notEqual></SPAN>
												<SPAN id="tutorship<%=fdkLen%>_scoreText">(<bean:write id="fdkItem" property="fdkItems/Score"/>)<BR></SPAN>
											    </td></tr>
											    <tr><td width="100%" height="25%" align="center" bgColor="#ffffff">
												<TABLE width="100%" cellPadding="0" align="center" border="0" cellSpacing="0">
												<TBODY>
													<TR id="tutorship<%=fdkLen%>_item_link">
														<TD align="center" id="tutorship<%=fdkLen%>_add_td">
														<A id="tutorship<%=fdkLen%>_add_link" href="javascript:add_lev('tutorship<%=fdkLen%>');">新增等级</A></TD>
														<TD align="center" id="tutorship<%=fdkLen%>_modify_td">
														<A id="tutorship<%=fdkLen%>_modify_link" href="javascript:modify_item('tutorship<%=fdkLen%>');">修改</A></TD>
														<%if (fdkLen > 2) { %>
														<TD align="center" id="tutorship<%=fdkLen%>_del_td">
														<A id="tutorship<%=fdkLen%>_del_link" href="javascript:del_item('tutorship<%=fdkLen%>');">删除</A></TD>
														<% } %>
													</TR>
												</TBODY>
												</TABLE>
											    </td></tr>
											    </table>
												</TD>
												</logic:iterate>
												<TD width="200" align="center" rowspan="2" id="tutorship_suggest" bgColor="#ffffff">具体意见和建议</TD>
											</TR>
											<TR class="STYLE9">
											  <% fdkLen = 0; %>
											  <logic:iterate id="fdkItem" property="list[@type='fdkItems']">
											  <% 
											   int itemId = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"fdkItem","fdkItems/ItemID")); 
											   int fdkLevLen = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"fdkItem","fdkItems/levlen"));
											    fdkLen++;
											  %>
												<TD width="<%=fwidth%>" valign="top" align="center" id="tutorship<%=fdkLen%>_lev_td" bgColor="#ffffff">
													<TABLE width="100%" cellPadding="0" height="100%" border="0" cellSpacing="1" bgColor="#000000">
														<TBODY>
															<TR class="STYLE9" height="100%">
															<%
															  for (int i=1;i<=fdkLevLen;i++) {
															%>
															<logic:iterate id="fdklev" property="list[@type='fdkLevs']">
															   <%
															     int levItemId = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"fdklev","fdkLevs/ItemID"));
															     int levOrder =  Integer.parseInt(base.util.TalentContext.getValue(pageContext,"fdklev","fdkLevs/OrderNO"));
															     int fpwidth = fwidth/fdkLevLen;
															     if (levItemId==itemId && levOrder==i) {
															   %>
																<TD width="<%=fpwidth%>" valign="top" align="center" id="tutorship<%=fdkLen%>_lev<%=i%>_td" bgColor="#ffffff">
																<SPAN id="tutorship<%=fdkLen%>_lev<%=i%>_text">
																<script>formatLevText("tutorship<%=fdkLen%>_lev<%=i%>_text","<bean:write id="fdklev" property="fdkLevs/LevelName"/>");</script>
																</SPAN>
																<SPAN id="tutorship<%=fdkLen%>_lev<%=i%>_scoreText">(<bean:write id="fdklev" property="fdkLevs/Score"/>)</SPAN>
																<INPUT value="<bean:write id="fdklev" property="fdkLevs/LevelID"/>" type="hidden" id="tutorship<%=fdkLen%>_lev<%=i%>_levId">
																<INPUT value="<bean:write id="fdklev" property="fdkLevs/ItemID"/>" type="hidden" id="tutorship<%=fdkLen%>_lev<%=i%>_itemId">
																<INPUT value="<bean:write id="fdklev" property="fdkLevs/LevelName"/>" type="hidden" id="tutorship<%=fdkLen%>_lev<%=i%>_input"> 
																<INPUT value="<bean:write id="fdklev" property="fdkLevs/Score"/>" type="hidden" id="tutorship<%=fdkLen%>_lev<%=i%>_score"> 
																<INPUT value="<bean:write id="fdklev" property="fdkLevs/OrderNO"/>" type="hidden" id="tutorship<%=fdkLen%>_lev<%=i%>_no">
																<TABLE width="100%" cellPadding="0" align="center" border="0" cellSpacing="0">
																	<TBODY>
																	   <TR id="tutorship<%=fdkLen%>_lev<%=i%>_link">
																		  <TD align="center" id="tutorship<%=fdkLen%>_lev<%=i%>_modify">
																		  <a id="tutorship<%=fdkLen%>_lev<%=i%>_modifylink" href="javascript:modify_lev('tutorship<%=fdkLen%>_lev<%=i%>')">修<BR>改</a>
																		  </TD>
																		  <% if (i>2) { %>
																		  <TD align="center" id="tutorship<%=fdkLen%>_lev<%=i%>_del">
																		  <A id="tutorship<%=fdkLen%>_lev<%=i%>_dellink" href="javascript:del_lev('tutorship<%=fdkLen%>_lev<%=i%>')">删<BR>除</A></TD>
																		  <% } %>
																	   </TR>
																	</TBODY>
																</TABLE>
																</TD>
																<% } %>
															</logic:iterate>
															<% } %>
															</TR>
														</TBODY>
													</TABLE>
												</TD>
												</logic:iterate>
											</TR>
										</TBODY>
									</TABLE>
								</TD>
							</TR>
							<TR class="STYLE6">
								<TD width="120" bgColor="#ffffff">2008-6-2<BR>某老师<BR>
									（教研部）：<BR>
									经济开放的模式转换与格局调整</TD>
								<TD width="880" valign="top" align="center" bgColor="#ffffff">
									<TABLE width="100%" height="100%" border="0" bgColor="#000000">
										<TBODY>
											<TR>
											  <% fdkLen = 0; %>
											  <logic:iterate id="fdkItem" property="list[@type='fdkItems']">
											  <% fdkLen++; %>
												<TD width="<%=fwidth%>" id="row1_tutorship<%=fdkLen%>_checkboxes" align="center" bgColor="#ffffff">
													<TABLE width="100%" border="0" id="row1_tutorship<%=fdkLen%>_tb">
														<TBODY>
															<TR>
											  <%
											   int fdkLevLen = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"fdkItem","fdkItems/levlen"));	
											   for (int i=1;i<=fdkLevLen;i++) {
											       int fpwidth = fwidth/fdkLevLen;
											  %>
																<TD width="<%=fpwidth%>" align="center"><INPUT value="checkbox" type="checkbox" name="checkbox"></TD>
											  <% } %>
															</TR>
														</TBODY>
													</TABLE>
												</TD>
											   </logic:iterate>
												<TD width="200" id="row1_tutorship_suggest" bgColor="#ffffff">&nbsp;</TD>
											</TR>
										</TBODY>
									</TABLE>
								</TD>
							</TR>
							<TR>
								<TD width="120" align="center" bgColor="#ffffff">.<BR>
									.<BR>
									.<BR>
									.<BR>
									.<BR>
									.<BR>
									.</TD>
								<TD width="880" valign="middle" align="center" bgColor="#ffffff">
									<TABLE width="100%" height="100%" border="0" bgColor="#000000">
										<TBODY>
											<TR>
											  <% fdkLen = 0; %>
											  <logic:iterate id="fdkItem" property="list[@type='fdkItems']">
											  <% fdkLen++; %>
												<TD width="<%=fwidth%>" align="center" id="row2_tutorship<%=fdkLen%>_checkboxes" bgColor="#ffffff">
													<TABLE width="100%" border="0" id="row2_tutorship<%=fdkLen%>_tb">
														<TBODY>
															<TR>
											  <%
											   int fdkLevLen = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"fdkItem","fdkItems/levlen"));
											   for (int i=1;i<=fdkLevLen;i++) {
											       int fpwidth = fwidth/fdkLevLen;
											  %>
																<TD width="<%=fpwidth%>" align="center" valign="middle"><INPUT value="checkbox" type="checkbox" name="checkbox"></TD>
											  <% } %>
															</TR>
														</TBODY>
													</TABLE>
												</TD>
											   </logic:iterate>
												<TD width="200" id="row2_tutorship_suggest" bgColor="#ffffff"></TD>
											</TR>
										</TBODY>
									</TABLE>
								</TD>
							</TR>
							<TR>
								<TD class="STYLE6" align="center" width="120" valign="middle" bgColor="#ffffff">教师及课题<BR>
									（互动式教学）<BR>
									<INPUT value="新增项目" type="button" onclick="add_item('active');" id="active_additem"></TD>
								<TD width="880" valign="top" align="center" bgColor="#ffffff">
									<TABLE width="100%" cellPadding="0" height="100%" border="0" cellSpacing="1" id="active" bgColor="#000000">
										<TBODY>
											<TR class="STYLE6">
											  <% 
											   int hdkLen = 0;
											   int hwidth = 0;
											   int hdkItemLen = Integer.parseInt(base.util.TalentContext.getValue(pageContext,null,"ItemsLen/hdklen"));
											  %>
											  <logic:iterate id="hdkItem" property="list[@type='hdkItems']">
											  <% hdkLen++;
											     hwidth = 880/hdkItemLen;%>
												<TD width="<%=hwidth%>" align="center" id="active<%=hdkLen%>_td" bgColor="#ffffff">
												<INPUT value="<bean:write id="hdkItem" property="hdkItems/ItemID"/>" type="hidden" id="active<%=hdkLen%>_itemId">
												<INPUT value="<bean:write id="hdkItem" property="hdkItems/Name"/>" type="hidden" id="active<%=hdkLen%>_input"> 
												<INPUT type="hidden" id="active<%=hdkLen%>_desc" value="<bean:write id="hdkItem" property="hdkItems/Explain"/>"> 
												<INPUT value="<bean:write id="hdkItem" property="hdkItems/Score"/>" type="hidden" id="active<%=hdkLen%>_score"> 
												<INPUT value="<bean:write id="hdkItem" property="hdkItems/CourseType"/>" type="hidden" id="active<%=hdkLen%>_courseid"> 
												<INPUT value="<bean:write id="hdkItem" property="hdkItems/OrderNO"/>" type="hidden" id="active<%=hdkLen%>_no"> 
												<TABLE height="100%" width="100%" cellPadding="0" align="center" border="0" cellSpacing="1" bgColor="#000000">
											    <tr><td width="100%" height="25%" align="center" bgColor="#ffffff">
												<SPAN id="active<%=hdkLen%>_text">
												<script>formatItemText("active<%=hdkLen%>_text","<bean:write id="hdkItem" property="hdkItems/Name"/>");</script>
												</SPAN>
											    </td></tr>
											    <tr><td width="100%" height="50%" align="center" bgColor="#ffffff" class="style2">
												<SPAN class="STYLE9" id="active<%=hdkLen%>_descText">
												<logic:notEqual id="hdkItem" property="hdkItems/Explain" value="">
												<bean:write id="hdkItem" property="hdkItems/Explain"/><BR>
												</logic:notEqual></SPAN>
												<SPAN id="active<%=hdkLen%>_scoreText">(<bean:write id="hdkItem" property="hdkItems/Score"/>)<BR></SPAN>
											    </td></tr>
											    <tr><td width="100%" height="25%" align="center" bgColor="#ffffff">
													<TABLE width="100%" cellPadding="0" align="center" border="0" cellSpacing="1" id="active<%=hdkLen%>_item_link">
														<TBODY>
															<TR>
																<TD align="center" id="active<%=hdkLen%>_add_td">
																   <A id="active<%=hdkLen%>_add_link" href="javascript:add_lev('active<%=hdkLen%>');">新增等级</A></TD>
																<TD align="center" id="active<%=hdkLen%>_modify_td">
																<A id="active<%=hdkLen%>_modify_link" href="javascript:modify_item('active<%=hdkLen%>');">修改</A></TD>
																<%if (hdkLen > 2) { %>
																<TD align="center" id="active<%=hdkLen%>_del_td">
																<A id="active<%=hdkLen%>_del_link" href="javascript:del_item('active<%=hdkLen%>');">删除</A></TD>
																<% } %>
															</TR>
														</TBODY>
													</TABLE>
											    </td></tr>
											    </table>
												</TD>
												</logic:iterate>
												<TD width="200" align="center" rowspan="2" id="active_suggest" bgColor="#ffffff">具体意见和建议</TD>
											</TR>
											<TR>
											  <% hdkLen = 0; %>
											  <logic:iterate id="hdkItem" property="list[@type='hdkItems']">
											  <%
											   int hdkLevLen = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"hdkItem","hdkItems/levlen"));
											   int hdkItemId = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"hdkItem","hdkItems/ItemID")); 
											    hdkLen++;
											  %>
												<TD width="<%=hwidth%>" valign="top" align="center" id="active<%=hdkLen%>_lev_td" bgColor="#ffffff">
													<TABLE width="100%" cellPadding="0" height="100%" border="0" cellSpacing="1" bgColor="#000000">
														<TBODY>
															<TR height="100%" class="STYLE9">
															<%
															  for (int i=1;i<=hdkLevLen;i++) {
															%>
															<logic:iterate id="hdklev" property="list[@type='hdkLevs']">
															   <%
															     int levItemId = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"hdklev","hdkLevs/ItemID"));
															     int levOrder =  Integer.parseInt(base.util.TalentContext.getValue(pageContext,"hdklev","hdkLevs/OrderNO"));
															     int hpwidth = hwidth/hdkLevLen;
															     if (levItemId==hdkItemId && levOrder==i) {
															   %>
																<TD width="<%=hpwidth%>" valign="top" align="center" id="active<%=hdkLen%>_lev<%=i%>_td" bgColor="#ffffff">
																<SPAN id="active<%=hdkLen%>_lev<%=i%>_text">
																<script>formatLevText("active<%=hdkLen%>_lev<%=i%>_text","<bean:write id="hdklev" property="hdkLevs/LevelName"/>");</script>
																</SPAN>
																<SPAN id="active<%=hdkLen%>_lev<%=i%>_scoreText">(<bean:write id="hdklev" property="hdkLevs/Score"/>)</SPAN>
																<INPUT value="<bean:write id="hdklev" property="hdkLevs/LevelID"/>" type="hidden" id="active<%=hdkLen%>_lev<%=i%>_levId">
																<INPUT value="<bean:write id="hdklev" property="hdkLevs/ItemID"/>" type="hidden" id="active<%=hdkLen%>_lev<%=i%>_itemId">
																<INPUT value="<bean:write id="hdklev" property="hdkLevs/LevelName"/>" type="hidden" id="active<%=hdkLen%>_lev<%=i%>_input"> 
																<INPUT value="<bean:write id="hdklev" property="hdkLevs/Score"/>" type="hidden" id="active<%=hdkLen%>_lev<%=i%>_score"> 
																<INPUT value="<bean:write id="hdklev" property="hdkLevs/OrderNO"/>" type="hidden" id="active<%=hdkLen%>_lev<%=i%>_no">
																	<TABLE width="100%" cellPadding="0" align="center" border="0" cellSpacing="0">
																		<TBODY>
																			<TR class="STYLE9" id="active<%=hdkLen%>_lev<%=i%>_link">
																				<TD align="center" id="active<%=hdkLen%>_lev<%=i%>_modify">
																				<A id="active<%=hdkLen%>_lev<%=i%>_modifylink" href="javascript:modify_lev('active<%=hdkLen%>_lev<%=i%>')">修<BR>改</A></TD>
																				<% if (i>2) { %>
																				<TD align="center" id="active<%=hdkLen%>_lev<%=i%>_del">
																				<A id="active<%=hdkLen%>_lev<%=i%>_dellink" href="javascript:del_lev('active<%=hdkLen%>_lev<%=i%>')">删<BR>除</A></TD>
																				<% } %>
																			</TR>
																		</TBODY>
																	</TABLE>
																</TD>
																<% } %>
															</logic:iterate>
															<% } %>
															</TR>
														</TBODY>
													</TABLE>
												</TD>
												</logic:iterate>
											</TR>
										</TBODY>
									</TABLE>
								</TD>
							</TR>
							<TR>
								<TD width="120" class="STYLE6" bgColor="#ffffff">2008-6-2<BR>某老师<BR>
									（教研部）：<BR>
									危机管理模拟训练</TD>
								<TD width="880" valign="top" align="center" bgColor="#ffffff">
									<TABLE width="100%" height="100%" border="0" bgColor="#000000">
										<TBODY>
											<TR>
											  <% hdkLen = 0; %>
											  <logic:iterate id="hdkItem" property="list[@type='hdkItems']">
											  <% hdkLen++; %>
												<TD align="center" width="<%=hwidth%>" id="row1_active<%=hdkLen%>_checkboxes" bgColor="#ffffff">
													<TABLE width="100%" height="100%" border="0" id="row1_active<%=hdkLen%>_tb">
														<TBODY>
															<TR>
											  <% 
									           int hdkLevLen = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"hdkItem","hdkItems/levlen"));
				                             for (int i=1;i<=hdkLevLen;i++) {
				                                 int hpwidth = hwidth/hdkLevLen;
											  %>
																<TD width="<%=hpwidth%>" align="center"><INPUT value="checkbox" type="checkbox" name="checkbox52"></TD>
											  <% } %>
															</TR>
														</TBODY>
													</TABLE>
												</TD>
												</logic:iterate>
												<TD width="200" id="row1_active_suggest" bgColor="#ffffff"></TD>
											</TR>
										</TBODY>
									</TABLE>
								</TD>
							</TR>
							<TR>
								<TD width="120" align="center" bgColor="#ffffff">.<BR>
									.<BR>
									.<BR>
									.<BR>
									.<BR>
									.<BR>
									.</TD>
								<TD width="880" valign="top" align="center" bgColor="#ffffff">
									<TABLE width="100%" height="100%" border="0" bgColor="#000000">
										<TBODY>
											<TR>
											  <% hdkLen = 0; %>
											  <logic:iterate id="hdkItem" property="list[@type='hdkItems']">
											  <% hdkLen++; %>
												<TD align="center" width="<%=hwidth%>" id="row2_active<%=hdkLen%>_checkboxes" bgColor="#ffffff">
													<TABLE width="100%" height="100%" border="0" id="row2_active<%=hdkLen%>_tb">
														<TBODY>
															<TR>
											  <% 
									          int hdkLevLen = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"hdkItem","hdkItems/levlen"));
				                            
				                            for (int i=1;i<=hdkLevLen;i++) {
				                                int hpwidth = hwidth/hdkLevLen;
											  %>
																<TD width="<%=hpwidth%>" align="center"><INPUT value="checkbox" type="checkbox" name="checkbox52"></TD>
											  <% } %>
															</TR>
														</TBODY>
													</TABLE>
												</TD>
												</logic:iterate>
												<TD width="200" id="row2_active_suggest" bgColor="#ffffff">&nbsp;</TD>
											</TR>
										</TBODY>
									</TABLE>
								</TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
			</TR>
		</TBODY>
	</TABLE>
</FORM>
<P class="STYLE6" align="right">教 务 处</P>
<div align="center"><INPUT type="button" class="button_02" value="保存" onclick="checkVersion();">&nbsp;
<INPUT type="button" class="button_02" value="返回" onclick="delEvlReturn();"></div>
</body>
<script language="javascript">
dispSuggest();

function checkVersion() {
var evlId = document.all["Evaluation/EvaluationID"].value;
var path = "teachWorkManage.prTeachEvaluate.prWeekEvlFixDo.do?";
var newversion = document.forms[0].elements("Evaluation/Version").value;
var version = prompt("是否确认使用当前版本号 ："+newversion+",否则在下面输入新版本号，按确定即可！",newversion);
//var oldversion = document.forms[0].elements("oldVersion").value;

//if (newversion == oldversion) {
//   if (confirm('是否确认当前版本号 ：'+newversion)){
//		history.go(-1);
//   }
//} else location.href="teachWorkManage.prTeachEvaluate.prWeekEvlList.do";

if (version==null) location.href="teachWorkManage.prTeachEvaluate.prWeekEvlList.do";
else {
   path = path + "Evaluation/EvaluationID=" + evlId + "&Evaluation/Version=" + version;
   document.getElementById("modifyframe").src = path;
   setTimeout("location.href='teachWorkManage.prTeachEvaluate.prWeekEvlList.do';",3000);
}
}

function delEvlReturn() {
var path = "teachWorkManage.prTeachEvaluate.prEvlListDel.do?Evaluation/ClassType=1&Evaluation/Period=每周";
var evlId = document.all["Evaluation/EvaluationID"].value;
var status = document.all["status"].value;

if (status == 'add') {
   path = path + "&evlList/Evaluation1/EvaluationID="+evlId;
   if (confirm("确定取消新增当前主体班每周评估表吗？")) location.href = path;
} else {
   location.href='teachWorkManage.prTeachEvaluate.prWeekEvlList.do';
}
}
</script>