<%@include file="/internet/common.jsp"%>
<logic:equal property="PageCond/count" value="0">
<script>
alert("没有符合查询条件的用品");
</script>
</logic:equal>
<body>
<form>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
 			<td class="text_wirte">首页—&gt;办公系统—&gt;用品管理—&gt;<span id="printTable">用品领用表</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prThingsManage.drawReportList.do">
	
		<html:hidden property="COMM_DRAWSTATIS/_order/col1/field"/>
		<html:hidden property="COMM_DRAWSTATIS/_order/col1/asc" />
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
            <td height="30" class="text">
            	领用部门：<html:select property="COMM_DRAWSTATIS/BRANCH/criteria/value" onchange="talentquery()" > 
              <html:option value="">--请选择--</html:option> <html:options property="list[@type='TeachGroup']/TeachGroup/orgID" labelProperty="list[@type='TeachGroup']/TeachGroup/orgName"/> 
              </html:select> 
              <html:hidden property="COMM_DRAWSTATIS/BRANCH/criteria/operator" value="="/>
				
			    领用时间：从
            	<html:text property="COMM_DRAWSTATIS/DRAWDATE/criteria/min" attributesText='class="input" size="10"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["COMM_DRAWSTATIS/DRAWDATE/criteria/min"],"yyyy-MM-dd")> 
           		到
           		<html:text property="COMM_DRAWSTATIS/DRAWDATE/criteria/max" attributesText='class="input" size="10"' readonly="true"/>
          	    <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["COMM_DRAWSTATIS/DRAWDATE/criteria/max"],"yyyy-MM-dd")>
			    <input type="hidden" name="COMM_DRAWSTATIS/DRAWDATE/criteria/operator" value="between"/>
			    <input type="hidden" name="COMM_DRAWSTATIS/DRAWDATE/criteria/criteriaPattern" value="yyyy-MM-dd"/>
			    <a title="用品名称,规格 ">关键字：</a>
				<html:text property="COMM_DRAWSTATIS/searchText" attributesText='class="input" size="30"'/>
				<html:hidden property="COMM_DRAWSTATIS/searchField" value="COMMNAME,SPECIA"/><br/>
			    <input name="query" type="button" class="button_02" value="统 计" onClick="talentquery()">
				<input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
				
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text" >
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
		<tr class="td_title"> 
				  <td width="10%" align="center" nowrap id="COMM_DRAWSTATIS.DRAWDATE" onClick="talentsort()">领用时间</td>
				  <td width="20%" align="center" nowrap id="COMM_DRAWSTATIS.BRANCHNAME" onClick="talentsort()">领用部门</td>
                  <td width="30%" align="center" nowrap id="COMM_DRAWSTATIS.COMMNAME" onClick="talentsort()">品名</td>   
                  <td width="10%" align="center" nowrap id="COMM_DRAWSTATIS.SPECIA" onClick="talentsort()">规格</td>
                  <td width="10%" align="center" nowrap id="COMM_DRAWSTATIS.UNITNAME" onClick="talentsort()">计量单位</td>
                  <td width="10%" align="center" nowrap id="COMM_DRAWSTATIS.PRICE" onClick="talentsort()">单价（元)</td>
                  <td width="10%" align="center" nowrap id="COMM_DRAWSTATIS.QUANTITY" onClick="talentsort()">数量</td>
                </tr>
                <logic:greaterThan property="PageCond/count" value="0">
                
                <%
		             int count=0;
		             int i=0;
			         String trClass = "result_content"; 
		  
		  		%>
			        <logic:iterate id="resultset" property="list[@type='COMM_DRAWSTATIS']">
			           <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
						i=0;
			       %>
                <tr class="<%=trClass%>" onClick="changeTRBgColor(this)">  
                <td nowrap >&nbsp;<bean:write id="resultset" property="COMM_DRAWSTATIS/DRAWDATE"  formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/></td>
				<td nowrap >&nbsp;<bean:write id="resultset" property="COMM_DRAWSTATIS/BRANCHNAME"/></td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="COMM_DRAWSTATIS/COMMNAME"/></td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="COMM_DRAWSTATIS/SPECIA"/></td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="COMM_DRAWSTATIS/UNITNAME"/></td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="COMM_DRAWSTATIS/PRICE"       language="zh" country="CN"/></td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="COMM_DRAWSTATIS/QUANTITY" /></td>
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
			 </logic:greaterThan>
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
<input type="hidden" name="title" value="用品领用表">
<input type="hidden" name="xmlfcc">
</form>
</body>
<script>
	loadOrderImg(document.forms[0],'COMM_DRAWSTATIS');
</script>