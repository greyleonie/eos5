<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prMeetingManage.mrNoticeList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;办公系统—&gt;会议管理—&gt;会议通知 </td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prMeetingManage.mrNoticeList.do">
		<input type="hidden" name="viewaction" value="oa.prMeetingManage.mrNoticeView.do">
		<input type="hidden" name="addaction" value="oa.prMeetingManage.mrNoticeAdd.do">
		<input type="hidden" name="modifyaction" value="oa.prMeetingManage.mrNoticeModify.do">
		<input type="hidden" name="deleteaction" value="oa.prMeetingManage.mrNoticeDelete.do">
		<html:hidden property="MR_NOTICE/_order/col1/field"/>
		<html:hidden property="MR_NOTICE/_order/col1/asc" />
		
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
	      <html:text property="MR_NOTICE/TOPIC/criteria/value" attributesText='class="input"' size="15"/>
        <html:hidden property="MR_NOTICE/TOPIC/criteria/operator" value="like"/>
        <html:hidden property="MR_NOTICE/TOPIC/criteria/likeRule" value="center"/>
&nbsp;


	  
<input name="B32" type="button" class="button_02" value="查 询" onClick="talentquery()">
<qx:talentButton property="add" type="button" styleClass="button_02" value="新 增" onclick="talentadd()" operation="DX_OASYS_MR_NOTICE.DX_OASYS_MR_NOTICE_ADD" />
<qx:talentButton property="modify" type="button" styleClass="button_02" value="修 改" onclick="talentmodify()" operation="DX_OASYS_MR_NOTICE.DX_OASYS_MR_NOTICE_MODIFY" />
<qx:talentButton property="delete" type="button" styleClass="button_02" value="删 除" onclick="todelete()" operation="DX_OASYS_MR_NOTICE.DX_OASYS_MR_NOTICE_DEL" />
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
            <td width="34%" align="center"  id="MR_NOTICE.TOPIC" onClick="talentsort()">会议主题</td>
            <td width="12%" align="center" nowrap id="MR_NOTICE.MRNAME" onClick="talentsort()">会议地点</td>
            <td width="10%" align="center" nowrap id="MR_NOTICE.ModeratorName" onClick="talentsort()">主持人</td>
            <td width="20%" align="center" nowrap id="MR_NOTICE.STARTDATE" onClick="talentsort()">会议开始时间</td>
            <td width="20%" align="center" nowrap id="MR_NOTICE.ENDDATE" onClick="talentsort()">会议结束时间</td>
            </tr>
          <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
          <logic:iterate id="resultset" property="list[@type='MR_NOTICE']">
            <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
						
						
			       %>
             <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="MR_NOTICE/NOTICEID"/>','true')">
	      
	            <td align="center">
	          
	           <html:checkbox name="list[@name='update']/MR_NOTICE/NOTICEID" id="resultset" property="MR_NOTICE/NOTICEID" indexed="true"  />	                       </td>
	        	<td nowrap align="center"><bean:write id="resultset" property="MR_NOTICE/TOPIC"/></td>
	            <td nowrap align="center"><bean:write  id="resultset" property="MR_NOTICE/MRNAME" /></td>
	            <td nowrap align="center"><bean:write  id="resultset" property="MR_NOTICE/Moderator" formatClass="username" formatType="operatorID" /></td>
	            
	            <td  nowrap align="center"><bean:write id="resultset" property="MR_NOTICE/STARTDATE" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd HH:mm"/></td>
	            <td  nowrap align="center"><bean:write id="resultset" property="MR_NOTICE/ENDDATE" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd HH:mm"/></td>
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
<script>
function todelete(){
    	var frm =document.forms[0];
		
   		if(chechedCount(frm)<1){
    		alert("至少必须选择一行！");
    		return ;
    	}
    	
    	if(confirm("删除会议通知会把该会议纪要一同删掉，是否确定删除指定记录？")==false){
			return ;
		}    	 
    
    	frm.action = frm.elements["deleteaction"].value;
    	frm.submit();
}

</script>