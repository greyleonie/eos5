<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="studentmanage.prThesis.thesisClassList.do">
  <html:hidden property="TeachingPlanUnit/UnitID" name="Thesis/TeachingGroupID"/>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">学员管理—&gt;学员文章管理—&gt;学员文章上传</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="studentmanage.prThesis.thesisClassList.do">
	  	<input type="hidden" name="viewaction" value="studentmanage.prThesis.thesisView.do">
		<input type="hidden" name="uploadaction" value="studentmanage.prThesis.thesisUpload.do">
		<input type="hidden" name="deleteaction" value="studentmanage.prThesis.thesisClassDetele.do">
	  	<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		<html:hidden property="isUpdateClass" value="0"/>
		<html:hidden property="Class/ClassID"/>
	  </td>
    </tr>
  </table>


<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="96%"  border="0" align="center" cellpadding="1" cellspacing="1">
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
            <td class="text">班　　　级： <html:select property="QueryThesis/ClassID/criteria/value" onchange="talentquery()" attributesText='id="printTable"'> 
              <html:option value="-1">--请选择班级--</html:option> <html:options property="list[@type='studentclass']/Class/ClassID" labelProperty="list[@type='studentclass']/Class/ClassName"/> 
              </html:select> 
              <input name="query" type="button" class="button_02" value="查 询" onclick="talentquery()">
            </td>
      </tr>
      <tr>
      <TD class="text">
           <qx:talentButton property="view" type="button" styleClass="button_02" value="上 传" onclick="talentToUpload()" operation="DX_STUDENT_MANAGE_ARTICLE_UPLOAD.DX_STUDENT_MANAGE_ARTICLE_UPLOAD_UPLOAD"/>
           <qx:talentButton property="delete" type="button" styleClass="button_02" value="删 除" onclick="talentdelete()" operation="DX_STUDENT_MANAGE_ARTICLE_UPLOAD.DX_STUDENT_MANAGE_ARTICLE_UPLOAD_DEL"/>
           <input name="ieprint" type="button" class="button_02" value="打 印" onclick="iePrint()">
           <input name="export" type="button" class="button_02" value="导 出" onclick="exporttoexcel()">
           <input name="SetDeadline" type="button" class="button_03" value="设置截止时间" onclick="displayDeadline()">
           <html:text property="Class/ThesisDeadline[@pattern='yyyy-MM-dd']" attributesText='class="input" size="10" ValidateType="notempty" Msg="截止时间不能为空"' style="display:none"/>
		   <img name="ThesisDeadlineImg" src="/internet/image/date.gif" width="13" height="20" align="absmiddle" style="display:none" onClick=calendar(document.forms[0].elements["Class/ThesisDeadline[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
		   <input name="SaveThesisDeadline" type="button" class="button_02" value="保 存" style="display:none" onclick="saveDeadline()">
		   <logic:notEqual property="Class/ThesisDeadline" value="">该班级的论文上传截止时间为<bean:write property="Class/ThesisDeadline" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></logic:notEqual>
        </td>
      </tr>
      <tr>
        <td height="5"></td>
      </tr>
      <tr>
        <td valign="top" class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
            <tr class="td_title">
              <td width="3%" align="center" nowrap><input type="checkbox" name="checkbox" value="checkbox" onclick="eosCheckAll(document.forms[0],this)" marked="">              </td>
              <td width="9%" align="center" nowrap  onclick="talentsort()">学号</td>
              <td width="9%" align="center" nowrap  onclick="talentsort()">姓名</td>
              <td width="36%" align="center" nowrap  onclick="talentsort()">文章标题</td>
              <td width="11%" align="center" nowrap  onclick="talentsort()">上传时间</td>
              <td width="7%" align="center" nowrap  onclick="talentsort()">是否合写</td>
              <td width="10%" align="center" nowrap  onclick="talentsort()">合写人</td>
            </tr>
            <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
            <logic:iterate id="resultset" property="list[@type='QueryStudent']">
              <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
             <tr class="<%=trClass%>" onclick="changeTRBgColor(this)" >
              <td align="center"><logic:present  id="resultset" property="QueryStudent/StudentID">
                <html:checkbox id="resultset" name="list[@name='update']/QueryStudent/StudentID" property="QueryStudent/StudentID" indexed="true"/>
              </logic:present>              </td>
            <td nowrap>&nbsp;
                <bean:write id="resultset" property="QueryStudent/StudentNO"/></td>
                <td nowrap>&nbsp;
                    <bean:write id="resultset" property="QueryStudent/operatorname" /></td>
                <td nowrap>&nbsp; 
                <logic:present id="resultset" property="QueryStudent/QueryThesis"> 
                <a href='/common/page/viewimgdb/viewFromDB.jsp?table=Thesis&pkn=ThesisID&field=ThesisContent&pkv=<bean:write id="resultset" property="QueryStudent/QueryThesis/ThesisID"/>&type=application/msword&fileName=<bean:write id="resultset" property="QueryStudent/QueryThesis/ThesisTitle" filter="true"/>'>
              		<bean:write id="resultset" property="QueryStudent/QueryThesis/ThesisTitle"/>
            	</a>
            	</logic:present>
            	<logic:notPresent id="resultset" property="QueryStudent/QueryThesis">
            	<font color="red">未上传</font>
            	</logic:notPresent>
             </td>
                <td nowrap>&nbsp;
                    <bean:write id="resultset" property="QueryStudent/QueryThesis/CommitTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                <td nowrap>&nbsp;
                	<logic:equal value="1" id="resultset" property="QueryStudent/QueryThesis/Iscooperate">是</logic:equal>
                </td>
                <td nowrap>&nbsp;
                    <bean:write id="resultset" property="QueryStudent/QueryThesis/cooperatorsName" />            </td>
              </tr>
            </logic:iterate>
          </table>
            <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td height="30" class="text">
                </td>
              </tr>
          </table></td>
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
function talentToUpload(){
    	var frm =document.forms[0];
		
   		if(chechedCount(frm)<1){
    		alert("至少必须选择一行！");
    		return ;
    	} 
    
    	frm.action = frm.elements["uploadaction"].value;
    	frm.submit();
}

function displayDeadline() {
var frm =document.forms[0];
var timeInput = frm.elements["Class/ThesisDeadline[@pattern='yyyy-MM-dd']"];
var timeImg = frm.elements["ThesisDeadlineImg"];
var saveButton = frm.elements["SaveThesisDeadline"];

timeInput.style.display = "inline";
timeImg.style.display = "inline";
saveButton.style.display = "inline";
}

function saveDeadline() {
var frm =document.forms[0];
var classes = frm.elements["QueryThesis/ClassID/criteria/value"];

frm.elements["isUpdateClass"].value="1";
frm.elements["Class/ClassID"].value=classes.options[classes.selectedIndex].value;
frm.submit();
}
</script>