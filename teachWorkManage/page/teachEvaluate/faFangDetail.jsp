<%@include file="/internet/common.jsp"%>
<%@page import="talent.core.*" %>
<head>
</head>

<body>
<form>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0" style="display:none">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;��ѧ����������&gt;<span id="printTable"><%=request.getParameter("title")%>������������</span></td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="2" cellspacing="2" id="listdetail">
    <tr>
      <td height="8" id="Statistics" class="td1"> </td>
    </tr>
    <tr>
      <td class="text">   
        <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr align="center" class="td_title">
            <td width="11%" align="center">ѧ��</td>
            <td width="11%" align="center">����</td>
            <td width="11%" align="center">�ֻ�����</td>
            <td width="11%" align="center">ѧ��</td>
            <td width="11%" align="center">����</td>
            <td width="11%" align="center">�ֻ�����</td>
            <td width="11%" align="center">ѧ��</td>
            <td width="11%" align="center">����</td>
            <td width="11%" align="center">�ֻ�����</td>
          </tr>
          <%
          int i=0,j=0,total=0,yes=0,no=0;
          %>
          <logic:iterate id="weekevl" property="list[@type='evlList']">
          <%
          int type = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"weekevl","evlList/state"));
            String state = (type>0)?"<font color='black'>������</font>":"<font color='red'>δ����</font>";
          if (type==0) no++; else yes++;
          if (type==0) {
          if (i % 3==0) {
               j++;
          %>
		  <tr <%if (j % 2==0) { out.print("class='td2'"); } else { out.print("class='td1'"); }%> onclick="changeTRBgColor(this)">
		  <% } %>
            <td align="center">
            	<SCRIPT>
            		var ecount='<bean:write id="weekevl" property="evlList/evlamount"/>';
            		var temp='<bean:write id="weekevl" property="evlList/studentNo"/>';
            		if(ecount=='0'){
            			document.write('<font color="red">'+temp+'</font>');
            		}else{
            			document.write(temp);
            		}
            	</SCRIPT>               
            </td>
            <td align="center">
            	<SCRIPT>
            		var ecount='<bean:write id="weekevl" property="evlList/evlamount"/>';
            		var temp='<bean:write id="weekevl" property="evlList/operatorName"/>';
            		if(ecount=='0'){
            			document.write('<font color="red">'+temp+'</font>');
            		}else{
            			document.write(temp);
            		}
            	</SCRIPT>             	
            </td>
            <td align="center">
            	<SCRIPT>
            		var ecount='<bean:write id="weekevl" property="evlList/evlamount"/>';
            		var temp='<bean:write id="weekevl" property="evlList/MobileTel"/>';
            		if(ecount=='0'){
            			document.write('<font color="red">'+temp+'</font>');
            		}else{
            			document.write(temp);
            		}
            	</SCRIPT>             	
            </td>
          <% if ((i+1) % 3==0) { %></tr>
          <% } }
             i++; 
             total++;%>
          </logic:iterate>
        </table>
        </td>
    </tr>
    <tr>
      <td height="15" class="text" align="center"><input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()"></td>
    </tr>
  </table>
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>
<script>
document.all.Statistics.innerHTML = "&nbsp;&nbsp;ȫ�������� ��" + <%=total%> + "�ˣ�<font color='blue'>������</font> ��" + <%=yes%> + "�ˣ�<font color='red'>δ����</font> ��" + <%=no%> + "�ˡ�"; 
</script>