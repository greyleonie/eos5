<%@ include file="/internet/common.jsp" %><eos:css/>
<html>
<head>
	<script language="JavaScript" src="/internet/scripts/pagination.js"></script>
	 <link rel="stylesheet" href="/internet/css/style.css" type="text/css" />
</head>
<form name="roleList" action="ROLE.pr_automata.ROLE_P_QueryRoleAll.do" method="POST">
	
	<!----------Hidden Param Start---------------->
	<html:hidden property="QueryCondition[@entity='EOSRole']/PageCond/begin" />
	<html:hidden property="QueryCondition[@entity='EOSRole']/PageCond/length" />
	<html:hidden property="QueryCondition[@entity='EOSRole']/PageCond/count" />
	<!----------Hidden Param END---------------->
	
	<script>
		var otherPage = new page();
		otherPage.init("roleList", "QueryCondition[@entity='EOSRole']/PageCond/begin", "QueryCondition[@entity='EOSRole']/PageCond/length", "QueryCondition[@entity='EOSRole']/PageCond/count");
	</script>
<table width="103%" height="100%"  border=0>
   <tr valign="top">
        <td >
            <eos:OneTab name="��ɫ����" imagePath="/internet/images/tt.gif" >
		    <table class="result" cellpadding="0"  cellspacing="0"> 
		          <tr><td height="5%"colspan="2"><b>��ɫ�б�</b></td></tr> 
			  <tr  valign="top">
			      <td colspan="2" class="tb_blue" height="55%">
		                    <table width="100%" border="1" cellpadding="0"  cellspacing="0" bordercolor="#B6B5B5" style="border-collapse: collapse" >
			             <tr class="tableHeadTR"> 
		    			<td width="5%">ѡ��</td>
		    			<td>��ɫID</td>
		    			<td>��ɫ��</td>
					</tr>
					
					<logic:iterate id="EOSRole" property="QueryCondition[@entity='EOSRole']/list[@type='EOSRole']">
		
					<tr class="tableContentTR" >
					                
		                                       	<td width="5%" align="center">
						
							   <html:checkbox indexed="true" name="list/EOSRole/roleID" id="EOSRole" property="EOSRole/roleID" />
						
		    					</td>
		    					<html:hidden name="temName" id="EOSRole" property="EOSRole/roleName" />
		    					<td align="center"><bean:write id="EOSRole" property="EOSRole/roleID"/></td>	
		    					<td align="center"><bean:write id="EOSRole" property="EOSRole/roleName"/></td>
		
					</logic:iterate>
		
		
				</table>
			    </td>
			</tr>
                        <tr class=queryLabelTD valign=top> 
			          <td align="left" height="40%"> 
						       <input type="button" name="button2" value="&nbsp;�༭&nbsp;" onclick="javascript:modify()"/>
						       <input type="button" name="button3" value="&nbsp;ɾ��&nbsp;" onclick="javascript:del()"/>
						       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						       <input type="button" name="button1" value="&nbsp;������ɫ&nbsp;" onclick="javascript:add()"/>
				  </td>	
				  <td align="right" height="40%"> 		
						<!-------------------��ҳ��ʼ---------------------------->
							<script>
								if (otherPage.total > 1 && !otherPage.noCount) {
								                document.write('<input type="button" name="button5" value="��һҳ" onclick="javascript:otherPage.previousPage()"/>&nbsp;');
									document.write('<input type="button" name="button5" value="��һҳ" onclick="javascript:otherPage.nextPage()"/>&nbsp;&nbsp;');	
									document.write('�ܹ�' + otherPage.count + '��');
									document.write('&nbsp;&nbsp;��');
									document.write(otherPage.current + '/');
									document.write(otherPage.total + 'ҳ&nbsp;&nbsp;')
								}
							</script>
							
			          </td> 
						<!-------------------��ҳ����---------------------------->
			  </tr>	
		  </table>
           </form>
       </eos:OneTab>
    </td>
  </tr> 
 </table>		

<%@ include file="/internet/commonTail.jsp" %>
<script language="JavaScript">

function selectedCheckboxCount(form){
	var length =0;
	var i=0;
	var count =0;
	eles = form.elements;
	while(i<eles.length){
		obj= eles.item(i);
		type = obj.attributes.item("type").nodeValue;
		if(type == "checkbox"){
			if(obj.checked){
				count++;
			}
		}
		i++;
	}
	return count;
}

function getIDValue(form){
	var length =0;
	var i=0;
	var count =0;
	eles = form.elements;
	while(i<eles.length){
		obj= eles.item(i);
		type = obj.attributes.item("type").nodeValue;
		if(type == "checkbox"){
			if(obj.checked){
			 return obj.value
			}
		}
		i++;
	}
}
function getNameValue(form){
	var length =0;
	var i=0;
	var count =0;
	eles = form.elements;
	while(i<eles.length){
		obj= eles.item(i);
		type = obj.attributes.item("type").nodeValue;
		if(type == "checkbox"){
			if(obj.checked){
			 return eles.item(i+1).value
			}
		}
		i++;
	}
}
function add(){
	var frm = document.roleList;
	frm.action = "ROLE.pr_automata.ROLE_P_AddRole.do";
	frm.submit();
}

function modify(){
        
	var frm = document.roleList;
        var eleID=0;
        var eleName=0;
	if(selectedCheckboxCount(frm) != 1){
		alert("������ѡ��һ����¼����ִ���޸Ĳ�����");
		return;
	}	

        eleID=getIDValue(frm);
        eleName=getNameValue(frm);
 
	frm.action = "ROLE.pr_automata.ROLE_P_RoleDetailFrame.do?EOSRole/roleID="+eleID+"&EOSRole/roleName="+eleName;
	frm.submit();
}

function del(){
	var frm = document.roleList;
	
	if(selectedCheckboxCount(frm) < 1){
		alert("������ѡ��һ����¼����ִ��ɾ��������");
		return;
	}
	frm.action = "ROLE.pr_automata.ROLE_P_DeleteRole.do";
	frm.target = "_top";
	if(confirm("ȷ��Ҫɾ���˽�ɫ?") == true){
			frm.submit();
	}
}


</script>
