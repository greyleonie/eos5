<%@ include file="/internet/common.jsp" %>
<form name="queryForm" action="oa.prPersonOffice.mailfolder.do">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="24" background="/internet/image/lz_bg.gif">
    <table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="12"></td>
        <td class="text_wirte">首页—&gt;办公系统—&gt;个人办公—&gt;邮件夹管理</td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td> </td>
  </tr>
  
</table>
<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr class="td2">
    <td class="text" width="57%">当前用户：<bean:write property="SessionEntity/userID" formatType="userid"/>&nbsp;&nbsp; </td>
    </td>
  </tr>
</table>
<table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td></td>
  </tr>
</table>
<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
  <tr class="tdtitle">
    <td width="9%" align="center" class="td_title"><input type="checkbox" name="checkbox" marked="fcc" onclick="eosCheckAll(document.queryForm,this)" /></td>
    <td id="foldername" width="21%" align="center" class="td_title" onClick="talentsort()">邮件夹</td>
    <td id="newmail" width="27%" align="center" class="td_title" onClick="talentsort()">新邮件</td>
    <td id="mailcount" width="19%" align="center" class="td_title" onClick="talentsort()">邮件总数</td>
    <td id="totalspace" width="24%" align="center" class="td_title" onClick="talentsort()">占用空间</td>
  </tr>
  <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		 %>
		<logic:iterate id="ResultSet" property="list[@type='foldermanage']">
		
		<%
				     
			       	if(count%2==0)
			       	    trClass = "td1";
			       	else
			       	    trClass = "td2";
			       	count++;
		 %>
		
        <tr class="<%=trClass%>" onclick="changeTRBgColor(this)">
          <td align="center">
          <logic:equal id="ResultSet" property="Folder/FolderFlag" value="0">
		   
		   
		   <html:checkbox id="ResultSet" name="list[@name='update']/TOOL_MailDirectory/MAILDIRID" property="Folder/FolderId" indexed="true" attributesText='disabled'/>
		   
		  </logic:equal>
		  <logic:equal id="ResultSet" property="Folder/FolderFlag" value="1">
		   
		   
		   <html:checkbox id="ResultSet" name="list[@name='update']/TOOL_MailDirectory/MAILDIRID" property="Folder/FolderId" indexed="true"/>
		   
		  </logic:equal>
		  
		  </td>
          <td>
		  
		  	<a href='oa.prPersonOffice.mailreceive.do?fid=<bean:write id="ResultSet" property="Folder/FolderId"/>&fname=<bean:write id="ResultSet" property="Folder/FolderName"/>'>
		  		<bean:write id="ResultSet" property="Folder/FolderName"/>
		  	</a>
		  </td>
          <td align="right"><bean:write id="ResultSet" property="Folder/NewMail"/></td>
          <td align="right"><bean:write id="ResultSet" property="Folder/MailNum"/></td>
          <td align="right">
		  <bean:write id="ResultSet" property="Folder/UsedNum"/>Byte
          </td>
        </tr>
        </logic:iterate>
  <tr class="td_title">
      <td colspan="2" align="center">&nbsp;</td>
      <td colspan="2" align="right">&nbsp;邮件总数：<span class="text_red"><bean:write property="TMail/MailTotal"/></span></td>
      <td align="center"> 已占空间：<span class="text_red"><bean:write property="TMail/MailSize"/>Byte</span></td>
  </tr>
</table>
</form>
<script language="JavaScript">
function chechedCount(form){
		var length =0;
	    var i=0;
	    var count =0;
		eles = form.elements;
		while(i<eles.length){
			obj= eles[i];
			if(obj.type == "checkbox"&&obj.getAttribute("marked")==null){
				if(obj.checked){
				  count++;
			     }
			}
			i++;
		}
		return count;
	}

function deleteRows(){
    	var frm =document.queryForm;
   		if(chechedCount(frm)<1){
    		alert("至少必须选择一行！");
    		return ;
    	}
    	
    	if(confirm("是否确定删除指定记录？")==false){
			return ;
		}    	 
    
    	frm.action="oa.prPersonOffice.deleteFolder.do";
    	frm.submit();
    }
</script>