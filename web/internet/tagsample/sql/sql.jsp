<%@ include file="../head.jsp" %> 
<table width="960" border="1"  cellpadding="0" cellspacing="0" bordercolor="#BFC2C6" class="input-tb" style="border-collapse: collapse">
<tr><td colspan=4 class="Result-title">��ʾ���ݿ������</td></tr>
<tr><td class="Result-bt">�ֶ�һ</td><td class="Result-bt">�ֶ�һ</td><td class="Result-bt">�ֶ�һ</td><td class="Result-bt">ʱ��</td></tr>
  <eos:enum  packageName="ROLE"  property="querysql" offset="0" length="10">
   <tr>
      <td><input type="text" class="Result-box" value='<eos:field property="name"  maxLength="30"/>'></td>
      <td  class="Result-tb2"><eos:field property="age"  maxLength="10"/></td> 
      <td class="Result-tb2"><eos:field property="address"  maxLength="6"/></td>  
      <td class="Result-tb2"><eos:field property="birth" /></td>  
   </TR>    
  </eos:enum>
</TABLE>

<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p><a href="./sqlsource.htm">�鿴Դ����</a></p>

