<%@include file="/internet/common.jsp"%>

<body>
<form>

  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;��ѧ�ƻ����ơ�&gt;��������</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8">
      <html:hidden property="Subjects/SubjectID"/>
      <html:hidden property="isAdd"/>
       </td>
    </tr>
    <tr>
      <td class="text">
      <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
        <tr>
            <td align="right" class="td2">�γ̱��⣺</td>
            <td class="td1">
            <html:text maxlength="50" property="Subjects/SubjectName" attributesText='class="input" size="60" '/>
            </td>
          </tr>
          <tr>
            <td align="right" class="td2">�Ͽ����ڣ�</td>
            <td class="td1">
                <html:text property="Subjects/ClassTime[@pattern='yyyy-MM-dd']" attributesText='class="input" size="30"' readonly="true"/>
          <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["Subjects/ClassTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
           
          </td>
          </tr>
          <tr>
            <td align="right" class="td2">���</td>
            <td class="td1">
            <html:radio property="Subjects/ClassNoon" value="0"/>   
            ����
             <html:radio property="Subjects/ClassNoon" value="1"/>   
            ����
             <html:radio property="Subjects/ClassNoon" value="2"/>   
            ����
             <html:radio property="Subjects/ClassNoon" value="3"/>   
            ȫ��</td>
          </tr>
          <tr>
            <td align="right" class="td2">�Ƿ����룺</td>
            <td class="td1">
           <html:radio property="Subjects/IsOuter" value="0" onclick="setStatus(this)"/>
  �� 
    <html:radio property="Subjects/IsOuter" value="1" onclick="clearValue(this)"/>
              ��
           </td>
          </tr>
          <tr>
            <td align="right" class="td2">�ڿν�ʦ��</td>
            <td class="td1">
            <html:hidden property="Subjects/Teacher"/>
            <html:text maxlength="5" property="shouKe" readonly="true" attributesText='class="input" size="20" '/>
             <input name="btn" type="button" class="button_02" value="ѡ ��" elname="Subjects/Teacher,shouKe" onClick="selectSysUser('yes')"> 
          
            </td>
          </tr>
          
          <tr>
            <td align="right" class="td2">�������в���</td>
            <td class="td1">
            <html:select property="Subjects/TeachingGroupID" attributesText='id="printTable" '> 
              <html:option value="-1">--��ѡ����в�--</html:option> 
              <html:options property="list[@type='EOSORG_T_Organization']/EOSORG_T_Organization/orgid" labelProperty="list[@type='EOSORG_T_Organization']/EOSORG_T_Organization/orgname"/> 
              </html:select>
              </td>
          </tr>
          <tr>
            <td align="right" class="td2">�����ʦ������</td>
            <td class="td1">
            <html:text maxlength="25" property="Subjects/outTeacher" attributesText='class="input" size="25" '/> 
            </td>
          </tr>
          <tr>
            <td align="right" class="td2">�����ʦ��λ��</td>
            <td class="td1">
            <html:text maxlength="25" property="Subjects/OuterOrg" attributesText='class="input" size="60" '/> 
            </td>
          </tr>
          <tr>
            <td align="right" class="td2">ְ��</td>
            <td class="td1">
             <html:text maxlength="10" property="Subjects/Post" attributesText='class="input" size="20" '/>      
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">ְ�ƣ�</td>
            <td class="td1"> 
       <html:text maxlength="10" property="Subjects/JobTitle" attributesText='class="input" size="20" '/>                    
</td>
          </tr>
       
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Submit" type="button" class="button_02" value="�� ��" onclick="save()">                
                <input name="Submit2" type="button" class="button_02" value="�� ��" onclick="history.go(-1)"></td>
            </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
</form>
</body>

<script language="javascript">
var frm=document.forms[0];

function save(){
 if(frm.elements["Subjects/IsOuter"].value=="1"){
    frm.elements["Subjects/Teacher"].value=frm.elements["shouKe"].value
 }
 frm.action="teachWorkManage.prMakeTeachPlan.saveSubjects.do";
 frm.submit();
}

function clearValue(){
 frm.elements["Subjects/Teacher"].value="";
 frm.elements["shouKe"].value="";
 frm.elements["btn"].disabled=true;
 frm.elements["Subjects/TeachingGroupID"].options[0].selected=true;


}

function setStatus(obj){
  if(obj.value=="0"){
    frm.elements["btn"].disabled=false;
  }
  
}

function init(){
var type='<bean:write property="Subjects/IsOuter"/>';

if(type=="1"){
  clearValue();
}
}
init();
</script>