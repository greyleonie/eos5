<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@page import="com.talent.hibernate.Eosoperator"%>
<%String top_path=request.getContextPath();
			%>
<link href="<%=top_path%>/css/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" background="<%=top_path%>/image/title_bg.gif">
  <tr>
    <td align="left"><img src="<%=top_path%>/image/title_01.gif" width="534" height="99"></td>
    <td>&nbsp;</td>
    <td align="right"><img src="<%=top_path%>/image/title_02.gif" width="228" height="99"></td>
  </tr>
  <tr>
    <td colspan="3" align="left"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" background="<%=top_path%>/image/bg.gif">
      <tr>
        <td width="80%">
        <span class="text_wirte">&nbsp;
        <%! String operatorId; %>
        <% 
        if(request.getSession().getAttribute("user")!=null){
        com.talent.dao.student.StudentDAO studentDao=new com.talent.dao.student.StudentDAO();
        
  			Eosoperator op=(Eosoperator)request.getSession().getAttribute("user");
  			
  			Integer id=op.getOperatorId();
  			String className=studentDao.getClassNameByUserId(id);
    					Eosoperator topuser=(Eosoperator) request.getSession().getAttribute("user");
    					out.println(" ��ӭ���� "+topuser.getOperatorName()+"  "+className);
    					operatorId=topuser.getOperatorId().toString();
    			}else if(request.getSession().getAttribute("user")==null){
    				response.sendRedirect("login.do?action=logout");
    			}
    			%>&nbsp;&nbsp;
        <script language="JavaScript">var week; 
if(new Date().getDay()==0)     week=" ������"
if(new Date().getDay()==1)     week=" ����һ"
if(new Date().getDay()==2)     week=" ���ڶ�" 
if(new Date().getDay()==3)     week=" ������"
if(new Date().getDay()==4)     week=" ������"
if(new Date().getDay()==5)     week=" ������"
if(new Date().getDay()==6)     week=" ������"
document.write("������"+new Date().getYear()+"��"+(new Date().getMonth()+1)+"��"+new Date().getDate()+"��"+week);   
</script>
        
        </span></td>
        <td width="20%" height="20px" align="center" valign="middle">
        <%if(request.getSession().getAttribute("user")!=null){ %>
        <a href="javascript:modPassword()" style="cursor: hand"><font size="2">�޸�����</font></a>&nbsp;
        <a href="login.do?action=logout" style="cursor: hand"><font size="2">ע��</font></a>&nbsp;<%} %>
        <a href="http://www.gzswdx.gov.cn" style="cursor: hand"><font size="2">������ҳ</font></a>
		    </td>
      </tr>
    </table></td>
  </tr>
</table>
<script type="text/javascript">
<!--
	function modPassword(){
		window.open('modPassword.jsp?operatorId='+<%=operatorId%>,'','width=400,height=180,left=400,top=200');
	}
//-->
</script>
<map name="Map"><area shape="rect" coords="1,2,68,20" href="http://www.gzswdx.gov.cn">
</map>