<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="ICCard.prIssueCard.teacherCardList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;һ��ͨ��&gt;��������&gt;�̹�������
              </td></tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="ICCard.prIssueCard.teacherCardList.do">
		<input type="hidden" name="addaction" value="ICCard.prCardBase.cardAdd.do">
		<input type="hidden" name="thawaction" value="ICCard.prIssueCard.thawCard.do">
		<input type="hidden" name="congealaction" value="ICCard.prIssueCard.congealCard.do">
		<input type="hidden" name="viewaction" value="">
		<html:hidden property="QueryTeacherCard/_order/col1/field"/>
		<html:hidden property="QueryTeacherCard/_order/col1/asc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		</td>
    </tr>
  </table>


<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
      
	  <tr>
	    <td height="30" class="text">
	   ���ţ�
	     <html:select property="QueryTeacherCard/DepartmentID/criteria/value"  > 
			<html:option  value="-1">---��ѡ��---</html:option> 
			<html:options property="list[@type='teacherorg']/EOSORG_T_Organization/orgID" labelProperty="list[@type='teacherorg']/EOSORG_T_Organization/orgName"/> 
		</html:select>
        
������
<html:text property="QueryTeacherCard/operatorname/criteria/value" size="10" attributesText=" class='input' "/>

��״̬��
<html:select property="QueryTeacherCard/StateID/criteria/value"  > 
			<html:option  value="-1">��ѡ��</html:option> 
			<html:option value="0">δ����</html:option>
			<html:option value="2">ʹ����</html:option>
			<html:option value="3">����</html:option>
			<html:option value="4">��ʧ</html:option>
			<html:option value="5">����</html:option>
			
			
</html:select>

&nbsp; <a href="ICCard.prIssueCard.test.do">����</a>
	  
<input name="B32" type="button" class="button_02" value="�� ѯ" onClick="talentquery()">

<input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">
				���������<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""></td>
	    </tr>
	  
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
          <tr class="td_title">
            <td width="6%" align="center" nowrap><input type="checkbox" name="checkbox2" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked="">            </td>
            <td width="12%" align="center" nowrap id="QueryTeacherCard.operatorname" onClick="talentsort()">����</td>
            <td width="20%" align="center" nowrap id="QueryTeacherCard.orgName" onClick="talentsort()">����</td>
            <td width="12%" align="center" nowrap id="QueryTeacherCard.TeacherType" onClick="talentsort()">���</td>
            <td width="12%" align="center" nowrap id="QueryTeacherCard.DutyTechnicalPost" onClick="talentsort()">ְ��/ְ��</td>
            <td width="12%" align="center" nowrap id="QueryTeacherCard.IsRetire" onClick="talentsort()">�Ƿ���ְ</td>
            <td width="12%" align="center" nowrap id="QueryTeacherCard.StateID" onClick="talentsort()">����״̬</td>
            <td width="10%" align="center" nowrap onClick="talentsort()">����</td>
          </tr>
          <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
          <logic:iterate id="resultset" property="list[@type='QueryTeacherCard']">
            <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
           <tr class="<%=trClass%>" onClick="changeTRBgColor(this)">
	            <td align="center"><html:checkbox id="resultset" name="list[@name='update']/QueryTeacherCard/TeacherID" property="QueryTeacherCard/TeacherID" indexed="true"/>            </td>
	        	<td nowrap align="center"><bean:write id="resultset" property="QueryTeacherCard/operatorname"/></td>
	            <td nowrap align="center"><bean:write  id="resultset" property="QueryTeacherCard/orgName" /></td>
	            <td nowrap align="center"><bean:write id="resultset" property="QueryTeacherCard/TeacherType"/></td>
	            <td nowrap align="center"><bean:write  id="resultset" property="QueryTeacherCard/DutyTechnicalPost" /></td>
	            <td  nowrap align="center">
	            
	            	<logic:present id="resultset" property="QueryTeacherCard/IsRetire">
	            		<logic:equal id="resultset" property="QueryTeacherCard/IsRetire" value="0">��</logic:equal>
	            		<logic:notEqual id="resultset" property="QueryTeacherCard/IsRetire" value="0">��</logic:notEqual>
	            	</logic:present>
	            	<logic:notPresent id="resultset" property="QueryTeacherCard/IsRetire">��</logic:notPresent>
	            </td>
	            <td  nowrap align="center">
	            <%
	            String cardID= base.util.TalentContext.getValue(pageContext,"resultset","QueryTeacherCard/CardID");
	            String stateID= base.util.TalentContext.getValue(pageContext,"resultset","QueryTeacherCard/StateID");
	            if(cardID==null)
	            	out.println("<font color='red'>δ����</font>");
	            else
	            	if(stateID!=null){
	            		if(stateID.equals("1")) out.println("δʹ��");
	            		if(stateID.equals("2")) out.println("ʹ����");
	            		if(stateID.equals("3")) out.println("����");
	            		if(stateID.equals("4")) out.println("��ʧ");
	            		if(stateID.equals("5")) out.println("<font color='red'>����</font>");
	            	}
	             %>
		
	            </td>
	            <td  nowrap align="center">
	            <%if(cardID==null){ %>
	            <input name="issue" type="button" class="button_02" value="�� ��" onClick="issueCard(<bean:write id="resultset" property="QueryTeacherCard/TeacherID"/>)">
	           <%}
	           else if(stateID!=null&&stateID.equals("5")){
	           %>
	            <input name="thaw" type="button" class="button_02" value="�� ��" onClick="thawCard(<bean:write id="resultset" property="QueryTeacherCard/CardID"/>)">
	           <%}
	           else{
	           %>
	            <input name="congeal" type="button" class="button_02" value="�� ��" onClick="congealCard(<bean:write id="resultset" property="QueryTeacherCard/CardID"/>)">
	           <%
	           } %>
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
    </table>    
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>
<script >
	function issueCard(id){
		window.open("ICCard.prIssueCard.issueCard.do?fid="+id,"","height=250,width=460,top=130,left=300");
	}
	
	function thawCard(id){
		if(window.confirm("ȷ��Ҫ�ⶳ��")){
			var frm =document.forms[0];
			frm.action = frm.elements["thawaction"].value+".do?fid="+id;
    		frm.submit();
		}
	}
	
	function congealCard(id){
		if(window.confirm("ȷ��Ҫ������")){
			var frm =document.forms[0];
			frm.action = frm.elements["congealaction"].value+".do?fid="+id;
    		frm.submit();
		}
	}
</script>