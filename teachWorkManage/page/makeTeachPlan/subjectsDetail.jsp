<%@include file="/internet/common.jsp"%>

<body>
<form>

  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;��ѧ�ƻ����ơ�&gt;�鿴����</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8">
    
       </td>
    </tr>
    <tr>
      <td class="text">
      <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
        <tr>
            <td align="right" class="td2" width="20%">�γ̱��⣺</td>
            <td class="td1">            
            <bean:write property="Subjects/SubjectName"/>
            </td>
          </tr>
          <tr>
            <td align="right" class="td2">�Ͽ����ڣ�</td>
            <td class="td1">
                <bean:write property="Subjects/ClassTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
          
           
          </td>
          </tr>
          <tr>
            <td align="right" class="td2">��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
            <td class="td1"><dict:write businTypeId="BNDICT_classMoon" property="Subjects/ClassNoon"/></td>
          </tr>
          <tr>
            <td align="right" class="td2">�ڿν�ʦ��</td>
            <td class="td1">           
            <bean:write property="shouKe"/>            
            </td>
          </tr>
          <tr>
            <td align="right" class="td2">�Ƿ����룺</td>
            <td class="td1">
           <logic:equal  property="Subjects/IsOuter" value="0">��</logic:equal>
           <logic:equal property="Subjects/IsOuter" value="1">��</logic:equal>
           </td>
          </tr>
          <tr>
            <td align="right" class="td2">�������в���</td>
            <td class="td1">
            <logic:iterate id="result" property="list[@type='EOSORG_T_Organization']">
               <logic:equal property="Subjects/TeachingGroupID" valueType="variable" valueId="result" valueProperty="EOSORG_T_Organization/orgid">
                  <bean:write id="result" property="EOSORG_T_Organization/orgname"/>
               </logic:equal>
            </logic:iterate>
          
              </td>
          </tr>
          <tr>
            <td align="right" class="td2">�����ʦ��λ��</td>
            <td class="td1">
            <bean:write property="Subjects/OuterOrg"/> 
            </td>
          </tr>
          <tr>
            <td align="right" class="td2">ְ&nbsp;&nbsp;&nbsp;&nbsp;��</td>
            <td class="td1">
             <bean:write property="Subjects/Post"/>      
            </td>
          </tr>
          <tr  >
            <td align="right" class="td2">ְ&nbsp;&nbsp;&nbsp;&nbsp;�ƣ�</td>
            <td class="td1"> 
       <bean:write property="Subjects/JobTitle"/>                    
</td>
          </tr>
       
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
                <input name="Submit2" type="button" class="button_02" value="�� ��" onclick="history.go(-1)"></td>
            </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
</form>
</body>