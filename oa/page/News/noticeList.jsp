<%@include file="/internet/common.jsp"%>

<%
String ret=base.util.TalentContext.getValue(pageContext,null,"ret");
String column =base.util.TalentContext.getValue(pageContext,null,"NewsOrg/Columns/criteria/value");
if (column == null) column = base.util.TalentContext.getValue(pageContext,null,"NewsOrg/Columns");

%>
  <script>
 
  var ret=<%=ret%>;
 
  if(ret=="0"&&ret!=null){
  
   alert("你只能修改和删除你本部门信息！");
 
  }
function talentviewf1(id,authority,pageId) {
	if(authority == "true") {
		var frm =document.forms[0];
		
		
		
	   	frm.action = frm.elements["viewaction"].value;
	   	frm.action += "?fid=" + id;
	   	frm.action +="&pageID="+pageId;
		frm.submit();		
    } 	
}
function talentview1() {

	
		var frm =document.forms[0];
		if(chechedCount(frm)<1){
	    	alert("至少必须选择一行！");
	    	return ;
	    }
		if(chechedCount(frm)>1){
	   		alert("只能选择一行！");
	    	return ;
	   	}
		id = getChechedValue(frm)
		//alert(id)
	   	frm.action = frm.elements["viewaction"].value;
	   	frm.action += "?pageID=1&fid=" + id;
		frm.submit();	
		
   	
}
 
  </script>
   
<body>
<form method="post" action="oa.prNews.noticeList.do?NewsOrg/Columns/criteria/value=<%=column%>">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;办公系统—&gt;校院信息—&gt;<%=column%></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prNews.noticeList.do?NewsOrg/Columns/criteria/value=<%=column%>">
		<input type="hidden" name="addaction" value="oa.prNews.noticeAdd.do?NewsOrg/Columns=<%=column%>">
		<input type="hidden" name="modifyaction" value="oa.prNews.noticeModify.do">
		<input type="hidden" name="deleteaction" value="oa.prNews.noticeDelete.do?NewsOrg/Columns/criteria/value=<%=column%>">
		<input type="hidden" name="viewaction" value="oa.prNews.noticeView.do">
		
		<html:hidden property="NewsOrg/_order/col1/field"/>
		<html:hidden property="NewsOrg/_order/col1/desc" />
		<html:hidden property="NewsOrg/Columns/criteria/value" value="<%=column%>" />
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
	  	<td class="text">
	  	
	  	<logic:equal property="NewsOrg/Columns/criteria/value" value="校园新闻">
	  	
	  	<qx:talentButton property="add" type="button" styleClass="button_02" value="新增"  onclick="talentadd()"    operation="DX_OASYS_INFO_NEWS.DX_OASYS_INFO_NEWS_Add"/>
		<qx:talentButton property="modify" type="button" styleClass="button_02" value="修改"  onclick="talentmodify()" operation="DX_OASYS_INFO_NEWS.DX_OASYS_INFO_NEWS_Modify"/>
        <qx:talentButton property="delete" type="button" styleClass="button_02" value="删除"  onclick="talentdelete()" operation="DX_OASYS_INFO_NEWS.DX_OASYS_INFO_NEWS_Delete"/>
		</logic:equal>
		<logic:equal property="NewsOrg/Columns/criteria/value" value="校院通知">
	  	<qx:talentButton property="add" type="button" styleClass="button_02" value="新增"  onclick="talentadd()"    operation="DX_OASYS_INFO_NOTICE.DX_OASYS_INFO_NOTICE_Add"/>
		<qx:talentButton property="modify" type="button" styleClass="button_02" value="修改"  onclick="talentmodify()" operation="DX_OASYS_INFO_NOTICE.DX_OASYS_INFO_NOTICE_Modify"/>
        <qx:talentButton property="delete" type="button" styleClass="button_02" value="删除"  onclick="talentdelete()" operation="DX_OASYS_INFO_NOTICE.DX_OASYS_INFO_NOTICE_Delete"/>
		</logic:equal>
		<logic:equal property="NewsOrg/Columns/criteria/value" value="会议公告">
	  	<qx:talentButton property="add" type="button" styleClass="button_02" value="新增"  onclick="talentadd()"    operation="DX_OASYS_INFO_MEETING.DX_OASYS_INFO_MEETING_Add"/>
		<qx:talentButton property="modify" type="button" styleClass="button_02" value="修改"  onclick="talentmodify()" operation="DX_OASYS_INFO_MEETING.DX_OASYS_INFO_MEETING_Modify"/>
        <qx:talentButton property="delete" type="button" styleClass="button_02" value="删除"  onclick="talentdelete()" operation="DX_OASYS_INFO_MEETING.DX_OASYS_INFO_MEETING_Delete"/>
		</logic:equal>
		<logic:equal property="NewsOrg/Columns/criteria/value" value="部门公告">
	  	<qx:talentButton property="add" type="button" styleClass="button_02" value="新增"  onclick="talentadd()"    operation="DX_OASYS_INFO_DEP.DX_OASYS_INFO_DEP_Add"/>
		<qx:talentButton property="modify" type="button" styleClass="button_02" value="修改"  onclick="talentmodify()" operation="DX_OASYS_INFO_DEP.DX_OASYS_INFO_DEP_Modify"/>
        <qx:talentButton property="delete" type="button" styleClass="button_02" value="删除"  onclick="talentdelete()" operation="DX_OASYS_INFO_DEP.DX_OASYS_INFO_DEP_Delete"/>
		</logic:equal>
				<input name="view" type="button" class="button_02" value="查 看" onClick="talentview1()">

		</td>
	  </tr>
      <tr>
        <td height="8"> </td>
      </tr>
	  <tr>
        <td class="text">
			<a title="标题">关键字：</a>
			<html:text property="NewsOrg/searchText" attributesText='class="input" size="30"'/>
			<html:hidden property="NewsOrg/searchField" value="Title"/>
			<input name="query" type="button" class="button_02" value="查询" onClick="doQuery()">
		</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="5%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                  <td width="50%" align="center" nowrap id="NewsOrg.Title" onClick="talentsort()">标题</td>
                  <td width="15%" align="center" nowrap id="NewsOrg.PublishDate" onClick="talentsort()">创建时间</td>
                  <!--<td width="15%" align="center" nowrap id="NewsOrg.Publisher" onClick="talentsort()">发表人</td>
                 --><td width="15%" align="center" nowrap id="NewsOrg.Department" onClick="talentsort()">部门</td>
                  
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='NewsOrg']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf1('<bean:write id="resultset" property="NewsOrg/NewsID"/>','true','1')">  
                <td align="center"> 
					<logic:present  id="resultset" property="NewsOrg/NewsID"> 
                  		<html:checkbox id="resultset" name="list[@name='update']/NewsOrg/NewsID" property="NewsOrg/NewsID" indexed="true"/> 
                  	</logic:present> 
				</td>
				 <td nowrap>&nbsp;<bean:write id="resultset" property="NewsOrg/Title"/></td>
				<td nowrap align="center"><bean:write id="resultset" property="NewsOrg/PublishDate"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
				<!--<td nowrap align="center"><logic:equal  property="NewsOrg/Department" value="SessionEntity/orgID">&nbsp;<bean:write id="resultset" property="NewsOrg/PublisherName"/></logic:equal>
				</td>
				--><!--
                <td nowrap align="center">&nbsp;<bean:write id="resultset" property="NewsOrg/PublisherName"/></td>
                --><td nowrap align="center">&nbsp;<bean:write id="resultset" property="NewsOrg/departmentName"/></td>
               
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
<SCRIPT>
	function doQuery(){
		document.forms[0].submit();
	}
</SCRIPT>

</body>