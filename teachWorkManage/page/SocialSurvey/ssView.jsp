<%@include file="/internet/common.jsp"%>
<form method="post">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;���������Ϲ���&gt;<span id="printTable">����������</span>�鿴</td>
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
		<html:hidden property="SocialSurvey/_order/col1/field"/>
		<html:hidden property="SocialSurvey/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/length" />
		<html:hidden property="SocialSurvey/classname/criteria/value"/> 
		
		
		
		
	  </td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">
<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
      <tr> 
            <td  align="right" class="td2" width="15%">�༶���ƣ�</td>
            <td class="td1" colspan="3"><bean:write property="QuerySocialSurvey/classname"/>
			 </td>
        </tr>
        <tr> 
          <td align="right" class="td2">�������⣺ </td>
          <td  class="td1" colspan="3"><bean:write property="QuerySocialSurvey/Theme" /> 
            </td>
        </tr>
        <tr> 
          <td align="right" class="td2">�������ݣ� </td>
          <td class="td1" colspan="3"><bean:write property="QuerySocialSurvey/Detail" /> 
           </td>

        </tr>
        <tr> 
          <td align="right" class="td2" width="15%">������в���</td>
          <td class="td1" width="35%"><bean:write property="QuerySocialSurvey/orgName" /> </td>
          <td align="right" class="td2" width="15%">����ʱ�䣺 </td>
          <td class="td1" width="35%">  <bean:write property="QuerySocialSurvey/SurveyTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd" />
        </tr>
        <tr> 
          <td align="right" class="td2">�����쵼�� </td>
          <td class="td1"><bean:write property="QuerySocialSurvey/LeadTeacherName" /> 
            </td>
          <td align="right" class="td2">������ʦ�������Σ� </td>
           <td class="td1"><bean:write property="QuerySocialSurvey/AttendantsName" /> 
        </tr>
        <tr> 
          
          <td align="right" class="td2">����ص㣺 </td>
          <td class="td1" colspan="3"><bean:write property="QuerySocialSurvey/SurveySpot" /> 
          </td>
        </tr>
        <tr> 
          <td align="right" class="td2">���鷽����</td>
          <td class="td1"><logic:present property="QuerySocialSurvey/SchemeType">
          <a href='/common/page/viewimgdb/viewFromDB.jsp?table=SocialSurvey&pkn=SurveyID&field=Scheme&pkv=<bean:write property="QuerySocialSurvey/SurveyID"/>&type=<bean:write property="QuerySocialSurvey/SchemeType"/>' target="_black">���鷽�� </a>
          </logic:present>
          </td>
          
          <td align="right" class="td2">�����쵼�� </td>
          <td class="td1"><bean:write property="QuerySocialSurvey/ExamLeaderName" />
          </td>
        </tr>
        <tr> 
          <td align="right" class="td2">�г�·�ߣ�</td>
          <td class="td1"><logic:present property="QuerySocialSurvey/RouteAttachType">
          <a href='/common/page/viewimgdb/viewFromDB.jsp?table=SocialSurvey&pkn=SurveyID&field=Route&pkv=<bean:write property="QuerySocialSurvey/SurveyID"/>&type=<bean:write property="QuerySocialSurvey/RouteAttachType"/>' target="_black">�г�·�� </a>
          </logic:present>
          </td>
          
          
          <td align="right" class="td2">���鱨�棺</td>
          <td class="td1"><logic:present property="QuerySocialSurvey/ReportAttachType">
          <a href='/common/page/viewimgdb/viewFromDB.jsp?table=SocialSurvey&pkn=SurveyID&field=Report&pkv=<bean:write property="QuerySocialSurvey/SurveyID"/>&type=<bean:write property="QuerySocialSurvey/ReportAttachType"/>' target="_black">���鱨�� </a>
          </logic:present>
          </td>
        </tr>
        <tr> 
          <td align="right" class="td2">���鱨�淢�������</td>
          <td class="td1" colspan="3">&nbsp;<bean:write property="QuerySocialSurvey/Publish" /></td>
        </tr>
                <tr> 
          <td align="right" class="td2">��ע��</td>
          <td class="td1" colspan="3">&nbsp;<bean:write property="QuerySocialSurvey/Remarks" /></td>
         
        </tr>
      </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              
            <td align="center"> 
               <input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
			  <input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">
              <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="history.back()"></td>
            </tr>
          </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
  </form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>