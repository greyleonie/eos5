<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="">
 
  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">ѧԱ����&gt;�༶ѧԱ�ɼ���&gt;<span id="printTable"><bean:write  property="QueryStudent/operatorname" filter="true"/>ѧԱ�ɼ�</span>
            
            </td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8" align="right">&nbsp;</td>
    </tr>
    <tr>
      <td height="8" align="right"><span class="text">
        <input name="ieprint" type="button" class="button_02" value="�� ӡ" onclick="iePrint()" />
        <input name="export" type="button" class="button_02" value="�� ��" onclick="exporttoexcel()" />
		&nbsp;&nbsp;
      </span></td>
    </tr>
    <tr>
      <td height="8" align="right"></td>
    </tr>
    <tr>
      <td height="8"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
        <tr class="td_title"> 
          <td width="9%" align="center">���</td>
          <td width="56%" align="center">ѧϰ��Ŀ</td>
          <td width="17%" align="center">ѧʱ</td>
          <td width="18%" align="center">�ɼ�</td>
        </tr>
        <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
        <logic:iterate id="resultset" property="list[@type='QueryScore']">
					<%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
		<tr class="<%=trClass%>" onClick="changeTRBgColor(this)" > 
          <td align="center"><bean:write id="resultset" property="QueryScore/SubjectNO" filter="true"/></td>
          <td>&nbsp;<bean:write id="resultset" property="QueryScore/Subject" filter="true"/></td>
          <td align="center"><bean:write id="resultset" property="QueryScore/ClassHours" filter="true"/></td>
          <td align="center"><bean:write id="resultset" property="QueryScore/Score" filter="true"/></td>
		</tr>
		</logic:iterate>
      </table></td>
    </tr>
    <tr>
      <td class="text"><table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
                <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="javascript:history.go(-1)">              </td>
            </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
</form>
 <form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>