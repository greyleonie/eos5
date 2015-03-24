<%@ include file="/internet/WFCOMMON/wfappbase.jsp" %>    

<%@ page import="com.primeton.eos.wf.web.util.WFDefinitionUtil"%>
<%
String id=request.getParameter("processDefID");
String startID="";
//System.out.println("startID"+id);
if (id!=null)
  startID = WFDefinitionUtil.getStartActID(Integer.parseInt(id));
//System.out.println("startID"+startID);  
%>



<frameset name="mainTop" rows="300,8,*" cols="*" framespacing="0" frameborder="NO" border="0">
  <frame src="WFDEFMGR.pr_automata.WFDEFMGR_P_ShowProcDefGraph.do?processDefID=<bean:write property="processDefID"/>" name="topFrame" scrolling="no" noresize border="0">
  <frame src="/internet/WFDEFMGR/WFDEFMGR_WFSwitchUpDown.jsp" name="middle" scrolling="no" noresize border="0">
  <frame src="WFDEFMGR.pr_automata.WFDEFMGR_P_ShowActyDef.do?processDefID=<bean:write property="processDefID"/>&activityDefID=<%=startID%>&activityType=start" name="mainFrame" scrolling="no" noresize border="0">
</frameset>



<%@include file="/internet/commonTail.jsp"%>
