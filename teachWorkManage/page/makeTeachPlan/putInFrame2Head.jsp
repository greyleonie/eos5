<%@include file="/internet/common.jsp"%>


<title>��ѧ�ƻ�����-&gt;�ύ�쵼���</title>
<body>
<form name="postForm" method="post">

  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ -&gt; ������� -&gt;��ѧ�ƻ�����   
              -&gt;
            <logic:equal property="TeachingPlan/State" value="1">�ύ�쵼���</logic:equal>
            <logic:in property="TeachingPlan/State" value="-4,3">�ύ�쵼����</logic:in>
              </td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8">     
       <html:hidden property="TeachingPlan/PlanID"/>
      <logic:equal property="TeachingPlan/State" value="1">        
         <html:hidden property="TeachingPlan/State" value="2"/>
         <html:hidden property="TeachingPlan/LeaderID"/>  
      </logic:equal><!--�ύ�����-->
      <logic:in property="TeachingPlan/State" value="-4,3">
        <html:hidden property="TeachingPlan/State" value="4"/>
        <html:hidden property="TeachingPlan/LeaderID2"/>       
      </logic:in>
   <input type="hidden" name="targetValue" value="1">
       </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr  onClick="changeTRBgColor(this)" >
            <td align="right" class="td2">��&nbsp;&nbsp;&nbsp;&nbsp;����</td>
            <td class="td1"><bean:write property="className"/></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">�ƻ����ƣ�</td>
            <td class="td1"><bean:write property="TeachingPlan/PlanName"/></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">
             <logic:equal property="TeachingPlan/State" value="1"> ������ݣ�</logic:equal>
            <logic:in property="TeachingPlan/State" value="-4,3"> �������ݣ�</logic:in>
           </td>
            <td class="td1">
            <logic:equal property="TeachingPlan/State" value="1">��ѧ�ƻ����</logic:equal>
            <logic:in property="TeachingPlan/State" value="-4,3">��ѧ�ƻ��γ�</logic:in>
           
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
               <td align="right" class="td2">
            <logic:equal property="TeachingPlan/State" value="1">����쵼��</logic:equal>
            <logic:in property="TeachingPlan/State" value="-4,3">�����쵼��</logic:in>           
            </td>
            <td class="td1"><input name="leader" readonly="true" class="input" type="text">
             <logic:equal property="TeachingPlan/State" value="1">
             <input name="Button" type="button" class="button_02" value="ѡ ��" elname="TeachingPlan/LeaderID,leader" onClick="selectHead('yes')"> 
           </logic:equal>
               <logic:in property="TeachingPlan/State" value="-4,3">
             <input name="Button" type="button" class="button_02" value="ѡ ��" elname="TeachingPlan/LeaderID2,leader" onClick="selectHead('yes')"> 
           </logic:in>
            <font color="#FF0000">*</font> </td>
          </tr>
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Submit" type="button" class="button_02" value="�� ��" onclick="save()">&nbsp;   
                <input name="Submit2" type="button" class="button_02" value="ȡ ��" onclick="window.close()"></td>
            </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
</form>
</body>
<script>
var msg='<bean:write property="msg"/>';
if(msg!=""){
  alert(msg);
  window.close();
}
</script>
<script language="javascript">
var frm=document.postForm;

function save(){
var state=frm.elements["TeachingPlan/State"].value;

if(state=="2"){
 if(frm.elements["TeachingPlan/LeaderID"].value==""){
   alert("��ѡ���쵼��");
   return;
 }
}

if(state=="4"){
 if(frm.elements["TeachingPlan/LeaderID2"].value==""){
   alert("��ѡ���쵼��");
   return;
 }
}
 frm.action="teachWorkManage.prMakeTeachPlan.sendFrame2Leader.do";
 frm.submit();
}

function selectHead(single){
  selectSysUser(single);
}

 function selectSysUser(single){
	var btn = event.srcElement;
	var frm = btn.form;
	var url = "";
	var date = new Date();
	var fccargs = date.getTime();
	var height = 500;
	var name = btn.elname;
	var names = name.split(",");
	
	if(single == null) single = "no";
	url = "teachWorkManage.prMakeTeachPlan.selectHead.do?fccargs=" + fccargs + "&single=" + single+"&orgId="+document.forms[0].elements["targetValue"].value;
	
	
	if((names.length%2)!=0){
		return false;
	}
	var values = [];
	var j =0;
	for(var i=0;i<names.length;i=i+2){
		values[j++] = frm.elements[names[i]].value;//id��ֵ
	}
	values[values.length] = btn.name;
	
	
	var retArr = window.showModalDialog(url,values,"dialogHeight: " + height + "px; dialogWidth: 500px; center: Yes; help: no; resizable: no; status: no;");
	
	
	if(retArr!=null){
		var obj = null;
		var j = 0;
		for(var i=0;i<retArr.length;i++){
			obj = retArr[i];
			frm.elements[names[j++]].value=retArr[i].value;
			frm.elements[names[j++]].value=retArr[i].text;
		}	
	}
}
</script>