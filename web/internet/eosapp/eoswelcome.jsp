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
					<td width="70%" heitht="70%" align="left">�û�</td>
				</tr>
				<tr>
					<td colspan=2 valign="top">�û���ϵͳ�з��ʲ˵���ִ�й��ܵ�ʵ�ʵĲ�����Ա��һ���û����Զ�Ӧ�������ɫ��һ����ɫҲ���԰�������û���</td>
				</tr>
							
			</table>
		</td>
		<td width="5%">  </td>
		<td width="30%" height="30%">
			 <table class="firstpage">
				<tr>
					<td width="30%" height="30%"><img src="/internet/images/welfunction.gif" border=0> </td>
					<td width="70%" heitht="70%" align="left">����</td>
				</tr>
				<tr>
					<td colspan=2 valign="top">������ϵͳ��ִ��ĳ������������ṩ�Ĳ��������ܿ�����һ������չ���߼������������û�ִ��չ���߼�ʱ���Ը��ݹ�����ϵȷ���û��Ƿ��й���Ȩ�ޡ�</td>
				</tr>
							
			</table>
		</td>
		<td width="5%">  </td>
		<td width="30%" height="30%">
			 <table class="firstpage">
				<tr>
					<td width="30%" height="30%"><img src="/internet/images/weldata.gif" border=0> </td>
					<td width="70%" heitht="70%" align="left">����Ȩ��</td>
				</tr>
				<tr>
					<td colspan=2 valign="top">����Ȩ����ϵͳ��ɫ��ҵ�����ݷ��ʵ�Ȩ��,�û��ڶ���д����ʱֻ�ܲ������Ϲ����������ʽ�����ݣ���һ���û����ж����ɫʱ��ȡÿ����ɫ����Ȩ�޵Ĳ�����</td>
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
					<td width="70%"  heitht="70%" align="left">������</td>
				</tr>
				<tr>
					<td colspan=2 valign="top">��֯����--ʹ�����ͽṹά��һ����λ����֯ģ�͡�<br>

                                                                   ҵ�����--��Ϊ��֯�����Ĳ��䣬ά����ά��ҵ����֯ģ�͡�</td>
				</tr>
							
			</table>
		</td>
		<td width="5%">  </td>
		<td width="30%" height="30%">
			 <table class="firstpage">
				<tr>
					<td width="30%" height="30%"><img src="/internet/images/welrole.gif" border=0> </td>
					<td width="70%" heitht="70%" align="left">��ɫ</td>
				</tr>
				<tr>
					<td colspan=2 valign="top">��ɫ����ϵͳ�о�����ͬ���ܵ�һ���û�,һ����ɫ�����û����Կ�����Щ�˵�������ִ����Щ���ܡ���˿������ý�ɫ��Ϊ�û���������Ȩ�ޡ�</td>
				</tr>
										
			</table>
		</td>
		<td width="5%">  </td>
		<td width="30%" height="30%">
			 <table class="firstpage">
				<tr>
					<td width="30%" height="30%"><img src="/internet/images/welmenu.gif" border=0> </td>
					<td width="70%" heitht="70%" align="left">�˵�</td>
				</tr>
				<tr>
					<td colspan=2 valign="top">�˵����û���ϵͳ��ִ�и��ֳ��ò���ʱ���ʵĽ���Ԫ�ء�ϵͳ֧�ֲ�νṹ�ĸ��Ӳ˵������Զ����ɫ���Կ�����Щ�˵������ܿ�����Щ�˵���</td>
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
					<td width="70%" heitht="70%" align="left">ҵ�������ֵ�</td>
				</tr>
				<tr>
					<td colspan=2 valign="top">ҵ�������ֵ��ܹ��ṩͳһ�������ֵ��������ʵ�ֶ�ҵ�������µ�ҵ��ѡ��Ķ�̬���ú͹���������ΪӦ��ҵ�������µ�ҵ��ѡ��Ĳ�ȷ���ԺͶ�̬�仯�ṩ�˷��㡣</td>
				</tr>
							
			</table>
		</td>
		<td width="5%">  </td>
		<td width="30%" height="30%">
			 <table class="firstpage">
				<tr>
					<td width="30%" height="30%"><img src="/internet/images/welauth.gif" border=0> </td>
					<td width="70%" heitht="70%" align="left">����չ���߼�У��</td>
				</tr>
				<tr>
					<td colspan=2 valign="top">ÿ��չ���߼���ϵͳ��Ĭ��״̬�ǲ�У�飬��չ���߼�����ΪУ��״̬��,ÿ��ִ��չ���߼���ʱ��Ҫ�����¼�û��Ƿ���и�չ���߼���Ȩ�ޡ�</td>
				</tr>
							
			</table>
		</td>
		<td width="5%">  </td>
		<td width="30%" height="30%">
			 <table class="firstpage">
				<tr>
					<td width="30%" height="30%"><img src="/internet/images/welauth.gif" border=0> </td>
					<td width="70%" heitht="70%" align="left">�޸�����</td>
				</tr>
				<tr>
					<td colspan=2 valign="top">ÿ����¼�û��ĳ�ʼ������sysadmin���ã��û����Ը���ʵ����Ҫ�޸ĳ�ʼ���롣</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<%@ include file="/internet/hciTail.jsp" %>