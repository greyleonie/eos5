<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prResearchManage.reviewList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">�칫ϵͳ��&gt;���й���&gt;<logic:equal property="type" value="sb">�����걨����</logic:equal><logic:equal property="type" value="bj">�ɹ��걨����</logic:equal></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prResearchManage.reviewList.do">
		<input type="hidden" name="addaction" value="oa.prResearchManage.reviewAdd.do">
		<input type="hidden" name="modifyaction" value="">
		<input type="hidden" name="deleteaction" value="oa.prResearchManage.reviewDelete.do">
		<input type="hidden" name="viewaction" value="oa.prResearchManage.reviewView.do">
		<input type="hidden" name="modelaction" value="oa.prResearchManage.modelUpload.do">
		<input type="hidden" name="upstatusaction" value="oa.prResearchManage.ketiSbUpStatus.do">
		
		<html:hidden property="KetiSb/_order/col1/field"/>
		<html:hidden property="KetiSb/_order/col1/desc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		
		<html:hidden property="type" />
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
                <a title='��������"' id="keytitle">��������</a>�� 
			    <html:text property="KetiSbSearch/KetiName" attributesText='class="input" size="15"'/>
			    &nbsp;
				<a title='�걨��"' id="keytitle">�걨��</a>�� 
			    <html:text property="KetiSbSearch/Sbr" attributesText='class="input" size="15"'/>
				&nbsp;
				�ϱ����ڣ�
				<html:text property="KetiSbSearch/ShangBaoriqi" attributesText='class="input" size="15"'/>
				<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["KetiSbSearch/ShangBaoriqi"],"yyyy-MM-dd")> 
				&nbsp;
				����״̬��
				<html:select  property="KetiSbSearch/ShangBaoState">   
                  <html:option value="-1">��ѡ��</html:option>
                  <html:option value="0">δ����</html:option>
                  <html:option value="1">ͨ��</html:option>
                  <html:option value="2">��ͨ��</html:option>
                 </html:select>
				
			    <input name="query" type="button" class="button_02" value="�� ѯ" onClick="talentquery()">

			</td>
      </tr>
	  <tr>
	  	<td class="text">
	  	   <logic:equal property="type" value="sb">
	  	   <input name="view" type="button" class="button_02" value="�� ��" onClick="talentview()">
           <qx:talentButton value="ɾ ��" styleClass="button_02" type="button" operation="DX_OASYS_RESEARCH_KETIPINGSHEN.DX_OASYS_RESEARCH_KETIPINGSHEN_DELETE" onclick="talentdelete()" property="delete"></qx:talentButton>
           <qx:talentButton value="�� ӡ" styleClass="button_02" type="button" operation="DX_OASYS_RESEARCH_KETIPINGSHEN.DX_OASYS_RESEARCH_KETIPINGSHEN_PRINT" onclick="iePrint()" property="ieprint"></qx:talentButton>
           <qx:talentButton value="�� ��" styleClass="button_02" type="button" operation="DX_OASYS_RESEARCH_KETIPINGSHEN.DX_OASYS_RESEARCH_KETIPINGSHEN_EXPORT" onclick="exporttoexcel()" property="export"></qx:talentButton>
           <input name="add" type="button" class="button_02" value="ģ���ϴ�" onClick="modelUpload('<bean:write property="type"/>')">
           </logic:equal>
           <logic:equal property="type" value="bj">
           <input name="view" type="button" class="button_02" value="�� ��" onClick="talentview()">
           <qx:talentButton value="ɾ ��" styleClass="button_02" type="button" operation="DX_OASYS_RESEARCH_CHENGGUOPINGSHEN.DX_OASYS_RESEARCH_CHENGGUOPINGSHEN_DELETE" onclick="talentdelete()" property="delete"></qx:talentButton>
           <qx:talentButton value="�� ӡ" styleClass="button_02" type="button" operation="DX_OASYS_RESEARCH_CHENGGUOPINGSHEN.DX_OASYS_RESEARCH_CHENGGUOPINGSHEN_PRINT" onclick="iePrint()" property="ieprint"></qx:talentButton>
           <qx:talentButton value="�� ��" styleClass="button_02" type="button" operation="DX_OASYS_RESEARCH_CHENGGUOPINGSHEN.DX_OASYS_RESEARCH_CHENGGUOPINGSHEN_EXPORT" onclick="exporttoexcel()" property="export"></qx:talentButton>
           <input name="add" type="button" class="button_02" value="ģ���ϴ�" onClick="modelUpload('<bean:write property="type"/>')">
           </logic:equal>
			    <!--<input name="view" type="button" class="button_02" value="�� ��" onClick="talentview()">
              	<input name="delete" type="button" class="button_02" value="ɾ ��" onClick="talentdelete()">
				<input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="�� ��" onclick="exporttoexcel()">
				<input name="add" type="button" class="button_02" value="ģ���ϴ�" onClick="modelUpload('<bean:write property="type"/>')">-->
		</td>
	  </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="5%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                  <td width="18%" align="center" nowrap id="KetiSb.KetiName" onClick="talentsort()">��������</td>
                  <td width="10%" align="center" nowrap id="KetiSb.Sbr" onClick="talentsort()">�걨��</td>
                  <td width="12%" align="center" nowrap id="KetiSb.SbrDepartment" onClick="talentsort()">���ڲ���</td>
                  <td width="10%" align="center" nowrap id="KetiSb.ShangBaoriqi" onClick="talentsort()">�ϱ�����</td>
                  <td width="24%" align="center" nowrap id="KetiSb.fileName" onClick="talentsort()">�걨�ĵ�</td>
                  <td width="8%" align="center" nowrap id="KetiSb.ShangBaoState" onClick="talentsort()">����״̬</td>
                  <td width="13%" align="center" >����</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@tye='KetiSb']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="KetiSb/KetiSbID"/>','true')">  
                <td align="center"> 
					<logic:present  id="resultset" property="KetiSb/KetiSbID"> 
                  		<html:checkbox id="resultset" name="list[@name='update']/KetiSb/KetiSbID" property="KetiSb/KetiSbID" indexed="true"/> 
                  	</logic:present> 
				</td>
				<td nowrap align="left"><bean:write id="resultset" property="KetiSb/KetiName"/></td>
                <td nowrap align="center"><bean:write id="resultset" property="KetiSb/Sbr"/></td>
                <td nowrap align="center"><bean:write id="resultset" property="KetiSb/SbrDepartment"/></td>
                <td nowrap align="center"><bean:write id="resultset" property="KetiSb/ShangBaoriqi" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                <td nowrap align="left">
                <logic:iterate id="resultSbList" property="list[@type='SbFj']">
                <logic:equal propertyId="resultset" property="KetiSb/KetiSbID" valueId="resultSbList" value="SbFj/sbId" valueType="variable">
                   <a href='/common/page/viewimgdb/viewFromDB.jsp?table=SbFj&pkn=SbFjId&field=Content&pkv=<bean:write id="resultSbList" property="SbFj/SbFjId"/>&type=<bean:write id="resultSbList" property="SbFj/filetype"/>&fileName=<bean:write id="resultSbList" property="SbFj/name" filter="true"/>' target="_blank">
                   <bean:write id="resultSbList" property="SbFj/name"/>
                    </a>
                   <br>
                </logic:equal>           
                </logic:iterate>
				</td>
                <td nowrap align="center">
                <logic:equal id="resultset" property="KetiSb/ShangBaoState" value="0">δ����</logic:equal>
                <logic:equal id="resultset" property="KetiSb/ShangBaoState" value="1">ͨ��</logic:equal>
                <logic:equal id="resultset" property="KetiSb/ShangBaoState" value="2">��ͨ��</logic:equal>
                </td>
                <td nowrap align="center">
				 <logic:equal id="resultset" property="KetiSb/status" value="0">
                 <logic:equal id="resultset" property="KetiSb/ShangBaoState" value="0">
                 <a href='#' onclick="pingshen('<bean:write id="resultset" property="KetiSb/KetiSbID"/>')">����</a>
                 </logic:equal>
                 <logic:notEqual id="resultset" property="KetiSb/ShangBaoState" value="0">
				 <a href='#' onclick="viewPs('<bean:write id="resultset" property="KetiSb/KetiSbID"/>')">�鿴����</a>&nbsp;
				 <a href='#' onclick="liXiang('<bean:write id="resultset" property="KetiSb/KetiSbID"/>')">����</a>
				 </logic:notEqual>
				 </logic:equal>
				 <logic:equal id="resultset" property="KetiSb/status" value="1">�ϴ�������Ϣ</logic:equal>
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
              <logic:equal property="type" value="sb">
              <IMG src="/internet/image/research/research2.jpg">
	  	      </logic:equal>
              <logic:equal property="type" value="bj">
              <IMG src="/internet/image/research/research7.jpg">
              </logic:equal>
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
	
	
	function pingshen(id){
		var frm = document.forms[0];
		frm.action = frm.elements["addaction"].value;
		frm.action += "?fid=" + id;
   		frm.submit();
	}
	
	function viewPs(id){
		var frm = document.forms[0];
		frm.action = frm.elements["viewaction"].value;
		frm.action += "?fid=" + id;
   		frm.submit();
	}
	
	function liXiang(id){
		var frm = document.forms[0];
		frm.action = frm.elements["upstatusaction"].value;
		frm.action += "?fid=" + id + "&status=1";
   		frm.submit();
	}
	
	function modelUpload(type){
		var frm = document.forms[0];
		frm.action = frm.elements["modelaction"].value;
		frm.action += "?type=" + type;
   		frm.submit();
	}
</script>