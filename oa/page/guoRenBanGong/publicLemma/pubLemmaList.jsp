<%@include file="/internet/common.jsp"%>

<body>
<form method="post" action="oa.prPsLemma.psLemmaList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">办公系统—&gt;公文管理—&gt;个人词条</td>
          </tr>
        </table></td>
    </tr>

    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prPsLemma.psLemmaList.do">
		<input type="hidden" name="addaction" value="oa.prPsLemma.psLemmaAdd.do">
		<input type="hidden" name="modifyaction" value="oa.prPsLemma.psLemmaModify.do">
		<input type="hidden" name="deleteaction" value="oa.prPsLemma.psLemmaDelete.do">
		<input type="hidden" name="viewaction" value="oa.prPsLemma.psLemmaView.do">
		
		<html:hidden property="PubLemma/_order/col1/field"/>
		<html:hidden property="PubLemma/_order/col1/asc" />
		<html:hidden property="PubLemma/DESCRIPTION/criteria/operator" value="like"/>
		
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
	  	    <a title='根据词条内容查询"' id="keytitle">内 容</a>： 
			<html:text property="PubLemma/DESCRIPTION/criteria/value" attributesText='class="input" size="15"'/>
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
                  <td width="10%" align="center" nowrap id="PubLemma.CODE" onClick="talentsort()">编号</td>
                  <td width="40%" align="center" nowrap id="PubLemma.DESCRIPTION" onClick="talentsort()">词条内容</td>
                  <td width="20%" align="center" nowrap id="PubLemma.CYYTYPE" onClick="talentsort()">类型</td>
				<td width="20%" align="center" nowrap id="PubLemma.CREATEOR" onClick="talentsort()">创建人</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='PubLemmaList']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="PubLemma/CODE"/>','true')">  
                <td align="center"> 
					<logic:present  id="resultset" property="PubLemma/CODE"> 
                  		<html:checkbox id="resultset" name="list[@name='update']/PubLemma/CODE" property="PubLemma/CODE" indexed="true"/> 
                  	</logic:present> 
				</td>
				<td nowrap align="center">&nbsp;<bean:write id="resultset" property="PubLemma/CODE"/></td>
				<td nowrap >&nbsp;<bean:write id="resultset" property="PubLemma/DESCRIPTION"/></td>
				<td nowrap align="center">
				 <logic:equal id="resultset" property="PubLemma/CYYTYPE" value="0">公有</logic:equal>
                 <logic:equal id="resultset" property="PubLemma/CYYTYPE" value="1">私有</logic:equal></td>
				<td nowrap align="center">&nbsp;<bean:write id="resultset" property="PubLemma/CREATEOR"/></td>
				
                
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