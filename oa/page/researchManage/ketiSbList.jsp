<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prResearchManage.ketiSbList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">办公系统—&gt;科研管理—&gt;<logic:equal property="type" value="sb">课题申报</logic:equal><logic:equal property="type" value="bj">成果申报</logic:equal></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prResearchManage.ketiSbList.do">
		<input type="hidden" name="addaction" value="oa.prResearchManage.ketiSbAdd.do">
		<input type="hidden" name="modifyaction" value="oa.prResearchManage.ketiSbModify.do">
		<input type="hidden" name="deleteaction" value="oa.prResearchManage.ketiSbDelete.do">
		<input type="hidden" name="viewaction" value="oa.prResearchManage.reviewView.do">
		<input type="hidden" name="shangbaoaction" value="oa.prResearchManage.ketiSbUpDo.do">
		<input type="hidden" name="downmodelaction" value="oa.prResearchManage.modelUpload.do">
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
	  	<td class="text">
	  	   <logic:equal property="type" value="sb">
	  	   <qx:talentButton value="申 报" styleClass="button_02" type="button" operation="DX_OASYS_RESEARCH_KETISHENBAO.DX_OASYS_RESEARCH_KETISHENBAO_ADD" onclick="talentadd()" property="add"></qx:talentButton>
           <input name="view" type="button" class="button_02" value="查 看" onClick="talentview()">
           <qx:talentButton value="打 印" styleClass="button_02" type="button" operation="DX_OASYS_RESEARCH_KETISHENBAO.DX_OASYS_RESEARCH_KETISHENBAO_PRINT" onclick="iePrint()" property="ieprint"></qx:talentButton>
           <qx:talentButton value="导 出" styleClass="button_02" type="button" operation="DX_OASYS_RESEARCH_KETISHENBAO.DX_OASYS_RESEARCH_KETISHENBAO_EXPORT" onclick="exporttoexcel()" property="export"></qx:talentButton>
           <qx:talentButton value="模板下载" styleClass="button_02" type="button" operation="DX_OASYS_RESEARCH_KETISHENBAO.DX_OASYS_RESEARCH_KETISHENBAO_DOWNMODEL" onclick="downModel()" property="downmodel"></qx:talentButton>
           </logic:equal>
           <logic:equal property="type" value="bj">
           <qx:talentButton value="申 报" styleClass="button_02" type="button" operation="DX_OASYS_RESEARCH_CHENGGUOSHENBAO.DX_OASYS_RESEARCH_CHENGGUOSHENBAO_ADD" onclick="talentadd()" property="add"></qx:talentButton>
           <input name="view" type="button" class="button_02" value="查 看" onClick="talentview()">
           <qx:talentButton value="打 印" styleClass="button_02" type="button" operation="DX_OASYS_RESEARCH_CHENGGUOSHENBAO.DX_OASYS_RESEARCH_CHENGGUOSHENBAO_PRINT" onclick="iePrint()" property="ieprint"></qx:talentButton>
           <qx:talentButton value="导 出" styleClass="button_02" type="button" operation="DX_OASYS_RESEARCH_CHENGGUOSHENBAO.DX_OASYS_RESEARCH_CHENGGUOSHENBAO_EXPORT" onclick="exporttoexcel()" property="export"></qx:talentButton>
           <qx:talentButton value="模板下载" styleClass="button_02" type="button" operation="DX_OASYS_RESEARCH_CHENGGUOSHENBAO.DX_OASYS_RESEARCH_CHENGGUOSHENBAO_DOWNMODEL" onclick="downModel('sb')" property="downmodel"></qx:talentButton>
           </logic:equal>
			<!--	<input name="add" type="button" class="button_02" value="申 报" onClick="talentadd()">
                <input name="view" type="button" class="button_02" value="查 看" onClick="talentview()">
                <input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
                <input name="export" type="button" class="button_02" value="导 出" onclick="exporttoexcel()">
				<input name="downmodel" type="button" class="button_02" value="模板下载" onClick="downModel()">-->
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
                  <td width="15%" align="center" nowrap id="KetiSb.KetiName" onClick="talentsort()">课题名称</td>
                  <td width="12%" align="center" nowrap id="KetiSb.Sbr" onClick="talentsort()">申报人</td>
                  <td width="11%" align="center" nowrap id="KetiSb.Shenbaoriqi" onClick="talentsort()">申报日期</td>
                  <td width="17%" align="center" nowrap id="KetiSb.SbrDepartment" onClick="talentsort()">所在部门</td>
                  <td width="26%" align="center" >申报文档</td>
                  <td width="14%" align="center" >操作</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='KetiSb']"> 
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
				<td nowrap >&nbsp;<bean:write id="resultset" property="KetiSb/KetiName"/></td>
                <td nowrap align="center"><bean:write id="resultset" property="KetiSb/Sbr"/></td>
                <td nowrap  align="center"><bean:write id="resultset" property="KetiSb/ShenBaoriqi" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="KetiSb/SbrDepartment"/></td>
                <td nowrap >
               
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
                <logic:equal id="resultset" property="KetiSb/isShenBao" value="0">
                <a href='#' onclick="shangbao('<bean:write id="resultset" property="KetiSb/KetiSbID"/>')">上报</a>
                &nbsp;<a href='#' onclick="update('<bean:write id="resultset" property="KetiSb/KetiSbID"/>')">修改</a>
                &nbsp;<a href='#' onclick="detele('<bean:write id="resultset" property="KetiSb/KetiSbID"/>')">删除
                </logic:equal>
                <logic:equal id="resultset" property="KetiSb/ShangBaoState" value="2">
                <a href='#' onclick="shangbao('<bean:write id="resultset" property="KetiSb/KetiSbID"/>')">上报</a>
                &nbsp;<a href='#' onclick="update('<bean:write id="resultset" property="KetiSb/KetiSbID"/>')">修改</a>
                &nbsp;<a href='#' onclick="detele('<bean:write id="resultset" property="KetiSb/KetiSbID"/>')">删除
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
              <logic:equal property="type" value="sb">
              <IMG src="/internet/image/research/research1.jpg">
	  	      </logic:equal>
              <logic:equal property="type" value="bj">
              <IMG src="/internet/image/research/research6.jpg">
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
	
	
	function shangbao(id){
		var frm = document.forms[0];
		if(confirm("是否确定上传申报文件？")==false){
			return ;
		} 
		frm.action = frm.elements["shangbaoaction"].value;
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
		if(confirm("是否确定删除申报文件？")==false){
			return ;
		} 
		frm.action = frm.elements["deleteaction"].value;
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