
<%@include file="/internet/common.jsp"%>
<title>查看意见</title>
<body>
<form name="frm" mehod="post">
  <table width="60%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="80%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15">
            <html:hidden property="planStatus"/>
             </td>
            <td width="999" class="text_wirte">首页 -&gt; 教务管理 -&gt;教学计划编制     
              -&gt;
               <logic:lessThan property="planStatus" value="4">
                  审核意见
               </logic:lessThan>
            <logic:greaterThan property="planStatus" value="3">                 
              审批意见              
            </logic:greaterThan> 
          </td>
          </tr>
      </table></td>
    </tr>
  </table>

    
  <table width="60%"  border="0" align="center" cellpadding="0" cellspacing="0">
   <tr>
      <td class="text" ><table width="60%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr >
            <td align="left" nowrap class="td2" >
             <logic:lessThan property="planStatus" value="4">
           审核意见：
               </logic:lessThan>
            <logic:greaterThan property="planStatus" value="3">     
            审批意见：             
            </logic:greaterThan> </td>
            <td class="td1" nowrap>            
       <bean:write property="view"/>  
            </td>
          </tr>
        </table>
      
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
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
<script>

  
</script>
<script language="javascript">
var frm=document.frm;
</script>