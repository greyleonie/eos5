<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prMeetingManage.meetingRoomList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;�������&gt;������ʹ����� </td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prMeetingManage.MeetingRoomUse.do">
		
		<html:hidden property="MR_REGISTER/_order/col1/field"/>
		<html:hidden property="MR_REGISTER/_order/col1/asc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		</td>
    </tr>
  </table>


<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
      
	  <tr>
	    <td height="30" class="text">���������ƣ�
	      <html:text property="MeetingRoomUse/mrname/criteria/value" attributesText='class="input"' size="15"/>
        <html:hidden property="MeetingRoomUse/mrname/criteria/operator" value="like"/>
        <html:hidden property="MeetingRoomUse/mrname/criteria/likeRule" value="center"/>
&nbsp;


	  
<input name="B32" type="button" class="button_02" value="�� ѯ" onClick="talentquery()" >

<input name="ieprint" type="button" class="button_02" value="�� ӡ" onclick="iePrint()">
<input name="export" type="button" class="button_02" value="�� ��" onclick="exporttoexcel()">
���������
<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""></td>
	    </tr>
	  
	  
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text"><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
          <tr class="td_title">
           
            <td width="14%" align="center" nowrap id="MeetingRoomUse.mrname" onClick="talentsort()">����</td>
            <td width="12%" align="center" nowrap id="MeetingRoomUse.MeetingName" onClick="talentsort()">��������</td>
            <td width="20%" align="center" nowrap id="MeetingRoomUse.operatorName" onClick="talentsort()">������</td>
            <td width="20%" align="center" nowrap id="MeetingRoomUse.APPLYDATE" onClick="talentsort()">����ʱ��</td>
            <td width="20%" align="center" nowrap id="MeetingRoomUse.STARTDATE" onClick="talentsort()">��ʼʱ��</td>
            <td width="10%" align="center" nowrap id="MeetingRoomUse.ENDDATE" onClick="talentsort()">����ʱ��</td>
            <td width="10%" align="center" nowrap id="MeetingRoomUse.ENDDATE" onClick="talentsort()">��ǰʹ�����</td>
            </tr>
          <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
          <logic:iterate id="resultset" property="list[@type='meetingRoomUse']">
            <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
						
						
			       %>
            <tr class="<%=trClass%>" >
	          
	             <td nowrap align="center"><bean:write id="resultset" property="MeetingRoomUse/mrname"/></td>
	            <td nowrap align="center"><bean:write  id="resultset" property="MeetingRoomUse/MeetingName" /></td>
	            <td nowrap align="center"><bean:write  id="resultset" property="MeetingRoomUse/operatorName" /></td>
	            <td  nowrap align="center"><bean:write id="resultset" property="MeetingRoomUse/APPLYDATE" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
	            <td  nowrap align="center"><bean:write id="resultset" property="MeetingRoomUse/STARTDATE" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd HH:mm:ss"/></td>
	            <td  nowrap align="center"><bean:write id="resultset" property="MeetingRoomUse/ENDDATE" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd HH:mm:ss"/></td>
	             <td  nowrap align="center">
	            <logic:equal propertyId="resultset" value="-1" property="MeetingRoomUse/Status">
	            �ѽ���
	            </logic:equal>
	             <logic:equal propertyId="resultset" value="0" property="MeetingRoomUse/Status">
	            <SPAN style="color:red">����ʹ��</SPAN>
	            </logic:equal>
	             <logic:equal propertyId="resultset" value="1" property="MeetingRoomUse/Status">
	             δ��ʼ
	            </logic:equal>
	            </td>
	            </tr>
          </logic:iterate>
        </table>
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="30" class="text">
			  <script>
				PageCond(document.forms[0]);
		  </script>			  </td>
            </tr>
          </table>		  </td>
      </tr>
      <tr>
        <td class="text">&nbsp;</td>
      </tr>
    </table>    </td>
  </tr>
</table>
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>