<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prFolder.folderList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prFolder.folderList.do">
		<input type="hidden" name="addaction" value="oa.prFolder.folderAdd.do">
		<input type="hidden" name="modifyaction" value="oa.prFolder.folderModify.do">
		<input type="hidden" name="deleteaction" value="oa.prFolder.folderDelete.do">
		<input type="hidden" name="viewaction" value="oa.prFolder.folderView.do">
		<input type="hidden" name="fileaction" value="oa.prFolder.folderList.do">
		<input type="hidden" name="empoweraction" value="oa.prFolder.folderEmpower.do">
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
	  	        <logic:notEqual property="ShareFolder/ParentFileID/criteria/value" value='0'>
	  	        <logic:notEqual property="ShareFolder/ParentFileID/criteria/value" value='1'>
              	<logic:equal property="ShareFolder/UserType" value="1">
              	<logic:notEqual property="ShareFolder/ParentFileName/criteria/value" value="�ڲ��ļ��鵵����">
	  	        <input name="add" type="button" class="button_eight" value="�½��ļ�(��)" onClick="folderadd()">
	  	        </logic:notEqual>
              	<input name="delete" type="button" class="button_eight" value="ɾ���ļ�(��)" onClick="folderdelete()">
              	<input name="modify" type="button" class="button_02" value="������" onClick="rename()">
              	</logic:equal>
              	<logic:equal property="ShareFolder/UserType" value='2'>
              	<qx:talentButton value="�½��ļ�(��)" styleClass="button_eight" type="button" operation="DX_OASYS_AFFAIR_SHAREFOLDER_OFFICE.DX_OASYS_AFFAIR_SHAREFOLDER_OFFICE_ADD" onclick="folderadd()" property="add"></qx:talentButton>
         		<qx:talentButton value="ɾ���ļ�(��)" styleClass="button_eight" type="button" operation="DX_OASYS_AFFAIR_SHAREFOLDER_OFFICE.DX_OASYS_AFFAIR_SHAREFOLDER_OFFICE_DELETE" onclick="folderdelete()" property="delete"></qx:talentButton>
        		<qx:talentButton value="������" styleClass="button_02" type="button" operation="DX_OASYS_AFFAIR_SHAREFOLDER_OFFICE.DX_OASYS_AFFAIR_SHAREFOLDER_OFFICE_RENAME" onclick="rename()" property="modify"></qx:talentButton>
              	</logic:equal>
              	<logic:equal property="ShareFolder/UserType" value='3'>
              	<qx:talentButton value="�½��ļ�(��)" styleClass="button_eight" type="button" operation="DX_OASYS_AFFAIR_SHAREFOLDER_SCHOOL.DX_OASYS_AFFAIR_SHAREFOLDER_SCHOOL_ADD" onclick="folderadd()" property="add"></qx:talentButton>
         		<qx:talentButton value="ɾ���ļ�(��)" styleClass="button_eight" type="button" operation="DX_OASYS_AFFAIR_SHAREFOLDER_SCHOOL.DX_OASYS_AFFAIR_SHAREFOLDER_SCHOOL_DELETE" onclick="folderdelete()" property="delete"></qx:talentButton>
        		<qx:talentButton value="������" styleClass="button_02" type="button" operation="DX_OASYS_AFFAIR_SHAREFOLDER_SCHOOL.DX_OASYS_AFFAIR_SHAREFOLDER_SCHOOL_RENAME" onclick="rename()" property="modify"></qx:talentButton>
              	</logic:equal>
              	<logic:equal property="ShareFolder/UserType" value='4'>
              	<qx:talentButton value="�½��ļ�(��)" styleClass="button_eight" type="button" operation="DX_OASYS_AFFAIR_SHAREFOLDER_INFILE.DX_OASYS_AFFAIR_SHAREFOLDER_INFILE_ADD" onclick="folderadd()" property="add"></qx:talentButton>
         		<qx:talentButton value="ɾ���ļ�(��)" styleClass="button_eight" type="button" operation="DX_OASYS_AFFAIR_SHAREFOLDER_INFILE.DX_OASYS_AFFAIR_SHAREFOLDER_INFILE_DELETE" onclick="folderdelete()" property="delete"></qx:talentButton>
        		<qx:talentButton value="������" styleClass="button_02" type="button" operation="DX_OASYS_AFFAIR_SHAREFOLDER_INFILE.DX_OASYS_AFFAIR_SHAREFOLDER_INFILE_RENAME" onclick="rename()" property="modify"></qx:talentButton>
              	</logic:equal>
              	<!--<input name="view" type="button" class="button_02" value="�� Ȩ" onClick="empower()"> -->
				<input name="Submit2" type="button" class="button_02" value="�� ��" onClick="javascript:history.go(-1)">
				</logic:notEqual>
				</logic:notEqual>
		</td>
		
	  </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <logic:equal property="ShareFolder/ParentFileID/criteria/value" value='0'>
      <tr><td>
      <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" >
	  
	  <%int i=0; %>
      <logic:iterate id="resultset" property="list[@type='ShareFolder']"> 
      <%i++;
         if(i%2==1){
      %><tr><%} %>
	   <td height="160">
	     
         <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
            <tr  align="center"> 
	           <td width="50%" height="66" class='td1'><a href="#" onClick="openFile('<bean:write id="resultset" property="ShareFolder/FileID"/>','<bean:write id="resultset" property="ShareFolder/FileName"/>')"><img border='0' src="/internet/image/shareFolder/f<%=i %>.gif" width="64" height="64" align="middle"></a></td>
           </tr>
	      <tr align="center"> 
	         <td class='td1'><a href="#" onClick="openFile('<bean:write id="resultset" property="ShareFolder/FileID"/>','<bean:write id="resultset" property="ShareFolder/FileName"/>')"><bean:write id="resultset" property="ShareFolder/FileName"/></a></td>
          </tr>
         </table>
         
		</td> 
		<%if(i%2==0){ %>
          </tr>
        <%} %>
	  </logic:iterate> 
	  <%if(i%2==1){ %>
           <td align="center">&nbsp;</td>
          </tr>
          <%} %>
	  </table>  
	   </td></tr> 
      </logic:equal>
      <logic:notEqual property="ShareFolder/ParentFileID/criteria/value" value='0'>
            <logic:equal property="ShareFolder/ParentFileID/criteria/value" value='1'>
      <tr><td>
      <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" >
	  
	  <%int j=0; %>
      <logic:iterate id="resultset" property="list[@type='ShareFolder']"> 
      <%j++;
         if(j%5==1){
      %><tr><%} %>
	   <td height="60" width="100">
	     
         <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
            <tr  align="center"> 
	           <td width="100%" height="60"><a href="#" onClick="openFile('<bean:write id="resultset" property="ShareFolder/FileID"/>','<bean:write id="resultset" property="ShareFolder/FileName"/>')"><img border='0' src="/internet/image/shareFolder/f1<%=j %>.jpg" width="64" height="64" align="middle"></a></td>
           </tr>
	      <tr align="center"> 
	         <td><a href="#" onClick="openFile('<bean:write id="resultset" property="ShareFolder/FileID"/>','<bean:write id="resultset" property="ShareFolder/FileName"/>')"><bean:write id="resultset" property="ShareFolder/FileName"/></a></td>
          </tr>
         </table>
         
		</td> 
		<%if(j%5==0){ %>
          </tr>
        <%} %>
	  </logic:iterate> 
	  <%if(j%5==1){ %>
           <td align="center">&nbsp;</td>
          </tr>
          <%} %>
	  </table>  
	   </td></tr> 
      </logic:equal>
      <logic:notEqual property="ShareFolder/ParentFileID/criteria/value" value='1'>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="5%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                  <td width="29%" align="center" nowrap id="ShareFolder.FileName" onClick="talentsort()">�ļ�(��)����</td>
                  <td width="11%" align="center" nowrap id="ShareFolder.FileSize" onClick="talentsort()">�ļ�(��)��С</td>
                  <td width="15%" align="center" nowrap id="ShareFolder.FileType" onClick="talentsort()">�ļ�����</td>
                  <td width="17%" align="center" nowrap id="ShareFolder.UpdateTime" onClick="talentsort()">�޸�ʱ��</td>
                  <logic:equal property="ShareFolder/UserType" value='4'>
                  <td width="6%" align="center" nowrap id="ShareFolder.Miji" onClick="talentsort()">�ܼ�</td>
                  </logic:equal>
                  <td width="12%" align="center" nowrap id="ShareFolder.CreaterIDs" onClick="talentsort()">������</td>
                  <td width="11%" align="center" nowrap >����</td>
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
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)">  
                <td align="center"> 
					<logic:present  id="resultset" property="ShareFolder/FileID"> 
					    <logic:notEqual id="resultset" property="ShareFolder/Status" value='2'>
                  		<html:checkbox id="resultset" name="list[@name='update']/ShareFolder/FileID" property="ShareFolder/FileID" indexed="true"/> 
                  		</logic:notEqual>
                  		<logic:equal id="resultset" property="ShareFolder/Status" value='2'>
                  		<input type="checkbox"  disabled/> 
                  		</logic:equal>
                  	</logic:present> 
				</td>
				<td nowrap>&nbsp;
				<logic:equal id="resultset" property="ShareFolder/FileType" value='�ļ���'>
				<logic:notEqual property="ShareFolder/UserType" value='4'>
				<span title="��Ȩ��Ա:<bean:write id="resultset" property="ShareFolder/EmpowerIDsName"/>"></logic:notEqual>
				<a href="#" onClick="openFile('<bean:write id="resultset" property="ShareFolder/FileID"/>','<bean:write id="resultset" property="ShareFolder/FileName"/>')" onFocus="this.blur()">
				<logic:equal id="resultset" property="ShareFolder/Status" value='0'>
				<img border='0' src="/internet/image/shareFolder/folder1.gif" width="16" height="16">
				</logic:equal>
				<logic:equal id="resultset" property="ShareFolder/Status" value='1'>
				<img border='0' src="/internet/image/shareFolder/folder2.gif" width="16" height="16">
				</logic:equal>
				<logic:equal id="resultset" property="ShareFolder/Status" value='2'>
				<img border='0' src="/internet/image/shareFolder/folder3.gif" width="16" height="16">
				</logic:equal>
				<bean:write id="resultset" property="ShareFolder/FileName" /></a><logic:notEqual property="ShareFolder/UserType" value='4'></span></logic:notEqual>
				</logic:equal>
				<logic:notEqual id="resultset" property="ShareFolder/FileType" value='�ļ���'>
				<a href="/oa/page/shareFolder/downloadFile.jsp?filePath=<bean:write id="resultset" property="ShareFolder/FilePath"/>&&fileName=<bean:write id="resultset" property="ShareFolder/FileName"/>" onFocus="this.blur()">
				<logic:equal id="resultset" property="ShareFolder/Style" value='0'><img border='0' src="/internet/image/shareFolder/file6.gif" width="16" height="16"></logic:equal>
				<logic:equal id="resultset" property="ShareFolder/Style" value='1'><img border='0' src="/internet/image/shareFolder/file3.gif" width="16" height="16"></logic:equal>
				<logic:equal id="resultset" property="ShareFolder/Style" value='2'><img border='0' src="/internet/image/shareFolder/file1.gif" width="16" height="16"></logic:equal>
				<logic:equal id="resultset" property="ShareFolder/Style" value='3'><img border='0' src="/internet/image/shareFolder/file2.gif" width="16" height="16"></logic:equal>
				<logic:equal id="resultset" property="ShareFolder/Style" value='4'><img border='0' src="/internet/image/shareFolder/file5.gif" width="16" height="16"></logic:equal>
				<logic:equal id="resultset" property="ShareFolder/Style" value='5'><img border='0' src="/internet/image/shareFolder/file7.gif" width="16" height="16"></logic:equal>
				<bean:write id="resultset" property="ShareFolder/FileName" /></a>
				</logic:notEqual>
				</td>
                <td nowrap align="center"><bean:write id="resultset" property="ShareFolder/FileSize"/>&nbsp;</td>
                <td nowrap align="center"><bean:write id="resultset" property="ShareFolder/FileType"/></td>
                <td nowrap align="center"><bean:write id="resultset" property="ShareFolder/UpdateTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd HH:mm"/></td>
                <logic:equal property="ShareFolder/UserType" value='4'>
                  <td align="center" nowrap >
                <span class="linkOA">
		 		<logic:equal id="resultset" property="ShareFolder/Miji" value='0'>����</logic:equal>
		 		<logic:equal id="resultset" property="ShareFolder/Miji" value='1'>����</logic:equal>
		 		<logic:equal id="resultset" property="ShareFolder/Miji" value='2'>����</logic:equal>
		 		<logic:equal id="resultset" property="ShareFolder/Miji" value='3'>����</logic:equal>
		 		</span>
		 		</td>
		 		</logic:equal>
				<td nowrap align="center"><bean:write id="resultset" property="ShareFolder/CreaterIDsName"/></td>
				<td nowrap align="center">
				<logic:equal id="resultset" property="ShareFolder/FileType" value='�ļ���'>
				<a href="#" onClick="openFile('<bean:write id="resultset" property="ShareFolder/FileID"/>','<bean:write id="resultset" property="ShareFolder/FileName"/>')"><SPAN class="linkOA">��</SPAN></a>
				<logic:notEqual property="ShareFolder/ParentFileID/criteria/value" value='0'>
				<logic:equal property="ShareFolder/UserType" value="1">
				<logic:notEqual property="ShareFolder/ParentFileName/criteria/value" value="�ڲ��ļ��鵵����">
				<logic:notEqual id="resultset" property="ShareFolder/Status" value='2'>
				<a href="#" onClick="empower('<bean:write id="resultset" property="ShareFolder/FileID"/>')"><SPAN class="linkOA">��Ȩ</SPAN></a>
				<logic:notEqual id="resultset" property="ShareFolder/EmpowerIDsName" value="��ǰ��û����Ȩ��Ա">
				<a href="javascript:setDisplay('<bean:write id="resultset" property="ShareFolder/FileID"/>')"><SPAN class="linkOA">�鿴��Ȩ��</SPAN></a>
				</logic:notEqual>
				</logic:notEqual>
				</logic:notEqual>
				</logic:equal>
				</logic:notEqual>
				</logic:equal>
				<logic:notEqual id="resultset" property="ShareFolder/FileType" value='�ļ���'>
				<a href="/oa/page/shareFolder/downloadFile.jsp?filePath=<bean:write id="resultset" property="ShareFolder/FilePath"/>&&fileName=<bean:write id="resultset" property="ShareFolder/FileName"/>" ><SPAN class="linkOA">����</SPAN></a>
				</logic:notEqual>
				</td>
              </tr>
                <logic:equal id="resultset" property="ShareFolder/FileType" value='�ļ���'>
                <logic:notEqual property="ShareFolder/ParentFileID/criteria/value" value='0'>
				<logic:equal property="ShareFolder/UserType" value="1">
				<logic:notEqual id="resultset" property="ShareFolder/Status" value='2'>
				<logic:present id="resultset" property="ShareFolder/EmpowerIDs">
              <tr id='<bean:write id="resultset" property="ShareFolder/FileID"/>' style="display:none" class="td1">
              <td></td>
              <td colspan="6">&nbsp;��Ȩ��Ա:<SPAN class="linkOA"><bean:write id="resultset" property="ShareFolder/EmpowerIDsName"/></SPAN></td>
              </tr>
              </logic:present>
                 </logic:notEqual>
			     </logic:equal>
			     </logic:notEqual>
			     </logic:equal>
                </logic:iterate> 
                
              </table>
		  
		  </td>
      </tr>
      </logic:notEqual>
      </logic:notEqual>
      <tr>
        <td class="text">&nbsp;</td>
      </tr>
    </table>    </td>
  </tr>
</table>
</form>
</body>
<script>
function folderadd(){
    var fid = '<bean:write property="ShareFolder/ParentFileID/criteria/value"/>';
	var url = "oa.prFolder.folderAddFrame.do?fid="+ fid;
	var width = 500;
	var height = 300;
	var xposition = (screen.width-width)/2;
	var yposition = (screen.height-height-25)/2;
	window.open(url,'folder','height='+height+',width='+width+',left='+ xposition +',top='+ yposition +',toolbar=no,menubar=no,scrillbars=no,resizable=no,location=no,status=no');
}


function folderdelete(){
	var frm =document.forms[0];
	if(chechedCount(frm)<1){
    	alert("���ٱ���ѡ��һ�У�");
    	return ;
    }
	if(chechedCount(frm)>1){
    	alert("ֻ��ѡ��һ�У�");
    	return ;
    }
    
 
	if(chechedCount(frm)==1){
	    if(confirm("ȷ��Ҫɾ��ѡ�����ļ����ļ�����?")==false){
			return ;
		} 
		id = getChechedValue(frm);
    	frm.action = frm.elements["deleteaction"].value;
    	frm.action += "?fid=" + id;	
		frm.submit();		
    }
}


function openFile(id,filename){
	var frm = document.forms[0];
	frm.action = frm.elements["fileaction"].value;
	frm.action += "?ShareFolder/ParentFileID/criteria/value=" + id + "&ShareFolder/ParentFileName/criteria/value=" + filename;
   	frm.submit();
}


//function empower() {
//	var frm =document.forms[0];
//	if(chechedCount(frm)<1){
//    	alert("���ٱ���ѡ��һ�У�");
//    	return ;
 //   }
//	if(chechedCount(frm)>1){
//    	alert("ֻ��ѡ��һ�У�");
//    	return ;
//    }
//	if(chechedCount(frm)==1){
//		id = getChechedValue(frm);
//    	frm.action = frm.elements["empoweraction"].value;
//    	frm.action += "?fid=" + id;
//		var width = 500;
//		var height = 300;
//		var xposition = (screen.width-width)/2;
//		var yposition = (screen.height-height-25)/2;
//		window.open(frm.action,'folder','height='+height+',width='+width+',left='+ xposition +',top='+ yposition +',toolbar=no,menubar=no,scrillbars=no,resizable=no,location=no,status=no');
	    		
			//frm.submit();		
//    }
		
//}

function empower(id){
	var frm =document.forms[0];
	frm.action = frm.elements["empoweraction"].value;
	frm.action += "?fid=" + id;
	var width = 500;
	var height = 300;
	var xposition = (screen.width-width)/2;
	var yposition = (screen.height-height-25)/2;
	window.open(frm.action,'folder','height='+height+',width='+width+',left='+ xposition +',top='+ yposition +',toolbar=no,menubar=no,scrillbars=no,resizable=no,location=no,status=no');
  
}

function rename() {
	var frm =document.forms[0];
	if(chechedCount(frm)<1){
    	alert("���ٱ���ѡ��һ�У�");
    	return ;
    }
	if(chechedCount(frm)>1){
    	alert("ֻ��ѡ��һ�У�");
    	return ;
    }
	if(chechedCount(frm)==1){
		id = getChechedValue(frm);
    	frm.action = frm.elements["renameaction"].value;
    	frm.action += "?type=0&fid=" + id;
		var width = 500;
		var height = 300;
		var xposition = (screen.width-width)/2;
		var yposition = (screen.height-height-25)/2;
		window.open(frm.action,'folder','height='+height+',width='+width+',left='+ xposition +',top='+ yposition +',toolbar=no,menubar=no,scrillbars=no,resizable=no,location=no,status=no');
	    		
			//frm.submit();		
    }
		
}

  function setDisplay(id) {
	if(document.getElementById(id).style.display == 'none') {
		document.getElementById(id).style.display = '';
	} else {
		document.getElementById(id).style.display = 'none';
	}
  }
  
  var title ;
  title='<logic:notEqual property="ShareFolder/ParentFileID/criteria/value" value='0'><logic:present  property="ShareFolder/BaseType">��&gt;<bean:write property="ShareFolder/BaseType"/></logic:present>��&gt;<bean:write property="ShareFolder/ParentFileName/criteria/value"/></logic:notEqual>';
  window.parent.subtitle.innerHTML = title;
</script>