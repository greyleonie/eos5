<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="teachWorkManage.prSearch.videoList.do" name="opeForm">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;��ѯͳ�ơ�&gt;<span id="printTable">¼��β�ѯ</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="teachWorkManage.prSearch.videoList.do">
		<html:hidden property="VideoAll/_order/col1/field"/>
		<html:hidden property="VideoAll/_order/col1/asc" />
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
            <td height="30" class="text">
				���⣺
			<html:text property="VideoAll/Title/criteria/value" attributesText='class="input" size="20"' />
			<html:hidden property="VideoAll/Title/criteria/operator" value="like"/>
			<html:hidden property="VideoAll/Title/criteria/likeRule" value="center"/>
            ¼��ʱ�䣺 ��
            	<html:text property="VideoAll/RecordTime/criteria/min" attributesText='class="input" size="10"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["VideoAll/RecordTime/criteria/min"],"yyyy-MM-dd")> 
           		��
           		<html:text property="VideoAll/RecordTime/criteria/max" attributesText='class="input" size="10"' readonly="true"/>
          	    <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["VideoAll/RecordTime/criteria/max"],"yyyy-MM-dd")>
			    <input type="hidden" name="VideoAll/RecordTime/criteria/operator" value="between"/>
			    <input type="hidden" name="VideoAll/RecordTime/criteria/criteriaPattern" value="yyyy-MM-dd"/>
			 �༶��<html:text property="VideoAll/Class/criteria/value" attributesText='class="input" size="20"' />
			<html:hidden property="VideoAll/Class/criteria/operator" value="like"/>
			<html:hidden property="VideoAll/Class/criteria/likeRule" value="center"/>
			 <br/>
			 
                <input name="query" type="button" class="button_02" value="�� ѯ" onClick="talentquery()">     
				<input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">	
				���������<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""> 		
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="5%" align="center"  nowrap >���</td>
                  <td width="14%" align="center"  nowrap id="VideoAll.Title" onClick="talentsort()">¼�����</td>
                  <td width="5%" align="center"  nowrap id="VideoAll.IsReg" onClick="talentsort()">�Ƿ�¼��</td>
                  <td width="10%" align="center"  nowrap id="VideoAll.RecordTime" onClick="talentsort()">¼��ʱ��</td>
                  <td width="5%" align="center"  nowrap id="VideoAll.Recorder" onClick="talentsort()">¼����</td>
                  <td width="10%"  align="center"  nowrap id="VideoAll.ClassRooms" onClick="talentsort()">��Ӧ����</td>
                  <td width="19%"  align="center"  nowrap id="VideoAll.Class" onClick="talentsort()">��Ӧ�༶</td>
                  <td width="5%"  align="center"  nowrap id="VideoAll.Speaker" onClick="talentsort()">�ڿ���ʦ</td>
				  <td width="10%"  align="center"  nowrap id="VideoAll.Remarks" onClick="talentsort()">��ע</td>
                </tr>
				<%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
				<logic:iterate id="resultset" property="list[@type='VideoAll']">
					<%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
                <tr class="<%=trClass%>" onClick="changeTRBgColor(this)"> 
                  
                  <td align="center"><%=count %></td>
                  <td   align="center"  ><bean:write id="resultset" property="VideoAll/Title" /></td>
                  <td   align="center"  ><logic:equal id="resultset" property="VideoAll/IsReg"  value="1" >��</logic:equal>
                  <logic:equal id="resultset" property="VideoAll/IsReg"  value="0" >��</logic:equal></td>
				  <td   align="center"  ><bean:write id="resultset" property="VideoAll/RecordTime" formatType="yyyy-MM-dd"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" /></td>
                  <td   align="center"  ><bean:write id="resultset" property="VideoAll/Recorder" /></td>
                  <td   align="center"  ><bean:write id="resultset" property="VideoAll/ClassRooms" /></td>
                  <td   align="center"  ><bean:write id="resultset" property="VideoAll/Class" /></td>
                  <td   align="center"  ><bean:write id="resultset" property="VideoAll/Speaker" /></td>    
                  <td   align="center"  ><bean:write id="resultset" property="VideoAll/Remarks" /></td>

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
			 
          </table>
		  
		  </td>
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
<script type="text/javascript">
<!--

//-->

</script>