<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="oa.prResearchManage.reportResultModifyDo.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;���й���&gt;�ɹ�����鿴</td>
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
          <html:hidden name="ReportedResult/ProjectID" property="fid" />
          <tr  onClick="changeTRBgColor(this)">
            <td align="left" class="td1">�ɹ���ʽ��&nbsp;&nbsp;<bean:write property="ReportedResult/ResultType"/></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="left" class="td2">�ɹ����ƣ�&nbsp;&nbsp;<bean:write property="ReportedResult/ProjectName"/></td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td align="left" class="td1">����ʣ�&nbsp;&nbsp;<bean:write property="ReportedResult/MeSH"/></td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td align="left" class="td2">�ɹ���������&nbsp;&nbsp;<bean:write property="ReportedResult/WordNum"/></td>
          </tr>
		  <tr onClick="changeTRBgColor(this)">
            <td align="left" class="td1">ѧ�Ʒ��ࣺ&nbsp;&nbsp;<bean:write property="ReportedResult/SubjectType"/>&nbsp;&nbsp;
            �о����ͣ�&nbsp;&nbsp;<bean:write property=ReportedResult/ReseachType/>
		    �ɹ����֣�&nbsp;&nbsp;<bean:write property=ReportedResult/Languages/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="left" class="td2">�����������&nbsp;&nbsp;<bean:write property="ReportedResult/CourseType"/></td>
          </tr>
          <tr id="WeiTuo_TR" onClick="changeTRBgColor(this)" style="display: none">
            <td align="left" class="td1">�ɹ�ί�е�λ��&nbsp;&nbsp;<bean:write property="ReportedResult/AgentUnit"/></td>
          </tr>
          <tr id="ShangBao_TR" onClick="changeTRBgColor(this)">
            <td align="left" class="td2">�ɹ��ϱ���λ��&nbsp;&nbsp;<bean:write property="ReportedResult/ReleasedUnit"/></td>
          </tr>
          <tr onClick="changeTRBgColor(this)">
            <td align="left" class="td1">���������ƣ�&nbsp;&nbsp;<bean:write property="ReportedResult/Publisher"/></td>
          </tr>
		  <tr onClick="changeTRBgColor(this)">
            <td align="left" class="td2">����ʱ�䣺&nbsp;&nbsp;<bean:write property="ReportedResult/ReleasedTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
            &nbsp;&nbsp;��<bean:write property="ReportedResult/QiShu"/></td>
          </tr>
          <tr id="Members_Tr" onClick="changeTRBgColor(this)">
            <td align="left" class="td1">�ɹ����ߣ�
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
	        </tr>
	        <%int i=1; %>
            <logic:iterate id="resultset" property="list[@type='MemberList']">
	        <tr>
		    <td style="font-size:10pt;"><%=i++%></td>
		    <td style="font-size:10pt;font-weight:bold;"><bean:write id="resultset" property="researchGroup/memberName"/></td>
		    <td style="font-size:10pt;"><bean:write id="resultset" property="researchGroup/WorkFor"/></td>
		    <td style="font-size:10pt;"><bean:write id="resultset" property="researchGroup/WordNum"/></td>
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
            <td align="left" class="td2">�Ƿ�����ɹ���&nbsp;&nbsp;
            <logic:equal property="ReportedResult/IsProjectResult" value="0">
            ��
            </logic:equal>
            <logic:equal property="ReportedResult/IsProjectResult" value="1">
            ��
            </logic:equal>
            </td>
          </tr>
          <tr id="ResultProject_Tr" onClick="changeTRBgColor(this)" style="display:none">
            <td align="left" class="td1">�׶λ����ճɹ���&nbsp;&nbsp;<bean:write property="ReportedResult/ResultTime"/></td>
          </tr>
	      <tr onClick="changeTRBgColor(this)">
            <td align="left" class="td2">�ɹ��Ƿ�񽱣�&nbsp;&nbsp;
            <logic:equal property="ReportedResult/IsWinning" value="0">
            ��
            </logic:equal>
            <logic:equal property="ReportedResult/IsWinning" value="1">
            ��
            </logic:equal>
            </td>
          </tr>
          <tr id="ResultWinner_Tr" onClick="changeTRBgColor(this)">
            <td align="left" class="td1">�����ƣ�&nbsp;&nbsp;<bean:write property="ReportedResult/WinnerName"/>
            <br>�ڽ�������&nbsp;&nbsp;<bean:write property="ReportedResult/GiveDep"/>
            <br>�񽱵ȼ���&nbsp;&nbsp;<bean:write property="ReportedResult/WinClass"/>
		    <br>��ʱ�䣺&nbsp;&nbsp;<bean:write property="ReportedResult/WinTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
		    </td>
          </tr>
		  <tr onClick="changeTRBgColor(this)">
		  <td align="left" class="td2">������Ҫ��&nbsp;&nbsp;<bean:write property="ReportedCourse/Content"/></td>
	      </tr>
	      <TR onClick="changeTRBgColor(this)">
		  <TD align="left" class="td1">��  ע��&nbsp;&nbsp;<bean:write property="ReportedCourse/Remark"/></TD>
	      </TR>
          </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;
        </td>
    </tr>
  </table>
  </form>