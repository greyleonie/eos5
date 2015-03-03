<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prAffair.workArrangeModifyDo.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;办公系统—&gt;公共事务—&gt;工作安排—&gt;分派工作安排—&gt;工作安排回复</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prAffair.workArrangeList.do">
		<input type="hidden" name="addaction" value="oa.prAffair.workArrangeAdd.do">
		<input type="hidden" name="modifyaction" value="oa.prAffair.workArrangeModify.do">
		<input type="hidden" name="deleteaction" value="oa.prAffair.workArrangeDelete.do">
		<input type="hidden" name="viewaction" value="oa.prAffair.workArrangeView.do">
		<input type="hidden" name="replayviewaction" value="oa.prAffair.workArrangeReplayView.do">
		
		<html:hidden property="WorkArrangeReplay/_order/col1/field"/>
		<html:hidden property="WorkArrangeReplay/_order/col1/desc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />

	  </td>
    </tr>
  </table>


<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
 
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
                  <td width="15%" align="center" nowrap id="WorkArrange.CALENDAR" onClick="talentsort()">回复人</td>
                  <td width="12%" align="center" nowrap id="WorkArrange.BeArrangedIDs" onClick="talentsort()">回复时间</td>
                  <td width="68%" align="center" nowrap id="WorkArrange.TASKSUM" onClick="talentsort()">回复内容</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='WorkArrangeReplay']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="WorkArrangeReplay/ReplayID"/>','true')">  
                <td align="center"> 
					<logic:present  id="resultset" property="WorkArrangeReplay/ReplayID"> 
                  		<html:checkbox id="resultset" name="list[@name='update']/WorkArrangeReplay/ReplayID" property="WorkArrangeReplay/ReplayID" indexed="true"/> 
                  	</logic:present> 
				</td>
				<td nowrap align="center"><bean:write id="resultset" property="WorkArrangeReplay/USERIDName"/></td>
                <td nowrap align="center"><bean:write id="resultset" property="WorkArrangeReplay/ReplyTime"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="WorkArrangeReplay/Reply"/></td>
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
      <tr>
        <td height="8"> </td>
      </tr>
      <tr id="replayinput" style="display:none">
        <td height="100" align="center" class="td1">
        <html:hidden property="WorkArrange/ArrangeID"/>
        <html:textarea property="WorkArrange/Reply" attributesText='class="input" cols="70" rows="6" ValidateType="notempty" Msg="回复内容不能为空"'/>
        </td>
      </tr>
	  <tr>
	  	<td class="text" align="center">
	  	        <span id="replay"><input name="button"  type="button" class="button_02" value="回　复" onClick="setDisplay()"></span>&nbsp;
				<input name="Submit2" type="button" class="button_02" value="返 回" onClick="javascript:history.go(-1)">
				
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