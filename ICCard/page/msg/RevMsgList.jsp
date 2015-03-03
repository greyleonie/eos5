<%@include file="/internet/common.jsp"%>
<%@ page import="java.util.*;"%>
<body>
<%

  java.text.SimpleDateFormat df=new java.text.SimpleDateFormat("yyyy-MM-dd");
  Date date=new Date();  
  String currentDate=df.format(date);
 %>
<form name="form1" method="post">
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		<html:hidden property="start" />
		<html:hidden property="end" />
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;一卡通—&gt;回复短信管理</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr class="td1">
      <td height="8"> 
       日期：<html:text property="start[@pattern='yyyy-MM-dd']"  value="<%=currentDate %>" attributesText='class="input"  size="15" '/> 
       <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["start[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
       —<html:text property="end[@pattern='yyyy-MM-dd']"  value="<%=currentDate %>" attributesText='class="input"  size="15" '/> 
       <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["end[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
           <input name="B3" type="button" class="button_02" value="查 询" onclick="query()">     
      </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" class="text" align="right">
            <input name="B3" type="button" class="button_02" value="删 除" onclick="del()">           
     
                          </td>
        </tr>
      </table>      
        <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr align="center" class="td_title">
          <td width="2%">
            <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked="firstChk">
          </td>
           <td width="12%">手机号码</td>
            <td width="14%">回复时间</td>
            <td width="23%">短信内容<br></td>
            <td width="6%">状态</td>
          </tr>
          <logic:iterate id="resultSet" property="list[@type='RevMsg']">
          <tr class="td2">
           <td>
           	  <html:checkbox id="resultSet" name="list[@name='RevMsg']/RevMsg/RevMsgID" property="RevMsg/RevMsgID" indexed="true"/></td>
            <td ><bean:write id="resultSet" property="RevMsg/SrcAddrIsdnNum"/></td>
            <td ><bean:write id="resultSet" property="RevMsg/DoneTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd hh:mm:ss"/></td>
            <td><bean:write id="resultSet" maxLength="72" property="RevMsg/MsgContent"/></td>
            <td align="center">
            <%
              String readed = base.util.TalentContext.getValue(pageContext,"resultSet","RevMsg/Readed");
            if(readed.equals("1"))
            	out.print("未阅读");
            else
            	out.print("已阅读");
            %>
            </td>
          </tr>
      </logic:iterate>
        </table>
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="30" class="text">
              <script>
				PageCond(document.forms[0]);
		     </script>
            </td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
</form>
</body>
<script>
var frm=document.forms[0];

 function add(){
    frm.action="ICCard.prMsg.addSms.do";
    frm.submit();
 }
 
 function del(){
  if(chechedCount(frm)<1){
    alert("至少必须选择一行！");
    		return ;
  }
  if(chechedCount(frm)>1){
    		alert("只能选择一行！");
    		return ;
  }
  if(confirm("确实删除这些信息？")){
   frm.action="ICCard.prMsg.delMsg.do";
   frm.submit();
   }
 }
 
 function query(){
    frm.action="ICCard.prMsg.msg.do";
    frm.elements["start"].value=frm.elements["start[@pattern='yyyy-MM-dd']"].value;
    frm.elements["end"].value=frm.elements["end[@pattern='yyyy-MM-dd']"].value;
    frm.elements["PageCond/begin"].value="";
    frm.elements["PageCond/count"].value="";
    frm.elements["PageCond/length"].value="";
    frm.submit();
 }
 
</script>