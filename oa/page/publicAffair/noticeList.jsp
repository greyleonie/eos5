<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prAffair.noticeList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;办公系统—&gt;公共事务—&gt;公告通知</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prAffair.noticeList.do">
		<input type="hidden" name="addaction" value="oa.prAffair.noticeAdd.do">
		<input type="hidden" name="modifyaction" value="oa.prAffair.noticeModify.do">
		<input type="hidden" name="deleteaction" value="oa.prAffair.noticeDelete.do">
		<input type="hidden" name="viewaction" value="oa.prAffair.noticeView.do">
		
		<html:hidden property="Notice/_order/col1/field"/>
		<html:hidden property="Notice/_order/col1/desc" />
		
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
	  	        <input name="add" type="button" class="button_02" value="新 增" onClick="talentadd()">
				<input name="modify" type="button" class="button_02" value="修 改" onClick="talentmodify()">
				<input name="view" type="button" class="button_02" value="查 看" onClick="talentview()">
              	<input name="delete" type="button" class="button_02" value="删 除" onClick="talentdelete()">
				
		</td>
	  </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="4%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                  <td width="10%" align="center" nowrap id="Notice.CreateTime" onClick="talentsort()">创建时间</td>
                  <td width="21%" align="center" nowrap id="Notice.ReceiveIDs" onClick="talentsort()">通知人员</td>
                  <td width="32%" align="center" nowrap id="Notice.Title" onClick="talentsort()">通知标题</td>
                  <td width="10%" align="center" nowrap id="Notice.ValidTime" onClick="talentsort()">生效时间</td>
                  <td width="10%" align="center" nowrap id="Notice.InValidTime" onClick="talentsort()">终止时间</td>
                  <td width="7%" align="center" nowrap id="Notice.State" onClick="talentsort()">当前状态</td>
                  <td width="6%" align="center" nowrap id="Notice.ViewNumber" onClick="talentsort()">查阅人数</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='Notice']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="Notice/NoticeID"/>','true')">  
                <td align="center"> 
					<logic:present  id="resultset" property="Notice/NoticeID"> 
                  		<html:checkbox id="resultset" name="list[@name='update']/Notice/NoticeID" property="Notice/NoticeID" indexed="true"/> 
                  	</logic:present> 
				</td>
				<td nowrap align="center"><bean:write id="resultset" property="Notice/CreateTime"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                <td nowrap>&nbsp;<span title='<bean:write id="resultset" property="Notice/ReceiveIDsName"/>'><bean:write id="resultset" property="Notice/ReceiveIDsSubName"/></span></td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="Notice/Title"/></td>
                <td nowrap align="center"><bean:write id="resultset" property="Notice/ValidTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
				<td nowrap align="center"><bean:write id="resultset" property="Notice/InValidTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
				<td nowrap align="center">
				<logic:equal id="resultset" property="Notice/Status" value="0">生效</logic:equal>
				<logic:equal id="resultset" property="Notice/Status" value="1">未生效</logic:equal>
				<logic:equal id="resultset" property="Notice/Status" value="2">终止</logic:equal>
				 </td>
				<td nowrap　align="center">
				<logic:equal id="resultset" property="Notice/ReadCount" value="0">&nbsp;</logic:equal>
				<logic:notEqual id="resultset" property="Notice/ReadCount" value="0">
				<span title='<bean:write id="resultset" property="Notice/HaveReadIDsName"/>'>&nbsp;&nbsp;&nbsp;<bean:write id="resultset" property="Notice/ReadCount"/>人</span>
				</logic:notEqual>
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
		  
		  </td>
      </tr>
      <tr>
        <td class="text">&nbsp;</td>
      </tr>
    </table>    </td>
  </tr>
</table>
</form>
</body>