<%@include file="/internet/common.jsp"%>
<eos:css/> <link rel="stylesheet" href="/internet/css/style.css" type="text/css" />
    
    <script  language="JavaScript">
     var ref="<bean:write property="refresh"/>";
     if(ref=="tree"){
	window.parent.frames("tree").navigate("/internet/ROLE.pr_automata.ROLE_P_QueryAllMenu.do?");
     }

     function query(){      
    	queryForm.elements("PageCond/begin").value="0";
    	queryForm.elements("PageCond/isFirst").value="true";
    	queryForm.elements("PageCond/isEnd").value="false";    	
    	queryForm.elements("PageCond/curPage").value="1";  	
    	queryForm.elements("list/orderby/col1").value="menuLevel";
    	queryForm.elements("list/orderby/col2").value="displayOrder";
    	queryForm.action = "ROLE.pr_automata.ROLE_P_QueryMenusPage.do";
        queryForm.target = "_self";
    	queryForm.submit();    	
     }
     function previousPage(){
        if(queryForm.elements("PageCond/curPage").value>1){
        queryForm.elements("PageCond/begin").value = parseInt(queryForm.elements("PageCond/begin").value) - parseInt(queryForm.elements("PageCond/length").value);
        queryForm.elements("PageCond/curPage").value = parseInt(queryForm.elements("PageCond/curPage").value) - parseInt("1");
        queryForm.elements("list/orderby/col1").value="menuLevel";
        queryForm.elements("list/orderby/col2").value="displayOrder";
        queryForm.action = "ROLE.pr_automata.ROLE_P_QueryMenusPage.do";
        queryForm.target = "_self";
        queryForm.submit();
        }
        else{
        return;
        }

     }
     function nextPage(){
        if(queryForm.elements("PageCond/curPage").value != parseInt(queryForm.elements("PageCond/pages").value)){
        queryForm.elements("PageCond/begin").value = parseInt(queryForm.elements("PageCond/begin").value) + parseInt(queryForm.elements("PageCond/length").value);
        queryForm.elements("PageCond/curPage").value = parseInt(queryForm.elements("PageCond/curPage").value) + parseInt("1");
        queryForm.elements("list/orderby/col1").value="menuLevel";
        queryForm.elements("list/orderby/col2").value="displayOrder";
        queryForm.action = "ROLE.pr_automata.ROLE_P_QueryMenusPage.do";
        queryForm.target = "_self";
        queryForm.submit();
        }
        else{
        return;
        }
     }
    
     
     
     function addSubMenu(){
     
  		var frm = document.queryForm;
		frm.action = "ROLE.pr_automata.ROLE_P_AddLevel1Menu.do";
		frm.target = "addMenu";
		frm.submit();
	  		
     }
     
     function updateMenu(){
       if(selectedCheckboxCount(queryForm)!=1){
          alert("对不起，您只能并且必须选择单个记录进行修改!");
          return;
       }else{
          var v = getCheckedValue(queryForm);
          location.href="ROLE.pr_automata.ROLE_P_ExpandMenu.do?menuID="+v;
       }        
     }
     
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

     function getCheckedValue(form){
	var length =0;
	var i=0;
	var count =0;
	eles = form.elements;
	while(i<eles.length){
		obj= eles.item(i);
		type = obj.attributes.item("type").nodeValue;
		if(type == "checkbox"){
			if(obj.checked){
				return obj.value;
			}
		}
		i++;
	}
	return "";
     }

     
     function deleteMenus(){     
       if(selectedCheckboxCount(queryForm)<1){
          alert("对不起，您需要选择至少一条记录进行删除!");
          return;
       }else{
          queryForm.elements("PageCond/begin").value="0";
          queryForm.elements("PageCond/isFirst").value="true";
          queryForm.elements("PageCond/isEnd").value="false";    	
          queryForm.elements("PageCond/curPage").value="1";  	
          queryForm.elements("list/orderby/col1").value="menuLevel";
          queryForm.elements("list/orderby/col2").value="displayOrder";
          queryForm.elements("refresh").value="tree";          
          queryForm.action="ROLE.pr_automata.ROLE_P_DeleteMenus.do";
          queryForm.target = "_self";
          if(confirm("删除菜单将附带删除菜单包含的子菜单、角色对应的菜单权限等，请您慎重操作，确定要删除此菜单?") == true){
		queryForm.submit();
	  }

       }
     }
     
    </script>
    <form action="ROLE.pr_automata.ROLE_P_QueryMenusPage.do" name="queryForm" method="post">
    <input type="hidden" name="PageCond/length" value="10">
    <html:hidden property="PageCond/curPage"/>
    <html:hidden property="PageCond/begin"/>
    <html:hidden property="PageCond/isFirst"/>
    <html:hidden property="PageCond/isEnd"/>
    <html:hidden property="PageCond/pages"/>
    <html:hidden property="list/orderby/col1"/>
    <html:hidden property="list/orderby/col2"/>
    <html:hidden name="EOSMenu/parentsID" value="0"/>
    <html:hidden name="EOSMenu/menuID"/>
    
    <input type="hidden" name="refresh">
<table width="103%" height="100%">
   <tr><td>	
	<eos:OneTab name="菜单管理" imagePath="/internet/images/tt.gif" >
		   <table cellpadding=0 cellspacing=0  bgcolor="#eeeeee" height="85%" width="80%">
			       <tr valign="top">
			             <td colspan="2" class="tb_blue" height="50%" width="100%">
			                  <table width="100%" border="1"  cellpadding="0"  cellspacing="0" bordercolor="#B6B5B5" style="border-collapse: collapse" >
				             <tr class="tableHeadTR"> 
			                        <td width="4%" height="16">选择</td>
			                        <td width="29%" height="16">编号</td>
			                        <td width="29%" height="16">标题</td>
			                        <td width="10%" height="16">显示顺序</td>
			                    </tr><logic:iterate id="ResultSet" property="list">
			                    <tr class="tableContentTR">      
			                        <td width="4%" align="center"><html:checkbox name="list2/EOSMenu/menuID" id="ResultSet" property="EOSMenu/menuID" indexed="true"/></td>
			                        <td width="29%" align="center"><a href="ROLE.pr_automata.ROLE_P_ExpandMenu.do?menuID=<bean:write id="ResultSet" property="EOSMenu/menuID"/>"><bean:write id="ResultSet" property="EOSMenu/menuID"/></td> 
			                        <td width="29%" align="center"><bean:write id="ResultSet" property="EOSMenu/menuLabel"/></a></td>         
			                        <td width="10%" align="center"><bean:write id="ResultSet" property="EOSMenu/displayOrder"/></td>  
			                   </tr></logic:iterate>
			         	  </table>
				      </td>
				 </tr>
			         <tr class=queryLabelTD>
			                <td align="left" width="50%" height="10%"> 
					       <input type="button" name="button1" value="&nbsp;增加&nbsp;" onclick="javascript:addSubMenu()"/>
					       <input type="button" name="button2" value="&nbsp;修改&nbsp;" onclick="javascript:updateMenu()"/>
					       <input type="button" name="button3" value="&nbsp;删除&nbsp;" onclick="javascript:deleteMenus()"/>			                
				         </td>	
				         <td align="right" width="50%" height="10%">
				         <input type="button" name="button4" value="上一页" onclick="javascript:previousPage()"/>
				         <input type="button" name="button5" value="下一页" onclick="javascript:nextPage()"/>

			                            共<bean:write property="PageCond/pages"/>页                                    
			                 </td>       
			         </tr> </form>  
			         <tr>
			              <td colspan=2  height="40%" width="100%"> <iframe name="addMenu" src="/internet/iframebg.jsp" width="100%" height="100%" marginwidth="0" marginheight="0" frameborder="0"  scrolling="no" align="left"/></td>
			         </tr>       
		   </table>     
	</eos:OneTab> 
      </td>
   </tr>
</table>
 	