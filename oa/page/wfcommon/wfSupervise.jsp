<%@include file="/internet/common.jsp"%>
<style type="text/css">
<!--
.STYLE1 {color: #FFFFFF}
.text_legend {	font-size: 18px;
	color: #BF0404;
	line-height: 24px;
	font-weight:bold;
	font-family: "������Բ��";
}
-->
</style>
<body>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;����</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		
		
	  </td>
    </tr>
  </table>

<form method="post" action="oa.pr.wfSuperviseDO.do">
		<html:hidden property="SendMsg/MsgFormat" value="1"/>
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
      
      <tr>
        <td height="110" align="center" valign="top" bgcolor="#FFFFFF" ><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr id="divid2">
            <td><table width="98%"  border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#A2C4DC">
              <tr>
                <td width="15%"  align="center"  class="td2">�� Ŀ</td>
                <td width="85%"  class="td1">
                <html:text property="WFSupervise/title" styleClass="input" size="70" maxlength="70" />                </td>
              </tr>
              <tr>
                <td width="15%" height="40" align="center"  class="td2">�� ��</td>
                <td width="85%" height="40"  class="td1">
                <html:textarea property="WFSupervise/content" styleClass="input" rows="4" cols="70"/>                </td>
              </tr>
              <tr>
			  <td  align="center"  class="td2">ѡ����Ա</td>
               <td  class="td1">
            <html:hidden property="WFSupervise/sendTo"/>
            <html:text property="WFSupervise/sendToName" styleClass="input" readonly="true" size="70" onchange="selMsg()"/>
            <input name="receiver" type="button" class="button_02" value="ѡ����Ա" elname="WFSupervise/sendTo,WFSupervise/sendToName"  onClick="selPerson('all',<bean:write property="SessionEntity/orgID"/>)" ></td>
          </tr>
              <tr>
                <td align="center"  class="td2">���췽ʽ</td>
                <td class="td1" >
				<html:checkbox property="SetTypeList/type[@num='0']"  value="1"/>����Ϣ
				<html:checkbox property="SetTypeList/type[@num='1']"   value="2" onclick="showEmail(this)"/>�ʼ�
				<html:checkbox property="SetTypeList/type[@num='2']"   value="3" onclick="showMsg(this)"/>����				</td>
              </tr>
              
              <tr id="trEmail" style="display:none">
                <td align="center" class="td2">�����ַ				</td>
                <td align="left" class="td1">
                <html:textarea property="WFSupervise/Email" styleClass="input" rows="2" cols="70"/> 
                (��"|"�Ÿ���)
				 </td>
              </tr>
              <tr id="trMsg" style="display:none">
                <td align="center" class="td2">���ź���</td>
                <td align="left" class="td1">
                <html:textarea property="WFSupervise/Msg"  styleClass="input" rows="2" cols="70"/>               
                (��"|"�Ÿ���)
                 </td>
              </tr>
            </table>
            <div align="center" >
              <br>
              <input type="button" value="�� ��" onClick="save()" class="button_02"/>
			&nbsp;&nbsp;
			<input type="button" value="�� ��" onClick="window.close()" class="button_02"/>
              </div>
            </td>
          </tr>
		 
       
        </table></td>
      </tr>
    </table>
</form>
</body>
<script>
	
	function save(){
		var frm = document.forms[0];
		if(frm.elements["WFSupervise/title"].value==""){
			alert("��������Ŀ");
			return;
		}
		if(frm.elements["WFSupervise/content"].value==""){
			alert("����������");
			return;
		}
		if(frm.elements["WFSupervise/sendTo"].value==""){
			alert("��ѡ����Ա");
			return;
		}
		if(frm.elements["SetTypeList/type[@num='2']"].checked){
			var msgValue = frm.elements["WFSupervise/Msg"].value;
			if(msgValue != ""){
				var temp = msgValue.split("|");
				for( i=0 ;i< temp.length;i++){
					if(!checkMobile(temp[i])){
						alert("�ֻ��������� �����飡");
						 return;
					}
					
				}
				frm.elements["SendMsg/MsgFormat"].value=is_chinese(frm.elements["WFSupervise/content"].value);
			}
			
		}
		frm.submit();
		
	}

	function selPerson(type,orgID){
		selectSysUserWithOrg(type,orgID);
		getInfo();
	}
	function getInfo(){
		selMsg();
		selEmail();
	}
	
	function showEmail(obj){
		if(obj.checked)
			trEmail.style.display='';
		else
		 	trEmail.style.display='none';
	}
	function showMsg(obj){
		if(obj.checked)
			trMsg.style.display='';
		else
		 	trMsg.style.display='none';
	}
	
	function checkMobile(obj)
	{
		if(obj.length!=11) return false;
		else if(obj.substring(0,1)!="1") return false;
		else if(isNaN(obj)) return false;
		else return true;
	}
	function is_chinese(elem){
		var pattern=/[^\x00-\xff]/g;
		if(pattern.test(elem)){
		  //��������	
			return 1;
		}else{	  //����������
		  return 0;
		}
	}
</script>
<script language="javascript">
	var http_requestMsg = false;
	var http_requestEmail = false;
	// ��������Ϣ�ĺ���
    function processRequestMsg() {
        if (http_requestMsg.readyState == 4) { // �ж϶���״̬
            if (http_requestMsg.status == 200) { // ��Ϣ�Ѿ��ɹ����أ���ʼ������Ϣ
                //alert(http_request.responseText);
				document.forms[0].elements["WFSupervise/Msg"].innerHTML = http_requestMsg.responseText;
            } else { //ҳ�治����
                alert("���������ҳ�����쳣��");
            }
        }
    }
	// ��������Ϣ�ĺ���
    function processRequestEmail() {
        if (http_requestEmail.readyState == 4) { // �ж϶���״̬
            if (http_requestEmail.status == 200) { // ��Ϣ�Ѿ��ɹ����أ���ʼ������Ϣ
                //alert(http_request.responseText);
				document.forms[0].elements["WFSupervise/Email"].innerHTML = http_requestEmail.responseText;
            } else { //ҳ�治����
                alert("���������ҳ�����쳣��");
            }
        }
    }
	function selMsg() {
		var ids = document.forms[0].elements["WFSupervise/sendTo"].value;
		var url = "oa.pr.ajaxGetMsgAdds.do?ids="+ids;
		http_requestMsg = false;
		//��ʼ��ʼ��XMLHttpRequest����
		if(window.XMLHttpRequest) { //Mozilla �����
			http_requestMsg = new XMLHttpRequest();
			if (http_requestMsg.overrideMimeType) {//����MiME���
				http_requestMsg.overrideMimeType('text/xml');
			}
		}
		else if (window.ActiveXObject) { // IE�����
			try {
				http_requestMsg = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					http_requestMsg = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {}
			}
		}
		if (!http_requestMsg) { // �쳣����������ʵ��ʧ��
			window.alert("���ܴ���XMLHttpRequest����ʵ��.");
			return false;
		}
		http_requestMsg.onreadystatechange = processRequestMsg;
		// ȷ����������ķ�ʽ��URL�Լ��Ƿ�ͬ��ִ���¶δ���
		http_requestMsg.open("GET", url, true);
		http_requestMsg.send(null);
	}
	function selEmail() {
		var ids = document.forms[0].elements["WFSupervise/sendTo"].value;
		var url = "oa.pr.ajaxGetEmails.do?ids="+ids;
		http_requestEmail = false;
		//��ʼ��ʼ��XMLHttpRequest����
		if(window.XMLHttpRequest) { //Mozilla �����
			http_requestEmail = new XMLHttpRequest();
			if (http_requestEmail.overrideMimeType) {//����MiME���
				http_requestEmail.overrideMimeType('text/xml');
			}
		}
		else if (window.ActiveXObject) { // IE�����
			try {
				http_requestEmail = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					http_requestEmail = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {}
			}
		}
		if (!http_requestEmail) { // �쳣����������ʵ��ʧ��
			window.alert("���ܴ���XMLHttpRequest����ʵ��.");
			return false;
		}
		http_requestEmail.onreadystatechange = processRequestEmail;
		// ȷ����������ķ�ʽ��URL�Լ��Ƿ�ͬ��ִ���¶δ���
		http_requestEmail.open("GET", url, true);
		http_requestEmail.send(null);
	}
	
	
</script>