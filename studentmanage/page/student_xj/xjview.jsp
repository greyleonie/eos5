<%@include file="/internet/common.jsp"%>
<form method="post">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">ѧԱ����&gt;ѧ������&gt;�༶ѧԱ�鿴</td>
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
          <td colspan="5" class="td1">&nbsp;<bean:write property="Class/ClassName"/></td>
        </tr>
        <tr> 
          <td width="10%" align="right" class="td2">�ա������� </td>
          <td width="23%" class="td1">
			&nbsp;<bean:write property="QueryStudent/operatorname"/> </td>
          <td width="10%" align="right" class="td2">�ԡ����� </td>
          <td width="23%" class="td1">&nbsp;<dict:write businTypeId="BNDICT_gender" property="QueryStudent/Sex" /></td>
          <td width="10%" align="right" class="td2">�񡡡��壺</td>
          <td width="23%" class="td1">&nbsp;<dict:write businTypeId="dx_folk" property="QueryStudent/FolkID"  /> </td>
        </tr>
        <tr> 
          <td align="right" class="td2">ѧ�����ţ� </td>
          <td class="td1">&nbsp;<bean:write property="QueryStudent/StudentNO"  />           </td>
          <td align="right" class="td2">�������᣺</td>
          <td class="td1">&nbsp;<bean:write property="QueryStudent/NativePlace"  /></td>
          <td align="right" class="td2">�������£�</td>
          <td class="td1">
		  &nbsp;<bean:write property="QueryStudent/Birthdate" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>		  </td>
        </tr>
        <tr>
          <td height="15" align="right" class="td2">ѧ��������</td>
          <td class="td1">
		  &nbsp;<dict:write businTypeId="dx_education" property="QueryStudent/DegreeID"  />		  </td>
          <td align="right" class="td2">ѧ����λ�� </td>
          <td class="td1">&nbsp;<bean:write property="QueryStudent/EduLevel"  />          </td>
          <td align="right" class="td2">��ѧרҵ��</td>
          <td class="td1">&nbsp;<bean:write property="QueryStudent/Major"  /></td>
        </tr>
        <tr>
          <td align="right" class="td2">������λ�� </td>
          <td class="td1">&nbsp;<bean:write property="QueryStudent/WorkingOrgan"  />          </td>
          <td align="right" class="td2">ְ�����ƣ�</td>
          <td class="td1">&nbsp;<bean:write property="QueryStudent/JobTitle"  /></td>
          <td height="15" align="right" class="td2">�μӹ���ʱ�䣺</td>
          <td class="td1">
		  &nbsp;<bean:write property="QueryStudent/StartWorkingTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>		  </td>
        </tr>
        <tr>
          <td align="right" class="td2">ְ������</td>
          <td class="td1">&nbsp;<bean:write property="QueryStudent/Duty"  />            </td> 
          <td align="right" class="td2">ְ��������</td>
          <td class="td1">
		  &nbsp;<dict:write businTypeId="dx_dutylevel" property="QueryStudent/dutylevel"  />		       </td>
          <td align="right" class="td2">�뵳ʱ�䣺</td>
          <td class="td1">
		  &nbsp;<bean:write property="QueryStudent/JoinPartyTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>		  </td>
        </tr>
        <tr>
          <td align="right" class="td2">����ְ�� </td>
          <td class="td1">&nbsp;<bean:write property="QueryStudent/PartyPost"  /></td> 
          <td align="right" class="td2">���ְ�� </td>
          <td class="td1">&nbsp;<bean:write property="QueryStudent/SocietyPost"  /></td>
          <td align="right" class="td2">��λ�绰��</td>
          <td class="td1">&nbsp;<bean:write property="QueryStudent/OrganTel"  />          </td>
        </tr>
        <tr>
          <td align="right" class="td2">��λ��ַ��</td>
          <td class="td1">&nbsp;<bean:write property="QueryStudent/OrgAddr" /></td>
          <td align="right" class="td2">��λ�ʱࣺ </td>
          <td class="td1">&nbsp;<bean:write property="QueryStudent/OrgPostcode" /></td> 
          <td align="right" class="td2">סլ�绰�� </td>
          <td class="td1">&nbsp;<bean:write property="QueryStudent/HomeTel"  />          </td>
        </tr>
        <tr>
          <td align="right" class="td2">�������䣺</td>
          <td class="td1">&nbsp;<bean:write property="QueryStudent/Email"/>          </td> 
          <td align="right" class="td2">�֡������� </td>
          <td class="td1">&nbsp;<bean:write property="QueryStudent/MobileTel" />          </td>
          <td align="right" class="td2">���ƺţ�</td>
          <td class="td1">&nbsp;<bean:write property="QueryStudent/carNumber" /></td>
        </tr>
        <tr>
          <td align="right" class="td2">�֡����飺</td>
          <td class="td1">&nbsp;<bean:write property="QueryStudent/TeamName"  />          </td>
          <td align="right" class="td2">��(��)ҵ֤���룺</td>
          <td class="td1">&nbsp;<bean:write property="QueryStudent/DiplomaNO"  />          </td>
          <td rowspan="3" align="right" class="td2">�ա�Ƭ��</td>
          <td rowspan="3" class="td1"><img src='/common/page/viewimgdb/viewFromDB.jsp?table=Student&pkn=StudentID&field=Photo&pkv=<bean:write property="QueryStudent/StudentID"/>' width="80" height="100"></td>
          </tr>
        <tr>
          <td align="right" class="td2">��ѵ�����룺</td>
          <td colspan="3" class="td1">&nbsp;<bean:write property="QueryStudent/Barcode"  /></td>
          </tr>
        <tr> 
          <td align="right" class="td2">������ע��</td>
          <td colspan="3" class="td1">&nbsp;<bean:write property="QueryStudent/Remark" />		  </td>
          </tr>
      </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              
            <td align="center"> 
              <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="javascript:history.go(-1)"></td>
            </tr>
          </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
  </form>
  