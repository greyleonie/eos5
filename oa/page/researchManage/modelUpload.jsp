<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="oa.prResearchManage.modelUploadDo.do">

        <input type="hidden" name="deleteaction" value="oa.prResearchManage.ketiModelDelete.do">
        <input type="hidden" name="setmodelaction" value="oa.prResearchManage.ketiModelSetDo.do">
        <input type="hidden" name="backaction" value="oa.prResearchManage.reviewList.do">
        
  		<input type="hidden" name="filepath" value="KetiModel"/>
		<input type="hidden" name="FBFILE_T_FILE/GROUP_ID" value="KetiModel">
		<input type="hidden" name="FBFILE_T_FILE/FILE_SAVE" value="F"> 
		
		<html:hidden property="KetiModel/_order/col1/field"/>
		<html:hidden property="KetiModel/_order/col1/desc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		
		<html:hidden property="type" />
		<input type="hidden" name="fid">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;办公系统—&gt;科研管理—&gt;<logic:equal property="type" value="sb">课题申报评审</logic:equal><logic:equal property="type" value="bj">成果申报评审</logic:equal>—&gt;模板上传</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="28"> </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#A2C4DC">
          <tr  onClick="changeTRBgColor(this)">
            <td width="9%" align="right" class="td2">模版名称：</td>
            <td width="11%" class="td1"><html:text property="KetiModel/modelName" styleClass="inputOA" maxlength="25" attributesText='style="width:98%;" ValidateType="notempty" Msg="模版名称不能为空"'/></td>
            <td width="6%" align="right" class="td2">年度：</td>
            <td width="10%" class="td1">
            <html:select property="KetiModel/year">
            <script language="javascript">
            var todate = new Date();
            var toyear = todate.getYear();
            document.write("<option value=''>请选择</option>");
            for (var i=0;i<=10;i++) {
                var year = toyear - i;
                document.write("<option value='"+ year + "'>" + year + "年度</option>");
            }
            </script>
            </html:select>
            </td>
            <td width="10%" align="right" class="td2">课题类型：</td>
            <td width="12%" class="td1">
            <html:select property="KetiModel/modelClass">
            <html:option value=''>请选择</html:option>
            <html:option value='国家级课题'>国家级课题</html:option>
            <html:option value='省部级课题'>省部级课题</html:option>
            <html:option value='市级课题'>市级课题</html:option>
            <html:option value='校级课题'>校级课题</html:option>
            <html:option value='其他课题'>其他课题</html:option>
            </html:select>
            </td>
            <qx:talentModule moduleID="DX_OASYS_RESEARCH_KETIPINGSHEN">
            <td width="10%" align="right" class="td2">上传文档：</td>
            <td width="30%" class="td1">
            <table width="100%" id="fjtable">
            <tr><td id='td0'>
            <input type="file" name="modelContent" class='input' size='20' ValidateType="notempty" Msg="上传文档不能为空">&nbsp;<input name="Button" type="button" class="button_02" value="添加附件" onClick="insertFile();">
            </td>
            </tr>
			</table>
            </td>
            </qx:talentModule>
          </tr>
          </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
                <input name="Button" type="button" class="button_02" value="查 询" onClick="query()">
                <qx:talentModule moduleID="DX_OASYS_RESEARCH_KETIPINGSHEN">
                <input name="Button" type="button" class="button_02" value="上 传" onClick="save()">
                </qx:talentModule>
                <input name="Submit2" type="button" class="button_02" value="返 回" onClick="goback()">
              </td>
            </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;
        </td>
    </tr>
    <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="10%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                  <td width="10%" align="center" nowrap id="KetiModel.uploadDate" onClick="talentsort()">年度</td>
                  <td width="20%" align="center" >模板名称</td>
                  <td width="35%" align="center" >文档名称</td>
                  <td width="15%" align="center" >上传时间</td>
                  <qx:talentModule moduleID="DX_OASYS_RESEARCH_KETIPINGSHEN">
                  <td width="10%" align="center" >操作</td>
                  </qx:talentModule>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='KetiModel']">
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" >  
                <td align="center"> 
					<logic:present  id="resultset" property="KetiModel/modelID"> 
                  		<html:checkbox id="resultset" name="list[@name='update']/KetiModel/modelID" property="KetiModel/modelID" indexed="true"/> 
                  	</logic:present> 
				</td>
                <td nowrap  align="center"><bean:write id="resultset" property="KetiModel/year"/></td>
                <td nowrap >&nbsp;
                <bean:write id="resultset" property="KetiModel/modelName"/>
                </a>
				</td>
                <td nowrap >&nbsp;
                <a href='/common/page/viewimgdb/viewFromDB.jsp?table=KetiModel&pkn=modelID&field=modelContent&pkv=<bean:write id="resultset" property="KetiModel/modelID"/>&type=<bean:write id="resultset" property="KetiModel/modelType"/>&fileName=<bean:write id="resultset" property="KetiModel/fileName" filter="true"/>' target="_blank">
                <bean:write id="resultset" property="KetiModel/fileName"/>
                </a>
				</td>
				<td nowrap  align="center">
				<bean:write id="resultset" property="KetiModel/uploadDate" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
				</td>
				<qx:talentModule moduleID="DX_OASYS_RESEARCH_KETIPINGSHEN">
				<td nowrap  align="center">
				<a href='#' onclick="deleteModel('<bean:write id="resultset" property="KetiModel/modelID"/>')">删除</a>
				</td>
				</qx:talentModule>
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
  </form>
 
  <script>
  var i=0;
  function insertFile(){
		i++;
		R = fjtable.insertRow();
		C1 = R.insertCell();
		C1.id="td"+i;
	    C1.innerHTML = "<input  type='file' name='modelContent' class='input' size='30'>&nbsp;<img src='/internet/images/attachdelete.gif' alt='删除' align='absmiddle' style='cursor:hand' onclick='fjtable.deleteRow(td"+i+".parentElement.rowIndex)'>";
  }
  
  function save() {
  	 var frm = document.forms[0];
  	
  	 frm.action = "oa.prResearchManage.modelUploadDo.do";
	 if(validater(frm)) frm.submit();
  
  }
  
  function query() {
     var frm = document.forms[0];
  	 
  	 ///criteria/value
  	 frm.elements["KetiModel/modelName"].name = "KetiModel/modelName/criteria/value";
  	 frm.elements["KetiModel/year"].name = "KetiModel/year/criteria/value";
  	 frm.elements["KetiModel/modelClass"].name = "KetiModel/modelClass/criteria/value";
  	 frm.action = "oa.prResearchManage.modelUpload.do";
	 frm.submit();
  }
  
  function setModel(id){
  		var frm = document.forms[0];
		if(confirm("是否确定将选择项设为当前申报课题模板？")==false){
			return ;
		} 
		frm.action = frm.elements["setmodelaction"].value;
		frm.fid.value = id;
   		frm.submit();
  }
  
  	function deleteModel(id){
		var frm = document.forms[0];
		if(confirm("是否确定删除申报课题模板？")==false){
			return ;
		} 
		frm.action = frm.elements["deleteaction"].value;
		frm.fid.value = id;
   		frm.submit();
	}
	
	function goback(){
		var frm = document.forms[0];

		frm.action = frm.elements["backaction"].value;

   		frm.submit();
	}
  </script>
 