<%--
	---------------------------------------------------------------------------------
	Revision           Revision Date    Revision Man         Reason/Statement 
	1.0                2003/03/22       xuyb                create
--%>
<%@include file="/internet/common.jsp" %><eos:css/>
<SCRIPT language=JavaScript src="/internet/scripts/check.js"></SCRIPT>
<script language='javascript' src='/internet/scripts/progress.js' type='text/javascript'> </script>
<script language="javascript">
	var refresh = "<bean:write property="refresh"/>";
	
	
	if(refresh=="tree"){
		window.parent.frames("tree").location="ROLE.pr_automata.ROLE_P_QueryAllMenu.do";
		
	}


	function submit1() {
		var frm = document.forms(0);
		if(frm.elements("EOSMenu/menuID").value==""){
			alert("�Բ���'�˵����'����Ϊ�գ�");
			return ;
		}
		if(frm.elements("EOSMenu/menuLabel").value==""){
			alert("�Բ���'�˵�����'����Ϊ�գ�");
			return ;
		}
		if(isChinaOrNumbOrLett(frm.elements("EOSMenu/menuLabel").value)==false) {
			alert("����Ĳ˵�����Ϊ�Ƿ��ַ������������룡");
			frm.elements("EOSMenu/menuLabel").focus();
			return;
		}   
		if(getTotalBytes(frm.elements["EOSMenu/menuLabel"])>40) {
			alert("�˵�����������������������룡");
			return;
		}   		
		if(frm.elements("EOSMenu/displayOrder").value!="" && !isNumber(frm.elements("EOSMenu/displayOrder").value)){
			alert("�Բ���'��ʾ˳��'������һ������!");
			return;
		}  
		if(frm.elements("EOSMenu/isLeaf").value=="Y" && frm.elements("EOSMenu/menuActionName").value==""){
			alert("�Բ���'Ҷ�Ӳ˵������Ӧ����!");
			return;
		}   		
		if(frm.elements("EOSMenu/isLeaf").value=="N"){
			frm.elements("EOSMenu/menuAction").value="";
		}
		if(frm.elements("EOSMenu/isLeaf").value=="Y"&& frm.elements("EOSMenu/menuAction").value==""){
			frm.elements("EOSMenu/menuAction").value=frm.elements("EOSMenu/menuActionName").value;
		}    		
		frm.elements("EOSMenu/menuName").value=frm.elements("EOSMenu/menuLabel").value;	
		frm.elements("refresh").value="tree";	
		frm.action="ROLE.pr_automata.ROLE_P_UpdateMenu.do";
		frm.target = "_self";
		frm.submit();
		showWaiting();
	}
	
	function del(){
		var frm = document.addmenu;
		frm.elements("refresh").value="tree";
		frm.target = "_parent";
		frm.action="ROLE.pr_automata.ROLE_P_DeleteMenu.do";
		if(confirm("ɾ���˵�������ɾ���˵��������Ӳ˵�����ɫ��Ӧ�Ĳ˵�Ȩ�޵ȣ��������ز�����ȷ��Ҫɾ���˲˵�?") == true){
			frm.submit();
		}
	}
  	
	function selectFunction(){
		var win = window.open("ROLE.pr_automata.ROLE_P_SelectFunction.do","childWIn","menuBar:no,toolbar=no,addressbar=no,width=700,height=500,scrollbars=yes,statusbar=yes");
		win.opener = window;
  	}
  	
  	function clearFunction(){
  		var frm = document.addmenu;
  		frm.elements("EOSMenu/menuAction").value="";
  		frm.elements("EOSMenu/menuActionName").value="";
  	} 
  	function clearFunctionID(){
  		var frm = document.addmenu;
  		frm.elements("EOSMenu/menuAction").value="";
  	} 
  	
  	function isLeafChange(newValue){
  		var frm = document.forms(0);
  		var frm1 = document.forms(1);
  		if(newValue=="N"){
  			frm.elements("EOSMenu/menuActionName").disabled=true;

  			frm.elements("btnSelectFunc").disabled=true;

  			frm1.elements("addChildButton").disabled=false;
			frm.elements("btnSave").disabled=true;
  		}else{
  			frm.elements("EOSMenu/menuActionName").disabled=false;

  			frm.elements("btnSelectFunc").disabled=false;

  			frm1.elements("addChildButton").disabled=true;
			frm.elements("btnSave").disabled=false;
  		}
  	} 
  	
  	function init_frm(){
  		var frm = document.forms(0);
  		var frm1 = document.forms(1);
  		var newValue = frm.elements("EOSMenu/isLeaf").value;
		
  		var newLevel = frm.elements("EOSMenu/menuLevel").value;
  		if(newLevel==3){
  			newValue = "Y";
  		}
  		if(newValue=="N"){
  			frm.elements("EOSMenu/menuActionName").disabled=true;

  			frm.elements("btnSelectFunc").disabled=true;

  			frm1.elements("addChildButton").disabled=false;
  		}else{
  			frm.elements("EOSMenu/menuActionName").disabled=false;

  			frm.elements("btnSelectFunc").disabled=false;
  			frm1.elements("addChildButton").disabled=true;
			
  		}  		
  	}
  	function addChildMenu(){
  		var frm1 = document.forms(0);
  		frm1.elements("btnSave").disabled=true;
  	       	frm1.elements("button2").disabled=true;
  	       	frm1.elements("button3").disabled=true;
  		var frm = document.addChildForm;
		frm.action = "ROLE.pr_automata.ROLE_P_ShowNewMenu.do";
		frm.target = "childMenu";
		frm.submit();
	  		
  	}
  	  	function removeMenu(){
  	  	var frm = document.addChildForm;
	  	frm.elements("refresh").value="tree";
  	  	frm.action ="ROLE.pr_automata.ROLE_P_ShowMenuTree.do";
  	        frm.target = "childMenu";
  	  	frm.submit();
  	}
  	
</script>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/internet/css/style.css"/>

<body onLoad="init_frm();return true;">

<table width="103%" height="98%">
   <tr><td>	
	       <eos:OneTab name="�˵���Ϣ" imagePath="/internet/images/tt.gif" >
		     <table cellpadding=0 cellspacing=0  bgcolor="#EEEEEE" height="85%" width="85%">
	                  <html:form name="addmenu" action="ROLE.pr_automata.ROLE_P_UpdateMenu.do" method="post">
	                  <html:hidden property="EOSMenu/menuID" name="menuID"/>
	                  <html:hidden property="EOSMenu/menuID" />
			  <html:hidden property="EOSMenu/menuLevel" />
			  <html:hidden property="EOSMenu/parentsID" />
			  <html:hidden property="EOSMenu/parentsID"  name="parentsID"/>
			  <html:hidden property="EOSMenu/menuName" />
			  <html:hidden property="EOSMenu/menuAction"/>
	 		  <html:hidden name="refresh" />
		           <tr valign="top">
		                 <td height="35%"> 	
		  		       <table class="add" align="center" border="0">
					    <tr class="add_content">
					      <td align="right" class="add_head">�˵����(����Ψһ)��</td>
					       <td>
					      	<bean:write property="EOSMenu/menuID"/>
					      </td>
					     
					    </tr>
					    <tr class="add_content">
					      <td align="right" class="add_head">�˵����⣺</td>
					       <td>
					        <html:text property="EOSMenu/menuLabel" maxlength="40" />
					      </td>
					    </tr>
					    <tr class="add_content">
					      <td align="right" class="add_head">�Ƿ�Ҷ�ӣ�</td>
					       <td>
							<select size="1" name="EOSMenu/isLeaf" onchange="javascript:isLeafChange(this.value);">
								<option value="Y" <logic:notEqual property="EOSMenu/isLeaf" value="N">selected</logic:notEqual> >
									Ҷ�Ӳ˵�(Ҷ�Ӳ˵����ܲ���Ϊ��)
								</option>
								<option value="N" <logic:notEqual property="EOSMenu/isLeaf" value="Y">selected</logic:notEqual> >
									��Ҷ�Ӳ˵�(��Ҷ�Ӳ˵�������Ч)
								</option>
							</select>

					       
					
					      </td>
					    </tr>
					    <tr class="add_content">
					      <td align="right" class="add_head">�˵���Ӧ��չ���߼���</td>
					      <td> 
					        <textarea  name="EOSMenu/menuActionName" cols="50" rows="2" onchange="javascript:clearFunctionID();"><bean:write property="EOSMenu/menuAction"/></textarea>
					        <input type="button" name="btnSelectFunc" value="ѡ��" onclick="javascript:selectFunction();">&nbsp;
					       </td>
					    </tr>
					    <tr class="add_content">
					      <td align="right" class="add_head">��ʾ˳��(����Ϊ����)��</td>
					      <td>
					        <html:text name="EOSMenu/displayOrder" property="EOSMenu/displayOrder" maxlength="5" />
					      </td>
					    </tr>
					    <tr class="add_bottom">
					      <td  align="center">
	        <input type="button" name="btnSave" value="&nbsp;����&nbsp;" onclick="javascript:submit1()"/>
	        <input type="button" name="button2" value="&nbsp;����&nbsp;" onclick="javascript:document.addmenu.reset()"/>
	        <input type="button" name="button3" value="&nbsp;ɾ��&nbsp;" onclick="javascript:del()"/>
					        	
					      </td>
					      </html:form>
					      <td >
					         <html:form name="addChildForm" action="ROLE.pr_automata.ROLE_P_ShowNewMenu.do">
					  	<html:hidden property="EOSMenu/menuID" name="EOSMenu/parentsID"/>
					  	<html:hidden property="EOSMenu/menuLevel" name="EOSMenu/parentLevel"/>
					  	<html:hidden property="EOSMenu/menuID" name="menuID"/>
					        <html:hidden property="EOSMenu/menuID" />
					        <html:hidden property="EOSMenu/menuLevel" />
					        <html:hidden property="EOSMenu/parentsID" />
					        <html:hidden property="EOSMenu/parentsID"  name="parentsID"/>
					        <html:hidden property="EOSMenu/menuName" />
					        <html:hidden property="EOSMenu/menuAction"/>
					        <html:hidden property="EOSMenu/menuLabel"/>
					        <html:hidden property="EOSMenu/displayOrder"/> 
					        <html:hidden name="refresh" />
					        <input type="button" name="addChildButton" value="�����Ӳ˵�" onclick="javascript:addChildMenu();">&nbsp;	
					        <input type="button" name="removeButton" value="�ƶ��˵�" onclick="javascript:removeMenu();">&nbsp;			        
					     </td>
					   </tr>
				   </table> 
		 	        </td>
			   </tr> </html:form>
			   <tr valign="top">
				<td colspan=2  height="60%" width="100%"> <iframe name="childMenu"  src="/internet/iframebg.jsp" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0"  scrolling="no" /> </td>
			   </tr>
		      </table>       
	      </eos:OneTab>  
	  </td>
  </tr>
	
</table>
 
<script language="javascript">
	if(refresh=="tree"){
		document.forms(0).elements("btnSave").disabled=true;		
	}
</script>

<%@include file="/internet/commonTail.jsp" %>
</body>
