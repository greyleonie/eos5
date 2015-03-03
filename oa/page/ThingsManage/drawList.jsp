<%@include file="/internet/common.jsp"%>
 <logic:present property="Msg">
 <script>
 alert('<bean:write property="Msg"/>');
 </script>
  </logic:present>
<body>
<form method="post" action="oa.prThingsManage.drawList.do" name="opeForm">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
 			<td class="text_wirte">首页—&gt;办公系统—&gt;用品管理—&gt;<span id="printTable">用品发放列表</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prThingsManage.drawList.do">
		<input type="hidden" name="addaction" value="oa.prThingsManage.drawAdd.do">
		<input type="hidden" name="modifyaction" value="oa.prThingsManage.drawModify.do">
		<input type="hidden" name="deleteaction" value="oa.prThingsManage.drawDelete.do">
		<input type="hidden" name="viewaction" value="oa.prThingsManage.drawView.do">
		
		
		<html:hidden property="COMM_DRAWVIEW/_order/col1/field"/>
		<html:hidden property="COMM_DRAWVIEW/_order/col1/asc" />
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
				<a title="发放单编号,领用部门，领用人,用品名称,操作员 ">关键字：</a>
				<html:text property="COMM_DRAWVIEW/searchText" attributesText='class="input" size="30"'/>
				<html:hidden property="COMM_DRAWVIEW/searchField" value="DRAWCODE,BRANCHNAME,PROPOSERNAME,ZCNC,OPERATORNAME"/>
			      发放日期：从
            	<html:text property="COMM_DRAWVIEW/DRAWDATE/criteria/min" attributesText='class="input" size="10"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["COMM_DRAWVIEW/DRAWDATE/criteria/min"],"yyyy-MM-dd")> 
           		到
           		<html:text property="COMM_DRAWVIEW/DRAWDATE/criteria/max" attributesText='class="input" size="10"' readonly="true"/>
          	    <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["COMM_DRAWVIEW/DRAWDATE/criteria/max"],"yyyy-MM-dd")>
			    <input type="hidden" name="COMM_DRAWVIEW/DRAWDATE/criteria/criteriaPattern" value="yyyy-MM-dd"/>
			    <input type="hidden" name="COMM_DRAWVIEW/DRAWDATE/criteria/operator" value="between"/> 	<br/>
			    <input name="query" type="button" class="button_02" value="查 询" onClick="talentquery()">
                <input name="modifyandsave" type="button" class="button_02" value="修 改" onClick="talentmodify()">
              	<input name="delete" type="button" class="button_02" value="删 除" onClick="talentdelete()">
              	<input name="view" type="button" class="button_02" value="查 看" onClick="talentview()">
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text" >
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="3%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                  <td width="10%" align="center" nowrap id="COMM_DRAWVIEW.DRAWCODE" onClick="talentsort()">发放单编号</td>
                  <td width="10%" align="center" nowrap id="COMM_DRAWVIEW.DRAWDATE" onClick="talentsort()">发放日期</td>
                  <td width="30%" align="center" nowrap id="COMM_DRAWVIEW.ZCNC" onClick="talentsort()">用品名称</td>
                  <td width="10%" align="center" nowrap id="COMM_DRAWVIEW.BRANCHNAME" onClick="talentsort()">领用单位</td>
                  <td width="10%" align="center" nowrap id="COMM_DRAWVIEW.PROPOSERNAME" onClick="talentsort()">领用人</td>
                  <td width="10%" align="center" nowrap id="COMM_DRAWVIEW.OPERATORNAME" onClick="talentsort()">操作员</td>
                  <td width="17%" align="center" nowrap id="COMM_DRAWVIEW.REMARK" onClick="talentsort()">备 注</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='COMM_DRAWVIEW']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)"  onDblClick="talentviewf('<bean:write id="resultset" property="COMM_DRAWVIEW/DRAWID"/>','true')">  
                <td align="center"> 
					<logic:present  id="resultset" property="COMM_DRAWVIEW/DRAWID"> 
                  		<html:checkbox id="resultset" name="list[@name='update']/COMM_DRAWVIEW/DRAWID" property="COMM_DRAWVIEW/DRAWID" indexed="true"/> 
                  	</logic:present> 
				</td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="COMM_DRAWVIEW/DRAWCODE"/></td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="COMM_DRAWVIEW/DRAWDATE"  formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/></td>
                <td nowrap  title='<bean:write id="resultset" property="COMM_DRAWVIEW/ZCNC"/>' >&nbsp;<bean:write id="resultset" property="COMM_DRAWVIEW/ZCNC" maxLength="30"/></td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="COMM_DRAWVIEW/BRANCHNAME"/></td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="COMM_DRAWVIEW/PROPOSERNAME"/></td>
 				<td nowrap >&nbsp;<bean:write id="resultset" property="COMM_DRAWVIEW/OPERATORNAME"/></td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="COMM_DRAWVIEW/REMARK" /></td>
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
<input type="hidden" name="title" value="用品发放列表">
<input type="hidden" name="xmlfcc">
</form>
</body>
 <script>
	loadOrderImg(document.forms[0],'COMM_DRAWVIEW');
</script>