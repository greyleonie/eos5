
<%@include file="/internet/common.jsp"%>
<title>教研部意见汇总</title>
<body>
<form name="frm" mehod="post">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15">
             <html:hidden property="planStatus"/>
             </td>
            <td class="text_wirte">首页 -&gt; 教务管理 -&gt;教学计划编制     
              -&gt;
               教研部意见汇总
            </td>
          </tr>
      </table></td>
    </tr>
  </table>
    
   <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" >
     <tr> 
            <td colspan="13" class="td2">意见汇总：</td>
            </tr>
          <%int i=0; %>
         <logic:iterate id="resultSet" property="list[@type='Course']">
         <%++i; %>
          <tr> 
            <td colspan="13" class="td1"><%=i %>：
             <bean:write id="resultSet" property="Course/orgView"/>
          </td>
            </tr>
         </logic:iterate>  
   </table>
 
  <table width=""  border="0" align="center" cellpadding="0" cellspacing="0">
   <tr>
      <td class="text" width="776">  
      <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
         <tr>
              <td align="center">
             &nbsp;  
                
                </td>
            </tr>
             <tr>
              <td align="center">
             &nbsp;  
                
                </td>
            </tr>
            <tr>
              <td align="center">
             &nbsp;  
                <input name="Submit2" type="button" class="button_02" value="关 闭" onclick="window.close()"></td>
            </tr>
        </table></td>
    </tr>
  
  </table>
</form>
</body>
