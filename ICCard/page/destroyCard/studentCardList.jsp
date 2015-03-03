<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="ICCard.prDestroyCard.selectStudent.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;一卡通—&gt;卡注销—&gt;销卡登记—&gt;选择学员</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="ICCard.prDestroyCard.selectStudent.do">
		<html:hidden property="QueryStudentCard/_order/col1/field"/>
		<html:hidden property="QueryStudentCard/_order/col1/asc" />
		
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
	    <td height="30" class="text">  班级：
	     <html:select property="QueryStudentCard/ClassID/criteria/value" attributesText='id="printTable"'> 
              <html:option value="-1">--请选择班级--</html:option> <html:options property="list[@type='studentclass']/Class/ClassID" labelProperty="list[@type='studentclass']/Class/ClassName"/> 
        </html:select> &nbsp;</td>
    </tr>
	  <tr>
	    <td height="30" class="text">
	 
        
姓名：
<html:text property="QueryStudentCard/operatorname/criteria/value" size="10" attributesText=" class='input' "/>



&nbsp; 
	  
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
            <td width="8%" align="center" nowrap ><input type="checkbox" name="checkbox2" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""></td>
            <td width="16%" align="center" nowrap id="QueryStudentCard.operatorname" onClick="talentsort()">姓名</td>
            <td width="10%" align="center" nowrap id="QueryStudentCard.Sex" onClick="talentsort()">性别</td>
            <td width="50%" align="center" nowrap id="QueryStudentCard.WorkingOrgan" onClick="talentsort()">单位</td>
            <td width="15%" align="center" nowrap id="QueryStudentCard.CardID" onClick="talentsort()">卡编号</td>
          </tr>
          <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
          <logic:iterate id="resultset" property="list[@type='QueryStudentCard']">
            <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
						String UserName= talent.core.TalentFunctions.getAvailStr(base.util.TalentContext.getValue(pageContext,"resultset","QueryStudentCard/operatorname"));
						String CardLastSum= talent.core.TalentFunctions.getAvailStr(base.util.TalentContext.getValue(pageContext,"resultset","QueryStudentCard/CardLastSum"));
						String TimeOfIssueCard= talent.core.TalentFunctions.getAvailStr(base.util.TalentContext.getValue(pageContext,"resultset","QueryStudentCard/TimeOfIssueCard"));
						String CardID= talent.core.TalentFunctions.getAvailStr(base.util.TalentContext.getValue(pageContext,"resultset","QueryStudentCard/CardID"));
						com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl bImpl=new com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl();
						TimeOfIssueCard = bImpl.format(TimeOfIssueCard,"yyyy-MM-dd HH:mm:ss");
						java.util.Hashtable h = new java.util.Hashtable();
						h.put("UserName", UserName);
						h.put("CardLastSum", CardLastSum);
						h.put("TimeOfIssueCard", TimeOfIssueCard);
						h.put("CardID", CardID);
						
			       %>
           <tr class="<%=trClass%>" onClick="changeTRBgColor(this)"  >
	            <td nowrap align="center">
	            <html:checkbox name="list[@name='update']/StudentCard/StudentID" id="resultset" property="QueryStudentCard/StudentID" indexed="true" attributes="<%=h%>" />
	            </td>
	        	<td nowrap align="center"><bean:write id="resultset" property="QueryStudentCard/operatorname"/></td>
	            <td nowrap align="center"><dict:write businTypeId="BNDICT_gender" property="QueryStudentCard/Sex" id="resultset"/></td>
	            <td  >&nbsp;<bean:write id="resultset" property="QueryStudentCard/WorkingOrgan"/></td>
	            <td width="10%" align="center"  nowrap>
                 <bean:write id="resultset" property="QueryStudentCard/CardID"/>
          
                 </td>
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