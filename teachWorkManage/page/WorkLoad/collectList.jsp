<%@include file="/internet/common.jsp"%>
<%@ page import=" java.util.GregorianCalendar"%>
<SCRIPT language="jscript" src="/internet/scripts/processCaller.js"></SCRIPT>
<SCRIPT language="jscript" src="/internet/scripts/string.js"></SCRIPT>
<SCRIPT language="jscript" src="/internet/scripts/dynamicSelect.js"></SCRIPT>

<body >
<form method="post" action="teachWorkManage.prWorkLoad.collectList.do" name="opeForm" >
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;��ʦ������ͳ�ơ�&gt;<span id="printTable">�������б�</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="teachWorkManage.prWorkLoad.collectList.do">
		<input type="hidden" name="addaction" value="teachWorkManage.prWorkLoad.collectAdd.do">
		<input type="hidden" name="modifyaction" value="teachWorkManage.prWorkLoad.collectModify.do">
		<input type="hidden" name="deleteaction" value="teachWorkManage.prWorkLoad.collectDelete.do">
		<html:hidden property="WorkLoadCollect/_order/col1/field"/>
		<html:hidden property="WorkLoadCollect/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		
		<!--INPUT value="like" type="hidden" name="QueryStudent/operatorname/criteria/operator">
		<INPUT value="center" type="hidden" name="QueryStudent/operatorname/criteria/likeRule"-->
	  </td>
    </tr>
  </table>

<%String year = base.util.TalentContext.getValue(pageContext,null,"WorkLoadCollect/Yearth/criteria/value"); 
  String period=base.util.TalentContext.getValue(pageContext,null,"WorkLoadCollect/Period/criteria/value");
  String TeachingGroupID=base.util.TalentContext.getValue(pageContext,null,"WorkLoadCollect/TeachingGroupID/criteria/value");%>

<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
	  <tr>
            <td height="30" class="text">
				��ݣ�
            <html:select property="WorkLoadCollect/Yearth/criteria/value"  attributesText='ValidateType="notempty" Msg="��Ȳ���Ϊ��" ' value="<%=year %>">
            <html:option value="">--��ѡ��--</html:option>
			<%
			GregorianCalendar today=new GregorianCalendar();
          int thisYear=today.get(GregorianCalendar.YEAR);
			for(int i=thisYear+1;i>=thisYear-4;i--){%>
            <html:option value="<%=i+""%>"><%=i%></html:option>
           <%}%>
			</html:select>
			<html:hidden property="WorkLoadCollect/Yearth/criteria/operator" value="="/>
            ѧ�ڣ� 
            <html:select property="WorkLoadCollect/Period/criteria/value" attributesText='ValidateType="notempty" Msg="ʱ�ڲ���Ϊ��" ' value="<%=period %>" >		
                <html:option value="">--��ѡ��--</html:option>
                <html:option value="1">�ϰ���</html:option>
                <html:option value="2">�°���</html:option>       
			    </html:select>
			  <html:hidden property="WorkLoadCollect/Period/criteria/operator" value="="/>  
         �������в���
         <select name="WorkLoadCollect/TeachingGroupID/criteria/value"   id="select1" bizAction="teachWorkManage.bizWorkLoad.selectTeachGroup"   paramXML="" listXpath="list[@type='TeachGroup']" entityName="TeachGroup" valueField="orgID"    textField="orgName"        childID="select2"  nullLable="true" nullLableText="��ѡ����в�" nullLableValue="" onchange="refreshChild_DS(this)"   ValidateType="notempty" Msg="�������в�����Ϊ��" ></select> 
           <html:hidden property="WorkLoadCollect/TeachingGroupID/criteria/operator" value="="/>
           ��ʦ��
         <select name="WorkLoadCollect/TeacherID/criteria/value"        id="select2" bizAction="teachWorkManage.bizWorkLoad.selectTeacher"    paramXML="" listXpath="list[@type='Teacher']"     entityName="Teacher"    valueField="TeacherID" textField="operatorName"  childID=""       mainSelectID="select1" nullLable="true" nullLableText="��ѡ����ʦ" nullLableValue=""   ValidateType="notempty" Msg="��ʦ����Ϊ��"></select>
		 <script language="JavaScript" type="text/JavaScript">
		 	
			initSel_DS(document.getElementById("select1"));
		</script> <br/><br/>
			  <html:hidden property="WorkLoadCollect/TeacherID/criteria/operator" value="="/> 
                <input name="query" type="button" class="button_02" value="�� ѯ" onClick="talentquery()"> 
                 
                
                <qx:talentButton property="add" type="button" styleClass="button_02" value="�� ��" onclick="talentaddNew()" operation="DX_TEACH_MANAGE_WORKLOAD_COLLECT.DX_TEACH_MANAGE_WORKLOAD_COLLECT_ADD"/>
				
				<qx:talentButton property="add" type="button" styleClass="button_02" value="�� ��" onclick="talentmodify()" operation="DX_TEACH_MANAGE_WORKLOAD_COLLECT.DX_TEACH_MANAGE_WORKLOAD_COLLECT_MODIFY"/>
				
				<qx:talentButton property="add" type="button" styleClass="button_02" value="ɾ ��" onclick="talentdelete()" operation="DX_TEACH_MANAGE_WORKLOAD_COLLECT.DX_TEACH_MANAGE_WORKLOAD_COLLECT_DELETE"/>
				<input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">			
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="3%" align="center" rowspan="2" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" > 
                  </td>
                  <td width="7%" align="center" rowspan="2" nowrap id="WorkLoadCollect.Yearth" onClick="talentsort()">���</td>
                  <td width="5%" align="center" rowspan="2" nowrap id="WorkLoadCollect.Period" onClick="talentsort()">ѧ��</td>
                  <td width="5%" align="center" rowspan="2" nowrap id="WorkLoadCollect.operatorName" onClick="talentsort()">��ʦ<br/>����</td>
                  <td width="15%" align="center" rowspan="2" nowrap id="WorkLoadCollect.orgName" onClick="talentsort()">����<br/>���в�</td>
                  <td width="15%" align="center" colspan="3" nowrap >�Ͽ�</td>
                  <td width="5%" align="center" rowspan="2" nowrap id="WorkLoadCollect.Papers" onClick="talentsort()">��������<br/>����</td>
                  <td width="5%"  align="center" rowspan="2" nowrap id="WorkLoadCollect.Articles" onClick="talentsort()">�Ծ�<br/>����</td>
                  <td width="5%"  align="center" rowspan="2" nowrap id="WorkLoadCollect.Directions" onClick="talentsort()">��ɰ��ҵ<br/>����ָ��</td>
                  <td width="5%"  align="center" rowspan="2" nowrap id="WorkLoadCollect.ExamQuestions" onClick="talentsort()">�Ծ�<br/>����</td>
                  <td width="5%"  align="center" rowspan="2" nowrap id="WorkLoadCollect.Designs" onClick="talentsort()">�γ̲˵�<br/>���</td>
                  <td width="5%"  align="center" rowspan="2" nowrap id="WorkLoadCollect.Cases" onClick="talentsort()">��ѧ����<br/>����</td>
                  <td width="5%"  align="center" rowspan="2" nowrap id="WorkLoadCollect.Attentions" onClick="talentsort()">��������<br>����</td>
                  <td width="5%"  align="center" rowspan="2" nowrap id="WorkLoadCollect.ClassSum" onClick="talentsort()">����<br/>�δ�</td>
                  <td width="10%"  align="center" rowspan="2" nowrap id="WorkLoadCollect.ClassSum" onClick="talentsort()">��ע</td>
                </tr>
                  <tr class="td_title"> 

                  <td width="5%" align="center" nowrap >�ּ���</td>
                  <td width="5%" align="center" nowrap >������</td>
                  <td width="5%" align="center" nowrap >������</td>
                </tr>
				<%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
				<logic:iterate id="resultset" property="list[@type='WorkLoadCollect']">
					<%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
                <tr class="<%=trClass%>" onClick="changeTRBgColor(this)"> 
                  <td align="center">
				  <logic:present  id="resultset" property="WorkLoadCollect/CollectID">
				  	<html:checkbox id="resultset" name="list[@name='update']/WorkLoadCollect/CollectID" property="WorkLoadCollect/CollectID" indexed="true"/>
				  </logic:present>
				  </td>
				  <td align="center"  nowrap ><bean:write id="resultset" property="WorkLoadCollect/Yearth" /></td>
                  <td  align="center"  nowrap ><logic:equal id="resultset" property="WorkLoadCollect/Period" value="1">�ϰ���</logic:equal>
                  <logic:equal id="resultset" property="WorkLoadCollect/Period" value="2">�°���</logic:equal>
                  <logic:equal id="resultset" property="WorkLoadCollect/Period" value="3">ȫ��</logic:equal>
                  </td>
                  <td  align="center"  nowrap ><bean:write id="resultset" property="WorkLoadCollect/operatorName" /></td>
                  <td  align="center"  nowrap ><bean:write id="resultset" property="WorkLoadCollect/orgName" /></td>
                  <td  align="center" nowrap ><bean:write id="resultset" property="WorkLoadCollect/LessonsJB1" /></td>
                  <td  align="center" nowrap ><bean:write id="resultset" property="WorkLoadCollect/LessonsJB2" /></td>
                  <td  align="center" nowrap ><bean:write id="resultset" property="WorkLoadCollect/LessonsJB3" /></td>
                  <td  align="center"  nowrap ><bean:write id="resultset" property="WorkLoadCollect/Papers" /></td>
                  <td   align="center"  nowrap ><bean:write id="resultset" property="WorkLoadCollect/Articles" /></td>
                  <td   align="center"  nowrap ><bean:write id="resultset" property="WorkLoadCollect/Directions" /></td>
                  <td   align="center"  nowrap ><bean:write id="resultset" property="WorkLoadCollect/ExamQuestions" /></td>
                  <td   align="center"  nowrap ><bean:write id="resultset" property="WorkLoadCollect/Designs" /></td>
                  <td   align="center"  nowrap ><bean:write id="resultset" property="WorkLoadCollect/Cases" /></td>
                  <td   align="center"  nowrap ><bean:write id="resultset" property="WorkLoadCollect/Attentions" /></td>
                  <td  align="center"  nowrap ><bean:write id="resultset" property="WorkLoadCollect/ClassSum" /></td>
                  <td  align="center"  nowrap ><bean:write id="resultset" property="WorkLoadCollect/Remark" /></td>
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
<script>
function talentaddNew() {
	var frm = document.forms[0];
	var year = frm.elements["WorkLoadCollect/Yearth/criteria/value"].value;
	var period = frm.elements["WorkLoadCollect/Period/criteria/value"].value;
	var teachGroup = frm.elements["WorkLoadCollect/TeachingGroupID/criteria/value"].value;
	var teacher = frm.elements["WorkLoadCollect/TeacherID/criteria/value"].value;
	var BeginDate = "";
	var EndDate = "";
	if(validater(frm)){
	if(period==1){
			BeginDate = year +"-"+"2-1";
			EndDate = year +"-"+"8-1";
		}else{
			BeginDate = year +"-"+"8-1";
			year = Number(year)+1
			EndDate = year +"-"+"2-1";
		}
	frm.action = frm.elements["addaction"].value + "?year="+year+"&period="+period+"&teachGroup="+teachGroup+"&teacher="+teacher+"&BeginDate="+BeginDate+"&EndDate="+EndDate;
   	frm.submit();
   }

}



</script>
<script>
	loadOrderImg(document.forms[0],'WorkLoadCollect');
</script>