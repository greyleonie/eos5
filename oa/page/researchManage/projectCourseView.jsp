<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="oa.prResearchManage.reportCourseModifyDo.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;���й���&gt;��������鿴</td>
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
      <table width="80%"  border="0" align="center" cellpadding="3" cellspacing="3" border="2" bgcolor="#A2C4DC">
          <html:hidden name="ReportedCourse/ProjectID" property="fid" />
          <tr  onClick="changeTRBgColor(this)">
            <td align="left" class="td1">
            <bean:write property="ReportedCourse/Class"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="left" class="td2">�������ƣ�&nbsp;&nbsp;
            <bean:write property="ReportedCourse/ProjectName"/>
            </td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td align="left" class="td1">����ʣ�&nbsp;&nbsp;<bean:write property="ReportedCourse/MeSH"/></td>
          </tr>
		  <tr onClick="changeTRBgColor(this)">
            <td align="left" class="td2">�������ͣ�
            <bean:write property="ReportedCourse/CourseType"/>&nbsp;&nbsp;
            �ɹ���ʽ��
            <bean:write property="ReportedCourse/ResultType"/>
            </td>
          </tr>
		  <tr onClick="changeTRBgColor(this)">
            <td align="left" class="td1">ѧ�Ʒ��ࣺ
            <bean:write property="ReportedCourse/SubjectType"/>&nbsp;&nbsp;
            �о����ͣ�
            <bean:write property="ReportedCourse/ReseachType"/>
            </td>
          </tr>
		  <tr onClick="changeTRBgColor(this)">
            <td align="left" class="td2">������Դ��
            <bean:write property="ReportedCourse/FundingSource"/>&nbsp;&nbsp;
            �������ѣ�
            <bean:write property="ReportedCourse/Fund"/>��Ԫ
            </td>
          </tr>
          <tr onClick="changeTRBgColor(this)">
            <td align="left" class="td1">������׼��λ��&nbsp;&nbsp;<bean:write property="ReportedCourse/Units"/></td>
          </tr>
          <tr id="WeiTuo_TR" onClick="changeTRBgColor(this)" style="display: none">
            <td align="left" class="td2">ί��(����)��λ��&nbsp;&nbsp;<bean:write property="ReportedCourse/AgentUnits"/>
            </td>
          </tr>
		  <tr onClick="changeTRBgColor(this)">
            <td align="left" class="td1">����ʱ�䣺&nbsp;&nbsp;<bean:write property="ReportedCourse/ReportTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
            &nbsp;&nbsp;(Ԥ��)���ʱ�䣺&nbsp;&nbsp;<bean:write property="ReportedCourse/ExpectedTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
          </tr>
          <tr id="Members_Tr" onClick="changeTRBgColor(this)">
            <td align="left" class="td2">�����Ա��&nbsp;&nbsp;</td>
          </tr>
          <tr>
            <td id="MemberList_Tr" align="center" class="td1">
            <table cellspacing="0" align="center" rules="all" bordercolor="LightGrey" height="100%" border="1" id="KeTi1_MyDataGrid" style="background-color:White;border-color:LightGrey;width:100%;border-collapse:collapse;">
	        <tr>
		    <td align="Center" style="font-size:10pt;width:10%;">��Ա��ɫ</td>
		    <td align="Center" style="font-size:10pt;width:10%;">��Ա����</td>
		    <td align="Center" style="font-size:10pt;width:70%;">�е�������Ĳ��ֹ���</td>
	        </tr>
            <logic:iterate id="resultset" property="list[@type='MemberList']">
	        <tr>
		    <td style="font-size:10pt;">
            <logic:equal id="resultset" property="researchGroup/MemberType" value="0">������</logic:equal>
            <logic:notEqual id="resultset" property="researchGroup/MemberType" value="0">��Ա</logic:notEqual>
            </td>
		    <td style="font-size:10pt;font-weight:bold;"><bean:write id="resultset" property="researchGroup/memberName"/></td>
		    <td style="font-size:10pt;"><bean:write id="resultset" property="researchGroup/WorkFor"/></td>
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
		  <td align="left" class="td1">������Ҫ��&nbsp;&nbsp;<bean:write property="ReportedCourse/Content"/></td>
	      </tr>
	      <TR onClick="changeTRBgColor(this)">
		  <TD align="left" class="td2">��  ע��&nbsp;&nbsp;<bean:write property="ReportedCourse/Remark"/></TD>
	      </TR>
	      <tr onClick="changeTRBgColor(this)">
            <td align="left" class="td1">�����Ƿ���&nbsp;&nbsp;
            <logic:equal property="ReportedCourse/IsOver" value="0">
            ��
            </logic:equal>
            <logic:equal property="ReportedCourse/IsOver" value="1">
            ��
            </logic:equal>
            </td>
          </tr>
          <tr id="OverProject_Tr" onClick="changeTRBgColor(this)">
            <td align="left" class="td2">����ʱ�䣺&nbsp;&nbsp;<bean:write property="ReportedCourse/OverTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>&nbsp;&nbsp;
            ר�Ҽ��������&nbsp;&nbsp;
            <logic:equal property="ReportedCourse/Result" value="1">
            ����
            </logic:equal>
            <logic:equal property="ReportedCourse/Result" value="2">
            ����
            </logic:equal>
            <logic:equal property="ReportedCourse/Result" value="3">
            �ϸ�
            </logic:equal>
            <logic:equal property="ReportedCourse/Result" value="4">
            ���ϸ�
            </logic:equal>
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