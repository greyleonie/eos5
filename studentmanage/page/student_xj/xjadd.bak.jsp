<%@include file="/internet/common.jsp"%>
<HTML>
	<BODY onload='javascript:CardControl.Init(2);' onunload='javascript:CardControl.Quit();'>
  <OBJECT NAME="CardControl" ID="AttendanceCard Control" WIDTH="" HEIGHT="" CLASSID="CLSID:9EFA2DFA-637E-4060-9035-C91193F59308">
  </OBJECT>
  
<form method="post" enctype="multipart/form-data" action="studentmanage.student_xj.xjaddDo.do">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">ѧԱ����&gt;ѧ������&gt;�༶ѧԱ����</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction">
		<input type="hidden" name="addaction">
		<input type="hidden" name="modifyaction">
		<input type="hidden" name="deleteaction">
		<input type="hidden" name="viewaction">
		<html:hidden property="QueryStudent/_order/col1/field"/>
		<html:hidden property="QueryStudent/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		
		<html:hidden property="PageCond/length" />
		<html:hidden property="QueryStudent/ClassID/criteria/value"/> 
		<html:hidden property="Class/ClassCode"/>
		
		<input type="hidden" name="filepath" value="Student"/>
		<input type="hidden" name="FBFILE_T_FILE/GROUP_ID" value="talentmail">
		<input type="hidden" name="FBFILE_T_FILE/FILE_SAVE" value="F">
		
		<%
		int ClassTypeID= talent.core.TalentFunctions.getInt(base.util.TalentContext.getValue(pageContext,null,"Class/ClassTypeID"),1);
		
		 %>
		 <input type="hidden" name="Student/userTypeID" value="<%=ClassTypeID+2 %>"/>
	  </td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">
	  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
        <tr> 
            <td width="10%" align="right" class="td2">�ࡡ������ </td>
          <td colspan="5" class="td1">&nbsp;<bean:write property="Class/ClassName"/><html:hidden name="Student/ClassID" property="QueryStudent/ClassID/criteria/value"/></td>
        </tr>
        <tr> 
          <td width="10%" align="right" class="td2">�ա������� </td>
          <td width="23%" class="td1"><html:text property="Student/Name" style='color:#FF0000;font-weight:900;' maxlength="20" attributesText='class="input" size="30" ValidateType="notempty" Msg="��������Ϊ��"'/> 
            <span class="text_red">*</span></td>
          <td align="right" class="td2">���֤�ţ�</td>
          <td class="td1"><html:text property="Student/IDCardNO" style='color:#FF0000;font-weight:900;' onblur="preview()" maxlength="20" attributesText='class="input" size="30"'/>          </td> 
          <TD valign="middle" align="center" class="td1" rowspan='15' colspan='2'><img id="ImgIDCard" src="" onerror="this.src='../internet/images/IDCard.jpg'"/></TD>
          
        </tr>
        <tr>
          <td align="right" class="td2">���֤�����ţ� </td>
          <td class="td1"><html:text property="Student/IDCardPhysicalNO" style="cursor: hand;" readonly="true" onfocus="startTimer()" ondblclick="getCardID()" maxlength="20" attributesText='class="input" size="30"'/></td>
          <td align="right" class="td2">ѧ�����ţ� </td>
          <td class="td1"><html:text property="Student/StudentNO" maxlength="20" attributesText='class="input" size="30"' readonly="true"/>           </td>
          
        </tr>
        <tr>
          <td width="10%" align="right" class="td2">�ԡ����� </td>
          <td width="23%" class="td1"><dict:radio businTypeId="BNDICT_gender" property="Student/Sex" modifiable="true" value="1"/></td>
          <td width="10%" align="right" class="td2">�񡡡��壺</td>
          <td width="23%" class="td1"><dict:select businTypeId="dx_folk" property="Student/FolkID" nullOption="true" nullLabel="---��ѡ��---" /></td>
        </tr>
        <tr>
          <td align="right" class="td2">�������᣺</td>
          <td class="td1"><html:text property="Student/NativePlace" maxlength="20" attributesText='class="input" size="30"'/></td>
          <td align="right" class="td2">�������£�</td>
          <td class="td1"><html:text property="Student/Birthdate[@pattern='yyyy-MM-dd']" attributesText='class="input" size="30"' readonly="true"/>
            <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["Student/Birthdate[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")></td>
          
        </tr>
        <tr>
          <td height="15" align="right" class="td2">ѧ��������</td>
          <td class="td1"><dict:select businTypeId="dx_education" property="Student/DegreeID" nullOption="true" nullLabel="---��ѡ��---" /></td>
          <td align="right" class="td2">ѧ����λ�� </td>
          <td class="td1"><html:text property="Student/EduLevel" maxlength="20" attributesText='class="input" size="30"'/>          </td>
          
        </tr>
        <tr>
          <td align="right" class="td2">��ѧרҵ��</td>
          <td class="td1"><html:text property="Student/Major" maxlength="50" attributesText='class="input" size="30"'/></td>
          <td align="right" class="td2">������λ�� </td>
          <td class="td1"><html:text property="Student/WorkingOrgan" maxlength="50" attributesText='class="input" size="30"'/>          </td>
          
        </tr>
        <tr>
          <td align="right" class="td2">ְ�����ƣ�</td>
          <td class="td1"><html:text property="Student/JobTitle" maxlength="20" attributesText='class="input" size="30"'/></td>
          <td height="15" align="right" class="td2">�μӹ���ʱ�䣺</td>
          <td class="td1"><html:text property="Student/StartWorkingTime[@pattern='yyyy-MM-dd']" attributesText='class="input" size="30"' readonly="true"/>
            <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["Student/StartWorkingTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")></td>
          
        </tr>
        <tr>
          <td align="right" class="td2">ְ������</td>
          <td class="td1"><html:text property="Student/Duty" maxlength="20" attributesText='class="input" size="30"'/>            </td> 
          <td align="right" class="td2">ְ��������</td>
          <td class="td1"><dict:select businTypeId="dx_dutylevel" property="Student/dutylevel" nullOption="true" nullLabel="---��ѡ��---" />          </td>
          
        </tr>
        <tr>
          <td align="right" class="td2">�뵳ʱ�䣺</td>
          <td class="td1"><html:text property="Student/JoinPartyTime[@pattern='yyyy-MM-dd']" attributesText='class="input" size="30"' readonly="true"/>
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["Student/JoinPartyTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")></td>
          <td align="right" class="td2">����ְ�� </td>
          <td class="td1"><html:text property="Student/PartyPost" maxlength="20" attributesText='class="input" size="30"'/></td> 
          
        </tr>
        <tr>
          <td align="right" class="td2">���ְ�� </td>
          <td class="td1"><html:text property="Student/SocietyPost" maxlength="20" attributesText='class="input" size="30"'/></td>
          <td align="right" class="td2">��λ�绰��</td>
          <td class="td1"><html:text property="Student/OrganTel" maxlength="20" attributesText='class="input" size="30"'/>          </td>
          
        </tr>
        <tr>
          <td align="right" class="td2">��λ��ַ��</td>
          <td class="td1"><html:text property="Student/OrgAddr" maxlength="50" attributesText='class="input" size="30"'/></td>
          <td align="right" class="td2">��λ�ʱࣺ </td>
          <td class="td1"><html:text property="Student/OrgPostcode" maxlength="10" attributesText='class="input" size="30" ValidateType="postalcode" Msg="�ʱ಻��ȷ"'/></td> 
        </tr>
        <tr>
          <td align="right" class="td2">סլ�绰�� </td>
          <td class="td1"><html:text property="Student/HomeTel" maxlength="20" attributesText='class="input" size="30"'/>          </td>
          <td align="right" class="td2">�������䣺</td>
          <td class="td1"><html:text property="Student/Email" maxlength="50" attributesText='class="input" size="30" ValidateType="email" Msg="����Ϊ��Ч����"'/> <span class="text_red">*</span>          </td> 
          
        </tr>
        <tr>
          <td align="right" class="td2">�֡������� </td>
          <td class="td1"><html:text property="Student/MobileTel" maxlength="20" attributesText='class="input" size="30" ValidateType="phone" Msg="����Ϊ�ֻ�����"'/>          </td>
          <td align="right" class="td2">��(��)ҵ֤���룺</td>
          <td class="td1"><html:text property="Student/DiplomaNO" maxlength="20" attributesText='class="input" size="30" '/>
          </td>
          
        </tr>
        <tr>
          <td align="right" class="td2">�ա���Ƭ��</td>
          <td class="td1"><input type="file" name="Photo" class="input" STYLE="ime-mode:disabled" onkeyup="checkFile(this);"/></td>
          <td align="right" class="td2">�֡����飺</td>
          <td class="td1">
			<html:select property="Student/TeamID"  attributesText='id="printTable"'> 
              <html:option value="-1">---��ѡ��---</html:option> <html:options property="list[@type='Team']/Team/TeamID" labelProperty="list[@type='Team']/Team/TeamName"/> 
              </html:select> 
			 <span class="text_red">*</span>		</td>
          
        </tr>
        <tr>
          <td align="right" class="td2">��ѵ�����룺</td>
          <td class="td1"><html:text property="Student/Barcode" maxlength="20" attributesText='class="input" size="30" '/></td>
          <td align="right" class="td2"></td>
          <td class="td1"></td>
        </tr>
        <tr> 
          <td align="right" class="td2">������ע��</td>
          <td colspan="5" class="td1"><html:textarea property="Student/Remark" attributesText='cols="92" rows="6"'/>		  </td>
        </tr>
      </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="�� ��" onClick="save()">
              <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="javascript:history.go(-1)"></td>
            </tr>
          </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
  </form>
  <script>
//validater��������
//�÷�:ValidateType="alphanumeric,email",Msg="��������ĸ����;�ʼ�"
//��֤������:url,postalcode,phone,money,int,notempty,email,numeric
//function validater(frmObj)
	var timer=null;
	var times=0;

  function save() {
  	var frm = document.forms[0];
  	var filepath = frm.elements["Photo"].value;
    var fso =null;
    try{
    
     fso=new ActiveXObject("Scripting.FileSystemObject");
     }catch(e){}
	var ext = filepath.substring(filepath.indexOf(".")+1,filepath.length);
	if(frm.elements["Student/TeamID"].value == "-1") {
		alert("��ѡ�����");
		return
	}
	
	if (validater(frm)) {
	   if (filepath != "") {
	      if (fso!=null&&!fso.FileExists(filepath)) {
	         alert("��Ƭ�����ڣ�");
	         return false;
	      } else if ("JPG,BMP,GIF,PNG,TIF,jpg,bmp,gif,png,tif".indexOf(ext)<0) {
	        alert("���ϴ���ʽΪJPG��BMP��GIF��PNG��TIF����Ƭ��");
	        return false;
	      } else frm.submit();
	   } else frm.submit();
	}
  }
  
  function checkFile(obj) {
     var filepath = obj.value;
     var fso =null;
     try{
      fso=new ActiveXObject("Scripting.FileSystemObject");
      }catch(e){}
     
     if (fso!=null&&!fso.FileExists(filepath)) {
        alert("��Ƭ�����ڣ�");
        return false;
     }
  }
  
  function getCardID(){  	
  	var ret=CardControl.GetCardID();
	if(ret>0){
		  document.getElementById('Student/IDCardPhysicalNO').value=ret;
		  if(timer!=null){
		  	window.clearInterval(timer); 
		  }		  
	} 
	 times++;
	 if(times>60){
	 	window.clearInterval(timer); 
	 }
  }
  
  function startTimer(){
  	timer=window.setInterval(getCardID, 1000);   	
  }
  
  function preview(){	
		var IDCardNO = document.getElementById('Student/IDCardNO');		
		//var WshShell=new ActiveXObject("WScript.Shell"); 
		//var file=document.getElementById("Photo");
		//file.focus();
		//WshShell.sendKeys("d:\\cardImage\\"+IDCardNO.value+".jpg");
		var image = document.getElementById('ImgIDCard');
		image.src = "file://localhost/" + "d:\\cardImage\\"+IDCardNO.value+"all.jpg";
		//setTimeout("previewB()",500);    
	}
	document.getElementById('Student/Name').focus();
  </script></BODY>
</HTML>