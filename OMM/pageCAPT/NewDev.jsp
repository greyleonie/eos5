<%@include file="/internet/common.jsp"%>
<%@ taglib uri="/WEB-INF/hci-tree.tld" prefix="tree"%>
<script language="jscript" src="/pageComponent/resources/scripts/rtree.js"></script>
<script language="jscript" src="/pageComponent/resources/scripts/string.js"></script>
<script language="jscript" src="/pageComponent/resources/scripts/eventManager.js"></script>
<script language="jscript" src="/pageComponent/resources/scripts/processCaller.js"></script>
<script language="jscript" src="/internet/scripts/hiddensubmit.js"></script>
<link rel="stylesheet" href="/pageComponent/resources/theme/style.css" type="text/css">
<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="24" background="/internet/image/lz_bg.gif">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="15"></td>
						<td class="text_wirte">��ά����&gt;IT�豸����&gt;�豸�⡪&gt;�����豸</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="5"></td>
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
						<td valign="top" class="text">
							<TABLE border="0" width="98%" align="center">
								<TBODY>
									<TR>
										<TD width="85%" align="left" valign="top">
											<FORM action="OMM.prCAPT.prNewDev.do" method="post" name="myForm"><input type="hidden" name="typeCode"
													value=""> <input type="hidden" name="modifytoSave" value="OMM.prCAPT.prNewDev.do"> <input type="hidden"
													name="OMM_ITDevice/TypeID" value="-1">
												<table width="96%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CBCBCB" id="type">
													<tr class="td_title">
														<td nowrap align="center">�豸����</td>
													</tr>
													<tr>
														<TD nowrap="nowrap" style="background-color:white;"><select name="typeID" onchange="getExtPro()">
																<option value="-1">��ѡ���豸����</option>
																<logic:iterate id="item" property="list[@type='OMM_DevType']">
																	<option
																		value='<bean:write id="item" property="OMM_DevType/TypeCode" /><bean:write id="item" property="OMM_DevType/TypeID" />'>
																		<bean:write id="item" property="OMM_DevType/TypeName" />
																	</option>
																</logic:iterate>
															</select><FONT style="color: red;">&nbsp;&nbsp;*</FONT></TD>
													</tr>
												</table>
												<BR />
												<table width="96%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CBCBCB">
													<thead>
														<tr class="td_title">
															<td width="200" nowrap align="center">�豸��չ��������</td>
															<td nowrap align="center">�豸��չ����ֵ</td>
														</tr>
													</thead>
												</table>
												<table width="96%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CBCBCB" id="extPro">
												</table>
												<BR />
												<table width="96%" border="0" align="center" cellpadding="0" cellspacing="1">
													<tr>
														<TD nowrap="nowrap" class="td1">�����������豸����:<input type='text' name="num"
																onkeypress="javascript:KeyPress(this);" />&nbsp;<input name="modifyandsave" type="button"
																class="button_02" value="����" onClick="newDev();"></TD>
													</tr>
												</table>
												<table width="96%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CBCBCB">
													<tr class="td_title">
														<td width="10%" nowrap="nowrap" align="center">���</td>
														<td width="30%" nowrap="nowrap" align="center">�豸���</td>
														<td width="8%" nowrap="nowrap" align="center">����</td>
													</tr>
												</table>
												<table width="96%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CBCBCB"
													id="listdetail">
												</table>
												<BR>
												<TABLE>
													<TR align="left">
														<TD class="td1"><font style='color:red;'> &nbsp;&nbsp;&nbsp;&nbsp;ע�⣺1�������ʽ����ݣ���λ��+��ˮ�ţ���λ��������09001�� </font></TD>
													</TR>
													<TR align="left">
														<TD class="td1"><font style='color:red;'>
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2��������ɺ�ϵͳ����������Զ���֤����֤�ɹ����Զ�����7λ�豸��ţ������������
															</font></TD>
													</TR>
												</TABLE>
												<BR>
												<BR>
												<center>
													<TABLE>
														<TR align="center">
															<TD><input name="modifyandsave" type="button" class="button_02" value="����" onClick="save()"></TD>
														</TR>
													</TABLE>
												</center>
											</FORM>
										</TD>
									</TR>
								</TBODY>
							</TABLE>
						</td>
					</tr>
					<tr>
						<td class="text"></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
<script>
var rowArray = new Array();
var j=0;
var currentNode;
var checkboxIndex = 0;
	
	function addItem( treeNode ){
		currentNode = treeNode;
		var sub = new HiddenSubmit('OMM.bizCAPT.bizIsExist');
		sub.add("CAPTID", treeNode.entity.getProperty("CAPTID"));
		if (sub.submit()) {
			if(sub.getProperty("exist")>0){
				alert("���ʲ��Ѵ�����IT��ά����,������ѡ��!");
			}
			else{
				for (var i=0; i<rowArray.length; i++) {
					if(treeNode.entity.getProperty("CAPTID")==rowArray[i]){
						alert("�ü�¼�Ѵ���!");
						return;
						}
				}
				insertDetail(treeNode);
			}
		}
		/*window.frames["goodInfo"].location.href="OMM.prCAPT.prToCAPTIMP.do?fid="+treeNode.entity.getProperty("CAPTID")+"&OMM_ITDevice/CAPTID="+treeNode.entity.getProperty("CAPTID");*/
	}
	
	function newDev(){
		var num=document.getElementById('num').value;
		if(num>10){
			alert("ÿ��ֻ�����10���豸");
		}else{
		var objTable = document.all['listdetail']; // ��ϸ��
			if(checkboxIndex>0){/*
			for(var cc=0;cc<count;cc++){
			removeRowFromTable(objTable,'row_'+cc);
			}*/
			objTable.innerText="";
			checkboxIndex=0;
		}
		for(var j=1;j<=num;j++){
		insertDetail(j);}
		}
			
	}
	
	 // ������ϸ���¼
	function insertDetail(index) {
		
		var objTable = document.all['listdetail']; // ��ϸ��
		var nameArray = new Array();  //Ҫ��ʾ�ֶ�����
		var i = 0;
		nameArray[i++] = "INDEX"; 
		nameArray[i++] = "DevCode"; 
		nameArray[i++] = "OP";
		addRecordToTable(objTable, nameArray,index);
	}
	
	  //����������
	function addRecordToTable(objTable, nameArray,index) {
		
		var formHTML = "";
		var bodyHTML = objTable.innerHTML;
		bodyHTML = bodyHTML.replace("<TBODY>", "");
		bodyHTML = bodyHTML.replace("</TBODY>", "");
		formHTML += "<table width =\"96%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\"  bgcolor=\"#CAD6E8\" id=\"listdetail\">";
		formHTML += bodyHTML;
		formHTML += "<tr class=\"td1\" id=\"row_" + checkboxIndex + "\" onClick='changeTRBgColor(this)'>";
		for (var i=0; i<nameArray.length; i++) {
			var colHTML = "";
			switch (i) {
			case 0: 
				colHTML += "<td width=\"10%\" nowrap=\"nowrap\"  align='center'>";
				colHTML += "��"+index+"���豸���";
				break;
			case 1: 
				colHTML += "<td width=\"30%\" nowrap=\"nowrap\" align=\"left\">";
				colHTML += "<input type='text' name=\"list[@type='CAPT_CAPITALINFO']/CAPT_CAPITALINFO[@rowNum='"+index+"']/code\" onkeypress=\"javascript:KeyPress(this);\" onblur='setDevCode(this);' />";
				break;
		 	case 2: //����
				colHTML += "<td width=\"8%\" nowrap=\"nowrap\" align=\"center\">";
				colHTML += "<img  onClick=\"removeRowFromTable(document.all['listdetail'], 'row_"+checkboxIndex+"')\" src=\"/internet/image/delete1.gif\" style=\"cursor: hand\"> ";
				break;
			}
			
			colHTML += "</td>";
			formHTML += colHTML;		
		}
		formHTML += "</tr>";
		formHTML += "</table>";  
		objTable.outerHTML = formHTML;
		var objTable = document.all['listdetail']; // ��ϸ��
		
		// ���� checkboxIndex
		checkboxIndex ++ ;
	}
		// �ӱ����ɾ��idΪrowId����
	var selectedRowIndex;
	function removeRowFromTable(objTable, rowId) {
		var cells;
		var tableHTML = objTable.outerHTML; 
		var locOfRowId = tableHTML.indexOf(rowId);
		var beginHTML = tableHTML.substr(0, locOfRowId);
		var endHTML = tableHTML.substr(locOfRowId+1, tableHTML.length-locOfRowId-1);
		var lastTRLoc = beginHTML.lastIndexOf("<TR");
		var beforeHTML = beginHTML.substr(0, lastTRLoc);
		var firstTRLoc = endHTML.indexOf("</TR>");
		var latterHTML = endHTML.substr(firstTRLoc+5, endHTML.length-firstTRLoc);
		   
		   //�ı���ɫ
	    if (document.getElementById(selectedRowIndex)) {
	    document.getElementById(selectedRowIndex).style.backgroundColor="#FFFFFF"; }
	    selectedRowIndex = rowId;
		document.getElementById(rowId).style.backgroundColor="#999999";
		
		if (confirm("ȷ��ɾ���ü�¼��")==true){
		   objTable.outerHTML = beforeHTML + latterHTML;
			checkboxIndex--;
	    }
	}
	
	function getExtPro(){
		var type=document.getElementById("typeID").value;
		if(type==-1){
		
		}
		else{
			document.getElementById('typeCode').value=type.substring(0,2);
			type=type.substring(2);
			document.getElementById("OMM_ITDevice/TypeID").value=type;
			document.getElementById('extPro').innerText="";
			var sub = new HiddenSubmit('OMM.bizTypeExt.bizGetTypeExtProlistByTypeID');
			sub.add("OMM_TypeExtProperty/TypeID/criteria/value", type);
			if (sub.submit()) {
				if(sub.getValues("root/data/list[@type='OMM_TypeExtProperty']/OMM_TypeExtProperty").length<1){
					alert("������δ������չ���ԣ����ȶ���������ã�");
				}
				flag=true;
				for(var i=0;i<sub.getValues("root/data/list[@type='OMM_TypeExtProperty']/OMM_TypeExtProperty").length;i++){
				var name=sub.getValues("root/data/list[@type='OMM_TypeExtProperty']/OMM_TypeExtProperty[@rowNum='"+i+"']/ExtPropertyName");
				var mode=sub.getValues("root/data/list[@type='OMM_TypeExtProperty']/OMM_TypeExtProperty[@rowNum='"+i+"']/ExtPropertyMode");
				var option=sub.getValues("root/data/list[@type='OMM_TypeExtProperty']/OMM_TypeExtProperty[@rowNum='"+i+"']/ExtPropertyOptions");
				insertExtDetail(name,mode,option,i);
				}
			}
		}
	}
	
	function insertExtDetail(name,mode,option,index) {
		var objTable = document.all['extPro']; // ��ϸ��
		var nameArray = new Array();  //Ҫ��ʾ�ֶ�����
		var i = 0;
		nameArray[i++] = "NAME"; 
		nameArray[i++] = "OPTION";
		addExtToTable(objTable, nameArray,name,mode,option,index)	
	}
	
	var extcheckboxIndex = 0;  //����������
	function addExtToTable(objTable, nameArray,name,mode,option,index) {
		var formHTML = "";
		var bodyHTML = objTable.innerHTML;
		bodyHTML = bodyHTML.replace("<TBODY>", "");
		formHTML += "<table width =\"96%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\"  bgcolor=\"#CAD6E8\" id=\"extPro\">";
		bodyHTML = bodyHTML.replace("</TBODY>", "");
		formHTML += bodyHTML;
		formHTML += "<tr class=\"td1\" id=\"row_" + extcheckboxIndex + "\" >";
		for (var i=0; i<nameArray.length; i++) {
			var colHTML = "";
			switch (i) {
		 	case 0: //����
				colHTML += "<td width=\"200\" style=\"background-color:white;\"  nowrap align=\"center\">";
				colHTML += name;
				break;	
			default:
				colHTML += "<td style=\"background-color:white;\"  nowrap align=\"left\">";
				if(mode==1){
					colHTML += "<input type='text' value="+option+" name=\"list[@type='OMM_ExtProperty']/OMM_ExtProperty[@rowNum='"+index+"']/ExtPropertyValue\"/><FONT style=\"color: red;\">&nbsp;&nbsp;*</FONT><input type='hidden' value='"+name+"' name=\"list[@type='OMM_ExtProperty']/OMM_ExtProperty[@rowNum='"+index+"']/ExtPropertyName\"/>";
				}else{
					colHTML += "<input type='hidden' value='"+name+"' name=\"list[@type='OMM_ExtProperty']/OMM_ExtProperty[@rowNum='"+index+"']/ExtPropertyName\"/><select name=\"list[@type='OMM_ExtProperty']/OMM_ExtProperty[@rowNum='"+index+"']/ExtPropertyValue\">";
					var test="";
					test=option+"";
					var temp=test.split("|");
					for(var j=0;j<temp.length;j++){
						if(temp[j]==""){
						
						}else{
							colHTML += "<option value='"+temp[j]+"'>"+temp[j]+"</option>";
						}
					}
					colHTML += "</select><FONT style=\"color: red;\">&nbsp;&nbsp;*</FONT>";
				}
				break;
			}
			
			colHTML += "</td>";
			formHTML += colHTML;		
		}
		formHTML += "</tr>";
		formHTML += "</table>";  
		objTable.outerHTML = formHTML;
		var objTable = document.all['extPro']; // ��ϸ��
		
		// ���� checkboxIndex
		extcheckboxIndex ++ ;
	}


	function save(){
		var type=document.getElementById("OMM_ITDevice/TypeID").value;
		if(type==-1){
			alert("��ѡ���豸����!");
			return false;
		}
		if(flag==false){return false;}
		var captrows=document.getElementById("listdetail").getElementsByTagName("tr").length;
		if(captrows<1){alert("�����������豸��Ϣ!");return false;}
		var extprorows=document.getElementById("extPro").getElementsByTagName("tr").length;
		if(extprorows<1){alert("�������豸���͵���չ����!");return false;}
		if(checkAllTxt()==true){
			frm=document.forms[0];
			frm.action = frm.elements["modifytoSave"].value;
			frm.submit();
		}else{
			alert("����д������Ϣ!");	
		}		
	}

	function checkAllTxt()
	{
	   var vTxt = document.getElementsByTagName("input");
	   var vAble = true;
	   for(var i = 0 ; i < vTxt.length ; i++)
	   {
	      if(vTxt[i].type == "text")
	      {
	         if(vTxt[i].value.length == 0)
	         {
	            vAble = false;
	            break;
	         }
	      }
	   }
	   return vAble;
	}
	
	function setDevCode(obj){var type=document.getElementById("OMM_ITDevice/TypeID").value;
		if(type==-1){
			obj.value="";
			alert("����ѡ���豸����!");
		}else{
			var typeCode=document.getElementById('typeCode').value;
			var devCode=typeCode+obj.value+"";		
			var textList=document.getElementById('listdetail').getElementsByTagName("input");
			var num=0;
			for(var i = 0 ; i < textList.length ; i++)
		    {
		      if(textList[i].type == "text")
		      {
		         if(textList[i].value==devCode)
		         {
					num=num+1;
		         }
		      }
		    }
			if(num<1){
				if(obj.value.length==5){
					var sub = new HiddenSubmit('OMM.bizCAPT.bizDevIsExist');
					sub.add("DevCode", devCode);
					if (sub.submit()) {
						if(sub.getProperty("exist")>0){
							obj.value="";
							alert("���豸�����ʹ��,����������!");
						}
						else{
							obj.value=devCode;
							obj.readOnly=true;
						}
					}
				}else{
					if(obj.readOnly!=true)
						alert("������5λ�豸���!");
				}
			}else{
				obj.value="";
				alert("�豸��Ų����ظ�,����������!");
			}
		}
		
	}
	
	function KeyPress(objTR)
	{	
			var txtval=objTR.value;		
			
			var key = event.keyCode;
			if((key < 48||key > 57)&&key != 46)
			{		
				event.keyCode = 0;
			}
			else
			{
				if(key == 46)
				{
						event.keyCode = 0;
				}
			}
	
	}

	function reloadNodeChild(treeNode) {
		currentNode = treeNode;
		currentNode.reloadChild();
		currentNode.expandNode();
	}

	function refreshNode(){
		currentNode.reloadChild();
		currentNode.expandNode();
	}

	function refreshNodeParent(){
		var parentN = currentNode.getParent();
		if (parentN != null) {
			parentN.reloadChild();
			parentN.expandNode();
			currentNode = parentN;
		} else {
			goodTree.rootNode.reloadChild();
			goodTree.rootNode.expandNode();
			currentNode = goodTree.rootNode;
		}
	}</script>