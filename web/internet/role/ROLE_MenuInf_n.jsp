<%--
	---------------------------------------------------------------------------------
	Revision           Revision Date    Revision Man         Reason/Statement 
	1.0                2003/03/22       xuyb                create
--%>
<%@include file="/internet/common.jsp" %><eos:css/>
<SCRIPT language=JavaScript src="/internet/scripts/check.js"></SCRIPT>
<script languange="javascript">
	var refresh="<bean:write property="refresh"/>"
	if(refresh=="tree"){
		window.parent.parent.frames("tree").location="ROLE.pr_automata.ROLE_P_QueryAllMenu.do";
	}

	function submit1() {
		var frm = document.forms(0);
		if(frm.elements("EOSMenu/menuID").value==""){
    			alert("对不起，'菜单编号'不能为空！");
    			return ;
    		}
    		if(frm.elements("EOSMenu/menuID").value=="0"){
    			alert("对不起，'菜单编号'不能为0！");
    			return ;
    		}
    	        if(isNumberOr_Letter(frm.elements("EOSMenu/menuID").value)==false) {
	
			alert("菜单编号必须是字母或数字、下划线！");
			return;
		}       		
    		if(frm.elements("EOSMenu/menuLabel").value==""){
    			alert("对不起，'菜单标题'不能为空！");
    			return ;
    		}
    		 if(isChinaOrNumbOrLett(frm.elements("EOSMenu/menuLabel").value)==false) {
			alert("输入的菜单标题为非法字符，请重新输入！");
	                frm.elements("EOSMenu/menuLabel").focus();
			return;
		}     		
    		if(frm.elements("EOSMenu/displayOrder").value!="" && !isNumber(frm.elements("EOSMenu/displayOrder").value)){
    			alert("对不起，'显示顺序'必须是一个整数!");
    			return;
    		}
    		if(frm.elements("EOSMenu/isLeaf").value=="Y" && frm.elements("EOSMenu/menuActionName").value==""){
    			alert("对不起，'叶子菜单必须对应功能!");
    			return;
    		} 
    		
    		if(frm.elements("EOSMenu/isLeaf").value=="N"){
    			frm.elements("EOSMenu/menuAction").value="";
    		}
    		if(frm.elements("EOSMenu/isLeaf").value=="Y"&& frm.elements("EOSMenu/menuAction").value==""){
    			frm.elements("EOSMenu/menuAction").value=frm.elements("EOSMenu/menuActionName").value;
    		}    		

    		
    		var parentLevel = frm.elements("EOSMenu/parentLevel").value;
    		var le = parseInt(parentLevel)+1;
    		frm.elements("EOSMenu/menuLevel").value=le;
    		frm.elements("refresh").value="tree";
    		
    		frm.elements("EOSMenu/menuName").value=frm.elements("EOSMenu/menuLabel").value;		    				
    		frm.elements("returnURL").value="ROLE.pr_automata.ROLE_P_ShowNewMenu.do?EOSMenu/parentsID="+frm.elements("EOSMenu/parentsID").value+"&EOSMenu/parentLevel="+parentLevel;
		frm.submit();

	}	

	function selectFunction(){

		var win = window.open("ROLE.pr_automata.ROLE_P_SelectFunction.do","childWIn","menuBar:no,toolbar=no,addressbar=no,width=700,height=500,scrollbars=yes,statusbar=yes");
		win.opener = window;
  	}
  	
  	function clearFunction(){
  		var frm = document.forms(0);
  		frm.elements("EOSMenu/menuAction").value="";
  		frm.elements("EOSMenu/menuActionName").value="";
  	} 
  	
  	function clearFunctionID(){
  		var frm = document.addmenu;
  		frm.elements("EOSMenu/menuAction").value="";

  	} 
  	
  	function isLeafChange(newValue){
  		var frm = document.forms(0);
  		if(newValue=="N"){
  			frm.elements("EOSMenu/menuActionName").disabled=true;

  			frm.elements("btnSelectFunc").disabled=true;

  		}else{
  			frm.elements("EOSMenu/menuActionName").disabled=false;

  			frm.elements("btnSelectFunc").disabled=false;

  		}
  	} 	
  	
  	function init_frm(){
  		var frm = document.forms(0);
  		var newValue = frm.elements("EOSMenu/isLeaf").value;
  		var newLevel = frm.elements("EOSMenu/parentLevel").value;
  		if(newLevel==2){
  			newValue = "Y";
  		}
  		if(newValue=="N"){
  			frm.elements("EOSMenu/menuActionName").disabled=true;

  			frm.elements("btnSelectFunc").disabled=true;

  		}else{
  			frm.elements("EOSMenu/menuActionName").disabled=false;

  			frm.elements("btnSelectFunc").disabled=false;

  		}  		
  	}  		
</script>
 <LINK REL="stylesheet" TYPE="text/css" HREF="/internet/css/oldstyle.css"/>
<html:form name="addmenu" action="ROLE.pr_automata.ROLE_P_NewMenu.do" method="post"> 
  <html:hidden property="EOSMenu/menuLevel" />
  <html:hidden name="returnURL" />
  <html:hidden property="EOSMenu/parentLevel" />
  <html:hidden property="EOSMenu/parentsID" />
  <html:hidden property="EOSMenu/menuName" />
  <html:hidden property="EOSMenu/menuAction"/>
<!--  <html:hidden name="EOSMenu/isLeaf" value="Y"/> -->
  <html:hidden property="refresh"/>
  <table class="add" align="center" border="0" width="100%" height="100%" bgcolor="#EEEEEE">
	    <tr> 
	      <td colspan="2" height="5%">【增加子菜单】</td>
	    </tr>
	    
	    <tr class="add_content">
	      <td align="right" class="add_head" height="5%">菜单编号(必须唯一)：</td>
	      <td>
	      	<html:text name="EOSMenu/menuID" maxlength="40" />
	      </td>
	    </tr>
	    <tr class="add_content">
	      <td align="right" class="add_head" height="5%">菜单标题：</td>
	      <td> 
	        <html:text name="EOSMenu/menuLabel" maxlength="40" />
	      </td>
	    </tr>
	    <tr class="add_content">
	      <td align="right" class="add_head" height="5%">是否叶子：</td>
	      <td> 
	        <html:select size="1"  name="EOSMenu/isLeaf" onchange="javascript:isLeafChange(this.value);">
	    	<html:option value="Y">叶子菜单(叶子菜单功能不能为空)</html:option>
	    	<logic:notEqual property="EOSMenu/parentLevel" value="2">   
	    		<html:option value="N">非叶子菜单(非叶子菜单功能无效)</html:option> 
	    	</logic:notEqual>  
	 
	        </html:select>
	      </td>
	    </tr>    
	    <tr class="add_content">
	     <td align="right" class="add_head" height="5%">菜单对应的展现逻辑：</td>
	      <td>
	        <textarea  name="EOSMenu/menuActionName" cols="50" rows="2" onchange="javascript:clearFunctionID();"></textarea>
	        <input type="button" name="btnSelectFunc" value="选择" onclick="javascript:selectFunction();">&nbsp;
	      </td>
	    </tr>
	    <tr class="add_content" >
	      <td align="right" class="add_head" height="5%">显示顺序(必须为数字)：</td>
	      <td>
	        <html:text name="EOSMenu/displayOrder"  maxlength="5" />
	      </td>
	    </tr>
	    <tr class="add_content" valign="top">
		      <td colspan="2" align="center" height="60%">
			       <input type="button" name="button1" value="保存" onclick="javascript:submit1()"/>
			       <input type="button" name="button2" value="重置" onclick="javascript:document.addmenu.reset()"/>
			       <input type="button" name="button3" value="返回" onclick="javascript:window.navigate('/internet/iframebg.jsp')"/> 		      
		      </td>
	    </tr>
  </table>
<script type="text/javascript">
  init_frm();
</script>  
</html:form>

<%@include file="/internet/commonTail.jsp" %>
