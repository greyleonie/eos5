<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prMeetingManage.mrNoticeList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;办公系统—&gt;会议管理—&gt;会议纪要 </td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prMeetingManage.mrSummaryList.do">
		<input type="hidden" name="viewaction" value="oa.prMeetingManage.mrSummaryView.do">
		<input type="hidden" name="addaction" value="oa.prMeetingManage.mrSummaryAdd.do">
		<input type="hidden" name="modifyaction" value="oa.prMeetingManage.mrSummaryModify.do">
		<input type="hidden" name="deleteaction" value="oa.prMeetingManage.mrSummaryDelete.do">
		<html:hidden property="QueryMR_SUMMARY/_order/col1/field"/>
		<html:hidden property="QueryMR_SUMMARY/_order/col1/asc" />
		
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
	    <td height="30" class="text">会议主题：
	      <html:text property="QueryMR_SUMMARY/TOPIC/criteria/value" attributesText='class="input"' size="15"/>
        <html:hidden property="QueryMR_SUMMARY/TOPIC/criteria/operator" value="like"/>
        <html:hidden property="QueryMR_SUMMARY/TOPIC/criteria/likeRule" value="center"/>
&nbsp;


	  
<input name="B32" type="button" class="button_02" value="查 询" onClick="talentquery()">
<qx:talentButton property="delete" type="button" styleClass="button_02" value="编 辑" onclick="toedit()"/>
<input name="view" type="button" class="button_02" value="查 看" onClick="talentview()">
<input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
服务端排序：
<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""></td>
	    </tr>
	  
	  
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text"><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
          <tr class="td_title">
            <td width="4%" align="center" nowrap><input type="checkbox" name="checkbox2" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked="">            </td>
            <td width="30%" align="center" nowrap id="QueryMR_SUMMARY.TOPIC" onClick="talentsort()">会议主题</td>
            <td width="10%" align="center" nowrap id="QueryMR_SUMMARY.ModeratorName" onClick="talentsort()">主持人</td>
            <td width="18%" align="center" nowrap id="QueryMR_SUMMARY.STARTDATE" onClick="talentsort()">会议开始时间</td>
            <td width="18%" align="center" nowrap id="QueryMR_SUMMARY.ENDDATE" onClick="talentsort()">会议结束时间</td>
            <td width="10%" align="center" nowrap onClick="talentsort()">已否纪要</td>
          </tr>
          <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
          <logic:iterate id="resultset" property="list[@type='QueryMR_SUMMARY']">
            <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
						
						
			       %>
            <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="QueryMR_SUMMARY/SUMMARYID"/>','true')">
	      		<td align="center">
	          <logic:present id="resultset" property="QueryMR_SUMMARY/SUMMARYID">
				<html:checkbox name="MR_SUMMARY/SUMMARYID" id="resultset" property="QueryMR_SUMMARY/SUMMARYID" attributesText="isNew='false'"/>
				</logic:present>
					<logic:notPresent id="resultset" property="QueryMR_SUMMARY/SUMMARYID">
						<html:checkbox name="MR_SUMMARY/SUMMARYID" id="resultset" property="QueryMR_SUMMARY/NOTICEID" attributesText="isNew='true'"/>
					</logic:notPresent>
	           	                       </td>
	        	
	        	<td  align="center"><bean:write id="resultset" property="QueryMR_SUMMARY/TOPIC"/></td>
	            <td nowrap align="center"><bean:write  id="resultset" property="QueryMR_SUMMARY/ModeratorName" /></td>
	            <td  nowrap align="center"><bean:write id="resultset" property="QueryMR_SUMMARY/STARTDATE" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd HH:mm:ss"/></td>
	            <td  nowrap align="center"><bean:write id="resultset" property="QueryMR_SUMMARY/ENDDATE" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd HH:mm:ss"/></td>
	            <td  nowrap align="center">
					<logic:present id="resultset" property="QueryMR_SUMMARY/SUMMARYID">是</logic:present>
					<logic:notPresent id="resultset" property="QueryMR_SUMMARY/SUMMARYID">
					<font color="red">否</font>
					</logic:notPresent>
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
<script type="text/javascript">
	function toadd(fid){
		var frm =document.forms[0];
		frm.action = frm.addaction.value+"?fid="+fid;
		frm.submit();
	
	}
	
	function tomodify(fid){
		var frm =document.forms[0];
		frm.action = frm.modifyaction.value+"?fid="+fid;
		frm.submit();
	
	}
	
	function toedit() {
	   var fid = '';
	   var flag = '';
	   var selCount = 0;
	   var frm =document.forms[0];
	   var boxes = document.getElementsByName("MR_SUMMARY/SUMMARYID");
	   
	   for (var i=0;i<boxes.length;i++) {
	       if (boxes[i].checked) {
	          fid = boxes[i].value;
	          flag = boxes[i].isNew;
	          selCount++;
	       }
	   }
	   
	   if (selCount < 1) alert("请至少选择一条记录进行编辑！");
	   else if (selCount > 1) alert("请至多选择一条记录进行编辑！");
	   else {
	      if (flag=='false') {
	         frm.action = frm.modifyaction.value+"?fid="+fid;
	         frm.submit();
	      } else {
	         frm.action = frm.addaction.value+"?fid="+fid;
		     frm.submit();
	      }
	   }
	}
</script>