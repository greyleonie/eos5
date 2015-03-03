<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="studentmanage.student_xj.teamList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">学员管理—&gt;学籍管理—&gt;班组管理
              </td></tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="studentmanage.student_xj.teamList.do">
		<input type="hidden" name="addaction" value="studentmanage.student_xj.teamAdd.do">
		<input type="hidden" name="modifyaction" value="studentmanage.student_xj.teamModify.do">
		<input type="hidden" name="deleteaction" value="studentmanage.student_xj.teamDelete.do">
		<html:hidden property="QueryTeam/_order/col1/field"/>
		<html:hidden property="QueryTeam/_order/col1/asc" />
		
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
        <td height="8"></td>
      </tr>
      <tr>
        <td height="8" class="text">
		班　　　级： <html:select property="QueryTeam/ClassID/criteria/value" onchange="talentquery()" attributesText='id="printTable"'> 
              <html:options property="list[@type='studentclass']/Class/ClassID" labelProperty="list[@type='studentclass']/Class/ClassName"/> 
              </html:select> 
		
		 </td>
      </tr>
      
	  <tr>
            <td height="30" class="text">
				
				 <input name="add" type="button" class="button_02" value="新 增" onClick="talentaddNew()">
              	<input name="delete" type="button" class="button_02" value="删 除" onClick="talentdelete()">
              	<input name="modify" type="button" class="button_02" value="修 改" onClick="talentmodify()">
				<input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
				<input name="Submit2" type="button" class="button_02" value="返 回" onClick="javascript:history.go(-1)">
				
				</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="5%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""></td>
                  <td width="50%" align="center" nowrap >班级</td>
                  <td width="20%" align="center" nowrap>组别</td>
                  <td width="25%" align="center" nowrap >讨论室</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='QueryTeam']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" >  
              
                <td align="center"> 
					
                  		<html:checkbox id="resultset" name="list[@name='update']/QueryTeam/TeamID" property="QueryTeam/TeamID" indexed="true"/>                  				</td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="QueryTeam/ClassName"/></td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="QueryTeam/TeamName"/></td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="QueryTeam/RoomName"/></td>
              </tr>
                </logic:iterate> 
            </table>       	    </td>
      </tr>
	  <tr>
        <td class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="30" class="text">
			  <script>
				PageCond(document.forms[0]);
		  </script>			  </td>
            </tr>
          </table>		</td>
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
	if(frm.elements["QueryTeam/ClassID/criteria/value"].value == "-1") {
		alert("请选择班级");
		return
	}
	var sel = frm.elements["QueryTeam/ClassID/criteria/value"];
	var className = sel.options[sel.options.selectedIndex].text;
	frm.action = frm.elements["addaction"].value + "?Team/ClassName=" + className;
   	frm.submit();

}
	loadOrderImg(document.forms[0],'QueryTeam');
</script>