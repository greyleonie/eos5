<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="ICCard.prDestroyCard.selectTeacher.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;一卡通—&gt;卡注销—&gt;销卡登记—&gt;选择教工
              </td></tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="ICCard.prDestroyCard.selectTeacher.do">
		
		<html:hidden property="QueryTeacherCard/_order/col1/field"/>
		<html:hidden property="QueryTeacherCard/_order/col1/asc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		</td>
    </tr>
  </table>


<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
      
	  <tr>
	    <td height="30" class="text">
	   部门：
	     <html:select property="QueryTeacherCard/DepartmentID/criteria/value"  > 
			<html:option  value="-1">---请选择---</html:option> 
			<html:options property="list[@type='teacherorg']/EOSORG_T_Organization/orgID" labelProperty="list[@type='teacherorg']/EOSORG_T_Organization/orgName"/> 
		</html:select>
        
姓名：
<html:text property="QueryTeacherCard/operatorname/criteria/value" size="10" attributesText=" class='input' "/>


	  
<input name="B32" type="button" class="button_02" value="查 询" onClick="talentquery()">
<input  name="B22" type="button" class="button_02" value="选 择" onClick="selectUser()">
</td>
	  </tr>
	  
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
          <tr class="td_title">
            <td width="8%" align="center" nowrap><input type="checkbox" name="checkbox2" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked="">            </td>
            <td width="18%" align="center" nowrap id="QueryTeacherCard.operatorname" onClick="talentsort()">姓名</td>
            <td width="40%" align="center" nowrap id="QueryTeacherCard.orgName" onClick="talentsort()">部门</td>
            <td width="16%" align="center" nowrap id="QueryTeacherCard.TeacherType" onClick="talentsort()">类别</td>
            <td width="18%" align="center" nowrap id="QueryTeacherCard.CardID" onClick="talentsort()">卡编号</td>
          </tr>
          <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
          <logic:iterate id="resultset" property="list[@type='QueryTeacherCard']">
            <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
						String UserName= talent.core.TalentFunctions.getAvailStr(base.util.TalentContext.getValue(pageContext,"resultset","QueryTeacherCard/operatorname"));
						String CardLastSum= talent.core.TalentFunctions.getAvailStr(base.util.TalentContext.getValue(pageContext,"resultset","QueryTeacherCard/CardLastSum"));
						String TimeOfIssueCard= talent.core.TalentFunctions.getAvailStr(base.util.TalentContext.getValue(pageContext,"resultset","QueryTeacherCard/TimeOfIssueCard"));
						String CardID= talent.core.TalentFunctions.getAvailStr(base.util.TalentContext.getValue(pageContext,"resultset","QueryTeacherCard/CardID"));
						com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl bImpl=new com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl();
						TimeOfIssueCard = bImpl.format(TimeOfIssueCard,"yyyy-MM-dd HH:mm:ss");
						java.util.Hashtable h = new java.util.Hashtable();
						h.put("UserName", UserName);
						h.put("CardLastSum", CardLastSum);
						h.put("TimeOfIssueCard", TimeOfIssueCard);
						h.put("CardID", CardID);
			       %>
           <tr class="<%=trClass%>" onClick="changeTRBgColor(this)">
	            <td align="center"><html:checkbox id="resultset" name="list[@name='update']/QueryTeacherCard/TeacherID" property="QueryTeacherCard/TeacherID" indexed="true" attributes="<%=h%>"/>            </td>
	        	<td nowrap align="center"><bean:write id="resultset" property="QueryTeacherCard/operatorname"/></td>
	            <td nowrap align="center"><bean:write  id="resultset" property="QueryTeacherCard/orgName" /></td>
	            <td nowrap align="center"><bean:write id="resultset" property="QueryTeacherCard/TeacherType"/></td>
	            <td nowrap align="center"><bean:write  id="resultset" property="QueryTeacherCard/CardID" /></td>
            </tr>
          </logic:iterate>
        </table>
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="30" class="text">
			  <script>
				PageCond(document.forms[0]);
		  </script>			  </td>
            </tr>
          </table>		  </td>
      </tr>
      <tr>
        <td class="text">&nbsp;</td>
      </tr>
    </table>    
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>
<script>
function selectUser(){
	var frm =document.forms[0];
 	var i=0;
	var j=0;
	var UserName;
	var CardLastSum;
	var TimeOfIssueCard;
	var CardID;
	eles = frm.elements;
	while(i<eles.length){
			obj= eles[i];
			if(obj.type == "checkbox" && !obj.disabled && obj.getAttribute("marked")==null){
				if(obj.checked){
					j++;
					if(j>1){
						alert("只能选择一条记录！");
				    	return ;
					
					}
				    UserName = obj.getAttribute("UserName");
				    CardLastSum = obj.getAttribute("CardLastSum");
				    TimeOfIssueCard = obj.getAttribute("TimeOfIssueCard");
				    CardID = obj.getAttribute("CardID");
				}
			}
			i++;
		}
		if(j==0){
			alert("请选择一条记录");
			return "";
		}

		
		window.opener.curcardForm.elements["QueryCard/operatorName"].value=UserName;
		window.opener.curcardForm.elements["QueryCard/CardLastSumExt"].value=CardLastSum+"(这可能不是最新余额)";
		window.opener.curcardForm.elements["QueryCard/TimeOfIssueCard"].value=TimeOfIssueCard;
		window.opener.destroyForm.elements["DestroyCard/CardID"].value=CardID;
		window.opener.destroyForm.tosubmit.disabled="";
		window.close();
	
}
</script>