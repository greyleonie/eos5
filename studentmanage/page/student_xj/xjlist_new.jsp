<%@include file="/internet/common.jsp"%>
<body>
	<%
		//com.primeton.tp.core.prservice.context.SessionContext sessionContext = (com.primeton.tp.core.prservice.context.SessionContext) request.getSession().getAttribute(com.primeton.tp.web.driver.webdriver.WebDriver.SESSION_CONTEXT);
		//String test = (String) sessionContext.getProperty("test");
		//out.println(test);
		%>
	<form method="post" action="studentmanage.student_xj.xjlist.do" target="">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="24" background="image/lz_bg.gif">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="15"></td>
							<td class="text_wirte">ѧԱ����&gt;ѧ������&gt;�༶ѧԱ��Ϣ</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="5"><input type="hidden" name="queryaction" value="studentmanage.student_xj.xjlist.do"> <input
						type="hidden" name="addaction" value="studentmanage.student_xj.xjadd.do"> <input type="hidden" name="modifyaction"
						value="studentmanage.student_xj.xjmodify.do"> <input type="hidden" name="batchModifyAction"
						value="studentmanage.student_xj.xjBatchModify.do"> <input type="hidden" name="deleteaction"
						value="studentmanage.student_xj.xjdelete.do"> <input type="hidden" name="logdelaction"
						value="studentmanage.student_xj.xjlogdel.do"> <input type="hidden" name="viewaction"
						value="studentmanage.student_xj.xjview.do"> <input type="hidden" name="tuixueAction"
						value="studentmanage.student_xj.xjTuixue.do"> <input type="hidden" name="xuejiAction"
						value="studentmanage.student_xj.xjXueji.do"> <input type="hidden" name="teamListAction"
						value="studentmanage.student_xj.teamList.do"> <input type="hidden" name="importAction"
						value="studentmanage.student_xj.xjImport.do"> <input type="hidden" name="syncIDSAction"
						value="studentmanage.student_xj.xjSyncIDSDo.do">

					<html:hidden property="QueryStudent/_order/col1/field" />
					<html:hidden property="QueryStudent/_order/col1/asc" />
					<html:hidden property="PageCond/begin" />
					<html:hidden property="PageCond/count" />
					<html:hidden property="PageCond/length" />
					<html:hidden property="PageCond/status" />
					<!--INPUT value="like" type="hidden" name="QueryStudent/operatorname/criteria/operator">
		<INPUT value="center" type="hidden" name="QueryStudent/operatorname/criteria/likeRule"--></td>
			</tr>
		</table>
		<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0" class="table">
			<tr>
				<td>
					<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td height="8"></td>
						</tr>
						<tr>
							<td class="text">�� ����
								<html:select property="QueryStudent/ClassID/criteria/value" onchange="talentquery3()" attributesText='id="printTable"'>
									<html:option value="-1">--��ѡ��༶--</html:option>
									<html:options property="list[@type='studentclass']/Class/ClassID" labelProperty="list[@type='studentclass']/Class/ClassName" />
								</html:select>
								&nbsp; <%String check = "";%>
								<logic:equal property="QueryStudent/IsQuit" value="1">
									<%check = "checked";%>
								</logic:equal>
								<input type="checkbox" name="QueryStudent/IsQuit" value="1" marked="" <%=check %> onchange="talentquery3()">
								����ѧ ���������<input type="checkbox" name="checkbox" onclick="servertoorder()" marked=""> <input name="down"
									type="button" class="button_02" value="����ģ��" onclick="downModel()">
								<logic:present property="QueryStudent/ClassID/criteria/value">
									<logic:notEqual property="QueryStudent/ClassID/criteria/value" value="-1">
										<input name="teamManage" type="button" class="button_02" value="�������" onclick="teamList()">
									</logic:notEqual>
								</logic:present>
								<input name="ieprint" type="button" class="button_02" value="�� ӡ" onclick="iePrint()"></td>
						</tr>
						<tr>
							<td height="30" class="text"><a title='�ؼ��ֿ�����"ѧԱ������ѧ�š�������λ"' id="keytitle">�ؼ��ֲ�ѯ</a>��
								<html:text property="QueryStudent/fccsearch" attributesText='class="input"' />
								<input name="query" type="button" class="button_02" value="�� ѯ" onclick="talentquery2()">
								<qx:talentButton value="�� ��" styleClass="button_02" type="button"
									operation="DX_STUDENT_MANAGE_XJ.DX_STUDENT_MANAGE_XJ_ADD" onclick="talentaddNew()" property="add"></qx:talentButton>
								<qx:talentButton value="�� ��" styleClass="button_02" type="button"
									operation="DX_STUDENT_MANAGE_XJ.DX_STUDENT_MANAGE_XJ_MODIFY" onclick="talentmodify()" property="modify" />
								<qx:talentButton value="�����޸�" styleClass="button_02" type="button"
									operation="DX_STUDENT_MANAGE_XJ.DX_STUDENT_MANAGE_XJ_MODIFY" onclick="batchModify()" property="modify2" />
								<qx:talentButton value="ɾ ��" styleClass="button_02" type="button"
									operation="DX_STUDENT_MANAGE_XJ.DX_STUDENT_MANAGE_XJ_DELETE" onclick="talentdel()" property="delete"
									title="ɾ�����������Ϣ�����ݿ���ɾ��" />
								<!--����˵��Ҫ
                <qx:talentButton value="�߼�ɾ��" styleClass="button_02" type="button" operation="DX_STUDENT_MANAGE_XJ.DX_STUDENT_MANAGE_XJ_LOGDEL" onclick="talentlogdel()" property="delete2" title="�߼�ɾ�������ǰѸ���Ϣ״̬��Ϊ������"/>-->
								<input name="view" type="button" class="button_02" value="�� ��" onclick="talentview()">
								<qx:talentButton property="tuixue" type="button" styleClass="button_02" value="�� ѧ" onclick="talentTuixue()"
									operation="DX_STUDENT_MANAGE_XJ.DX_STUDENT_MANAGE_XJ_TUIXUE" />
								<qx:talentButton property="xueji" type="button" styleClass="button_02" value="ѧ ��" onclick="talentXueji()"
									operation="DX_STUDENT_MANAGE_XJ.DX_STUDENT_MANAGE_XJ_VIEWXJ" />
								<qx:talentButton property="import" type="button" styleClass="button_02" value="�� ��" onclick="importExcel()"
									operation="DX_STUDENT_MANAGE_XJ.DX_STUDENT_MANAGE_XJ_IMPORT" />
								<input name="export" type="button" class="button_02" value="�� ��" onclick="exporttoexcel()">
								<input name="sync" type="button" class="button_02" value="ͬ ��" onclick="syncIDS()"></td>
						</tr>
						<tr>
							<td height="8"></td>
						</tr>
						<tr>
							<td valign="top" class="text">
								<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
									<tr class="td_title">
										<td width="2%" align="center" nowrap><input type="checkbox" name="checkbox" value="checkbox"
												onclick="eosCheckAll(document.forms[0],this)" marked=""></td>
										<td width="6%" align="center" nowrap id="QueryStudent.StudentNO" onclick="talentsort()">ѧ��</td>
										<td width="10%" align="center" nowrap id="QueryStudent.operatorname" onclick="talentsort()">����</td>
										<td width="5%" align="center" nowrap id="QueryStudent.Sex" onclick="talentsort()">�Ա�</td>
										<td width="9%" align="center" nowrap id="QueryStudent.Birthdate" onclick="talentsort()">��������</td>
										<td width="5%" align="center" nowrap id="QueryStudent.FolkID" onclick="talentsort()">����</td>
										<td width="13%" align="center" nowrap id="QueryStudent.DegreeID" onclick="talentsort()">�Ļ��̶�</td>
										<td width="8%" align="center" nowrap id="QueryStudent.zhuanye" onclick="talentsort()">ѧλ</td>
										<td width="15%" align="center" nowrap id="QueryStudent.WorkingOrgan" onclick="talentsort()">������λ</td>
										<td width="17%" align="center" nowrap id="QueryStudent.Duty" onclick="talentsort()">ְ��</td>
										<td width="10%" align="center" nowrap id="QueryStudent.TeamID" onclick="talentsort()">����</td>
									</tr>
									<%
		int count = 0;
		String trClass = "result_content";

		%>
									<logic:iterate id="resultset" property="list[@type='student']">
										<%if (count % 2 == 0)
			trClass = "td1";
		else
			trClass = "td2";
		count++;

		String cardID = talent.core.TalentFunctions
				.getAvailStr(base.util.TalentContext.getValue(pageContext,
						"resultset", "QueryStudent/cardID"));
		java.util.Hashtable h = new java.util.Hashtable();
		h.put("cardID", cardID);
		%>
										<tr class="<%=trClass%>" onclick="changeTRBgColor(this)"
											onDblClick="talentviewf('<bean:write id="resultset" property="QueryStudent/StudentID"/>','true')">
											<td align="center">
												<logic:present id="resultset" property="QueryStudent/StudentID">
													<html:checkbox id="resultset" name="list[@name='update']/QueryStudent/StudentID"
														property="QueryStudent/StudentID" indexed="true" attributes="<%=h %>" />
												</logic:present>
											</td>
											<td nowrap>&nbsp;
												<bean:write id="resultset" property="QueryStudent/StudentNO" />
											</td>
											<td nowrap>&nbsp;
												<bean:write id="resultset" property="QueryStudent/operatorname" />
											</td>
											<td nowrap>&nbsp;
												<dict:write businTypeId="BNDICT_gender" property="QueryStudent/Sex" id="resultset" />
											</td>
											<td nowrap>&nbsp;
												<bean:write id="resultset" property="QueryStudent/Birthdate"
													formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd" />
											</td>
											<td nowrap>&nbsp;
												<dict:write businTypeId="dx_folk" property="QueryStudent/FolkID" id="resultset" />
											</td>
											<td nowrap>&nbsp;
												<dict:write businTypeId="dx_education" property="QueryStudent/DegreeID" id="resultset" />
											</td>
											<td nowrap>&nbsp;
												<logic:notEqual id="resultset" property="QueryStudent/zhuanye" value="null">
													<bean:write id="resultset" property="QueryStudent/zhuanye" maxLength="16" filter="true" />
												</logic:notEqual>
											</td>
											<td nowrap>&nbsp;
												<bean:write id="resultset" property="QueryStudent/WorkingOrgan" maxLength="50" />
											</td>
											<td nowrap>&nbsp;
												<bean:write id="resultset" property="QueryStudent/Duty" maxLength="16" />
											</td>
											<td nowrap>&nbsp;
												<bean:write id="resultset" property="QueryStudent/TeamName" />
											</td>
										</tr>
									</logic:iterate>

								</table>
								<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td height="30" class="text">
											<script>

												PageCond(document.forms[0]);
											</script>
										</td>
									</tr>

								</table>

							</td>
						</tr>
						<tr>
							<td class="text">&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
	<form name="exportform" method="post" target="_blank"><input type="hidden" name="title"> <input type="hidden"
			name="xmlfcc"></form>
</body>
<script>function talentaddNew() {
	var frm = document.forms[0];
	if(frm.elements["QueryStudent/ClassID/criteria/value"].value == "-1") {
		alert("��ѡ��༶");
		return
	}
	var sel = frm.elements["QueryStudent/ClassID/criteria/value"];
	var className = sel.options[sel.options.selectedIndex].text;
	frm.action = frm.elements["addaction"].value + "?Student/ClassName=" + className;
   	frm.submit();

}
function importExcel() {
	var frm = document.forms[0];
	if(frm.elements["QueryStudent/ClassID/criteria/value"].value == "-1") {
		alert("��ѡ��༶");
		return
	}
	var sel = frm.elements["QueryStudent/ClassID/criteria/value"];
	var className = sel.options[sel.options.selectedIndex].text;
	frm.action = frm.elements["importAction"].value + "?Student/ClassName=" + className;
   	frm.submit();

}

function teamList(){
	var frm = document.forms[0];
	if(frm.elements["QueryStudent/ClassID/criteria/value"].value == "-1") {
		alert("��ѡ��༶");
		return
	}
	
	frm.action = frm.elements["teamListAction"].value;
   	frm.submit();
}
function talentTuixue(){
    	var frm =document.forms[0];
		if(chechedCount(frm)<1){
    		alert("���ٱ���ѡ��һ�У�");
    		return ;
    	}
		if(chechedCount(frm)>1){
    		alert("ֻ��ѡ��һ�У�");
    		return ;
    	}
		if(chechedCount(frm)==1){
			id = getChechedValue(frm);
    		frm.action = frm.elements["tuixueAction"].value;
    		frm.action += "?fid=" + id;
			frm.submit();		
    	}
    
    	
}

function talentXueji(){
    	var frm =document.forms[0];
		if(chechedCount(frm)<1){
    		alert("���ٱ���ѡ��һ�У�");
    		return ;
    	}
		if(chechedCount(frm)>1){
    		alert("ֻ��ѡ��һ�У�");
    		return ;
    	}
		if(chechedCount(frm)==1){
			id = getChechedValue(frm);
    		frm.action = frm.elements["xuejiAction"].value;
    		frm.action += "?fid=" + id;
			frm.submit();		
    	}
    
    	
}
function downModel(){
	var frm = document.forms[0];
	var sel = frm.elements["QueryStudent/ClassID/criteria/value"];
	var className = sel.options[sel.options.selectedIndex].text;
	frm.action = "studentmanage.student_xj.downTemplet.do?ClassName=" + className;
   	frm.target="_blank";
   	frm.submit();
   	frm.target="";
}

//ɾ������
function talentdel(){
	var frm =document.forms[0];
		
    	var i=0;
    	var j=0;
    	eles = frm.elements;
		while(i<eles.length){
			obj= eles[i];
			if(obj.type == "checkbox" && !obj.disabled && obj.getAttribute("marked")==null){
				if(obj.checked){
				    var cardID=obj.getAttribute("cardID");
				    if(cardID!=null && cardID!=""){
					    alert("����ѡ��ļ�¼�д��ڿ���δ���գ�������ɾ��������");
					    return;
					}
					j++;
			     }
			}
			i++;
		}
		
    	if(j<1){
    		alert("���ٱ���ѡ��һ�У�");
    		return ;
    	}
    	if(confirm("�Ƿ�ȷ��ɾ��ָ����¼��")==false){
			return ;
		}    	 
    
    	frm.action = frm.elements["deleteaction"].value;
    	frm.submit();
}


//�߼�ɾ������
function talentlogdel(){
    	var frm =document.forms[0];
		
    	var i=0;
    	var j=0;
    	eles = frm.elements;
		while(i<eles.length){
			obj= eles[i];
			if(obj.type == "checkbox" && !obj.disabled && obj.getAttribute("marked")==null){
				if(obj.checked){
				    var cardID=obj.getAttribute("cardID");
				    if(cardID!=null && cardID!=""){
					    alert("����ѡ��ļ�¼�д��ڿ���δ���գ�������ɾ��������");
					    return;
					}
					j++;
			     }
			}
			i++;
		}
		
    	if(j<1){
    		alert("���ٱ���ѡ��һ�У�");
    		return ;
    	}
    	if(confirm("�Ƿ�ȷ��ɾ��ָ����¼��")==false){
			return ;
		}    	 
    
    	frm.action = frm.elements["logdelaction"].value;
    	frm.submit();
}
function batchModify(){
		var frm =document.forms[0];
   		if(frm.elements["QueryStudent/ClassID/criteria/value"].value == "-1") {
			alert("��ѡ��༶");
			return
		}
   		if(chechedCount(frm)<1){
    		alert("���ٱ���ѡ��һ�У�");
    		return ;
    	}
    	frm.action = frm.elements["batchModifyAction"].value;
    	frm.submit();
}

function talentquery2() {
	var frm =document.forms[0];
	var oldvalue = frm.elements["QueryStudent/fccsearch"].value;
	if(oldvalue!=""){
		var pattern = /[|,|'|\$|\^|%|\*|\.|\?]/gi;
		oldvalue = oldvalue.replace(pattern,"").replace(/(^\s*)|(\s*$)/g, "");
		frm.elements["QueryStudent/fccsearch"].value = oldvalue;
	}
	
	if(frm.elements["PageCond/begin"] && frm.elements["PageCond/count"] && frm.elements["PageCond/length"]) {
		frm.elements["PageCond/begin"].value=0;
		frm.elements["PageCond/count"].value=-1;
		if(frm.elements["PageCond/talentlength"]) {
			frm.elements["PageCond/length"].value = frm.elements["PageCond/talentlength"].value;
		}else{
			frm.elements["PageCond/length"].value=10;
		}
		if(frm.elements["queryaction"]) {
			frm.action = frm.elements["queryaction"].value;
		}
		event.srcElement.blur();
		frm.submit();
	}

}

//��ѯ
function talentquery3() {
	var frm =document.forms[0];
	processError(frm);
	if(frm.elements["PageCond/begin"] && frm.elements["PageCond/count"] && frm.elements["PageCond/length"]) {
		frm.elements["PageCond/begin"].value=0;
		frm.elements["PageCond/count"].value=-1;
		if(frm.elements["PageCond/status"]) {
			frm.elements["PageCond/status"].value = 1;
		}else{
			frm.elements["PageCond/status"].value=0;
		}
		if(frm.elements["PageCond/talentlength"]) {
			frm.elements["PageCond/length"].value = frm.elements["PageCond/talentlength"].value;
		}else{
			frm.elements["PageCond/length"].value=10;
		}
		if(frm.elements["queryaction"]) {
			frm.action = frm.elements["queryaction"].value;
		}
		event.srcElement.blur();
		frm.submit();
	}

}

//ͬ���û���Ϣ��TRS��IDS���ݿ�
function syncIDS(){
	var frm = document.forms[0];
	var classID = frm.elements["QueryStudent/ClassID/criteria/value"].value;
	if(classID == "-1") {
		alert("��ѡ��༶");
		return
	}
	
	if(validater(frm)) {
		frm.action = frm.elements["syncIDSAction"].value + "?ClassID=" + classID;
		
		if(window.confirm("ȷ��Ҫͬ��ѧԱ��Ϣ��IDS��\n����ͬ����Ҫ������ʱ�䣬�����ĵȴ�������")){
      		frm.submit();
      	}
	}

}


</script>
<script>

	loadOrderImg(document.forms[0],'QueryStudent');
</script>