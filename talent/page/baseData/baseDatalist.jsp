<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="talent.prBaseData.baseDatalist.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">系统管理—&gt;基础数据管理—&gt;<bean:write property="BNDICT_T_Dictionary/baseName"/></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="talent.prBaseData.baseDatalist.do">
		<input type="hidden" name="addaction" value="talent.prBaseData.baseDataAdd.do">
		<input type="hidden" name="modifyaction" value="">
		<input type="hidden" name="deleteaction" value="talent.prBaseData.baseDataDelete.do">
		<input type="hidden" name="viewaction" value="talent.prBaseData.baseDataView.do">
		<input type="hidden" name="modifytoSave" value="talent.prBaseData.baseDataModifySave.do">
		<html:hidden property="BNDICT_T_Dictionary/_order/col1/field"/>
		<html:hidden property="BNDICT_T_Dictionary/_order/col1/asc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		<html:hidden property="BNDICT_T_Dictionary/businTypeID/criteria/value" />
		<html:hidden property="BNDICT_T_Dictionary/baseName" />
		
		<INPUT value="like" type="hidden" name="BNDICT_T_Dictionary/businName/criteria/operator">
		<INPUT value="center" type="hidden" name="BNDICT_T_Dictionary/businName/criteria/likeRule">
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
				<a id="keytitle"><bean:write property="BNDICT_T_Dictionary/baseName"/>名称</a>： 
			    <html:text property="BNDICT_T_Dictionary/businName/criteria/value" attributesText='class="input"'/>
			    <input name="query" type="button" class="button_02" value="查 询" onClick="talentquery()">
				
                <input name="add" type="button" class="button_02" value="新 增" onClick="talentadd()">
              	<input name="delete" type="button" class="button_02" value="删 除" onClick="talentdelete()">
				<input name="modifyandsave" type="button" class="button_02" value="修改保存" onClick="modifySave('listdetail')">
				
				<input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
				服务端排序：<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""> 
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="11%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                  <td width="53%" align="center" nowrap id="BNDICT_T_Dictionary.businName" onClick="talentsort()"><bean:write property="BNDICT_T_Dictionary/baseName"/>--名称</td>
                  <td width="36%" align="center" nowrap id="BNDICT_T_Dictionary.remark" onClick="talentsort()">备注</td>
                  
                  
                  
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='basedata']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="BNDICT_T_Dictionary/businID"/>','true')">  
                <td align="center"> 
					<logic:present  id="resultset" property="BNDICT_T_Dictionary/businID">
						
                  		
                  			<html:checkbox id="resultset" name="list[@name='update']/BNDICT_T_Dictionary/businID" property="BNDICT_T_Dictionary/businID" indexed="true" /> 
                  
                  	</logic:present> 
				</td>
                <td nowrap onClick="toEditable()">&nbsp;<bean:write id="resultset" property="BNDICT_T_Dictionary/businName"/></td>
                
                
                <td align="center" nowrap onClick="toEditable()">&nbsp;<bean:write id="resultset" property="BNDICT_T_Dictionary/remark"/></td>
                
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
	loadOrderImg(document.forms[0],'EOSRole');
</script>