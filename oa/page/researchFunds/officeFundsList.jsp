<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prResearchFunds.officeFundsList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">办公系统—&gt;科研管理—&gt;科研处经费管理</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prResearchFunds.officeFundsList.do">
		<input type="hidden" name="addaction" value="oa.prResearchFunds.officeFundsAdd.do">
		<input type="hidden" name="modifyaction" value="oa.prResearchFunds.officeFundsModify.do">
		<input type="hidden" name="deleteaction" value="oa.prResearchFunds.officeFundsDelete.do">
		<input type="hidden" name="viewaction" value="oa.prResearchFunds.groupFundsView.do">
		<input type="hidden" name="lxaction" value="oa.prResearchFunds.officeFundsLx.do">
		<input type="hidden" name="shenheaction" value="oa.prResearchFunds.officeFundsShenhe.do">
		<input type="hidden" name="guidangaction" value="oa.prResearchFunds.officeFundsGuidang.do">
		<html:hidden property="KetiLxSearch/_order/col1/field" value="tjtime"/>
		<html:hidden property="KetiLxSearch/_order/col1/desc" value="desc"/>
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		
	  </td>
    </tr>
  </table>


<table width="96%"  border="0" align="center" cellpadding="1" cellspacing="2" class="table">
  <tr>
    <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
         <td>
         <table width="100%"  border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#A2C4DC">
         <tr>
            <td height="30" width="10%" class="td2"><a title='课题名称"' id="keytitle">课题名称</a>：</td>
			<td height="30" class="td1"><html:text property="KetiLxSearch/name/criteria/value" attributesText='class="input" size="25"'/></td>
			<td height="30" width="12%" class="td2"><a title='课题序号"' id="keytitle">课题序号</a>：</td>
			<td height="30" class="td1"><html:text property="KetiLxSearch/xuhao/criteria/value" attributesText='class="input" size="25"'/></td>
			<td height="30" width="10%" class="td2"><a title='课题代码"' id="keytitle">课题代码</a>：</td>
			<td height="30" class="td1"><html:text property="KetiLxSearch/daima/criteria/value" attributesText='class="input" size="25"'/></td>
		</tr>
		<tr>
            <td height="30" class="td2"><a title='年份"' id="keytitle">年份</a>：</td>
			<td height="30" class="td1">
               <html:select property="KetiLx/tjtime" style="width:160">
                <script language="javascript">
                var todate = new Date();
                var toyear = todate.getYear();
                document.write("<option value=''>-----请选择年份-----</option>");
                for (var i=0;i<=10;i++) {
                   var year = toyear - i;
                   document.write("<option value='"+ year + "'>" + year + "年度</option>");
                }
                </script>
                </html:select>
            </td>
			<td height="30" class="td2"><a title='课题负责人"' id="keytitle">课题负责人</a>：</td>
			<td height="30" class="td1"><html:text property="KetiLxSearch/fuzeren/criteria/value" attributesText='class="input" size="25"'/></td>
			<td height="30" class="td2"><a title='课题类型"' id="keytitle">课题类型</a>：</td>
			<td height="30" class="td1">
            <html:select property="KetiLxSearch/KetiType/criteria/value" style="width:160">
            <html:option value=''>---请选择课题类型---</html:option>
            <html:option value='国家级课题'>国家级课题</html:option>
            <html:option value='省部级课题'>省部级课题</html:option>
            <html:option value='市级课题'>市级课题</html:option>
            <html:option value='校级课题'>校级课题</html:option>
            <html:option value='其他课题'>其他课题</html:option>
            </html:select>
            </td>
		</tr>
        </table>
	    </td>
        </tr>
        <tr>
        <td align="center" height="25" valign="middle">
	       <input name="query" type="button" class="button_02" value="查 询" onClick="talentquery()">
	    </td>
        </tr>
	  <tr>
	  	<td class="text" height="10">
	  	   <qx:talentButton value="立项登记" styleClass="button_02" type="button" operation="DX_OASYS_RESEARCH_OFFICEFUNDS.DX_OASYS_RESEARCH_OFFICEFUNDS_ADD" onclick="talentadd()" property="add"></qx:talentButton>
           <input name="view" type="button" class="button_02" value="查 看" onClick="talentview()">
           <qx:talentButton value="打 印" styleClass="button_02" type="button" operation="DX_OASYS_RESEARCH_OFFICEFUNDS.DX_OASYS_RESEARCH_OFFICEFUNDS_PRINT" onclick="iePrint()" property="ieprint"></qx:talentButton>
           <qx:talentButton value="导 出" styleClass="button_02" type="button" operation="DX_OASYS_RESEARCH_OFFICEFUNDS.DX_OASYS_RESEARCH_OFFICEFUNDS_EXPORT" onclick="exporttoexcel()" property="export"></qx:talentButton>
           
			<!--<input name="add" type="button" class="button_02" value="立项登记" onClick="talentadd()">
                <input name="view" type="button" class="button_02" value="查 看" onClick="talentview()">
                <input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
                <input name="export" type="button" class="button_02" value="导 出" onclick="exporttoexcel()">-->
				
		</td>
	  </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="5%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                  <td width="5%" align="center" nowrap id="KetiLx.xuhao" onClick="talentsort()">序号</td>
                  <td width="6%" align="center" nowrap id="KetiLx.tjtime" onClick="talentsort()">年份</td>
                  <td width="25%" align="center" nowrap id="KetiLx.name" onClick="talentsort()">课题名称</td>
                  <td width="8%" align="center" nowrap id="KetiLx.daima" onClick="talentsort()">课题代码</td>
                  <td width="10%" align="center" nowrap id="KetiLx.zonge" onClick="talentsort()">拨款总额</td>
                  <td width="10%" align="center" nowrap id="KetiLx.fuzeren" onClick="talentsort()">课题负责人</td>
                  <td width="8%" align="center" nowrap id="KetiLx.feiyongstatus" onClick="talentsort()" >费用状态</td>
				  <td width="8%" align="center" nowrap id="KetiLx.status" onClick="talentsort()" >状态</td>
                  <td width="14%" align="center" >操作</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='KetiLx']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="KetiLx/ketiLxID"/>','true')">  
                <td align="center"> 
					<logic:present  id="resultset" property="KetiLxSearch/ketiLxID"> 
                  		<html:checkbox id="resultset" name="list[@name='update']/KetiLx/ketiLxID" property="KetiLxSearch/ketiLxID" indexed="true"/> 
                  	</logic:present> 
				</td>
				<td nowrap align="center">&nbsp;<bean:write id="resultset" property="KetiLxSearch/xuhao"/></td>
				<td nowrap align="center">&nbsp;<bean:write id="resultset" property="KetiLxSearch/tjtime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy"/></td>
                <td nowrap align="center"><bean:write id="resultset" property="KetiLxSearch/KetiName"/></td>
                <td nowrap align="center"><bean:write id="resultset" property="KetiLxSearch/daima"/></td>
                <td nowrap align="center">&nbsp;<bean:write id="resultset" property="KetiLxSearch/zonge"/></td>
                <td nowrap align="center">&nbsp;<bean:write id="resultset" property="KetiLxSearch/fuzeren"/></td>
				<td align="center">
				<logic:equal id="resultset" property="KetiLxSearch/feiyongstate" value="0">
				已结清
				</logic:equal>
				<logic:equal id="resultset" property="KetiLxSearch/feiyongstate" value="1">
				未结清
				</logic:equal>
                </td>
				<td nowrap align="center">
				<logic:equal id="resultset" property="KetiLxSearch/status" value="0">立项登记</logic:equal>
				<logic:equal id="resultset" property="KetiLxSearch/status" value="1">申请报帐</logic:equal>
				<logic:equal id="resultset" property="KetiLxSearch/status" value="2">审核报帐</logic:equal>
				<logic:equal id="resultset" property="KetiLxSearch/status" value="3">财务报销</logic:equal>
				<logic:equal id="resultset" property="KetiLxSearch/status" value="4">重新报帐</logic:equal>
				<logic:equal id="resultset" property="KetiLxSearch/status" value="5">重审</logic:equal>
				<logic:equal id="resultset" property="KetiLxSearch/status" value="6">进行归档</logic:equal>
				<logic:equal id="resultset" property="KetiLxSearch/status" value="7">归档</logic:equal>
				</td>
                <td align="center">
                <logic:equal id="resultset" property="KetiLxSearch/status" value="0">
                <a href='#' onClick="lixiang('<bean:write id="resultset" property="KetiLxSearch/ketiLxID"/>')">立项</a> 
                <a href='#' onClick="update('<bean:write id="resultset" property="KetiLxSearch/ketiLxID"/>')">修改</a> 
                <a href='#' onClick="deletes('<bean:write id="resultset" property="KetiLxSearch/ketiLxID"/>')">删除</a>
                </logic:equal>
                <logic:equal id="resultset" property="KetiLxSearch/status" value="1">
                <a href='#' onClick="update('<bean:write id="resultset" property="KetiLxSearch/ketiLxID"/>')">修改</a>
                </logic:equal>
                <logic:equal id="resultset" property="KetiLxSearch/status" value="2">
                <a href='#' onClick="shenhe('<bean:write id="resultset" property="KetiLxSearch/ketiLxID"/>')">审核</a> 
                <a href='#' onClick="update('<bean:write id="resultset" property="KetiLxSearch/ketiLxID"/>')">修改</a>  
                </logic:equal>
                <logic:equal id="resultset" property="KetiLxSearch/status" value="5">
                <!--<a href='#' onClick="shenhe('<bean:write id="resultset" property="KetiLxSearch/ketiLxID"/>')">重审</a>-->
                <a href='#' onClick="update('<bean:write id="resultset" property="KetiLxSearch/ketiLxID"/>')">修改</a>  
                </logic:equal>
                <logic:equal id="resultset" property="KetiLxSearch/status" value="6">
                <a href='#' onClick="guidang ('<bean:write id="resultset" property="KetiLxSearch/ketiLxID"/>')">归档</a> 
                </logic:equal>
                </td>
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
		  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="30" align="center">
              <IMG src="/internet/image/research/research11.jpg">
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
	function lixiang(id){
		var frm = document.forms[0];
		frm.action = frm.elements["lxaction"].value;
		frm.action += "?fid=" + id;
   		frm.submit();
	}

	function update(id){
		var frm = document.forms[0];
		frm.action = frm.elements["modifyaction"].value;
		frm.action += "?fid=" + id;
   		frm.submit();
	}
	
	function deletes(id){
		var frm = document.forms[0];
		if(confirm("是否确定删除课题经费立项吗？")==false){
			return ;
		} 
		frm.action = frm.elements["deleteaction"].value;
		frm.action += "?fid=" + id;
   		frm.submit();
	}
	
	function shenhe(id){
		var frm = document.forms[0];
		frm.action = frm.elements["shenheaction"].value;
		frm.action += "?fid=" + id;
   		frm.submit();
	}
	
	function guidang(id){
		var frm = document.forms[0];
		frm.action = frm.elements["guidangaction"].value;
		frm.action += "?fid=" + id;
   		frm.submit();
	}
</script>