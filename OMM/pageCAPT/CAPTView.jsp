<%@include file="/internet/common.jsp"%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="24" background="/internet/image/lz_bg.gif">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="15"></td>
						<td class="text_wirte">��ά����&gt;IT�豸����&gt;�豸�⡪&gt;��ϸ��Ϣ</span></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="5"></td>
		</tr>
	</table>
<form>
	<html:hidden property="CAPT_CAPITALINFO/STATE" value="1" />
	<div style="display: none" id="printTable">�ʲ���</div>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">

		<tr>
			<td height="5"></td>
		</tr>
	</table>
	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td height="15"></td>
		</tr>
		<tr>
			<td>
				<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td valign="top" class="text">
							<table width="800" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
								<tr height="50" style="background-color: ebebeb;">
									<TD colspan="5" align="center"><B>��������</B></TD>
								</tr>
								<tr class="td_title">
									<td width="300" align="center" nowrap id="OMM_ExtProperty.ExtPropertyName">��������</td>
									<td width="500" align="center" nowrap id="OMM_ExtProperty.ExtPropertyValue">����ֵ</td>
								</tr>

								<tr>

									<td align="center" nowrap="nowrap" class="td2">�ʲ����룺</td>
									<td colspan="3" nowrap="nowrap" class="td1"><%
        String code = base.util.TalentContext.getValue(pageContext, null,
                "CAPT_CAPITALINFO/CAPTCODE");
        String imgPath = "";
        if (code != null && !"".equals(code)) {
            imgPath = common.assets.Barcode.getImgPath(code, request, 180, 100);
            %> <img src="<%=imgPath%>"> <%}%></td>
								</tr>

								<tr>
									<td align="center" nowrap="nowrap" class="td2">�ʲ����룺</td>
									<td nowrap="nowrap" colspan="3"  class="td1">
										<bean:write property="CAPT_CAPITALINFO/BARCODE" />
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="center" class="td2">�ʲ��������ţ�</td>
									<td nowrap="nowrap" class="td1" colspan="3">
										<bean:write property="CAPT_CAPITALINFO/OWNERNAME" />

									</td>
								</tr>
								<tr>
									<td align="center" nowrap="nowrap" class="td2">�ʲ����ͣ�</td>
									<td nowrap="nowrap" class="td1" colspan="3">
										<bean:write property="CAPT_CAPITALINFO/TYPENAME" />
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="center" class="td2">������λ��</td>
									<td nowrap="nowrap" class="td1" colspan="3">
										<dict:write businTypeId="dx_unit" property="CAPT_CAPITALINFO/UNITCODE" />
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="center" class="td2">�ʲ����ƣ�</td>
									<td nowrap="nowrap" colspan="3" class="td1">
										<bean:write property="CAPT_CAPITALINFO/CAPTNAME" />
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="center" class="td2">�������̣�</td>
									<td nowrap="nowrap" colspan="3" class="td1">
										<bean:write property="CAPT_CAPITALINFO/MANUFACTURE" />
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="center" class="td2">Ʒ&nbsp;&nbsp;&nbsp;&nbsp;�ƣ�</td>
									<td nowrap="nowrap" class="td1" colspan="3">
										<bean:write property="CAPT_CAPITALINFO/BRANDNAME" />
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="center" class="td2">����ͺţ�</td>
									<td nowrap="nowrap" class="td1" colspan="3">
										<bean:write property="CAPT_CAPITALINFO/SPECIA" />
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="center" class="td2">�� Ӧ �̣�</td>
									<td nowrap="nowrap" class="td1" colspan="3">
										<bean:write property="CAPT_CAPITALINFO/PROVNAME" />
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="center" class="td2">�ۺ�����̣�</td>
									<td nowrap="nowrap" colspan="3" class="td1">
										<bean:write property="CAPT_CAPITALINFO/VINDNAME" />
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="center" class="td2">������ڣ�</td>
									<td nowrap="nowrap" class="td1" colspan="3">
										<bean:write property="CAPT_CAPITALINFO/HQDATE"
											formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd" />

									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="center" class="td2">�������ڣ�</td>
									<td nowrap="nowrap" class="td1" colspan="3">
										<bean:write property="CAPT_CAPITALINFO/QLDATE"
											formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd" />

									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="center" class="td2">����۸�</td>
									<td nowrap="nowrap" class="td1" colspan="3">
										<bean:write property="CAPT_CAPITALINFO/PRICE" language="zh" country="CN" />
										Ԫ</td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="center" class="td2">�ɹ��ʽ���Դ��</td>
									<td nowrap="nowrap" class="td1" colspan="3">
										<bean:write property="CAPT_CAPITALINFO/FUNDORIGIN" />
									</td>
								</tr>
								<tr>

									<td nowrap="nowrap" align="center" class="td2">�������ޣ�</td>
									<td nowrap="nowrap" class="td1" colspan="3">
										<bean:write property="CAPT_CAPITALINFO/BXDATE"
											formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd" />

									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="center" class="td2">��&nbsp;&nbsp;&nbsp;&nbsp;ע��</td>
									<td nowrap="nowrap" colspan="3" class="td1">
										<bean:write property="CAPT_CAPITALINFO/REMARK" />
									</td>
								</tr>
								<tr height="50" style="background-color: ebebeb;">
									<TD colspan="5" align="center"><B>��չ����</B></TD>
								</tr>
								<tr class="td_title">
									<td width="300" align="center" nowrap="nowrap"   id="OMM_ExtProperty.ExtPropertyName">��������</td>
									<td width="500" align="center" nowrap="nowrap"   id="OMM_ExtProperty.ExtPropertyValue" colspan="3">����ֵ</td>
								</tr>
								<logic:iterate id="resultset" property="list[@type='OMM_ExtProperty']">
									<tr>
										<td nowrap="nowrap"  align="center" class="td2">
											<bean:write id="resultset" property="OMM_ExtProperty/ExtPropertyName" />
											��</td>
										<td nowrap="nowrap"  align="left" class="td1" colspan="3">
											<bean:write id="resultset" property="OMM_ExtProperty/ExtPropertyValue" />
										</td>
									</tr>
								</logic:iterate>
							</table>
							<BR>
							<BR>
							<table width="98%" height="30" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td align="center"><!--<input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()"> <input
											name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()"> --><input name="Button"
											type="button" class="button_02" value="�� ��" onClick="javascript:history.go(-1)"></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</form>
<form name="exportform" method="post" target="_blank"><input type="hidden" name="title" value="�ʲ���"> <input
		type="hidden" name="xmlfcc"></form>