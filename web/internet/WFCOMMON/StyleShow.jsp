<!-- saved from url=(0022)http://internet.e-mail -->
<%@include file="/internet/hciHead.jsp"%>



<!--tab显示,tabFrame-->
<table width="80%" height="200"><tr><td width="100%">
  <eos:tabframe id="test1" width="100%" height="100%" frameborder="1" scrolling="auto">
            <eos:tabframetitle url="default.pr_automata.forward.do?nextPage=/internet/WFCOMMON/Tab1.jsp" title="标签A" selected="true"/>
            <eos:tabframetitle url="default.pr_automata.forward.do?nextPage=/internet/WFCOMMON/Tab2.jsp" title="标签B" />
  </eos:tabframe>
</td></tr></table>




<!--tab显示,tab-->
<table><tr><td>
    <eos:tab id="test2"  width="100%" height="95%">
        <eos:tabtitle>
            <eos:titleitem >标签A</eos:titleitem>
            <eos:titleitem >标签B</eos:titleitem>
        </eos:tabtitle>
        <eos:tabcontent>
	    <eos:contentitem>
		aaaa
		<br>
		bbbb
		<br>
		cccc	    
	    </eos:contentitem>
            <eos:contentitem>
            	ddddd
		<br>
		xxxx
		<br>
		zzz	    
            </eos:contentitem>
        </eos:tabcontent>
    </eos:tab>
</td></tr></table>



    <!--查询条件显示-->
<table class="result" border="0" width="60%" align="center">
  <tr class="result_content_"> 
    <td align="left" colspan="2"><b>【查询用户】</b></td>
    <td colspan="2">&nbsp; </td>
  </tr>
  <tr class="result_content_" align="left"> 
    <td>用户真实姓名:&nbsp; 
      
    </td>
    <td>&nbsp;<input type="text" name="EOSOperator/operatorName" ></td>
    <td> 用户登录名:&nbsp; </td>
    <td>
      <input type="text" name="EOSOperator/userID" >
    </td>
  </tr>
  <tr class="result_content_" align="left"> 
    <td>用户所属角色: 
    </td>
    <td>&nbsp;<select name="EOSOperatorRole/roleID" size="1" style="width:150px" class="myselect">
        <option value="0" selected>--请选择类型--&nbsp;&nbsp;&nbsp;</option>
        <option value="9999">没有分配角色 
        <option value="eosadmin">系统管理员</option>
        <option value="bizadmin">业务管理员</option>
        <option value="Guest">嘉宾</option>
        <option value="petstore">petstore example</option>
      </select></td>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr class="result_content_"> 
    <td align="center" colspan="4"><a href="#1" onclick="javascript:querysubmit()"> 
      <img src="/internet/theme/style0/query.gif" border="0"/>&nbsp;&nbsp;&nbsp; 
      </a> <a href="#2" onclick="javascript:document.queryFrm.reset();"> <img src="/internet/theme/style0/reset.gif" border="0"/> 
      </a> </td>
  </tr>
</table>




    <!--列表信息显示-->	
    <table border="0" cellspacing="1" cellpadding="1" class="result" align="center">
      <tr class="result_title">
		      <td colspan="5" width="100%"> 
		        <div align="left">【<b>XXXX列表</b>】</div>
		      </td>
      </tr>
      <tr class="result_head"> 
        <td width="10%" height="16">选择</td>
        <td width="25%" height="16">编号</td>
        <td width="25%" height="16">标题</td>
        <td width="10%" height="16">显示顺序</td>
      </tr>
      
      <tr class="result_content">      
        <td><input type="checkbox"/></td>
        <td>工作流</td> 
        <td>工作流</td>         
        <td>工作流</td>  
      </tr>
  
      <tr class="result_content_">      
        <td><input type="checkbox"/></td>
        <td>工作流</td> 
        <td>工作流</td>         
        <td>工作流</td>  
      </tr>
  
      <tr class="result_content">      
        <td><input type="checkbox"/></td>
        <td>工作流</td> 
        <td>工作流</td>         
        <td>?ぷ髁?</td>  
      </tr>
      
      <tr class="result_content_">      
        <td><input type="checkbox"/></td>
        <td>工作流</td> 
        <td>工作流</td>         
        <td>工作流</td>  
      </tr>
    </table>    



    <table border="0" cellspacing="0" cellpadding="1" class="query" align="center">           
       <tr>
       <td class="query_bottom"> 
     		<a href="#2" onclick="javascript:addSubMenu()">
			<img src="/internet/theme/style0/add.gif" border="0" />
		</a>
		<a href="#4" onclick="javascript:updateMenu();">
			<img src="/internet/theme/style0/modify.gif" border="0" />
		</a>
		<a href="#5" onclick="javascript:deleteMenus();">
			<img src="/internet/theme/style0/delete.gif" border="0" />
		</a>
		

       </td>            
       
    <td class="query_bottom" align="right"> <a href="javascript:previousPage();"><img src="/internet/theme/style0/prevpage.gif"  border="0" align="absbottom" class="null" width="48" height="19" ></a> 
      <a href="javascript:nextPage();"><img src="/internet/theme/style0/nextpage.gif"  border="0" align="absbottom" class="null" width="48" height="19" ></a> 
      共123页 </td>
      </tr>
    </table>   
    
    
    
    <!--详细信息显示-->
    
<table class="add" align="center" border="0">
  <tr class="add_title" > 
       
    <td colspan="2">【菜单详细信息】</td>
     </tr>
    
     <tr class="add_content">
       
    <td align="right" class="add_head" width="20%">菜单编号：</td>
       <td>
       ?说ケ嗪?	
       </td>
     </tr>
     <tr class="add_content">
      
    <td align="right" class="add_head" width="20%">菜单标题：</td>
      <td> 
        菜单标题
      </td>
    </tr>
    <tr class="add_content">
      
    <td align="right" class="add_head" width="20%">是否叶子：</td>
      <td> 
       是否叶子
      </td>
    </tr>    
    <tr class="add_content">
      
    <td align="right" class="add_head" width="20%">菜单自动机所在的包：</td>
      <td> 
        菜单自动机所?诘陌?
      </td>
    </tr>
    <tr class="add_content">
     
    <td align="right" class="add_head" width="20%">菜单对应的自动机：</td>
      
    <td>菜单对应的自动机 &nbsp; </td>
    </tr>
    <tr class="add_content">
      
    <td align="right" class="add_head" width="20%">显示顺序(必须为数字)：</td>
      <td>
       显示顺序
      </td>
    </tr>
    <tr class="add_bottom">
      <td colspan="2" align="center">

  	<a href="javascript:submit1()"><html:image src="/confirm.gif" border="0"/></a> 
        <a href="javascript:document.addmenu.reset()"><html:image src="/reset.gif" border="0"/></a> 
  

        	<a href="javascript:window.navigate('about:blank')"> 	<html:image src="/return.gif" border="0" />
		</a>   	   	

      </td>
    </tr>
  </table>


    <!--增加记录 -->
	<table class="add" align="center" border="0">
     <tr class="add_title" > 
       <td colspan="2">【增加子菜单】</td>
     </tr>
    
     <tr class="add_content">
       <td align="right" class="add_head">菜单编号：</td>
       <td>
       	<html:text property="EOSMenu/menuID" maxlength="40" />
       </td>
     </tr>
     <tr class="add_content">
      <td align="right" class="add_head">菜单标题：</td>
      <td> 
        <html:text property="EOSMenu/menuLabel" maxlength="40" />
      </td>
    </tr>
    <tr class="add_content">
      <td align="right" class="add_head">是否叶子：</td>
      <td> 
        <html:select size="1"  property="EOSMenu/isLeaf" onchange="javascript:isLeafChange(this.value);">
    	<html:option value="Y">叶子菜单(叶子菜单功能不能为空)</html:option>
    	<logic:notEqual property="EOSMenu/parentLevel" value="2">   
    		<html:option value="N">非叶子菜单(非叶子菜单功能无效)</html:option> 
    	</logic:notEqual>  
 
        </html:select>
      </td>
    </tr>    
    <tr class="add_content">
      <td align="right" class="add_head">菜单自动机所在的包：</td>
      <td> 
        <html:select size="1"  property="EOSMenu/pack">
	    <option selected/>
	  <logic:iterate id="rs" property="list">
	  	<html:option id="rs" property="EOSFunctionUnit/unitID" labelProperty="EOSFunctionUnit/unitName"/>
	  </logic:iterate>
        </html:select>
      </td>
    </tr>
    <tr class="add_content">
     <td align="right" class="add_head">菜单对应的自动机：</td>
      <td>
        <textarea  name="EOSMenu/menuActionName" cols="40" rows="3" onchange="javascript:clearFunctionID();"><bean:write property="EOSMenu/menuAction"/></textarea>
        <input type="button" name="btnSelectFunc" value="选择" onclick="javascript:selectFunction();">&nbsp;
      </td>
    </tr>
    <tr class="add_content">
      <td align="right" class="add_head">显示顺序(必须为数字)：</td>
      <td>
        <html:text name="EOSMenu/displayOrder" property="EOSMenu/displayOrder" maxlength="5" />
      </td>
    </tr>
    <tr class="add_bottom">
      <td colspan="2" align="center">

  	<a href="javascript:submit1()"><html:image src="/confirm.gif" border="0"/></a> 
        <a href="javascript:document.addmenu.reset()"><html:image src="/reset.gif" border="0"/></a> 
  

        	<a href="javascript:window.navigate('about:blank')"> 	<html:image src="/return.gif" border="0" />
		</a>   	   	

      </td>
    </tr>
  </table>

　　　　　　　

    

     
  
<%@include file="/internet/hciTail.jsp%>
