<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="oa.prResearchManage.reportCourseModifyDo.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;���й���&gt;���������걨</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="10"> </td>
    </tr>
    <tr>
      <td class="text">
      <div align="center" style="color:MediumBlue;font-weight:bold;font-size:medium;">������������ע * ��Ϊ�����</div>
      <table width="80%"  border="0" align="center" cellpadding="3" cellspacing="3" border="2" bgcolor="#A2C4DC">
          <html:hidden name="ReportedCourse/ProjectID" property="fid" />
          <tr  onClick="changeTRBgColor(this)">
            <td align="left" class="td1"><span class="text_red">*</span>��ѡ��
            <html:radio property="ReportedCourse/Class" value="���Ҽ�����" checked="true"/>���Ҽ�����&nbsp;
            <html:radio property="ReportedCourse/Class" value="ʡ��������"/>ʡ��������&nbsp;
            <html:radio property="ReportedCourse/Class" value="�м�����"/>�м�����&nbsp;
            <html:radio property="ReportedCourse/Class" value="У������"/>У������&nbsp;
            <html:radio property="ReportedCourse/Class" value="��������"/>��������&nbsp;
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="left" class="td2"><span class="text_red">*</span>�������ƣ�
            <html:text property="ReportedCourse/ProjectName" maxlength="100" attributesText='class="input" size="50"' readonly="true"/>
            </td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td align="left" class="td1">����ʣ�&nbsp;&nbsp;&nbsp;&nbsp;<html:text property="ReportedCourse/MeSH" maxlength="100" attributesText='class="input" size="50"'/>
            (&lt;100�ַ�)</td>
          </tr>
		  <tr onClick="changeTRBgColor(this)">
            <td align="left" class="td2"><span class="text_red">*</span>�������ͣ�
            <html:select property="ReportedCourse/CourseType" onchange="KTLX_Dropdownlist_onchange()" style="width:136px;" attributesText='ValidateType="notempty" Msg="�������Ͳ���Ϊ��"'>
			<html:option value="">��ѡ��</html:option>
			<html:option value="�ص����">�ص����</html:option>
			<html:option value="һ�����">һ�����</html:option>
			<html:option value="�������">�������</html:option>
			<html:option value="�Գﾭ�ѿ���">�Գﾭ�ѿ���</html:option>
			<html:option value="ί�п���">ί�п���</html:option>
			<html:option value="��������">��������</html:option>
			<html:option value="Ժ������">Ժ������</html:option>
			<html:option value="Ժ�ڲ��ſ���">Ժ�ڲ��ſ���</html:option>
			<html:option value="���ʺ���">���ʺ���</html:option>
			<html:option value="�б����">�б����</html:option>
			<html:option value="����">����</html:option>
            </html:select>&nbsp;&nbsp;
            <span class="text_red">*</span>�ɹ���ʽ��
            <html:select property="ReportedCourse/ResultType" style="width:144px;" attributesText='ValidateType="notempty" Msg="�ɹ���ʽ����Ϊ��"'>
			<html:option value="">��ѡ��</html:option>
			<html:option value="����">����</html:option>
			<html:option value="ר��">ר��</html:option>
			<html:option value="����">����</html:option>
			<html:option value="����">����</html:option>
			<html:option value="���ļ�">���ļ�</html:option>
			<html:option value="�о����棨��������">�о����棨��������</html:option>
			<html:option value="���ӳ�����">���ӳ�����</html:option>
			<html:option value="�̲�">�̲�</html:option>
			<html:option value="������">������</html:option>
			<html:option value="�������">�������</html:option>
			<html:option value="��������">��������</html:option>
			<html:option value="�ǹ�������ɹ�">�ǹ�������ɹ�</html:option>
			<html:option value="����">����</html:option>
		    </html:select>
            </td>
          </tr>
		  <tr onClick="changeTRBgColor(this)">
            <td align="left" class="td1"><span class="text_red">*</span>ѧ�Ʒ��ࣺ
            <html:select property="ReportedCourse/SubjectType" style="width:136px;" attributesText='ValidateType="notempty" Msg="ѧ�Ʒ��಻��Ϊ��"'>
			<html:option value="">��ѡ��</html:option>
			<html:option value="��������ѧ">��������ѧ</html:option>
			<html:option value="����ѧ">����ѧ</html:option>
			<html:option value="��ѧ">��ѧ</html:option>
			<html:option value="����ѧ">����ѧ</html:option>
			<html:option value="���ѧ">���ѧ</html:option>
			<html:option value="����&#183;����">����&#183;����</html:option>
			<html:option value="��ʷ&#183;����">��ʷ&#183;����</html:option>
			<html:option value="��ѧ">��ѧ</html:option>
			<html:option value="���ѧ">���ѧ</html:option>
			<html:option value="ͳ��ѧ">ͳ��ѧ</html:option>
			<html:option value="�˿�ѧ">�˿�ѧ</html:option>
			<html:option value="���������о�">���������о�</html:option>
			<html:option value="���������о�">���������о�</html:option>
			<html:option value="�й���ʷ">�й���ʷ</html:option>
			<html:option value="������ʷ">������ʷ</html:option>
			<html:option value="����ѧ">����ѧ</html:option>
			<html:option value="�ڽ�ѧ">�ڽ�ѧ</html:option>
			<html:option value="�й���ѧ">�й���ѧ</html:option>
			<html:option value="�����ѧ">�����ѧ</html:option>
			<html:option value="����ѧ">����ѧ</html:option>
			<html:option value="����ѧ">����ѧ</html:option>
			<html:option value="ͼ���">ͼ���</html:option>
			<html:option value="����ѧ">����ѧ</html:option>
			<html:option value="����ѧ��">����ѧ��</html:option>
            </html:select>&nbsp;&nbsp;
            <span class="text_red">*</span>�о����ͣ�
            <html:select property="ReportedCourse/ReseachType" style="width:144px;" attributesText='ValidateType="notempty" Msg="�о����Ͳ���Ϊ��"'>
			<html:option value="">��ѡ��</html:option>
			<html:option value="�����о�">�����о�</html:option>
			<html:option value="Ӧ���о�">Ӧ���о�</html:option>
			<html:option value="�ۺ��о�">�ۺ��о�</html:option>
			<html:option value="�����о�">�����о�</html:option>
		    </html:select>
            </td>
          </tr>
		  <tr onClick="changeTRBgColor(this)">
            <td align="left" class="td2"><span class="text_red">*</span>������Դ��
            <html:select property="ReportedCourse/FundingSource" style="width:136px;" attributesText='ValidateType="notempty" Msg="������Դ����Ϊ��"'>
			<html:option value="���Ҳ���">���Ҳ���</html:option>
			<html:option value="����λ����">����λ����</html:option>
			<html:option value="�Գ�">�Գ�</html:option>
			<html:option value="����">����</html:option>
			<html:option value="�����">�����</html:option>
			<html:option value="��������">��������</html:option>
			<html:option value="�йص�λ����">�йص�λ����</html:option>
			<html:option value="����">����</html:option>
            </html:select>&nbsp;&nbsp;
            <span class="text_red">*</span>�������ѣ�
            <html:text property="ReportedCourse/Fund" maxlength="50" attributesText='class="input" size="20" ValidateType="notempty" Msg="�������Ѳ���Ϊ��"'/>��Ԫ
            </td>
          </tr>
          <tr onClick="changeTRBgColor(this)">
            <td align="left" class="td1"><span class="text_red">*</span>������׼��λ��&nbsp;
            <html:text property="ReportedCourse/Units" maxlength="100" attributesText='class="input" size="50" ValidateType="notempty" Msg="������׼��λ����Ϊ��"'/>
            </td>
          </tr>
          <tr id="WeiTuo_TR" onClick="changeTRBgColor(this)" style="display: none">
            <td align="left" class="td2"><span class="text_red">*</span>ί��(����)��λ��&nbsp;
            <html:text property="ReportedCourse/AgentUnits" maxlength="100" attributesText='class="input" size="50"'/>
            </td>
          </tr>
		  <tr onClick="changeTRBgColor(this)">
            <td align="left" class="td1"><span class="text_red">*</span>����ʱ�䣺&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <html:text name="ReportedCourse/ReportTime[@pattern='yyyy-MM-dd']" property="ReportedCourse/ReportTime" attributesText='class="input" size="30" ValidateType="notempty" Msg="����ʱ�䲻��Ϊ��"' readonly="true"/>
            <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["ReportedCourse/ReportTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
            &nbsp;&nbsp;<span class="text_red">*</span>(Ԥ��)���ʱ�䣺
            <html:text name="ReportedCourse/ExpectedTime[@pattern='yyyy-MM-dd']" property="ReportedCourse/ExpectedTime" attributesText='class="input" size="30" ValidateType="notempty" Msg="(Ԥ��)���ʱ�䲻��Ϊ��"' readonly="true"/>
            <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["ReportedCourse/ExpectedTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
            </td>
          </tr>
          <tr id="Members_Tr" onClick="changeTRBgColor(this)">
            <td align="left" class="td2"><span class="text_red">*</span>�����Ա��&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="javascript:getLocalMember()">��ӱ���λ��Ա</a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="javascript:getExtraMember()">����ⵥλ��Ա</a>
            </td>
          </tr>
          <tr>
            <td id="MemberList_Tr" align="center" class="td1">
            <table cellspacing="0" align="center" rules="all" bordercolor="LightGrey" height="100%" border="1" id="KeTi1_MyDataGrid" style="background-color:White;border-color:LightGrey;width:100%;border-collapse:collapse;">
	        <tr>
		    <td align="Center" style="font-size:10pt;width:10%;">��Ա��ɫ</td>
		    <td align="Center" style="font-size:10pt;width:10%;">��Ա����</td>
		    <td align="Center" style="font-size:10pt;width:70%;">�е�������Ĳ��ֹ���</td>
		    <td align="Center" style="font-size:10pt;width:10%;">����</td>
	        </tr>
            <logic:iterate id="resultset" property="list[@type='MemberList']">
	        <tr>
		    <td style="font-size:10pt;">
            <logic:equal id="resultset" property="researchGroup/MemberType" value="0">������</logic:equal>
            <logic:notEqual id="resultset" property="researchGroup/MemberType" value="0">��Ա</logic:notEqual>
            </td>
		    <td style="font-size:10pt;font-weight:bold;"><bean:write id="resultset" property="researchGroup/memberName"/></td>
		    <td style="font-size:10pt;"><bean:write id="resultset" property="researchGroup/WorkFor"/></td>
		    <td align="Center" style="color:Blue;font-size:10pt;">
		    <!--<a href="javascript:modifyMember('<bean:write id="resultset" property="researchGroup/MemberId"/>')" style="color:Blue;">�޸�</a>-->
		    <a href="javascript:delMember('<bean:write id="resultset" property="researchGroup/MemberId"/>')" style="color:Blue;">ɾ��</a>
		    </td>
	        </tr>
	        </logic:iterate>
            </table>
            </td>
          </tr>
          <tr id="LocalMembers_Tr" onClick="changeTRBgColor(this)" style="display:none">
            <td align="center" class="td2">
            <IFRAME id="courseMbFrame" scrolling="no" src="" width="100%" height="195px" frameborder="0"></IFRAME>
            </td>
          </tr>
		  <tr onClick="changeTRBgColor(this)">
		  <td align="left" class="td1">������Ҫ��
		    <html:textarea property="ReportedCourse/Content" style="height:80px;width:328px;"/>(&lt;100�ַ�)</td>
	      </tr>
	      <TR onClick="changeTRBgColor(this)">
		  <TD align="left" class="td2">��  ע��&nbsp;&nbsp;&nbsp;
		  <html:textarea property="ReportedCourse/Remark" style="height:80px;width:328px;"/>(&lt;100�ַ�)</TD>
	      </TR>
	      <tr onClick="changeTRBgColor(this)">
            <td align="left" class="td1">�����Ƿ���
            <html:radio property="ReportedCourse/IsOver" value="0" checked="true" onclick="document.all('OverProject_Tr').style.display='none'"/>��&nbsp;&nbsp;&nbsp;&nbsp;
            <html:radio property="ReportedCourse/IsOver" value="1" onclick="document.all('OverProject_Tr').style.display=''"/>��
            </td>
          </tr>
          <tr id="OverProject_Tr" onClick="changeTRBgColor(this)" style="display:none">
            <td align="left" class="td2"><span class="text_red">*</span>����ʱ�䣺
            <html:text name="ReportedCourse/OverTime[@pattern='yyyy-MM-dd']" property="ReportedCourse/OverTime" attributesText='class="input" size="30"' readonly="true"/>
            <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["ReportedCourse/OverTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
            &nbsp;&nbsp;
            <span class="text_red">*</span>ר�Ҽ��������
            <html:select property="ReportedCourse/Result" style="width:108px;">
			<html:option value="">��ѡ��</html:option>
			<html:option value="1">����</html:option>
			<html:option value="2">����</html:option>
			<html:option value="3">�ϸ�</html:option>
			<html:option value="4">���ϸ�</html:option>
		    </html:select>
            </td>
          </tr>
          </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
                <input name="Button" type="button" class="button_02" value="�� ��" onClick="save()">
                <logic:equal property="ReportedCourse/Status" value="0">
                <logic:equal property="isManager" value="1">
                <input name="Button" type="button" class="button_02" value="�� ��" onClick="updateStatus()">
                </logic:equal>
                </logic:equal>
                <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="javascript:location.href='oa.prResearchManage.reportCourseList.do'">
              </td>
            </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;
        </td>
    </tr>
  </table>
  </form>
 
  <script language="javascript">

  function save() {
  	var frm = document.forms[0];
  	var obj=document.all("ReportedCourse/CourseType");
  	
		if(obj.options[obj.selectedIndex].value=="ί�п���" || obj.options[obj.selectedIndex].value=="��������")
		    if (frm.elements["ReportedCourse/AgentUnits"].value=="") {
			    alert("--ί��(����)��λ����Ϊ��");
			    return false;
		    }
		
		if (frm.elements["ReportedCourse/IsOver"][1].checked) {
		   if (frm.elements["ReportedCourse/OverTime[@pattern='yyyy-MM-dd']"].value=="") {
			    alert("--����ʱ�䲻��Ϊ��");
			    return false;
		   }
		   if (frm.elements["ReportedCourse/Result"].options[frm.elements["ReportedCourse/Result"].selectedIndex].value=="") {
			    alert("--ר�Ҽ����������Ϊ��");
			    return false;
		   }
		}
		   
  	
	if(validater(frm)) frm.submit();
  
  }
  
  function updateStatus() {
     var frm = document.forms[0];
	 location.href = "oa.prResearchManage.reportCourseUpdate.do?fid=" + frm.elements["ReportedCourse/ProjectID"].value;
  }
  
  function KTLX_Dropdownlist_onchange()
  {
		var obj=document.all("ReportedCourse/CourseType");
		if(obj.options[obj.selectedIndex].value=="ί�п���" || obj.options[obj.selectedIndex].value=="��������")
			document.all("WeiTuo_TR").style.display="";
		else
			document.all("WeiTuo_TR").style.display="none";
  }
  
  function getLocalMember() {
     var random = Math.random();
     document.all("LocalMembers_Tr").style.display = "";
     document.all("courseMbFrame").height = "195px";
     document.all("Members_Tr").style.display = "none";
     document.all("MemberList_Tr").style.display = "none";
     document.all("courseMbFrame").src = "oa.prResearchManage.courseMemberAdd.do?random="+random+"&isLocal=1&fid="+document.forms[0].elements["ReportedCourse/ProjectID"].value;
  }
  
  function getExtraMember() {
     var random = Math.random();
     document.all("LocalMembers_Tr").style.display = "";
     document.all("courseMbFrame").height = "195px";
     document.all("Members_Tr").style.display = "none";
     document.all("MemberList_Tr").style.display = "none";
     document.all("courseMbFrame").src = "oa.prResearchManage.courseMemberAdd.do?random="+random+"&isLocal=0&fid="+document.forms[0].elements["ReportedCourse/ProjectID"].value;
  }
  
  function delMember(mid) {
     var random = Math.random();
     document.all("LocalMembers_Tr").style.display = "";
     document.all("courseMbFrame").height = "195px";
     document.all("MemberList_Tr").style.display = "none";
     document.all("courseMbFrame").src = "oa.prResearchManage.courseMemberDelDo.do?random="+random+"&researchGroup/MemberId=" + mid + "&researchGroup/ProjectID=" + document.forms[0].elements["ReportedCourse/ProjectID"].value;
  }
  </script>
 