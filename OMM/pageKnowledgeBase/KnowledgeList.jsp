<%@include file="/internet/common.jsp"%>
<body>
	<form method="post" action="OMM.prKnowledgeBase.prKnowledgeBaseList.do">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="24" background="image/lz_bg.gif">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" id="printTable">
						<tr>
							<td width="15"></td>
							<td class="text_wirte">��ά����&gt;��ά���̡�&gt;֪ʶ�����&gt;֪ʶ�б�
								<!--<bean:write property="OMM_DevType/TypeName" />-->
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="5"><input type="hidden" name="queryaction" value="OMM.prKnowledgeBase.prKnowledgeBaseList.do"> <input type="hidden"
						name="addaction" value="OMM.prKnowledgeBase.prKnowledgeBaseAdd.do"> <input type="hidden" name="modifyaction" value=""> <input
						type="hidden" name="deleteaction" value="OMM.prKnowledgeBase.prKnowledgeBaseDel.do"> <input type="hidden" name="viewaction" value="OMM.prKnowledgeBase.prKnowledgeBaseView">
					<html:hidden property="OMM_KnowledgeBase/_order/col1/field" />
					<html:hidden property="OMM_KnowledgeBase/_order/col1/asc" />
					<html:hidden property="OMM_KnowledgeBase/KnowledgeBaseID/criteria/value" />
					<html:hidden property="OMM_KnowledgeBase/KnowledgeBaseID" />
					<html:hidden property="OMM_KnowledgeBase/KnowledgeSN" />
					<html:hidden property="PageCond/begin" />
					<html:hidden property="PageCond/count" />
					<html:hidden property="PageCond/length" />
					<INPUT value="like" type="hidden" name="OMM_KnowledgeBase/KnowledgeSN/criteria/operator"> <INPUT value="center"
						type="hidden" name="OMM_KnowledgeBase/KnowledgeSN/criteria/likeRule"></td>
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
							<td height="30" class="text"><a title='�ؼ��ֿ�����"֪ʶ���"' id="keytitle">֪ʶ���</a>��
								<html:text property="OMM_KnowledgeBase/KnowledgeSN/criteria/value" attributesText='class="input"' />
								<input name="query" type="button" class="button_02" value="�� ѯ" onClick="talentquery()"> <input name="add"
									type="button" class="button_02" value="�� ��" onClick="typeAdd()"> <input name="delete" type="button"
									class="button_02" value="ɾ ��" onClick="talentdelete()">  <input name="ieprint" type="button"
									class="button_02" value="�� ӡ" onClick="iePrint()"> <input name="export" type="button" class="button_02"
									value="�� ��" onClick="exporttoexcel()"> ���������<input type="checkbox" name="checkbox" onClick="servertoorder()"
									marked=""></td>
						</tr>
						<tr>
							<td height="8"></td>
						</tr>
						<tr>
							<td valign="top" class="text">
								<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
									<tr class="td_title">
										<td width="3%" align="center" nowrap><input type="checkbox" name="checkbox" value="checkbox"
												onClick="eosCheckAll(document.forms[0],this)" marked=""></td>
										<td width="15%" align="center" nowrap id="OMM_DevType.TypeName" onClick="talentsort()">��������</td>
										<td width="15%" align="center" nowrap id="OMM_DevType.TypeCode" onClick="talentsort()">���ͱ��</td>
										<td width="8%" align="center" nowrap id="OMM_DevType.TypeID" onClick="talentsort()">������չ����</td>
									</tr>
									<%
        int count = 0;
        String trClass = "result_content";

        %>
									<logic:iterate id="resultset" property="list[@type='OMM_DevType']">
										<%if (count % 2 == 0)
            trClass = "td1";
        else
            trClass = "td2";
        count++;
        %>
										<tr class="<%=trClass%>" onClick="changeTRBgColor(this)"
											onDblClick="talentviewf('<bean:write id="resultset" property="OMM_DevType/TypeID"/>','false')">
											<td align="center">
												<logic:present id="resultset" property="OMM_DevType/TypeID">
													<html:checkbox id="resultset" name="list[@name='update']/OMM_DevType/TypeID" property="OMM_DevType/TypeID"
														indexed="true" />
												</logic:present>
											</td>
											<td nowrap align="center" onClick="toEditable()">
												<bean:write id="resultset" property="OMM_DevType/TypeName" />
											</td>
											<td nowrap align="center" onClick="toEditable()">
												<bean:write id="resultset" property="OMM_DevType/TypeCode" />
											</td>
											<td nowrap align="center">&nbsp; <A
													href='OMM.prTypeExt.prGetTypeExtProList.do?OMM_DevType/TypeID=<bean:write id="resultset" property="OMM_DevType/TypeID" />'>����</A></td>
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
<script>

	function typeAdd() {
		window.location.href="OMM.pr.prToAddType.do";
	}
</script>