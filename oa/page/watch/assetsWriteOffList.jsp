<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prWatch.assetsWriteOffList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">办公系统—&gt;流程监控—&gt;<span  id="printTable">资产报废申请</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prWatch.assetsWriteOffList.do">
		<input type="hidden" name="addaction" value="">
		<input type="hidden" name="modifyaction" value="">
		<input type="hidden" name="deleteaction" value="oa.prAssetsManage.writeOffDelete.do">
		<input type="hidden" name="viewaction" value="oa.prAssetsManage.writeOffView.do">
		<html:hidden  property="CAPT_WRITEOFFVIEW/_order/col1/field"/>
		<html:hidden  property="CAPT_WRITEOFFVIEW/_order/col1/asc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		<html:hidden property="temptype" />	
	  </td>
    </tr>
  </table>


<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
      
	  <tr>
            <td height="30" class="text">
					<a title="申请单编号,申请部门，申请人,用品名称 ">关键字：</a>
				<html:text property="CAPT_WRITEOFFVIEW/searchText" attributesText='class="input" size="30"'/>
				<html:hidden property="CAPT_WRITEOFFVIEW/searchField" value="WRITEOFFCODE,DepName,RequestName,ZCNC"/>
				
					 
				申请日期： 从<html:text property="CAPT_WRITEOFFVIEW/WRITEOFFDATE/criteria/min" attributesText='class="input" size="10"' readonly="true"/>
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["CAPT_WRITEOFFVIEW/WRITEOFFDATE/criteria/min"],"yyyy-MM-dd")>
           到 <html:text property="CAPT_WRITEOFFVIEW/WRITEOFFDATE/criteria/max" attributesText='class="input" size="10"' readonly="true"/>
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["CAPT_WRITEOFFVIEW/WRITEOFFDATE/criteria/max"],"yyyy-MM-dd")>
			<html:hidden property="CAPT_WRITEOFFVIEW/WRITEOFFDATE/criteria/operator" value="between" />	
			<html:hidden property="CAPT_WRITEOFFVIEW/WRITEOFFDATE/criteria/criteriaPattern" value="yyyy-MM-dd" />	
				
			    <input name="query" type="button" class="button_02" value="查 询" onClick="search()">
			    服务端排序：<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""> <br/>
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
		<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="3%" align="center" > <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked="">                  </td>
               	  <td width="10%" align="center" nowrap id="CAPT_WRITEOFFVIEW.WRITEOFFCODE" onClick="talentsort()">申请单编号</td>
                  <td width="10%" align="center" nowrap id="CAPT_WRITEOFFVIEW.RequestName" onClick="talentsort()">申请人</td>
                  <td width="10%" align="center" nowrap id="CAPT_WRITEOFFVIEW.DepName" onClick="talentsort()">申请部门</td>
                  <td width="10%" align="center" nowrap id="CAPT_WRITEOFFVIEW.WRITEOFFDATE" onClick="talentsort()">申请日期</td>
                  <td width="20%" align="center" nowrap id="CAPT_WRITEOFFVIEW.ZCNC" onClick="talentsort()">用品名称</td>
                  <td width="17%" align="center" >当前操作人</td>
                  <td width="10%" align="center" >当前环节</td>
                  <td width="10%" align="center" >操作</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='CAPT_WRITEOFFVIEW']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="CAPT_WRITEOFFVIEW/WRITEOFFID"/>','true')">  
                <td align="center"> 
					<logic:present  id="resultset" property="CAPT_WRITEOFFVIEW/WRITEOFFID"> 
                  		<html:checkbox id="resultset" name="list[@name='update']/CAPT_WRITEOFFVIEW/WRITEOFFID" property="CAPT_WRITEOFFVIEW/WRITEOFFID" indexed="true"/> 
                  	</logic:present> 
				</td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="CAPT_WRITEOFFVIEW/WRITEOFFCODE"/></td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="CAPT_WRITEOFFVIEW/RequestName"/></td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="CAPT_WRITEOFFVIEW/DepName"/></td>
                 <td nowrap >&nbsp;<bean:write id="resultset" property="CAPT_WRITEOFFVIEW/WRITEOFFDATE" formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/></td>
				<td nowrap title="<bean:write id="resultset" property="CAPT_WRITEOFFVIEW/ZCNC"/>">&nbsp;<bean:write id="resultset" property="CAPT_WRITEOFFVIEW/ZCNC" maxLength="10"/></td>
                
                <td nowrap align="center">
				<fcc:toname dom="resultset" path="CAPT_WRITEOFFVIEW/participant"/>				</td>
                <td nowrap align="center"><bean:write id="resultset" property="CAPT_WRITEOFFVIEW/workItemName"/></td>
                <td nowrap>&nbsp;
                <logic:present id="resultset"  property="CAPT_WRITEOFFVIEW/currentState">
               <logic:notEqual id="resultset"  property="CAPT_WRITEOFFVIEW/currentState" value="">
                <a href="javascript:toWfSupervise('<bean:write id="resultset" property="CAPT_WRITEOFFVIEW/workItemID"/>','<bean:write id="resultset" property="CAPT_WRITEOFFVIEW/participant"/>')">督办</a>
				</logic:notEqual>
                </logic:present>
				<a href="#" onmousedown="getWfLog('<bean:write id="resultset" property="CAPT_WRITEOFFVIEW/processInstID"/>','<bean:write id="resultset" property="CAPT_WRITEOFFVIEW/archiveTitle"/>')">流程日志</a>				</td>
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
    </table>
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>

<script type="text/javascript">
	loadOrderImg(document.forms[0],'CAPT_WRITEOFFVIEW');
	var userID = "<bean:write property="SessionEntity/userID"/>";
	function search() {
	var frm =document.forms[0];
	if(frm.elements["PageCond/begin"] && frm.elements["PageCond/count"] && frm.elements["PageCond/length"]) {
		frm.elements["PageCond/begin"].value=0;
		frm.elements["PageCond/count"].value=-1;
		if(frm.elements["PageCond/talentlength"]) {
			frm.elements["PageCond/length"].value = frm.elements["PageCond/talentlength"].value;
		}else{
			frm.elements["PageCond/length"].value=10;
		}
		if(frm.elements["queryaction"]) {
			frm.action = frm.elements["queryaction"].value;
		}
		frm.submit();
		}
	}
</script>