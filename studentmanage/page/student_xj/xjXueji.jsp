<%@include file="/internet/common.jsp"%> 


<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">ѧԱ����&gt;ѧ������&gt;ѧ����</td>
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
		<html:hidden property="Student/StudentID"/> 
		<html:hidden property="Student/ClassID"/> 
		
		<input type="hidden" name="filepath" value="Student"/>
		<input type="hidden" name="FBFILE_T_FILE/GROUP_ID" value="talentmail">
		<input type="hidden" name="FBFILE_T_FILE/FILE_SAVE" value="F">
		
		
	  </td>
    </tr>
  </table>
 <form method="post" enctype="multipart/form-data" action="studentmanage.student_xj.xjmodifyDo.do">
 		<input type="hidden" name="docmarked" value="1">
		<html:hidden name="fid" property="QueryStudent/StudentID"/>
  <table width="754"  border="0" align="center" cellpadding="0" cellspacing="0" height="402" >
    <tr>
      <td width="752"><p align="center"><b><font face="����" size="4">�й�������ί��У</font></b> <br /><br /><font face="�����п�" size="5"><span id="printTable">ѧ&nbsp; Ա&nbsp;   
      ѧ&nbsp; ��&nbsp; ��&nbsp; ��&nbsp; ��</span></font> </p></td>
    </tr>
    
    <tr>
      <td height="59" width="752"  class="td1" >
	  
	  <table width="100%" border="0" cellspacing="0" cellpadding="0" id="listdetail">
        
        <tr>
          <td height="50" class="td1">&nbsp;&nbsp;���
            <bean:write property="Class/ClassName"/>
            &nbsp;<br/>
&nbsp; ��Уʱ�䣺
<bean:write property="Class/BeginTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy��MM��dd��"/>
--
<bean:write property="Class/EndTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy��MM��dd��"/>
&nbsp;&nbsp;&nbsp;&nbsp; ѧ�ţ�
<bean:write property="QueryStudent/StudentNO" filter="true"/>
&nbsp;&nbsp; 
            �ϣ��ᣩҵ֤���룺
            <bean:write property="QueryStudent/DiplomaNO" filter="true"/></td>
        </tr>
        <tr>
          <td height="400"><table width="100%"  border="1" align="center" cellpadding="0" cellspacing="0"  height="369" bordercolordark="#FFFFFF" bordercolorlight="#A2C4DC">
            <tr class="td1">
              <td align="center" class="td1" width="68" height="22">�ա��� </td>
              <td width="83" class="td1" align="center" height="22">&nbsp;<bean:write property="QueryStudent/operatorname" filter="true"/></td>
              <td width="51" class="td1" align="center" height="22">�� �� </td>
              <td width="67" class="td1" align="center" height="22">&nbsp;<dict:write businTypeId="BNDICT_gender" property="QueryStudent/Sex" />              </td>
              <td width="89" align="center" class="td1" height="22">�񡡡��� </td>
              <td width="82" class="td1" align="center" height="22">&nbsp;<dict:write businTypeId="dx_folk" property="QueryStudent/FolkID"  />              </td>
              <td width="101" class="td1" align="center" height="22">��&nbsp; ��</td>
              <td width="85" class="td1" align="center" height="22">&nbsp;<bean:write property="QueryStudent/NativePlace"/>��</td>
              <td width="97" height="116" rowspan="5" align="center" valign="middle" class="td1"><img src='/common/page/viewimgdb/viewFromDB.jsp?table=Student&pkn=StudentID&field=Photo&pkv=<bean:write property="QueryStudent/StudentID"/>'  width="80" height="100"> </td>
            </tr>
            <tr class="td1">
              <td align="center" class="td1" width="68" height="22">ѧ&nbsp; �� </td>
              <td class="td1" align="center" width="67" height="22">&nbsp;<dict:write businTypeId="dx_education" property="QueryStudent/DegreeID"/>              </td>
              <td class="td1" align="center" width="61" height="22"> ѧ&nbsp; λ </td>
              <td class="td1" align="center" width="73" height="22">&nbsp;
                  <bean:write property="QueryStudent/EduLevel"/>
                             </td>
              <td align="center" class="td1" width="89" height="22">��ѧרҵ</td>
              <td class="td1" align="center" width="82" height="22">&nbsp;<bean:write property="QueryStudent/Major"/></td>
              <td class="td1" align="center" width="101" height="22"> �������� </td>
              <td class="td1" align="center" width="85" height="22">&nbsp;<bean:write property="QueryStudent/Birthdate" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>              </td>
            </tr>
            <tr class="td1">
              <td align="center" class="td1" width="68" height="22">������λ </td>
              <td class="td1" align="center" width="201" colspan="3" height="22">&nbsp;<bean:write property="QueryStudent/WorkingOrgan"/>              </td>
              <td align="center" class="td1" width="89" height="22">ְ�� �� </td>
              <td class="td1" align="center" width="82" height="22">&nbsp;<bean:write property="QueryStudent/JobTitle"/>
              </td>
              <td class="td1" align="center" width="101" height="22"> �μӹ���ʱ�� </td>
              <td class="td1" align="center" width="85" height="22">&nbsp;<bean:write property="QueryStudent/StartWorkingTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>              </td>
            </tr>
            <tr class="td1">
              <td align="center" class="td1" width="68" height="22">ְ������ </td>
              <td class="td1" align="center" width="201" colspan="3" height="22">&nbsp;<bean:write property="QueryStudent/Duty"/>              </td>
              <td align="center" class="td1" width="89" height="22">ְ�� �� </td>
              <td class="td1" align="center" width="82" height="22">&nbsp;<dict:write businTypeId="dx_dutylevel" property="QueryStudent/dutylevel" />              </td>
              <td class="td1" align="center" width="101" height="22"> �뵳ʱ�� </td>
              <td class="td1" align="center" width="85" height="22">&nbsp;<bean:write property="QueryStudent/JoinPartyTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>              </td>
            </tr>
            <tr class="td1">
              <td height="22" align="center" class="td1" width="68">����ְ�� </td>
              <td class="td1" align="center" width="201" colspan="3" height="22">&nbsp;<bean:write property="QueryStudent/PartyPost"/></td>
              <td align="center" class="td1" width="89" height="22">���ְ�� </td>
              <td class="td1" align="center" width="82" height="22">&nbsp;<bean:write property="QueryStudent/SocietyPost"/></td>
              <td class="td1" align="center" width="101" height="22"> &nbsp;�� </td>
              <td class="td1" align="center" width="85" height="22"> ��&nbsp; </td>
            </tr>
            <tr class="td1">
              <td align="center" class="td1" width="68" height="22">��λ��ַ</td>
              <td class="td1" align="center" width="201" colspan="3" height="22">��&nbsp;<bean:write property="QueryStudent/OrgAddr"/> </td>
              <td align="center" class="td1" width="89" height="22">��λ�ʱ� </td>
              <td class="td1" align="center" width="82" height="22">&nbsp;<bean:write property="QueryStudent/OrgPostcode"/></td>
              <td class="td1" align="center" width="101" height="22">��λ�绰 </td>
              <td class="td1" align="center" width="182" height="22" colspan="2">&nbsp;<bean:write property="QueryStudent/OrganTel"/>              </td>
            </tr>
            <tr class="td1">
              <td align="center" class="td1" width="68" height="22">��������</td>
              <td class="td1" align="center" width="201" colspan="3" height="22">&nbsp;<bean:write property="QueryStudent/Email"/>
                ��              </td>
              <td align="center" class="td1" width="89" height="22">��&nbsp;&nbsp; 
                ��</td>
              <td class="td1" align="center" width="82" height="22">��&nbsp;
                  <bean:write property="QueryStudent/MobileTel"/>              </td>
              <td class="td1" align="center" width="101" height="22">סլ�绰 </td>
              <td class="td1" align="center" width="182" height="22" colspan="2">��
                 &nbsp; <bean:write property="QueryStudent/HomeTel"/>              </td>
            </tr>
            <tr class="td1">
              <td align="center" class="td1" width="68" height="66">�ɼ�</td>
              <td height="66" colspan="8" align="center" valign="top" class="td1"><table  width="100%"  border="1" align="center" cellpadding="0" cellspacing="0"  bordercolordark="#FFFFFF" bordercolorlight="#A2C4DC" >
                  <tr class="td1" >
                    <td width="9%" align="center">���</td>
                    <td width="56%" align="center">ѧϰ��Ŀ</td>
                    <td width="17%" align="center">ѧʱ</td>
                    <td width="18%" align="center">�ɼ�</td>
                  </tr>
                  <logic:iterate id="resultset" property="list[@type='QueryScore']">
                    <tr class="td1" onclick="changeTRBgColor(this)" >
                      <td align="center"><bean:write id="resultset" property="QueryScore/SubjectNO" filter="true"/></td>
                      <td>&nbsp;
                          <bean:write id="resultset" property="QueryScore/Subject" filter="true"/></td>
                      <td align="center">&nbsp;<bean:write id="resultset" property="QueryScore/ClassHours" filter="true"/></td>
                      <td align="center">&nbsp;<bean:write id="resultset" property="QueryScore/Score" filter="true"/></td>
                    </tr>
                  </logic:iterate>
              </table></td>
            </tr>
            <tr  class="td1">
              <td align="center" class="td1" width="68" height="1">����</td>
              <td class="td1" align="center" colspan="8" height="1"><table   width="100%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolordark="#FFFFFF" bordercolorlight="#A2C4DC">
                  <tr class="td1">
                    <td width="10%" align="center">����</td>
                    <td width="10%" align="center">&nbsp;<bean:write property="QueryStudentSimple/count0"/>��</td>
                    <td width="10%" align="center">�ٵ�</td>
                    <td width="10%" align="center">&nbsp;<bean:write property="QueryStudentSimple/count1"/>��</td>
                    <td width="10%" align="center">ȱ��</td>
                    <td width="10%" align="center">&nbsp;<bean:write property="QueryStudentSimple/count2"/>��</td>
                    <td width="10%" align="center">����</td>
                    <td width="10%" align="center">&nbsp;<bean:write property="QueryStudentSimple/count3"/>��</td>
                    <td width="10%" align="center">�¼�</td>
                    <td width="10%" align="center">&nbsp;<bean:write property="QueryStudentSimple/count4"/>��</td>
                  </tr>
              </table></td>
            </tr>
            <tr class="td1">
              <td align="center" class="td1" width="68" height="92">����������</td>
              <td colspan="8" class="td1" align="center" height="92">&nbsp;</td>
            </tr>
            <tr class="td1">
              <td align="center" class="td1" width="68" height="49">�춯</td>
              <td colspan="8" class="td1" align="center" width="663" height="49">&nbsp; �� </td>
            </tr>
          </table></td>
        </tr>
      </table>      </td>
    </tr>
    <tr>
      <td class="text" width="752"><table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="22" align="center"><input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
				
				<!-- onClick="xjXuejiToDOC()"-->
				<input name="export" type="button" class="button_02" value="�� ��" onClick="domToDoc()">
              <input name="Submit2" type="button" class="button_02" value="�� ��" onclick="history.back()" /></td>
            </tr>
      </table></td>
    </tr>
    <tr>
      <td class="text" height="22" width="752">&nbsp;</td>
    </tr>
  </table>
</form>
  <form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>

<script>
function xjXuejiToDOC(){
    	var frm =document.forms[0];
		
		
			
    		frm.action = "studentmanage.student_xj.xjXueji.do";
    
			frm.target = "_blank";
			frm.submit();		
    
    
    	
}
</script>