<%@include file="/internet/BNOM/hciHead.jsp" %>
<%

     String userID = null;
     String url = null;
     
     com.primeton.tp.core.prservice.context.SessionContext sessionContext = (com.primeton.tp.core.prservice.context.SessionContext)session.getAttribute("sessionContext");
     if(sessionContext != null || !session.isNew())
     {
       userID = sessionContext.getUserID();

       if(userID.equals("petstore"))
       {

%>
 <jsp:forward page="default.pr_automata.forward.do?nextPage=/petstore/page/initPetstore.jsp"/> 
<%
       }
    }

%>
<table width="90%" height="80%"  align="center" border="1">	
	<tr>
		<td width="30%" height="30%">
			 <table class="firstpage">
				<tr>
					<td width="30%" height="30%"><img src="/internet/images/weluser.gif" border=0> </td>
					<td width="70%" heitht="70%" align="left">用户</td>
				</tr>
				<tr>
					<td colspan=2 valign="top">用户是系统中访问菜单和执行功能的实际的操作人员。一个用户可以对应到多个角色，一个角色也可以包含多个用户。</td>
				</tr>
							
			</table>
		</td>
		<td width="5%">  </td>
		<td width="30%" height="30%">
			 <table class="firstpage">
				<tr>
					<td width="30%" height="30%"><img src="/internet/images/welfunction.gif" border=0> </td>
					<td width="70%" heitht="70%" align="left">功能</td>
				</tr>
				<tr>
					<td colspan=2 valign="top">功能是系统中执行某项具体任务所提供的操作，功能可以与一个或多个展现逻辑关联，这样用户执行展现逻辑时可以根据关联关系确定用户是否有功能权限。</td>
				</tr>
							
			</table>
		</td>
		<td width="5%">  </td>
		<td width="30%" height="30%">
			 <table class="firstpage">
				<tr>
					<td width="30%" height="30%"><img src="/internet/images/weldata.gif" border=0> </td>
					<td width="70%" heitht="70%" align="left">数据权限</td>
				</tr>
				<tr>
					<td colspan=2 valign="top">数据权限是系统角色对业务数据访问的权限,用户在读、写数据时只能操作符合过滤条件表达式的数据；当一名用户具有多个角色时，取每个角色数据权限的并集。</td>
				</tr>
							
			</table>
		</td>
	</tr>
	<tr><td width="30%" height="5%"> </td><td width="5%" height="5%">  </td><td  width="30%" height="5%">  </td><td  width="5%" height="5%">  </td><td  width="30%" height="5%"> </td></tr>	
	<tr>
		<td width="30%" height="30%">
			 <table class="firstpage">
				<tr>
					<td width="30%" height="30%"><img src="/internet/images/welorg.gif" border=0> </td>
					<td width="70%"  heitht="70%" align="left">机构树</td>
				</tr>
				<tr>
					<td colspan=2 valign="top">组织机构--使用树型结构维护一个单位的组织模型。<br>

                                                                   业务机构--作为组织机构的补充，维护多维的业务组织模型。</td>
				</tr>
							
			</table>
		</td>
		<td width="5%">  </td>
		<td width="30%" height="30%">
			 <table class="firstpage">
				<tr>
					<td width="30%" height="30%"><img src="/internet/images/welrole.gif" border=0> </td>
					<td width="70%" heitht="70%" align="left">角色</td>
				</tr>
				<tr>
					<td colspan=2 valign="top">角色代表系统中具有相同功能的一组用户,一个角色决定用户可以看到哪些菜单，可以执行哪些功能。因此可以利用角色来为用户灵活的配置权限。</td>
				</tr>
										
			</table>
		</td>
		<td width="5%">  </td>
		<td width="30%" height="30%">
			 <table class="firstpage">
				<tr>
					<td width="30%" height="30%"><img src="/internet/images/welmenu.gif" border=0> </td>
					<td width="70%" heitht="70%" align="left">菜单</td>
				</tr>
				<tr>
					<td colspan=2 valign="top">菜单是用户在系统中执行各种常用操作时访问的界面元素。系统支持层次结构的父子菜单。可以定义角色可以看到哪些菜单，不能看到哪些菜单。</td>
				</tr>
							
			</table>
		</td>  
	</tr>
	<tr><td width="30%" height="5%"> </td><td width="5%" height="5%"> </td><td  width="30%" height="5%"> </td><td  width="5%" height="5%"></td><td  width="30%" height="5%"> </td></tr>	
	<tr>
		<td width="30%" height="30%">
			 <table class="firstpage">
				<tr>
					<td width="30%" height="30%"><img src="/internet/images/welbiz.gif" border=0> </td>
					<td width="70%" heitht="70%" align="left">业务数据字典</td>
				</tr>
				<tr>
					<td colspan=2 valign="top">业务数据字典能够提供统一的数据字典管理，可以实现对业务类型下的业务选项的动态设置和管理，这样就为应对业务类型下的业务选项的不确定性和动态变化提供了方便。</td>
				</tr>
							
			</table>
		</td>
		<td width="5%">  </td>
		<td width="30%" height="30%">
			 <table class="firstpage">
				<tr>
					<td width="30%" height="30%"><img src="/internet/images/welauth.gif" border=0> </td>
					<td width="70%" heitht="70%" align="left">设置展现逻辑校验</td>
				</tr>
				<tr>
					<td colspan=2 valign="top">每个展现逻辑在系统中默认状态是不校验，当展现逻辑设置为校验状态后,每当执行展现逻辑的时候都要检验登录用户是否具有该展现逻辑的权限。</td>
				</tr>
							
			</table>
		</td>
		<td width="5%">  </td>
		<td width="30%" height="30%">
			 <table class="firstpage">
				<tr>
					<td width="30%" height="30%"><img src="/internet/images/welauth.gif" border=0> </td>
					<td width="70%" heitht="70%" align="left">修改密码</td>
				</tr>
				<tr>
					<td colspan=2 valign="top">每个登录用户的初始密码由sysadmin设置，用户可以根据实际需要修改初始密码。</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<%@ include file="/internet/hciTail.jsp" %>