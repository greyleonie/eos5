<%@include file="/internet/common.jsp"%>
<title>教学单元授权</title>
<body>
<form name="listForm" method="post">

  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>          
            <td class="td1"><bean:write property="planName"/>教学单元授权</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%" height="6"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td></td>
        </tr>
      </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
   
    <tr>
      <td class="text">   
      <%
       int index=0;
       int count=0; 
        String orgId="";
        String org="";
      %>
      <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
             <tr align="center" class="td_title">
            <td nowrap>单元名称
            </td>
            <td nowrap >单元标题</td>
            <td nowrap >
			    教研部
			</td>    
          </tr> 
         <logic:iterate id="resultSet" property="list[@type='TeachingPlanUnitTemp']">
          <tr align="left" class="td1">
            <td width=""><input type="hidden" name="list/TeachingPlanUnit[@hciTagIndex='<%=count %>']/UnitID" value='<bean:write id="resultSet" property="entity/UnitID"/>'/>
             <%
               index++;
             
               orgId=base.util.TalentContext.getValue(pageContext,"resultSet","entity/org");
              %>
            <bean:write id="resultSet" property="entity/UnitName"/>
            </td>
            <td nowrap >&nbsp;<bean:write id="resultSet" property="entity/UnitTitle"/></td>
            <td nowrap align="left">
            <SELECT name="list/TeachingPlanUnit[@hciTagIndex='<%=count %>']/org">
                <option value="-1">选择教研部</option>
                <logic:iterate id="orgResult" property="list[@type='EOSORG_T_Organization']">
                   <%
                     org=base.util.TalentContext.getValue(pageContext,"orgResult","EOSORG_T_Organization/orgid");
                     if(org==null)org="";
                      if(org.equals(orgId)){
                      %>
                        <option  value="<%=org %>" selected><bean:write id="orgResult" property="EOSORG_T_Organization/orgname"/></option>
                      <% 
                      }else{
                       %>
                           <option  value="<%=org %>"><bean:write id="orgResult" property="EOSORG_T_Organization/orgname"/></option>
                    <% 
                      }
                      
                        count++;
                    %>
                </logic:iterate>
            </SELECT>
			</td>    
          </tr> 
         
          </logic:iterate>
     </table>
          <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
           <tr>
              <td height="30" align="center" class="text">
                &nbsp;
              </td>
            </tr>
            <tr>
              <td height="30" align="center" class="text">
                &nbsp;
              </td>
            </tr>
            
            <tr>
              <td height="30" align="center" class="text">
                <input name="add23" type="button" class="button_02" value="保存" onClick="saveDelegate()"> 
                 <input name="add23" type="button" class="button_02" value="关闭" onClick="window.close()"> 
              </td>
            </tr>
          </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
</form>
</body>
<script language="javascript">
var frm=document.listForm;
function saveDelegate(){
frm.action="teachWorkManage.prMakeTeachPlan.saveDelegate.do";
frm.submit();
}
</script>