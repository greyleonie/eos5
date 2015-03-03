<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="teachWorkManage.prNetCenter.acceptArrangeReplayDo.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;网络中心—&gt;中心工作日志—&gt;分派工作安排—&gt;工作安排回复</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="teachWorkManage.prNetCenter.workArrangeList.do">
		<input type="hidden" name="addaction" value="teachWorkManage.prNetCenter.workArrangeAdd.do">
		<input type="hidden" name="modifyaction" value="teachWorkManage.prNetCenter.workArrangeModify.do">
		<input type="hidden" name="deleteaction" value="teachWorkManage.prNetCenter.workArrangeDelete.do">
		<input type="hidden" name="viewaction" value="teachWorkManage.prNetCenter.workArrangeView.do">
		<input type="hidden" name="replayviewaction" value="teachWorkManage.prNetCenter.workArrangeReplayView.do">
		
		<html:hidden property="CenterWorkReply/_order/col1/field"/>
		<html:hidden property="CenterWorkReply/_order/col1/asc" />
		
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
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="5%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                  <td width="15%" align="center" nowrap id="CenterWorkReply.USERID" onClick="talentsort()">回复人</td>
                  <td width="15%" align="center" nowrap id="CenterWorkReply.TOUSERID" onClick="talentsort()">接收人</td>
                  <td width="12%" align="center" nowrap id="CenterWorkReply.ReplyTime" onClick="talentsort()">回复时间</td>
                  <td width="68%" align="center" nowrap id="CenterWorkReply.Content" onClick="talentsort()">回复内容</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='CenterWorkReply']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="WorkArrangeReplay/ReplayID"/>','true')">  
                <td align="center"> 
					<logic:present  id="resultset" property="CenterWorkReply/ReplayID"> 
                  		<html:checkbox id="resultset" name="list[@name='update']/CenterWorkReply/ReplayID" property="CenterWorkReply/ReplayID" indexed="true"/> 
                  	</logic:present> 
				</td>
				<td nowrap align="center"><bean:write id="resultset" property="CenterWorkReply/UserIDName"/></td>
				<td nowrap align="center"><bean:write id="resultset" property="CenterWorkReply/ToUserIDName"/></td>
                <td nowrap align="center"><bean:write id="resultset" property="CenterWorkReply/ReplyTime"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="CenterWorkReply/Content"/></td>
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
      <html:hidden property="fid"/>
      <html:hidden property="CenterWorkPlan/WorkID" />
      <html:hidden name="type" value="1"/>
      <html:hidden name="CenterWorkReply/PlanID" property="CenterWorkPlan/WorkID"/>
      <html:hidden name="CenterWorkReply/UserID" property="CenterWorkPlan/UserID"/>
      <tr id="replayinput" style="display:none">
        <td height="8">
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
        <tr  onClick="changeTRBgColor(this)">
            <td width="15%" height="30" align="right" class="td2">完成情况：</td>
            <td width="85%" class="td1">&nbsp;
            <html:radio property="CenterWorkPlan/Status" value="0"/>待修&nbsp;&nbsp;
            <html:radio property="CenterWorkPlan/Status" value="1"/>在修&nbsp;&nbsp;
            <html:radio property="CenterWorkPlan/Status" value="2"/>完成&nbsp;&nbsp;
            </td>
        </tr>
        <tr>
        <td height="30" width="15%" align="right" class="td2">选择回复人 ：</td>
        <td height="30" width="85%" class="td1">&nbsp;&nbsp;
        <SELECT name="CenterWorkReply/ToUserID">
        <%
        String id = base.util.TalentContext.getValue(pageContext,null,"CenterWorkPlan/Director");
        String name = base.util.TalentContext.getValue(pageContext,null,"CenterWorkPlan/DirectorName");
        String[] ids = id.split(",");
        String[] names = name.split(",");
       for (int i=0;i<ids.length;i++) {
        %>
        <OPTION value="<%=ids[i]%>"><%=names[i]%></OPTION>
        <%
        }
        %>
        </SELECT>
        </td>
      </tr>
      <tr>
        <td height="30" width="15%" align="right" class="td2">回复内容 ：</td>
        <td height="100" width="85%" align="left" class="td1">&nbsp;&nbsp;
        <html:textarea property="CenterWorkReply/Content" attributesText='class="input" cols="70" rows="6" ValidateType="notempty" Msg="回复内容不能为空"'/>
        </td>
      </tr>
      </table>
      </td>
      </tr>
	  <tr>
	  	<td class="text" align="center">
	  	        <span id="replay"><input name="button"  type="button" class="button_02" value="回　复" onClick="setDisplay()"></span>&nbsp;
				<input name="Submit2" type="button" class="button_02" value="返 回" onClick="location.href='teachWorkManage.prNetCenter.workArrangeList.do'">
				
		</td>
	  <tr>
        <td height="8"> </td>
      </tr>
    </table>    </td>
  </tr>
</table>
</form>
</body>
<script>
  function setDisplay() {
	if(document.getElementById("replayinput").style.display == 'none') {
		document.getElementById("replayinput").style.display = '';
		document.getElementById("replay").innerHTML = '<input name="button"  type="button" class="button_02" value="保　存" onClick="save()">';

	} else {
		//document.getElementById("replayinput").style.display = 'none';
		//document.getElementById("replay").value = '回　复';
	}
	
  }
  
   function save() {
  	var frm = document.forms[0];
  	
	if(validater(frm)) frm.submit();
  
  }
</script>