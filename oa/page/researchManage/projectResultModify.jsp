<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="oa.prResearchManage.reportResultModifyDo.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;���й���&gt;�ɹ������걨</td>
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
      <div align="center" style="color:MediumBlue;font-weight:bold;font-size:medium;">���гɹ��걨����ע * ��Ϊ�����</div>
      <table width="80%"  border="0" align="center" cellpadding="3" cellspacing="3" border="2" bgcolor="#A2C4DC">
          <html:hidden name="ReportedResult/ProjectID" property="fid" />
          <tr  onClick="changeTRBgColor(this)">
            <td align="left" class="td1"><span class="text_red">*</span>�ɹ���ʽ��
            <html:select property="ReportedResult/ResultType" style="width:144px;" onchange="KTLX_Dropdownlist_onchange()" attributesText='ValidateType="notempty" Msg="�ɹ���ʽ����Ϊ��"'>
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
          <tr  onClick="changeTRBgColor(this)">
            <td align="left" class="td2"><span class="text_red">*</span>�ɹ����ƣ�
            <html:text property="ReportedResult/ProjectName" maxlength="100" attributesText='class="input" size="50"' readonly="true"/>
            </td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td align="left" class="td1">����ʣ�&nbsp;&nbsp;&nbsp;&nbsp;<html:text property="ReportedResult/MeSH" maxlength="100" attributesText='class="input" size="50"'/>
            (&lt;100�ַ�)</td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td align="left" class="td2">�ɹ���������<html:text property="ReportedResult/WordNum" maxlength="100" attributesText='class="input" size="20" ValidateType="numeric" Msg="�ɹ�����������Ϊ����"'/>ǧ��  (����������)
            </td>
          </tr>
		  <tr onClick="changeTRBgColor(this)">
            <td align="left" class="td1"><span class="text_red">*</span>ѧ�Ʒ��ࣺ
            <html:select property="ReportedResult/SubjectType" style="width:128px;" attributesText='ValidateType="notempty" Msg="ѧ�Ʒ��಻��Ϊ��"'>
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
            �о����ͣ�
            <html:select property="ReportedResult/ReseachType" style="width:85px;">
			<html:option value="">��ѡ��</html:option>
			<html:option value="�����о�">�����о�</html:option>
			<html:option value="Ӧ���о�">Ӧ���о�</html:option>
			<html:option value="�ۺ��о�">�ۺ��о�</html:option>
			<html:option value="�����о�">�����о�</html:option>
		    </html:select>
		    �ɹ����֣�
            <html:select property="ReportedResult/Languages" style="width:85px;">
			<html:option value="">��ѡ��</html:option>
			<html:option value="����">����</html:option>
			<html:option value="Ӣ��">Ӣ��</html:option>
			<html:option value="����">����</html:option>
			<html:option value="����">����</html:option>
			<html:option value="����">����</html:option>
			<html:option value="����">����</html:option>
		    </html:select>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="left" class="td2"><span class="text_red">*</span>�����������&nbsp;&nbsp;
            <html:radio property="ReportedResult/CourseType" value="����" checked="true"/>����&nbsp;
            <html:radio property="ReportedResult/CourseType" value="����"/>����&nbsp;
            </td>
          </tr>
          <tr id="WeiTuo_TR" onClick="changeTRBgColor(this)" style="display: none">
            <td align="left" class="td1"><span class="text_red">*</span>�ɹ�ί�е�λ��&nbsp;
            <html:text property="ReportedResult/AgentUnit" maxlength="100" attributesText='class="input" size="50"'/>
            </td>
          </tr>
          <tr id="ShangBao_TR" onClick="changeTRBgColor(this)">
            <td align="left" class="td2"><span class="text_red">*</span>�ɹ��ϱ���λ��&nbsp;
            <html:text property="ReportedResult/ReleasedUnit" maxlength="100" attributesText='class="input" size="50"'/>
            </td>
          </tr>
          <tr onClick="changeTRBgColor(this)">
            <td align="left" class="td1"><span class="text_red">*</span><span id="publisher_span">���������ƣ�</span>&nbsp;&nbsp;&nbsp;
            <html:text property="ReportedResult/Publisher" maxlength="100" attributesText='class="input" size="50"' attributesText='ValidateType="notempty" Msg="���������Ʋ���Ϊ��"'/>
            </td>
          </tr>
		  <tr onClick="changeTRBgColor(this)">
            <td align="left" class="td2"><span class="text_red">*</span>����ʱ�䣺&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <html:text name="ReportedResult/ReleasedTime[@pattern='yyyy-MM-dd']" property="ReportedCourse/ReportTime" attributesText='class="input" size="30" ValidateType="notempty" Msg="����ʱ�䲻��Ϊ��"' readonly="true"/>
            <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["ReportedResult/ReleasedTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
            &nbsp;&nbsp;��<html:text property="ReportedResult/QiShu" maxlength="10" attributesText='class="input" size="10"'/>��
            </td>
          </tr>
          <tr id="Members_Tr" onClick="changeTRBgColor(this)">
            <td align="left" class="td1"><span class="text_red">*</span>�ɹ����ߣ�&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="javascript:getLocalMember()">��ӱ���λ����</a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="javascript:getExtraMember()">����ⵥλ����</a>
            </td>
          </tr>
          <tr>
            <td id="MemberList_Tr" align="center" class="td2">
            <table cellspacing="0" align="center" rules="all" bordercolor="LightGrey" height="100%" border="1" id="KeTi1_MyDataGrid" style="background-color:White;border-color:LightGrey;width:100%;border-collapse:collapse;">
	        <tr>
		    <td align="Center" style="font-size:10pt;width:10%;">����˳��</td>
		    <td align="Center" style="font-size:10pt;width:10%;">��������</td>
		    <td align="Center" style="font-size:10pt;width:50%;">�е��ɹ����Ĳ��ֹ���</td>
		    <td align="Center" style="font-size:10pt;width:20%;">�������(ǧ��)</td>
		    <td align="Center" style="font-size:10pt;width:10%;">����</td>
	        </tr>
	        <%int i=1; %>
            <logic:iterate id="resultset" property="list[@type='MemberList']">
	        <tr>
		    <td style="font-size:10pt;"><%=i++%></td>
		    <td style="font-size:10pt;font-weight:bold;"><bean:write id="resultset" property="researchGroup/memberName"/></td>
		    <td style="font-size:10pt;"><bean:write id="resultset" property="researchGroup/WorkFor"/></td>
		    <td style="font-size:10pt;"><bean:write id="resultset" property="researchGroup/WordNum"/></td>
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
            <td align="center" class="td1">
            <IFRAME id="resultMbFrame" scrolling="no" src="" width="100%" height="195px" frameborder="0"></IFRAME>
            </td>
          </tr>
	      <tr onClick="changeTRBgColor(this)">
            <td align="left" class="td2">�Ƿ�����ɹ���
            <html:radio property="ReportedResult/IsProjectResult" value="0" checked="true" onclick="document.all('ResultProject_Tr').style.display='none'"/>��&nbsp;&nbsp;&nbsp;&nbsp;
            <html:radio property="ReportedResult/IsProjectResult" value="1" onclick="document.all('ResultProject_Tr').style.display=''"/>��
            </td>
          </tr>
          <tr id="ResultProject_Tr" onClick="changeTRBgColor(this)" style="display:none">
            <td align="left" class="td1">�׶λ����ճɹ���
            <html:radio property="ReportedResult/ResultTime" value="�׶γɹ�" checked="true"/>�׶γɹ�&nbsp;
            <html:radio property="ReportedResult/ResultTime" value="���ճɹ�"/>���ճɹ�&nbsp;
            &nbsp;&nbsp;
            ������⣺
            <html:select property="ReportedResult/ReportCourseID" style="width:108px;">
			<html:option value="">��ѡ��</html:option>
			<html:options property="list[@type='ReportedCourses']/ReportedCourse/ProjectID" labelProperty="list[@type='ReportedCourses']/ReportedCourse/ProjectName"></html:options>
		    </html:select>
            </td>
          </tr>
	      <tr onClick="changeTRBgColor(this)">
            <td align="left" class="td2">�ɹ��Ƿ�񽱣�
            <html:radio property="ReportedResult/IsWinning" value="0" checked="true" onclick="document.all('ResultWinner_Tr').style.display='none'"/>��&nbsp;&nbsp;&nbsp;&nbsp;
            <html:radio property="ReportedResult/IsWinning" value="1" onclick="document.all('ResultWinner_Tr').style.display=''"/>��
            </td>
          </tr>
          <tr id="ResultWinner_Tr" onClick="changeTRBgColor(this)" style="display:none">
            <td align="left" class="td1"><span class="text_red">*</span>�����ƣ�
            <html:text property="ReportedResult/WinnerName" maxlength="100" attributesText='class="input" size="50"'/>
            <br><span class="text_red">*</span>�ڽ�������
            <html:text property="ReportedResult/GiveDep" maxlength="100" attributesText='class="input" size="50"'/>
            <br><span class="text_red">*</span>�񽱵ȼ���
            <html:select property="ReportedResult/WinClass" style="width:85px;">
			<html:option value="">��ѡ��</html:option>
			<html:option value="A">���Ҽ���</html:option>
			<html:option value="B">ʡ������</html:option>
			<html:option value="C">���м���</html:option>
			<html:option value="E">����</html:option>
			<html:option value="F">����</html:option>
		    </html:select>
		    <br><span class="text_red">*</span>��ʱ�䣺
		    <html:text name="ReportedResult/WinTime[@pattern='yyyy-MM-dd']" property="ReportedResult/WinTime" attributesText='class="input" size="30"' readonly="true"/>
            <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["ReportedResult/WinTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
            </td>
          </tr>
		  <tr onClick="changeTRBgColor(this)">
		  <td align="left" class="td2">������Ҫ��
		    <html:textarea property="ReportedCourse/Content" style="height:80px;width:328px;"/>(&lt;100�ַ�)</td>
	      </tr>
	      <TR onClick="changeTRBgColor(this)">
		  <TD align="left" class="td1">��  ע��&nbsp;&nbsp;&nbsp;
		  <html:textarea property="ReportedCourse/Remark" style="height:80px;width:328px;"/>(&lt;100�ַ�)</TD>
	      </TR>
          </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
                <input name="Button" type="button" class="button_02" value="�� ��" onClick="save()">
                <logic:equal property="ReportedResult/Status" value="0">
                <logic:equal property="isManager" value="1">
                <input name="Button" type="button" class="button_02" value="ͨ ��" onClick="updateStatus()">
                </logic:equal>
                </logic:equal>
                <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="javascript:location.href='oa.prResearchManage.reportResultList.do'">
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
  	var obj=frm.elements["ReportedResult/ResultType"];
  	
		if(obj.options[obj.selectedIndex].value=="�о����棨��������") {
		    if (frm.elements["ReportedResult/AgentUnit"].value=="") {
			    alert("--�ɹ�ί�е�λ����Ϊ��");
			    return false;
		    }
		    if (frm.elements["ReportedResult/ReleasedUnit"].value=="") {
			    alert("--�ɹ��ϱ���λ����Ϊ��");
			    return false;
		    }
		}
		
		if (frm.elements["ReportedResult/IsWinning"][1].checked) {
		   if (frm.elements["ReportedResult/WinnerName"].value=="") {
			    alert("--�����Ʋ���Ϊ��");
			    return false;
		   }
		   if (frm.elements["ReportedResult/GiveDep"].value=="") {
			    alert("--�ڽ���������Ϊ��");
			    return false;
		   }
		   if (frm.elements["ReportedResult/WinClass"].value=="") {
			    alert("--�񽱵ȼ�����Ϊ��");
			    return false;
		   }
		   if (frm.elements["ReportedResult/WinTime[@pattern='yyyy-MM-dd']"].value=="") {
			    alert("--��ʱ�䲻��Ϊ��");
			    return false;
		   }
		}
		   
  	
	if(validater(frm)) frm.submit();
  
  }
  
  function updateStatus() {
     var frm = document.forms[0];
	 location.href = "oa.prResearchManage.reportResultUpdate.do?fid=" + frm.elements["ReportedResult/ProjectID"].value;
  }
  
  function KTLX_Dropdownlist_onchange()
  {
        var frm = document.forms[0];
		var obj=frm.elements["ReportedResult/ResultType"];
		switch(obj.options[obj.selectedIndex].value)
		{
			case "����"://���Ļ�����
				document.all("WeiTuo_TR").style.display="none";
				document.all("ShangBao_TR").style.display="none";
				document.all("publisher_span").innerText="���濯�Ｐת�������";
				frm.elements["ReportedResult/Publisher"].Msg="���濯�Ｐת���������Ϊ��";
				break;
			case "�о����棨��������"://�о�����
				document.all("WeiTuo_TR").style.display="";
				document.all("ShangBao_TR").style.display="";
				document.all("publisher_span").innerText="��������";
				frm.elements["ReportedResult/Publisher"].Msg="��������ﲻ��Ϊ��";
				break;
			case "��������"://���ʴ��
				document.all("WeiTuo_TR").style.display="none";
				document.all("ShangBao_TR").style.display="none";
				document.all("publisher_span").innerText="���ʻ������ƣ�";
				frm.elements["ReportedResult/Publisher"].Msg="���ʻ������Ʋ���Ϊ��";
				break;
			default:
				document.all("WeiTuo_TR").style.display="none";
				document.all("ShangBao_TR").style.display="none";
				document.all("publisher_span").innerText="���������ƣ�";
				frm.elements["ReportedResult/Publisher"].Msg="���������Ʋ���Ϊ��";
				break;
 		}
  }
  
  function getLocalMember() {
     var frm = document.forms[0];
     var random = Math.random();
     document.all("LocalMembers_Tr").style.display = "";
     document.all("resultMbFrame").height = "195px";
     document.all("Members_Tr").style.display = "none";
     document.all("MemberList_Tr").style.display = "none";
     if (frm.elements["ReportedResult/CourseType"][0].checked)
        document.all("resultMbFrame").src = "oa.prResearchManage.rsMemberAdd.do?random="+random+"&isLocal=1&Group/ProjectID="+frm.elements["ReportedResult/ProjectID"].value+"&coursetype=0";
     else
        document.all("resultMbFrame").src = "oa.prResearchManage.rsMemberAdd.do?random="+random+"&isLocal=1&Group/ProjectID="+frm.elements["ReportedResult/ProjectID"].value+"&coursetype=1";
  }
  
  function getExtraMember() {
     var frm = document.forms[0];
     var random = Math.random();
     document.all("LocalMembers_Tr").style.display = "";
     document.all("resultMbFrame").height = "195px";
     document.all("Members_Tr").style.display = "none";
     document.all("MemberList_Tr").style.display = "none";
     if (frm.elements["ReportedResult/CourseType"][0].checked)
        document.all("resultMbFrame").src = "oa.prResearchManage.rsMemberAdd.do?random="+random+"&isLocal=0&Group/ProjectID="+frm.elements["ReportedResult/ProjectID"].value+"&coursetype=0";
     else
        document.all("resultMbFrame").src = "oa.prResearchManage.rsMemberAdd.do?random="+random+"&isLocal=0&Group/ProjectID="+frm.elements["ReportedResult/ProjectID"].value+"&coursetype=1";
  }
  
  function delMember(mid) {
     var random = Math.random();
     document.all("LocalMembers_Tr").style.display = "";
     document.all("resultMbFrame").height = "195px";
     document.all("MemberList_Tr").style.display = "none";
     document.all("resultMbFrame").src = "oa.prResearchManage.rsMemberDelDo.do?random="+random+"&researchGroup/MemberId=" + mid + "&researchGroup/ProjectID=" + document.forms[0].elements["ReportedResult/ProjectID"].value;
  }
  </script>
 