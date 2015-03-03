<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prFolder.fileList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;办公系统—&gt;公共事务—&gt;共享文件夹</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prFolder.fileList.do">
		<input type="hidden" name="addaction" value="oa.prFolder.fileAdd.do">
		<input type="hidden" name="modifyaction" value="oa.prFolder.fileModify.do">
		<input type="hidden" name="deleteaction" value="oa.prFolder.fileDelete.do">
		<input type="hidden" name="viewaction" value="oa.prFolder.fileView.do">
		<input type="hidden" name="renameaction" value="oa.prFolder.rename.do">
		
		<html:hidden property="ShareFolder/_order/col1/field"/>
		<html:hidden property="ShareFolder/_order/col1/desc" />
		

	  </td>
    </tr>
  </table>


<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
	  <tr>
	  	<td class="text">
                <input name="add" type="button" class="button_02" value="新建文件" onClick="fileadd('<bean:write property="fid"/>')">
              	<input name="delete" type="button" class="button_02" value="删除文件" onClick="filedelete()">
              	<input name="modify" type="button" class="button_02" value="重命名" onClick="rename()">
				<input name="Submit2" type="button" class="button_02" value="返 回" onClick="javascript:document.location.href='oa.prFolder.folderList.do'">
		</td>
	  </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="5%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                  <td width="28%" align="center" nowrap id="ShareFolder.FileName" onClick="talentsort()">文件名称</td>
                  <td width="9%" align="center" nowrap id="ShareFolder.FileSize" onClick="talentsort()">文件大小</td>
                  <td width="16%" align="center" nowrap id="ShareFolder.FileType" onClick="talentsort()">文件类型</td>
                  <td width="18%" align="center" nowrap id="ShareFolder.UpdateTime" onClick="talentsort()">修改时间</td>
                  <td width="14%" align="center" nowrap id="ShareFolder.CreaterIDs" onClick="talentsort()">上传人</td>
                  <td width="10%" align="center" nowrap >操作</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='ShareFolder']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" >  
                <td align="center"> 
					<logic:present  id="resultset" property="ShareFolder/FileID">
					    <logic:notEqual id="resultset" property="ShareFolder/Status" value='1'> 
                  		<html:checkbox id="resultset" name="list[@name='update']/ShareFolder/FileID" property="ShareFolder/FileID" indexed="true"/> 
                  		</logic:notEqual>
                  		<logic:equal id="resultset" property="ShareFolder/Status" value='1'>
                  		<input type="checkbox"  disabled/> 
                  		</logic:equal>
                  	</logic:present> 
				</td>
				<td nowrap>&nbsp;
				<a href="/oa/page/shareFolder/downloadFile.jsp?filePath=<bean:write id="resultset" property="ShareFolder/FilePath"/>&&fileName=<bean:write id="resultset" property="ShareFolder/FileName"/>" onFocus="this.blur()">
				<logic:equal id="resultset" property="ShareFolder/Style" value='0'><img border='0' src="/internet/image/shareFolder/file6.gif" width="16" height="16"></logic:equal>
				<logic:equal id="resultset" property="ShareFolder/Style" value='1'><img border='0' src="/internet/image/shareFolder/file3.gif" width="16" height="16"></logic:equal>
				<logic:equal id="resultset" property="ShareFolder/Style" value='2'><img border='0' src="/internet/image/shareFolder/file1.gif" width="16" height="16"></logic:equal>
				<logic:equal id="resultset" property="ShareFolder/Style" value='3'><img border='0' src="/internet/image/shareFolder/file2.gif" width="16" height="16"></logic:equal>
				<logic:equal id="resultset" property="ShareFolder/Style" value='4'><img border='0' src="/internet/image/shareFolder/file5.gif" width="16" height="16"></logic:equal>
				<logic:equal id="resultset" property="ShareFolder/Style" value='5'><img border='0' src="/internet/image/shareFolder/file7.gif" width="16" height="16"></logic:equal>
				
				<bean:write id="resultset" property="ShareFolder/FileName" /></a></td>
                <td nowrap align="center"><bean:write id="resultset" property="ShareFolder/FileSize"/>&nbsp;</td>
                <td nowrap align="center"><bean:write id="resultset" property="ShareFolder/FileType"/></td>
                <td nowrap align="center"><bean:write id="resultset" property="ShareFolder/UpdateTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd HH:mm"/></td>
				<td nowrap align="center"><bean:write id="resultset" property="ShareFolder/CreaterIDsName"/></td>
				<td nowrap align="center"><a href="/oa/page/shareFolder/downloadFile.jsp?filePath=<bean:write id="resultset" property="ShareFolder/FilePath"/>&&fileName=<bean:write id="resultset" property="ShareFolder/FileName"/>" ><SPAN class="linkOA">下载</SPAN></a></td>
              </tr>
                </logic:iterate> 
              </table>
		  
		  </td>
      </tr>
      <tr>
        <td class="text">&nbsp;</td>
      </tr>
    </table>    </td>
  </tr>
</table>
</form>
</body>
<script>
function fileadd(id){
	var url = "oa.prFolder.fileAdd.do?fid="+id;
	var width = 500;
	var height = 300;
	var xposition = (screen.width-width)/2;
	var yposition = (screen.height-height-25)/2;
	window.open(url,'file','height='+height+',width='+width+',left='+ xposition +',top='+ yposition +',toolbar=no,menubar=no,scrillbars=no,resizable=no,location=no,status=no');
}

function rename() {
	var frm =document.forms[0];
	if(chechedCount(frm)<1){
    	alert("至少必须选择一行！");
    	return ;
    }
	if(chechedCount(frm)>1){
    	alert("只能选择一行！");
    	return ;
    }
	if(chechedCount(frm)==1){
		id = getChechedValue(frm);
    	frm.action = frm.elements["renameaction"].value;
    	frm.action += "?type=1&fid=" + id;
		var width = 500;
		var height = 300;
		var xposition = (screen.width-width)/2;
		var yposition = (screen.height-height-25)/2;
		window.open(frm.action,'folder','height='+height+',width='+width+',left='+ xposition +',top='+ yposition +',toolbar=no,menubar=no,scrillbars=no,resizable=no,location=no,status=no');
	    		
			//frm.submit();		
    }
		
}

function filedelete(){
	var frm =document.forms[0];
	if(chechedCount(frm)<1){
    	alert("至少必须选择一行！");
    	return ;
    }
	if(chechedCount(frm)>1){
    	alert("只能选择一行！");
    	return ;
    }
    
 
	if(chechedCount(frm)==1){
	    if(confirm("文件删除后将不可恢复,确定要删除吗?")==false){
			return ;
		} 
		id = getChechedValue(frm);
    	frm.action = frm.elements["deleteaction"].value;
    	frm.action += "?fid=" + id;	
		frm.submit();		
    }
}

function downloadFile(id){

}
</script>