<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prResearchManage.ketiSbList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">�칫ϵͳ��&gt;���й���&gt;�ɹ������걨</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prResearchManage.reportResultList.do">
		<input type="hidden" name="modifyaction" value="oa.prResearchManage.reportResultModify.do">
		<input type="hidden" name="deleteaction" value="oa.prResearchManage.reportResultDelDo.do">
		<input type="hidden" name="viewaction" value="oa.prResearchManage.reportResultView.do">
		<html:hidden property="QueryReportResult/_order/col1/field"/>
		<html:hidden property="QueryReportResult/_order/col1/desc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		
        <html:hidden property="type" />
	  </td>
    </tr>
  </table>


<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
      
	  <tr>
	  	<td class="text">
	  	   <logic:equal property="type" value="sb">
	  	   <qx:talentButton value="�� ��" styleClass="button_02" type="button" operation="DX_OASYS_RESEARCH_KETISHENBAO.DX_OASYS_RESEARCH_KETISHENBAO_ADD" onclick="talentadd()" property="add"></qx:talentButton>
           <input name="view" type="button" class="button_02" value="�� ��" onClick="talentview()">
           <qx:talentButton value="�� ӡ" styleClass="button_02" type="button" operation="DX_OASYS_RESEARCH_KETISHENBAO.DX_OASYS_RESEARCH_KETISHENBAO_PRINT" onclick="iePrint()" property="ieprint"></qx:talentButton>
           <qx:talentButton value="�� ��" styleClass="button_02" type="button" operation="DX_OASYS_RESEARCH_KETISHENBAO.DX_OASYS_RESEARCH_KETISHENBAO_EXPORT" onclick="exporttoexcel()" property="export"></qx:talentButton>
           <qx:talentButton value="ģ������" styleClass="button_02" type="button" operation="DX_OASYS_RESEARCH_KETISHENBAO.DX_OASYS_RESEARCH_KETISHENBAO_DOWNMODEL" onclick="downModel()" property="downmodel"></qx:talentButton>
           </logic:equal>
			<!--	<input name="add" type="button" class="button_02" value="�� ��" onClick="talentadd()">
                <input name="view" type="button" class="button_02" value="�� ��" onClick="talentview()">
                <input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
                <input name="export" type="button" class="button_02" value="�� ��" onclick="exporttoexcel()">
				<input name="downmodel" type="button" class="button_02" value="ģ������" onClick="downModel()">-->
		</td>
	  </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="5%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                  <td width="15%" align="center" nowrap id="QueryReportResult.ProjectName" onClick="talentsort()">�ɹ�����</td>
                  <td width="15%" align="center" nowrap id="QueryReportResult.ResultType" onClick="talentsort()">�ɹ���ʽ</td>
                  <td width="17%" align="center" nowrap id="QueryReportResult.Publisher" onClick="talentsort()">������</td>
                  <td width="12%" align="center" nowrap id="QueryReportResult.ReleasedTime" onClick="talentsort()">����ʱ��</td>
                  <td width="12%" align="center" nowrap id="QueryReportResult.ResultTime" onClick="talentsort()">�ʱ��</td>
                  <td width="12%" align="center" nowrap id="QueryReportResult.Evaluation" onClick="talentsort()">�ɹ�����</td>
                  <td width="10%" align="center" nowrap id="QueryReportResult.Status" onClick="talentsort()">״̬</td>
                  <td width="16%" align="center" >����</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='ReportedResult']">
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="view('<bean:write id="resultset" property="QueryReportResult/ProjectID"/>')">  
                <td align="center"> 
					<logic:present  id="resultset" property="QueryReportResult/ProjectID"> 
                  		<html:checkbox id="resultset" name="list[@name='update']/ReportedResult/ProjectID" property="QueryReportResult/ProjectID" indexed="true"/> 
                  	</logic:present> 
				</td>
				<td nowrap align="center"><bean:write id="resultset" property="QueryReportResult/ProjectName"/></td>
				<td nowrap align="center"><bean:write id="resultset" property="QueryReportResult/ResultType"/></td>
				<td nowrap align="center"><bean:write id="resultset" property="QueryReportResult/Publisher"/></td>
                <td nowrap align="center"><bean:write id="resultset" property="QueryReportResult/ReleasedTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                <td nowrap align="center"><bean:write id="resultset" property="QueryReportResult/ResultTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                <td nowrap align="center"><bean:write id="resultset" property="QueryReportResult/Evaluation" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
				<td nowrap align="center">
				<logic:equal id="resultset" property="QueryReportResult/Status" value="0">
                      <logic:equal id="resultset" property="QueryReportResult/WordNum" value="0">
                      ������Ϣ
                      </logic:equal>
                      <logic:notEqual id="resultset" property="QueryReportResult/WordNum" value="0">
                      �����
                      </logic:notEqual>
                </logic:equal>
                <logic:equal id="resultset" property="QueryReportResult/Status" value="1">���ͨ��</logic:equal>
				</td>
                <td nowrap align="center">
                  <logic:equal id="resultset" property="QueryReportResult/Status" value="0">
                      <logic:equal id="resultset" property="QueryReportResult/WordNum" value="0">
                      <logic:equal property="isManager" value="0">
                      <a href='#' onclick="update('<bean:write id="resultset" property="QueryReportResult/ProjectID"/>')">�ϴ�������Ϣ</a>
                      </logic:equal>
                      </logic:equal>
                      <logic:notEqual id="resultset" property="QueryReportResult/WordNum" value="0">
                      <logic:equal property="isManager" value="1">
                      <a href='#' onclick="updateStatus('<bean:write id="resultset" property="QueryReportResult/ProjectID"/>')">ͨ��</a>
                      <a href='#' onclick="update('<bean:write id="resultset" property="QueryReportResult/ProjectID"/>')">�޸�</a>
                      <a href='#' onclick="delete('<bean:write id="resultset" property="QueryReportResult/ProjectID"/>')">ɾ��</a>
                      </logic:equal>
                      </logic:notEqual>
                  </logic:equal>
                  <logic:equal id="resultset" property="QueryReportResult/Status" value="1">
                  <a href='#' onclick="update('<bean:write id="resultset" property="QueryReportResult/ProjectID"/>')">�޸�</a>
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
		  </script>
			  </td>
            </tr>
          </table>
		  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="30" align="center">
              <IMG src="/internet/image/research/research8.jpg">
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
	function updateStatus(id){
		var frm = document.forms[0];
		frm.action = "oa.prResearchManage.reportResultUpdate.do";
		frm.action += "?fid=" + id;
   		frm.submit();
	}
	
	function update(id){
		var frm = document.forms[0];
		frm.action = frm.elements["modifyaction"].value;
		frm.action += "?fid=" + id;
   		frm.submit();
	}
	
	function detele(id){
		var frm = document.forms[0];
		if(confirm("�Ƿ�ȷ��ɾ��������ɹ���")==false){
			return ;
		} 
		frm.action = frm.elements["deleteaction"].value;
		frm.action += "?fid=" + id;
   		frm.submit();
	}
	
	function view(id){
		var frm = document.forms[0];
		frm.action = frm.elements["viewaction"].value;
		frm.action += "?fid=" + id;
   		frm.submit();
	}
	
	function downModel(type){
		var frm = document.forms[0];
		frm.action = frm.elements["downmodelaction"].value;
		//frm.elements["type"].value = type;
   		frm.submit();
	}
</script>