<%@include file="/internet/common.jsp"%>

<body>
<form>

  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;教学计划编制—&gt;查看课题</td>
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
            <td align="right" class="td2" width="20%">课程标题：</td>
            <td class="td1">            
            <bean:write property="Subjects/SubjectName"/>
            </td>
          </tr>
          <tr>
            <td align="right" class="td2">上课日期：</td>
            <td class="td1">
                <bean:write property="Subjects/ClassTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
          
           
          </td>
          </tr>
          <tr>
            <td align="right" class="td2">午&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
            <td class="td1"><dict:write businTypeId="BNDICT_classMoon" property="Subjects/ClassNoon"/></td>
          </tr>
          <tr>
            <td align="right" class="td2">授课教师：</td>
            <td class="td1">           
            <bean:write property="shouKe"/>            
            </td>
          </tr>
          <tr>
            <td align="right" class="td2">是否外请：</td>
            <td class="td1">
           <logic:equal  property="Subjects/IsOuter" value="0">否</logic:equal>
           <logic:equal property="Subjects/IsOuter" value="1">是</logic:equal>
           </td>
          </tr>
          <tr>
            <td align="right" class="td2">所属教研部：</td>
            <td class="td1">
            <logic:iterate id="result" property="list[@type='EOSORG_T_Organization']">
               <logic:equal property="Subjects/TeachingGroupID" valueType="variable" valueId="result" valueProperty="EOSORG_T_Organization/orgid">
                  <bean:write id="result" property="EOSORG_T_Organization/orgname"/>
               </logic:equal>
            </logic:iterate>
          
              </td>
          </tr>
          <tr>
            <td align="right" class="td2">外请教师单位：</td>
            <td class="td1">
            <bean:write property="Subjects/OuterOrg"/> 
            </td>
          </tr>
          <tr>
            <td align="right" class="td2">职&nbsp;&nbsp;&nbsp;&nbsp;务：</td>
            <td class="td1">
             <bean:write property="Subjects/Post"/>      
            </td>
          </tr>
          <tr  >
            <td align="right" class="td2">职&nbsp;&nbsp;&nbsp;&nbsp;称：</td>
            <td class="td1"> 
       <bean:write property="Subjects/JobTitle"/>                    
</td>
          </tr>
       
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
                <input name="Submit2" type="button" class="button_02" value="返 回" onclick="history.go(-1)"></td>
            </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
</form>
</body>