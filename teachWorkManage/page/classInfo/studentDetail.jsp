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
            <td width="12%" align="right" class="td2">�ࡡ������ </td>
          <td colspan="3" class="td1">&nbsp;<bean:write property="Class/ClassName"/></td>
        </tr>
        <tr> 
          <td align="right" class="td2">�ա������� </td>
          <td width="36%" class="td1"><bean:write property="QueryStudent/operatorname"/> 
          </td>
          <td width="12%" align="right" class="td2">�ԡ����� </td>
          <td width="40%" class="td1"><dict:write businTypeId="BNDICT_gender" property="QueryStudent/Sex" /></td>
        </tr>
        <tr> 
          <td align="right" class="td2">ѧ�����ţ� </td>
          <td class="td1"><bean:write property="QueryStudent/StudentNO"/> 
           </td>
          <td align="right" class="td2">�֡����飺</td>
          <td class="td1">
          </td>
        </tr>
        <tr> 
          <td align="right" class="td2">�������£� </td>
          <td class="td1">
		  <bean:write property="QueryStudent/Birthdate" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
          </td>
          <td align="right" class="td2">�뵳ʱ�䣺 </td>
          <td class="td1">
          <bean:write property="QueryStudent/JoinPartyTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
          </td>
        </tr>
        <tr> 
          <td align="right" class="td2">������λ�� </td>
          <td class="td1"><bean:write property="QueryStudent/WorkingOrgan"/>
            </td>
          <td align="right" class="td2">�μӹ���ʱ�䣺 </td>
          <td class="td1">
          <bean:write property="QueryStudent/StartWorkingTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
          </td>
        </tr>
        <tr> 
          <td height="22" align="right" class="td2">�Ļ��̶ȣ� </td>
          <td class="td1"><dict:write businTypeId="dx_education" property="QueryStudent/DegreeID"/></td>
          <td align="right" class="td2">ѧ����λ�� </td>
          <td class="td1">
		  <logic:notEqual property="QueryStudent/zhuanye" value="null">
		  <bean:write property="QueryStudent/zhuanye"/> 
		  </logic:notEqual>
          </td>
        </tr>
        <tr> 
          <td align="right" class="td2">�񡡡��壺</td>
          <td class="td1"><dict:write businTypeId="dx_folk" property="QueryStudent/FolkID"  /> </td>
          <td align="right" class="td2">�֡������� </td>
          <td class="td1"><bean:write property="QueryStudent/MobileTel"/> 
          </td>
        </tr>
        <tr> 
          <td align="right" class="td2">ְ������</td>
          <td class="td1">
          <bean:write property="QueryStudent/Duty"/> 
          </td>
          <td align="right" class="td2">ְ��������</td>
          <td class="td1"><dict:write businTypeId="dx_dutylevel" property="QueryStudent/dutylevel" /> </td>
        </tr>
        <tr> 
          <td align="right" class="td2">��λ�绰��</td>
          <td class="td1"><bean:write property="QueryStudent/OrganTel"/>
		  </td>
          <td align="right" class="td2">סլ�绰�� </td>
          <td class="td1"><bean:write property="QueryStudent/HomeTel"/>
		  </td>
        </tr>
        <tr  > 
          <td align="right" class="td2">�������䣺</td>
          <td class="td1"><bean:write property="QueryStudent/Email"/>
           </td>
          <td align="right" class="td2">�ա���Ƭ��</td>
          <td class="td1"><img src='/common/page/viewimgdb/viewFromDB.jsp?table=Student&pkn=StudentID&field=Photo&pkv=<bean:write property="QueryStudent/StudentID"/>' widht="80" height="100"></td>
        </tr>
        <tr> 
          <td align="right" class="td2">������ע��</td>
          <td colspan="3" class="td1"><bean:write property="QueryStudent/Remark"/>
		  </td>
        </tr>
      </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              
            <td align="center"> 
              <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="history.back()"></td>
            </tr>
          </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
  </form>
  