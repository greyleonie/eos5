<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="studentmanage.prThesis.thesisList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">学员管理—&gt;学员文章管理—&gt;学员文章查询</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="studentmanage.prThesis.thesisList.do">
		<input type="hidden" name="viewaction" value="studentmanage.prThesis.thesisView.do">
		
		<html:hidden property="QueryThesis/_order/col1/field"/>
		<html:hidden property="QueryThesis/_order/col1/asc" />
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
        <td height="8"> </td>
      </tr>
      <tr>
            <td class="text">班　　　级： <html:select property="QueryThesis/ClassID/criteria/value" onchange="talentquery()" attributesText='id="printTable"'> 
              <html:option value="-1">--请选择班级--</html:option> <html:options property="list[@type='studentclass']/Class/ClassID" labelProperty="list[@type='studentclass']/Class/ClassName"/> 
              </html:select> 
			  &nbsp;
			 
			  服务端排序：<input type="checkbox" name="checkbox" onClick="servertoorder()" marked="">			 </td>
      </tr>
	  <tr>
            <td height="30" class="text">
				<a title='关键字可以是"学号、姓名、文章标题、等级、批改教师"' id="keytitle">关键字查询</a>： 
			    <html:text property="QueryThesis/talentSearch" attributesText='class="input"'/>
			    上传时间：<html:text property="QueryThesis/CommitTime/criteria/min" attributesText='class="input" size="14"' readonly="true"/>
            <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["QueryThesis/CommitTime/criteria/min"],"yyyy-MM-dd")>
                至
				<html:text property="QueryThesis/CommitTime/criteria/max" attributesText='class="input" size="14"' readonly="true"/>
            <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["QueryThesis/CommitTime/criteria/max"],"yyyy-MM-dd")>
               <html:hidden property="QueryThesis/CommitTime/criteria/criteriaPattern" value="yyyy-MM-dd"/> 
               <html:hidden property="QueryThesis/CommitTime/criteria/operator" value="between"/> 
			    <input name="query" type="button" class="button_02" value="查 询" onClick="talentquery()">
			    
					</td>
      </tr>
	  <tr>
	    <td height="30" class="text">
	    <input name="view" type="button" class="button_02" value="查 看" onClick="talentview()">
	    		<input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">		</td>
	    </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="3%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked="">                  </td>
                  <td width="9%" align="center" nowrap id="QueryThesis.StudentNO" onClick="talentsort()">学号</td>
                  <td width="9%" align="center" nowrap id="QueryThesis.operatorname" onClick="talentsort()">姓名</td>
                  <td width="36%" align="center" nowrap id="QueryThesis.ThesisTitle" onClick="talentsort()">文章标题</td>
                  <td width="15%" align="center" nowrap id="QueryThesis.TeachingGroupID" onClick="talentsort()">文章类型</td>
                  <td width="11%" align="center" nowrap id="QueryThesis.CommitTime" onClick="talentsort()">上传时间</td>
                  <td width="7%" align="center" nowrap id="QueryThesis.Score" onClick="talentsort()">等级</td>
                  <td width="10%" align="center" nowrap id="QueryThesis.commentTeacher" onClick="talentsort()">批改教师</td>
                </tr>
				<%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
				<logic:iterate id="resultset" property="list[@type='QueryThesis']">
					<%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
                <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="QueryThesis/ThesisID"/>','true')"> 
                  <td align="center">
				  <logic:present  id="resultset" property="QueryThesis/ThesisID">
				  	<html:checkbox id="resultset" name="list[@name='update']/QueryThesis/ThesisID" property="QueryThesis/ThesisID" indexed="true"/>
				  </logic:present>				  </td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryThesis/StudentNO"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryThesis/operatorname" /></td>
                  <td nowrap>&nbsp;
                  <a href='/common/page/viewimgdb/viewFromDB.jsp?table=Thesis&pkn=ThesisID&field=ThesisContent&pkv=<bean:write id="resultset" property="QueryThesis/ThesisID"/>&type=<bean:write id="resultset" property="QueryThesis/ContentType"/>&fileName=<bean:write id="resultset" property="QueryThesis/ThesisTitle" filter="true"/>'>
                  <bean:write id="resultset" property="QueryThesis/ThesisTitle"/>
                  </a>                  </td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryThesis/UnitTitle"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryThesis/CommitTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryThesis/Score"/> </td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryThesis/commentTeacher" />
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
    </table>    </td>
  </tr>
</table>
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>

