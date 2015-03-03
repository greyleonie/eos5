<%@include file="/internet/common.jsp"%>
<title>查看课程修改痕迹</title>
<form>
 
  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8" class="td1"> 查看课程修改痕迹</td>
    </tr>
    <tr>
      <td class="text">     
        
        <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr align="center" class="td_title">
           
            <td width="12%">修改日期</td>
            <td width="12%">修改人</td>
            <td width="%">修改内容</td>
         
             <%int count=0; %> </tr>
        <logic:iterate id="resultSet" property="list[@type='updateRecord']">
         
          <tr class="td1" onClick="changeTRBgColor(this)" onDBLclick="courseDetail('<bean:write id="resultSet" property="TeachingPlanBu/id"/>')" title="双击可查看该版本详细信息">
            
           <td width=""><bean:write id="resultSet" property="updateRecord/AdjustTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>　</td>
            <td width=""><bean:write id="resultSet" property="updateRecord/Adjuster" />　</td>
            <td width=""><bean:write id="resultSet" property="updateRecord/AdjustContent"/>　</td>        
            
          </tr>
          <%count++; %>
          </logic:iterate>

        </table>
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
          
            <tr>
            <td height="30" class="td1" align="center"> 
              <input name="B3" type="button" class="button_02" value="关闭" onClick="window.close()">
            </td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
</form>