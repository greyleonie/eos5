<%@include file="/internet/common.jsp"%>

<body>
<form method="post" action="oa.prArchivePrefix.archivePrefixList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">办公系统—&gt;公文管理—&gt;公文前缀</td>
          </tr>
        </table></td>
    </tr>

    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prArchivePrefix.archivePrefixList.do">
		<input type="hidden" name="addaction" value="oa.prArchivePrefix.archivePrefixAdd.do">
		<input type="hidden" name="modifyaction" value="oa.prArchivePrefix.archivePrefixModify.do">
		<input type="hidden" name="deleteaction" value="oa.prArchivePrefix.archivePrefixDelete.do">
		<input type="hidden" name="viewaction" value="oa.prArchivePrefix.archivePrefixView.do">
		
		<html:hidden property="ArchivePrefix/_order/col1/field"/>
		<html:hidden property="ArchivePrefix/_order/col1/asc" />
		<html:hidden property="ArchivePrefix/DESCRIPTION/criteria/operator" value="like"/>
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />

	  </td>
    </tr>
  </table>

<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="99%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
	  <tr>
	  	<td class="text">
	  	    <a title='根据前缀名称查询"' id="keytitle">前缀名称:</a>： 
			<html:text property="ArchivePrefix/DESCRIPTION/criteria/value" attributesText='class="input" size="15"'/>
	  	    <input name="query" type="button" class="button_02" value="查 询" onClick="talentquery()">
			<input name="add" type="button" class="button_02" value="新 增" onClick="talentadd()">
			<input name="modify" type="button" class="button_02" value="修 改" onClick="talentmodify()">
			<input name="delete" type="button" class="button_02" value="删 除" onClick="talentdelete()">
            <input name="view" type="button" class="button_02" value="查 看" onClick="talentview()">
            <input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
			<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
		</td>
	  </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="10%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                  <td width="10%" align="center" nowrap id="ArchivePrefix.CODE" onClick="talentsort()">编号</td>
                  <td width="40%" align="center" nowrap id="ArchivePrefix.DESCRIPTION" onClick="talentsort()">前缀名称</td>
                  <td width="20%" align="center" nowrap id="ArchivePrefix.REMARK" onClick="talentsort()">类型</td>
				<td width="20%" align="center" nowrap id="ArchivePrefix.CREATEOR" onClick="talentsort()">创建人</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='ArchivePrefixList']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="ArchivePrefix/CODE"/>','true')">  
                <td align="center"> 
					<logic:present  id="resultset" property="ArchivePrefix/CODE">
                  		<html:checkbox id="resultset" name="list[@name='update']/ArchivePrefix/CODE" property="ArchivePrefix/CODE" indexed="true"/> 
                  	</logic:present> 
				</td>
				<td nowrap align="center">&nbsp;<bean:write id="resultset" property="ArchivePrefix/CODE"/></td>
				<td nowrap >&nbsp;<bean:write id="resultset" property="ArchivePrefix/DESCRIPTION"/></td>
				<td nowrap align="center">
				 <logic:equal id="resultset" property="ArchivePrefix/REMARK" value="1">发文</logic:equal>
                 <logic:equal id="resultset" property="ArchivePrefix/REMARK" value="2">收文</logic:equal></td>
				<td nowrap align="center">&nbsp;<bean:write id="resultset" property="ArchivePrefix/CREATEOR"/></td>
				
                
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