<%@include file="/internet/common.jsp"%>
<html:html locale="true">
<head>
	<title>��ֵ����</title>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<!-- ��ȡ������ -->
	<script language="javascript">

		var GetterEnable;//�ж��Ƿ������ֵΪ0�򲻶�����
		var lastCardID;//��������ֵ�Ŀ�ID

		function ShowOldCardCoverNO() {
			cardForm.elements["Card/oldCardCoverNO"].disabled="";
			cika.style.display="block";
		}

		function HideOldCardCoverNO() {
			cardForm.elements["Card/oldCardCoverNO"].disabled="ture";
			cika.style.display="none";
		}

		function isContainChar(srcString,chr,len,mode) {
			rtv = false;
			match = 0;
			for (i=0;i<srcString.length;i++) {
				if (mode) {
					if ( chr==srcString.charAt(i)) {
						match++;
					}
				} else{
					if (chr.toLowerCase()==srcString.charAt(i).toLowerCase()) {
						match++;
					}
				}
			}
			if (match>=len) {
				rtv = true;
			}
			return rtv;
		}

		function start() {
			cardcontrol.Init(0);
			GetterEnable=1;
			if (curCardForm.elements["Card/operatorName"].value.length==0 && curCardForm.elements["Card/CardLastSum"].value.length==0) 
				lastCardID=-1;//����ҳ��δ�ſ�֮ǰlastCardIDΪ-1
			else {
				lastCardID=cardForm.elements["Card/CardID"].value;
			}
			GetCardID();
		}

		function GetCardID() {
			setTimeout("GetCardID();",1000);
			var id=cardcontrol.GetCardIDWithoutInfo();
			var errinfo="�˿���δע����߻�δʹ�ã�";
			if (GetterEnable==1 && id>0 && lastCardID!=id) {
				var data2=cardcontrol.ReadData(7,2);
				lastCardID=id;
				//cardcontrol.Beep(100);
				if (data2.length==0) {
					GetterEnable=0;
					errinfo="�˿���δע���뵳У���⣡";
					alert(errinfo);
					curCardForm.elements["Card/operatorName"].value=errinfo;
					curCardForm.elements["Card/CardLastSum"].value=errinfo;
					return;
				} else if (data2==0 || isContainChar(data2,"f",30,false)) {
					//2��ȫΪ0��Ϊδע�Ῠ�����߳���25��f�ַ���Ҳ��Ϊδע�Ῠ
					GetterEnable=0;
					errinfo="�˿���δ����ʹ�ã��뷢�����ٳ�ֵ��";
					alert(errinfo);
					curCardForm.elements["Card/operatorName"].value=errinfo;
					curCardForm.elements["Card/CardLastSum"].value=errinfo;
					return;
				}
				if ((curCardForm.elements["Card/fromCardData0"].value=cardcontrol.ReadData(7,0)).length==0) {
					GetterEnable=0;
					alert(errinfo);
					curCardForm.elements["Card/operatorName"].value=errinfo;
					curCardForm.elements["Card/CardLastSum"].value=errinfo;
				} else if ((curCardForm.elements["Card/fromCardData1"].value=cardcontrol.ReadData(7,1)).length==0) {
					GetterEnable=0;
					alert(errinfo);
					curCardForm.elements["Card/operatorName"].value=errinfo;
					curCardForm.elements["Card/CardLastSum"].value=errinfo;
				} else{
					curCardForm.elements["Card/CardID"].value=id;
					curCardForm.submit();
					cardcontrol.Beep(100);
					cardcontrol.Quit();
				}
			}
		}

		function Forward() {
			window.navigate("ICCard.prDeposit.cardDeposit.do");
		}

		function goBack() {
			window.navigate("ICCard.prDeposit.depositList.do");
		}

		function doCheckClock() {
			var sum=cardForm.elements["Card/depositsum"].value;
			var array = sum.split(".");
			if (isNaN(sum)) {
				alert("��������ȷ�Ľ�");
				return false;
			} else if (parseFloat(sum)+parseFloat(cardForm.elements["Card/CardLastSum"].value)>=10000) {
				alert("�ܽ��ó���10000Ԫ��");
				return false;
			} else if (parseInt(array[1])>=100) {
				alert("���ֻ�ܾ�ȷ��С�������λ��");
				return false;
			} else if (sum<=0) {
				alert("�俨���������0��");
				return false;
			} else{
				return true;
			}
		}

		function doSubmit() {
			if (doCheckClock()) {
				cardForm.submit();
			}
		}
	</script>
	<!--<script language="javascript">

		var lastCardID;

		function ShowOldCardCoverNO() {
			cardForm.elements["Card/oldCardCoverNO"].disabled="";
			cika.style.display="block";
		}

		function HideOldCardCoverNO() {
			cardForm.elements["Card/oldCardCoverNO"].disabled="ture";
			cika.style.display="none";
		}

		function isContainChar(srcString,chr,len,mode) {
			rtv = false;
			match = 0;
			for (i=0;i<srcString.length;i++) {
				if (mode) {
					if ( chr==srcString.charAt(i)) {
						match++;
					}
				} else{
					if (chr.toLowerCase()==srcString.charAt(i).toLowerCase()) {
						match++;
					}
				}
			}
			if (match>=len) {
				rtv = true;
			}
			return rtv;
		}

		function start() {
			cardcontrol.Init(0);
			if (curCardForm.elements["Card/operatorName"].value.length==0 && curCardForm.elements["Card/CardLastSum"].value.length==0) 
				lastCardID=-1;
			else{
				lastCardID=cardForm.elements["Card/CardID"].value;
		//		alert(lastCardID);
			}
			GetCardID();
		}

		function GetCardID() {
			setInterval("GetCardID();",1000);
			var id=cardcontrol.GetCardIDWithoutInfo();
			var errinfo="�˿���δע����߻�δʹ�ã�";
			if (lastCardID!=id) {
				//		alert("id:"+id+";lastCardID:"+lastCardID);
				if (id>0) {
					lastCardID=id;
					cardcontrol.Beep(100);
					var data2=cardcontrol.ReadData(7,2);
					if (data2.length==0) {
						errinfo="�˿���δע���뵳У���⣡";
						alert(errinfo);
						curCardForm.elements["Card/operatorName"].value=errinfo;
						curCardForm.elements["Card/CardLastSum"].value=errinfo;
						return;
					} else if (data2==0 || isContainChar(data2,"f",30,false)) {
						//2��ȫΪ0��Ϊδע�Ῠ�����߳���25��f�ַ���Ҳ��Ϊδע�Ῠ
						errinfo="�˿���δ����ʹ�ã��뷢�����ٳ�ֵ��";
						alert(errinfo);
						curCardForm.elements["Card/operatorName"].value=errinfo;
						curCardForm.elements["Card/CardLastSum"].value=errinfo;
						return;
					}
					if ((curCardForm.elements["Card/fromCardData0"].value=cardcontrol.ReadData

(7,0)).length==0) {
						alert(errinfo);
						curCardForm.elements["Card/operatorName"].value=errinfo;
						curCardForm.elements["Card/CardLastSum"].value=errinfo;
					} else if ((curCardForm.elements["Card/fromCardData1"].value=cardcontrol.ReadData

(7,1)).length==0) {
						alert(errinfo);
						curCardForm.elements["Card/operatorName"].value=errinfo;
						curCardForm.elements["Card/CardLastSum"].value=errinfo;
					} else{
						curCardForm.elements["Card/CardID"].value=id;
						curCardForm.submit();
						cardcontrol.Quit();
					}
				} 
			}
		}

		function Forward() {
			window.navigate("ICCard.prDeposit.cardDeposit.do");
		}

		function goBack() {
			window.navigate("ICCard.prDeposit.depositList.do");
		}

		function doCheckClock() {
			var sum=cardForm.elements["Card/depositsum"].value;
			var balance=cardForm.elements["Card/CardLastSum"].value;
			var array = sum.split(".");
			if (isNaN(sum)) {
				alert("��������ȷ�Ľ�");
				return false;
			} else if (parseFloat(sum)+parseFloat(cardForm.elements["Card/CardLastSum"].value)>=10000) {
				alert("�ܽ��ó���10000Ԫ��");
				return false;
			} else if (parseInt(array[1])>=100) {
				alert("���ֻ�ܾ�ȷ��С�������λ��");
				return false;
			} else if (sum<=0) {
				alert("�俨���������0��");
				return false;
			} else if (balance<0) {
				alert("�ÿ����С��0�����������⣬���ܳ�ֵ��");
				return false;
			} else{
				return true;
			}
		}

		function doSubmit() {
			if (doCheckClock()) {
				cardForm.submit();
			}
		}
	</script>
-->
</head>
<body class="Standard-BodyStyle" topmargin="0" leftmargin="0" style="overflow-y:scroll" onLoad="start()"
	onunload="cardcontrol.Quit()">
	<!-- ������ -->
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="24" background="/internet/image/lz_bg.gif">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="15"></td>
						<td class="text_wirte">��ҳ��&gt;һ��ͨ��&gt;����ֵ</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="5"></td>
		</tr>
	</table>
	<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td width="22%">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="12" align="left" bgcolor="#4A82D1"><img src="/internet/image/left_01.gif" width="12" height="23"></td>
						<td width="271" align="center" bgcolor="#4A82D1" class="textb_wirte">����ֵ</td>
						<td width="18" align="right" bgcolor="#4A82D1"><img src="/internet/image/left_02.gif" width="12" height="23"></td>
					</tr>
				</table>
			</td>
			<td width="60%" valign="bottom">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td align="right"><span class="td1"> <input name="button" type="button" class="button_02" onClick="goBack()"
									value="�� ��" /> </span></td>
					</tr>
				</table>
				<table width="100%" height="4" border="0" cellpadding="0" cellspacing="0" bgcolor="#4A82D1">
					<tr>
						<td></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="2" colspan="2"></td>
		</tr>
	</table>
	<table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#A2C4DC">
		<tr>
			<td width="12%" class="td2" nowrap>����˵��</td>
			<td width="88%" class="td1">���IC�����ڶ������ϣ���ȷ��д�俨���󣬼��ɽ��г�ֵ������</td>
		</tr>
		<form name="curCardForm" action="ICCard.prDeposit.cardDeposit.do" method="POST">
		<tr>
			<td width="12%" class="td2" nowrap>�� �� ��</td>
			<td width="88%" class="td1" align="left">
				<html:text property="Card/operatorName" styleClass="input" size="30" readonly="true" />
			</td>
		</tr>
		<tr>
			<input type="hidden" name="Card/CardID" />
			<input type="hidden" name="Card/fromCardData0" />
			<input type="hidden" name="Card/fromCardData1" />
			<td width="12%" class="td2" nowrap>�������</td>
			<td width="88%" class="td1" align="left">
				<html:text property="Card/CardLastSum" styleClass="input" size="30" readonly="true" />
				(����ң�Ԫ)</td>
		</tr>
		</form>
		<html:form action="ICCard.prDeposit.cardDepositDO.do" method="POST" name="cardForm">
			<html:hidden property="Card/CardID" />
			<html:hidden property="Card/fromCardData0" />
			<html:hidden property="Card/fromCardData1" />
			<html:hidden property="Card/CardLastSum" />
			<tr>
				<td width="12%" class="td2" nowrap>�����Դ</td>
				<td width="88%" class="td1" align="left"><input type="radio" name="Card/moneysource" value="1"
						onclick="HideOldCardCoverNO()" checked="true" />�ֽ� <input type="radio" name="Card/moneysource" value="2"
						onclick="ShowOldCardCoverNO()" />�ſ�</td>
			</tr>
			<tr style="display:none" id="cika">
				<td width="12%" class="td2" nowrap>�ſ����</td>
				<td width="88%" class="td1">
					<html:text property="Card/oldCardCoverNO" styleClass="input" size="30" disabled="true" />
				</td>
			</tr>
			<tr>
				<td width="12%" class="td2" nowrap>�俨���</td>
				<td width="88%" class="td1" align="left">
					<html:text property="Card/depositsum" styleClass="input" size="30" />
					(����ң�Ԫ)</td>
			</tr>
			<!--
			<tr>
				<td width="12%" class="td2" nowrap>�Ƿ񿪷�Ʊ</td>
				<td width="88%" class="td1" align="left"><input type="radio" name="Card/isInVoiced" value="1" checked="true" />��&nbsp;&nbsp;
					<input type="radio" name="Card/isInVoiced" value="0" />��</td>
			</tr>
			-->
			<tr>
				<td width="12%" class="td2" nowrap></td>
				<td width="88%" class="td1"><!--<input type="button" value="�� ��" onClick="Forward()" class="button_02"/>--> 
				<input type="button" value="�� ��" onClick="Forward()" class="button_02" />
					<logic:present property="Card/CardLastSum">
						<html:button styleClass="button_02" property="button" onclick="doSubmit()" value="�� ֵ" />
					</logic:present>
					<logic:notPresent property="Card/CardLastSum">
						<html:button styleClass="button_02" property="button" onclick="doSubmit()" value="�� ֵ" disabled="true" />
					</logic:notPresent>
				</td>
			</tr>
		</html:form>
	</table>
</body>
<OBJECT ID="Card Control" WIDTH="" HEIGHT="" CLASSID="CLSID:AEA5E7AD-4A2F-44BE-88FE-0CF9A8E648D4"
	codebase="/internet/ActiveX/card.cab" name="cardcontrol"> </OBJECT>
</html:html>