<%@include file="/internet/common.jsp"%>

<%
String noteID=request.getParameter("InnerNote/MSGID");
System.out.println(noteID);
%>
<%String flag = request.getParameter("flag"); %>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="24" background="/internet/image/lz_bg.gif">
    <table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="12"></td>
        <td class="text_wirte">首页—&gt;办公系统—&gt;个人办公—&gt; 查阅短消息</td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="94%"  border="0" align="center" cellpadding="0" cellspacing="0">
 <form name="messForm" method="post">
  <tr>
    <td><table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td> 
         <input type="hidden" name="mark" value="1"/>
		  <html:hidden property="PageCond/begin" />
	      <html:hidden property="PageCond/length" />
	      <html:hidden property="PageCond/count" />
		  <html:hidden property="InnerNote/_order/col1/field" value="SENDDATE"/>
	      <html:hidden property="InnerNote/_order/col1/asc" value="DESC"/>
	      <html:hidden property="InnerNote/MSGTYPE"/>
	      <html:hidden property="InnerNote/ISREAD"/>
	      <html:hidden property="type"/>
	      <input type="hidden" name="InnerNote/CONTENT/criteria/operator" value="like">
          <html:hidden property="InnerNote/SENDACCOUNT"/>
          <html:hidden property="InnerNote/SENDDATE"/>
        
        </td>
      </tr>
    </table>
    <logic:iterate id="ResultSet" property="list[@type='note']">
    
    
     <table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1">
           <logic:equal  property="type" value="send">
             <tr class="td1">
              <td width="18%" align="right" >接收人员名单：</td>
              <td width="37%">&nbsp;<textarea name="TEMP/RECACCOUNTS" cols="50" rows="2"  disabled ><bean:write  property="TEMP/RECNAMES"/></textarea>
               </td>
            </tr>
            </logic:equal>
            <tr class="td2">
            	<td width="16%" align="right">发&nbsp;送&nbsp;人：</td>
            	<td>&nbsp;<bean:write property="InnerNote/SENDACCOUNT" formatClass="username" formatType="userid"/></td>
            	<td width="15%" align="right">发送时间：</td>
            	<td width="37%">&nbsp;
           	  <bean:write property="InnerNote/SENDDATE" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
            </tr>
            <tr class="td1">
              <td align="right">短信标题：</td>
              <td colspan="3">&nbsp;<bean:write id="ResultSet" property="InnerNote/MSGTITLE"/></td>
            </tr>
            <tr class="td2">
              <td align="right">短信内容：</td>
              <td colspan="3">&nbsp;<textarea name="TEMP/CONTENT" cols="50" rows="6" disabled><bean:write id="ResultSet" property="InnerNote/CONTENT"/></textarea></td>
            </tr>
          </table> </td>
        </tr>
      </table>    
      
      
         
      <table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td> </td>
        </tr>
      </table>
      <table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="0" class="text">
        <tr>
          <td align="center">              
 <!--          <logic:equal  id="ResultSet" property="InnerNote/ISREAD" value="0">
              <input name="Submit222" type="submit" class="button_six" value="阅读完毕" onClick="read()">
           </logic:equal>
  -->        
              <%if(flag!=null&&flag.equals("desk")){ %> 
                <input name="Submit2" type="button" class="button_02" value="关 闭" onClick="window.close()">
              <%}else{ %>                    
                <input name="Submit223" type="button" class="button_02" value="返 回" onClick="read()">
              <%} %>
                      
</td></tr>
      </table>
      
      </td>
      </logic:iterate>
  </tr>
</form></table>
<script  language="JavaScript">
function read(){
    	var frm = document.messForm;
  
        frm.action="oa.prPersonOffice.queryInnerNote.do";
       
    	frm.submit();   	
    }

function returnParent(){
    	var frm = document.messForm;
  
        frm.action="oa.prPersonOffice.readNote.do?InnerNote/MSGID=<%=noteID%>";
       
    	frm.submit();   	
    }
  </script>
    