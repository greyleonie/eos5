<%@include file="/internet/common.jsp"%>
<body>
	<form method="post" action="OMM.prTypeExt.prOMM_TypeExtPropertyQuery.do">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="24" background="image/lz_bg.gif">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" id="printTable">
						<tr>
							<td width="15"></td>
							<td class="text_wirte">��ά����&gt;IT�豸����&gt;�豸���͡�&gt;��չ����
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="5">
				<input type="hidden" name="queryaction" value="OMM.prTypeExt.prOMM_TypeExtPropertyQuery.do"> 
				<input type="hidden" name="addaction" value='OMM.prTypeExt.prToAddTypeExtPropertyTypeId.do?OMM_DevType/TypeID=<bean:write property="OMM_DevType/TypeID" />'> 
				<input type="hidden" name="modifyaction" value="OMM.prTypeExt.prOMM_TypeExtPropertyUpdate.do"> 
				<input type="hidden" name="deleteaction" value="OMM.prTypeExt.prOMM_TypeExtPropertyDelete.do">
				<input type="hidden" name="viewaction" value="">
				<input type="hidden" name="modifytoSave" value="">
				<html:hidden property="OMM_TypeExtProperty/_order/col1/field" />
				<html:hidden property="OMM_TypeExtProperty/_order/col1/asc" />
				<html:hidden property="OMM_TypeExtProperty/TypeExtPropertyID/criteria/value" />
				<html:hidden property="OMM_TypeExtProperty/TypeExtPropertyID" />
				<html:hidden property="OMM_TypeExtProperty/ExtPropertyName" />
				<html:hidden property="PageCond/begin" />
				<html:hidden property="PageCond/count" />
				<html:hidden property="PageCond/length" />
				<INPUT value="like" type="hidden" name="OMM_TypeExtProperty/ExtPropertyName/criteria/operator">
				<INPUT value="center" type="hidden" name="OMM_TypeExtProperty/ExtPropertyName/criteria/likeRule"></td>
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
							<td height="30" class="text"><a title='�ؼ��ֿ�����"��������"' id="keytitle">��չ��������</a>��
							<html:text property="OMM_TypeExtProperty/ExtPropertyName/criteria/value" attributesText="class='input'"/>
							<input name="query" type="button" class="button_02" value="�� ѯ" onClick="talentquery()"> 
							<input name="add" type="button" class="button_02" value="�� ��" onClick="extPropertyAdd()"> 
							<input name="delete" type="button" class="button_02" value="ɾ ��" onClick="talentdelete()"> 
							<input name="modifyandsave" type="button" class="button_02" value="�� ��" onClick="talentmodify()">
							<input name="wfcancel" type="button" class="button_02" value="�� ��" onClick="backTo()">
							<!--<input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()"> 
							<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()"> ���������
							<input type="checkbox" name="checkbox" onClick="servertoorder()" marked="">--></td>
						</tr>
						<tr>
							<td height="8"></td>
						</tr>
						<tr>
							<td valign="top" class="text">
								<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
									<tr class="td_title">
										<td width="3%" align="center" nowrap>
										<!--<input type="checkbox" name="checkbox" value="checkbox"onClick="eosCheckAll(document.forms[0],this)" marked=""></td>
										<td width="8%" align="center" nowrap id="OMM_TypeExtProperty.TypeID" onClick="talentsort()">���ͱ�ʶ��</td>-->
										<td width="8%" align="center" nowrap id="OMM_TypeExtProperty.ExtPropertyName" >��չ��������</td><!--onClick="talentsort()-->
										<td width="8%" align="center" nowrap id="OMM_TypeExtProperty.ExtPropertyMode">��չ����ģʽ</td>
										<td width="8%" align="center" nowrap id="OMM_TypeExtProperty.ExtPropertyOptions">��չ����ֵ</td>
										<!--<td width="8%" align="center" nowrap id="OMM_TypeExtProperty.TypeExtPropertyID" onClick="talentsort()">������չ����</td>-->
									</tr>
									<%
										int count = 0;
										String trClass = "result_content";
									 %>
									 <logic:iterate id="resultset" property="list">
									 	<%
									 		if(count % 2 == 0)
									 			trClass="td1";
									 		else
									 			trClass="td2";
									 		count++;
									 	 %>
									 	 <tr class="<%=trClass%>" onClick="changeTRBgColor(this)"
									 	 	onDblClick="talentviewf('<bean:write id="resultset" property="entity/ExtPropertyID"/>','false')">
											<td align="center">
												<logic:present id="resultset" property="entity/TypeID">
													<html:checkbox id="resultset" name="list[@name='update']/OMM_TypeExtProperty/TypeExtPropertyID" 
													property="entity/TypeExtPropertyID" indexed="true"/>
												</logic:present>
											</td><!--
											<td nowrap align="center" onClick="toEditable()">
												<bean:write id="resultset" property="OMM_TypeExtProperty/TypeID" />
											</td>-->
											<!--<td nowrap align="center">
												<bean:write id="resultset" property="OMM_TypeExtProperty/TypeID" />
											</td>-->
											<td nowrap align="center">
												<bean:write id="resultset" property="entity/ExtPropertyName" />
											</td>
											<td nowrap align="center">
												<logic:equal id="resultset" property="entity/ExtPropertyMode" value="1">�ı�</logic:equal>
												<logic:notEqual id="resultset" property="entity/ExtPropertyMode" value="1">������</logic:notEqual>
												<!--<bean:write id="resultset" property="OMM_TypeExtProperty/ExtPropertyMode" />-->
											</td>
											<td nowrap align="center">
												<bean:write id="resultset" property="entity/ExtPropertyOptions" />
											</td>
											
											<!--<td nowrap onClick="toEditable()">&nbsp;
												<A href='#?OMM_TypeExtProperty/TypeExtPropertyID=<bean:write id="resultset" property="OMM_TypeExtProperty/TypeExtPropertyID" />'>����</A>
											</td>-->
										</tr>
									 </logic:iterate>
								</table>
							</td>
						</tr>
					</table>
				</td>	
			</tr>
		</table>
	</form>
</body>
<script>

	var userID = <bean:write property="SessionEntity/operatorID" /> ;

	function extPropertyAdd(){
		window.location.href='OMM.prTypeExt.prToAddTypeExtPropertyTypeId.do?OMM_DevType/TypeID=<bean:write property="OMM_DevType/TypeID" />';
	}
	
	function modifyExtProperty(){
		var frm =document.forms[0];
	 	var i=0;
		var j=0;
		eles = frm.elements;
		while(i<eles.length){
			obj= eles[i];
			if(obj.type == "checkbox" && !obj.disabled && obj.getAttribute("marked")==null){
				if(obj.checked){
				    j++;
				    if(j>1){
				    	alert("ֻ��ѡ��һ����¼");
				    	return ;
				    }
				    /*var ManagerID = obj.getAttribute("ManagerID");
				    if(userID != ManagerID ){
				    	alert("��û�в���Ȩ�ޣ�");
				    	return ;
				    }*/
				}
			}
			i++;
		}
		if(j==0){
			alert("��ѡ��һ����¼");
			return ;
		}
		fid = getChechedValue(frm);
		frm.action = frm.elements["modifytoSave"].value;
		frm.submit();
		
	}
	
	function showOptions(){
		if(mode==1){
			colHTML += "<input type='text' name='xxx'/>";
		}else{
			colHTML += "<select name='xxx'>";
			var test="";
			test=option+"";
			var temp=test.split("|");
			for(var i=0;i<temp.length;i++){
				colHTML += "<option value='"+temp[i]+"'>"+temp[i]+"</option>";
			}
			colHTML += "</select>";
		}
	}
	
	function backTo(){
		window.location.href="OMM.pr.prGetTypeList.do?menuID=DX_OMMSYS_CAPTMGR_TYPEMGR";
		
	}

</script>