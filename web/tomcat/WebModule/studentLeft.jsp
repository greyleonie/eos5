<%@ page language="java" contentType="text/html; charset=GBK"%>
<table width="120" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFD88D" onClick="menu3(this)">
  <tr>
  <% 
  String stu_path=request.getContextPath();
  com.talent.dao.student.StudentDAO studentDao=new com.talent.dao.student.StudentDAO();
  com.talent.hibernate.Eosoperator op=(com.talent.hibernate.Eosoperator)session.getAttribute("user");
  Integer id=op.getOperatorId();
  String className=studentDao.getClassNameByUserId(id);
  
  %>
    <td colspan="2"><img src="<%=stu_path%>/image/menu_title.gif" width="120" height="52" /></td>
  </tr>
    <tr>
    <td align="right"><img src="<%=stu_path%>/image/img.gif" width="11" height="12" hspace="10" /></td>
    <a href="TeachEvl/zlpg.jsp?openState=0" target="main" class="menu31" onClick="clickAction(this)" onMouseOver="overAction(this)" onMouseOut="outAction(this)">
    <td height="35" class="menu31">教学质量评估</td></a>
  </tr>
   <tr align="right">
    <td colspan="2"><img src="<%=stu_path%>/image/line.gif" width="120" height="1" /></td>
  </tr>
  <tr>
    <td width="44" align="right"><img src="<%=stu_path%>/image/img.gif" width="11" height="12" hspace="10" /></td>
    <a href="/thesis.do?action=listThesis" target="main" onClick="clickAction(this)" onMouseOver="overAction(this)" onMouseOut="outAction(this)">
      <td width="123" height="35" class="menu31">提交论文</td>
    </a> </tr>
  <tr align="right">
    <td colspan="2"><img src="<%=stu_path%>/image/line.gif" width="120" height="1" /></td>
  </tr>

  <tr align="right">
    <td colspan="2"><img src="<%=stu_path%>/image/line.gif" width="120" height="1" /></td>
  </tr>
  <tr>
    <td align="right"><img src="<%=stu_path%>/image/img.gif" width="11" height="12" hspace="10" /></td>
    <a href="score.do?action=viewScore" target="main" class="menu31" onClick="clickAction(this)" onMouseOver="overAction(this)" onMouseOut="outAction(this)">
      <td height="35" class="menu31">查看成绩</td>
    </a> </tr>
  <tr align="right">
    <td colspan="2"><img src="<%=stu_path%>/image/line.gif" width="120" height="1" /></td>
  </tr>
  <tr>
    <td align="right"><img src="<%=stu_path%>/image/img.gif" width="11" height="12" hspace="10" /></td>
    <a href="sign.do?action=teachPlanInfo&className=<%=className%>" target="main" class="menu31" onClick="clickAction(this)" onMouseOver="overAction(this)" onMouseOut="outAction(this)">
      <td height="35" class="menu31">教学计划</td>
    </a> </tr>
  <tr align="right">
    <td colspan="2"><img src="<%=stu_path%>/image/line.gif" width="120" height="1" /></td>
  </tr>
  <tr>
    <td align="right"><img src="<%=stu_path%>/image/img.gif" width="11" height="12" hspace="10" /></td>
    <a href="adjust.do?action=courseAdjust" target="main" class="menu31" onClick="clickAction(this)" onMouseOver="overAction(this)" onMouseOut="outAction(this)">
      <td height="35" class="menu31">课程调整</td>
    </a> </tr>
	<tr align="right">
    <td colspan="2"><img src="<%=stu_path%>/image/line.gif" width="120" height="1" /></td>
  </tr>
 
    <td colspan="2"><img src="<%=stu_path%>/image/line.gif" width="120" height="1" /></td>
  </tr>
  <tr>
    <td height="217" colspan="2">&nbsp;</td>
  </tr>
</table>

