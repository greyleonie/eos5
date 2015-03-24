<%@ page language="java" contentType="text/html; charset=GBK"%>
<table width="120" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFD88D" onClick="menu3(this)">
  <tr><%String te_path=request.getContextPath();%>
    <td colspan="2"><img src="<%=te_path%>/image/menu_title2.gif" width="120" height="52" /></td>
  </tr>
  <tr>
    <td align="right"><img src="<%=te_path%>/image/img.gif" width="11" height="12" hspace="10" /></td>
    <a href="news.do?action=allNew" target="main" class="menu31" onClick="clickAction(this)" onMouseOver="overAction(this)" onMouseOut="outAction(this)">
      <td height="35" class="menu31">桌面信息</td>
    </a> </tr>
     <tr align="right">
    <td colspan="2"><img src="<%=te_path%>/image/line.gif" width="120" height="1" /></td>
  </tr>
   <tr>
    <td align="right"><img src="<%=te_path%>/image/img.gif" width="11" height="12" hspace="10" /></td>
    <a href="new/newMenu.jsp" target="main" class="menu31" onClick="clickAction(this)" onMouseOver="overAction(this)" onMouseOut="outAction(this)">
      <td height="35" class="menu31">校院信息</td>
    </a> </tr>
	  <tr align="right">
    <td colspan="2"><img src="<%=te_path%>/image/line.gif" width="120" height="1" /></td>
  </tr>
  <tr>
    <td width="44" align="right"><img src="<%=te_path%>/image/img.gif" width="11" height="12" hspace="10" /></td>
    <a href="thesis.do?action=thesisList" target="main" onClick="clickAction(this)" onMouseOver="overAction(this)" onMouseOut="outAction(this)">
      <td width="123" height="35" class="menu31">批改论文</td>
    </a> </tr>
  <tr align="right">
    <td colspan="2"><img src="<%=te_path%>/image/line.gif" width="120" height="1" /></td>
  </tr>
  <tr>
    <td align="right"><img src="<%=te_path%>/image/img.gif" width="11" height="12" hspace="10" /></td>
    <a href="TeachEvl/pingGuJieGuo.jsp" target="main" class="menu31" onClick="clickAction(this)" onMouseOver="overAction(this)" onMouseOut="outAction(this)">
    <td height="35" class="menu31">评估结果</td></a>
  </tr>
  <tr align="right">
    <td colspan="2"><img src="<%=te_path%>/image/line.gif" width="120" height="1" /></td>
  </tr>
  <tr>
    <td align="right"><img src="<%=te_path%>/image/img.gif" width="11" height="12" hspace="10" /></td>
    <a href="couseView.do?action=currentCourse" target="main" class="menu31" onClick="clickAction(this)" onMouseOver="overAction(this)" onMouseOut="outAction(this)">
      <td height="35" class="menu31">查看课程表</td>
    </a> </tr>
  <tr align="right">
    <td colspan="2"><img src="<%=te_path%>/image/line.gif" width="120" height="1" /></td>
  </tr>
  <tr>
    <td align="right"><img src="<%=te_path%>/image/img.gif" width="11" height="12" hspace="10" /></td>
    <a href="sign.do?action=teachPlanInfo&className=" target="main" class="menu31" onClick="clickAction(this)" onMouseOver="overAction(this)" onMouseOut="outAction(this)">
      <td height="35" class="menu31">教学计划</td>
    </a> </tr>
  <tr align="right">
    <td colspan="2"><img src="<%=te_path%>/image/line.gif" width="120" height="1" /></td>
  </tr>
  <tr>
    <td align="right"><img src="<%=te_path%>/image/img.gif" width="11" height="12" hspace="10" /></td>
    <a href="adjust.do?action=courseAdjust&pd=Y" target="main" class="menu31" onClick="clickAction(this)" onMouseOver="overAction(this)" onMouseOut="outAction(this)">
      <td height="35" class="menu31">课程调整</td>
    </a> </tr>
  <tr>
    <td colspan="2"><img src="<%=te_path%>/image/line.gif" width="120" height="1" /></td>
  </tr>
  <tr>
    <td align="right"><img src="<%=te_path%>/image/img.gif" width="11" height="12" hspace="10" /></td>
    <a href="arrange.do?action=arrangeList" target="main" class="menu31" onClick="clickAction(this)" onMouseOver="overAction(this)" onMouseOut="outAction(this)">
      <td height="35" class="menu31">工作安排</td>
    </a> </tr>
	  <tr align="right">
    <td colspan="2"><img src="<%=te_path%>/image/line.gif" width="120" height="1" /></td>
  </tr>
  
 
	
  <tr>
    <td colspan="2"><img src="<%=te_path%>/image/line.gif" width="120" height="1" /></td>
  </tr>
  <tr>
    <td height="217" colspan="2">&nbsp;</td>
  </tr>
</table>

