<%--
	---------------------------------------------------------------------------------
	Revision           Revision Date    Revision Man         Reason/Statement 
	1.0                2003/03/22       xuyb                create
--%>
<%@include file="/internet/common.jsp" %>
<SCRIPT language=JavaScript src="/internet/scripts/check.js"></SCRIPT>
<script languange="javascript">
	var refresh="<bean:write property="refresh"/>"
	if(refresh=="tree"){
		window.parent.parent.frames("tree").location="ROLE.pr_automata.ROLE_P_QueryAllMenu.do";
	}
	parent.parent.hideWaiting();

	function submit1() {
		var frm = document.forms(0);
		if(frm.elements("EOSMenu/menuID").value==""){
    			alert("�Բ���'�˵����'����Ϊ�գ�");
    			return ;
    		}
    		
    	        if(isNumberOr_Letter(frm.elements("EOSMenu/menuID").value)==false) {
	
			alert("�˵���ű�������ĸ�����֡��»��ߣ�");
			return;
		}   
		 		
    		if(frm.elements("EOSMenu/menuID").value=="0"){
    			alert("�Բ���'�˵����'����Ϊ0��");
    			return ;
    		}
    		if(frm.elements("EOSMenu/menuLabel").value==""){
    			alert("�Բ���'�˵�����'����Ϊ�գ�");
    			return ;
    		}
	  	
    		 if(isChinaOrNumbOrLett(frm.elements("EOSMenu/menuLabel").value)==false) {
			alert("����Ĳ˵������������ĸ�����ֻ����ģ����������룡");
	                frm.elements("EOSMenu/menuLabel").focus();
			return;
		} 
			
    		if(frm.elements("EOSMenu/displayOrder").value!="" && !isNumber(frm.elements("EOSMenu/displayOrder").value)){
    			alert("�Բ���'��ʾ˳��'������һ������!");
    			return;
    		}


    		frm.elements("refresh").value="tree";
    		frm.target = "_top"; 		
    		frm.elements("EOSMenu/menuName").value=frm.elements("EOSMenu/menuLabel").value;		    				
    		frm.elements("returnURL").value="ROLE.pr_automata.ROLE_P_ManageMenu.do";
		frm.submit();

	}	

  	
		
</script>

<html:form name="addmenu" action="ROLE.pr_automata.ROLE_P_AddLevel1MenuSubmit.do" method="post"> 

  <html:hidden property="EOSMenu/menuLevel" />
  <html:hidden name="returnURL" />
  <html:hidden property="EOSMenu/parentsID" />
  <html:hidden property="EOSMenu/menuName" />
  <html:hidden property="EOSMenu/menuAction"/>
  <html:hidden name="EOSMenu/isLeaf" value="N"/> 
  <html:hidden property="refresh"/>
 <table bgcolor="#eeeeee" height="100%" width="102%">
    <tr class="result_title"> 
      <td colspan="2" height="5%"><font size="2">�� ���Ӷ����˵���</font></td>
    </tr>
    
    <tr>
      <td align="right" ><font size="2">�˵����(����Ψһ)��</font></td>
      <td>
      	<html:text property="EOSMenu/menuID" maxlength="40" />
      </td>
    </tr>
    <tr >
      <td align="right" height="5%"><font size="2">�˵����⣺</font></td>
      <td> 
        <html:text property="EOSMenu/menuLabel" maxlength="40" />
      </td>
    </tr>

    <tr >
      <td align="right" height="5%"><font size="2">��ʾ˳��(����Ϊ����)��</font></td>
      <td>
        <html:text property="EOSMenu/displayOrder" maxlength="5" />
      </td>
    </tr>
    <tr valign="top">
      <td colspan="2" align="center" height="80%">
	        <input type="button" name="button1" value="&nbsp;����&nbsp;" onclick="javascript:submit1()"/>
	        <input type="button" name="button2" value="&nbsp;����&nbsp;" onclick="javascript:document.addmenu.reset()"/>
	        <input type="button" name="button3" value="&nbsp;����&nbsp;" onclick="javascript:window.navigate('/internet/iframebg.jsp')"/>
    </td>
    </tr>
  </table>

</html:form>

<%@include file="/internet/commonTail.jsp" %>
