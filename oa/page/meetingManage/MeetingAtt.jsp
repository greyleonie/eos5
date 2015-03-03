<%@include file="/internet/common.jsp"%>
<%@page import="java.math.BigDecimal;"%>
<%
	int count=0;
	double precent=0;
	String totle = base.util.TalentContext.getValue(pageContext,null,"totle/entity/totle");
	String rtotle = base.util.TalentContext.getValue(pageContext,null,"totle/entity/rtotle");
	String nrtotle = base.util.TalentContext.getValue(pageContext,null,"totle/entity/nrtotle");
	String ototle = base.util.TalentContext.getValue(pageContext,null,"totle/entity/ototle");
	int totleNum=Integer.parseInt(totle);
	int rtotleNum=Integer.parseInt(rtotle)*100;
	try{
	BigDecimal b1 = new BigDecimal(String.valueOf(rtotleNum));
	BigDecimal b2 = new BigDecimal(String.valueOf(totleNum));
	precent = b1.divide(b2,2,BigDecimal.ROUND_HALF_UP).doubleValue();
	}catch(Exception e){
		
	}
%>
<body>
<form method="post" action="oa.prMeetingManage.prMeetingAtt.do">
   <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;办公系统—&gt;会议统计
            </td></tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		
	  </td>
    </tr>
  </table>
  
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
   
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prMeetingManage.prMeetingAtt.do">
		<input type="hidden" name="applyid" value="<bean:write property="applyid" />">
		
		 </td>
    </tr>
  </table>


<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
            <td class="text">
            姓 名：<html:text  property="name" styleClass="input" size="15"/>
              &nbsp;部门：<html:select property="depid"> 
              <html:option value="-1">--请选择部门--</html:option> <html:options property="list[@type='depList']/entity/orgid" labelProperty="list[@type='depList']/entity/orgname"/> 
              </html:select> 
			  &nbsp;
			  考勤状态：<html:select property="itemid"> 
              <html:option value="-1">--请选择考勤状态--</html:option> 
              <html:option value="1">正常</html:option>
              <html:option value="5">事假</html:option>
              <html:option value="7">缺席</html:option>
              </html:select>  
			  &nbsp;
			  手动考勤：<html:select property="ismanual"> 
              <html:option value="-1">--是否手动考勤--</html:option> 
              <html:option value="0">否</html:option>
              <html:option value="1">是</html:option>
              </html:select> 
              </td>
      </tr>
      <tr>
        <td class="text">
        
        <input name="query" type="button" class="button_02" value="查 询" onClick="toquery()">
        <input name="saveEntity" type="button" class="button_02" value="保存更新" onClick="updateEntity()">
              <input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
              <input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
              <input name="deploy" type="button" class="button_02" value="发布" onclick="deploy()"/>
              <input name="cleanAtt" type="button" class="button_02" value="清空考勤" onclick="cleanA()"/>
        
        
        </td>
      </tr>

       
      <tr>
        <td height="25px" class="td1" valign="middle"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
        
		<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
				<tr>
        			<td colspan="6" height="25px" id="Statistics" class="td1" valign="middle"> </td>
      			</tr>
                <tr class="td_title"> 
                  <td width="15%" align="center" nowrap>姓名</td>
                  <td width="30%" align="center" nowrap>部门</td>
                  <td width="10%" align="center" nowrap>签到时间</td>
                  <td width="10%" align="center" nowrap>考勤状态</td>
                  <td width="10%" align="center" nowrap>备注</td>
                </tr>
				<%
		            String trClass = "result_content";
		  		%>
				<logic:iterate id="resultset" property="list[@type='ConferenceAttLogsList']">
					<%				       
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
                <tr class="<%=trClass%>" onClick="changeTRBgColor(this)"> 
                 <td nowrap align="center"><bean:write id="resultset" property="entity/operatorname" /></td>
                  <td nowrap align="center" ><bean:write id="resultset" property="entity/orgname" /></td>
                  <td nowrap align="center"><bean:write id="resultset" property="entity/HappeningTime"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd hh:mm:ss"/></td>
                  <td nowrap align="center" onDblClick="toEdit('<bean:write id="resultset" property="entity/ConferenceAttLogsID"/>')">
                  	<div style='display: none;' id='<bean:write id="resultset" property="entity/ConferenceAttLogsID"/>Sel'>
                  		  <select id="<bean:write id="resultset" property="entity/ConferenceAttLogsID"/>SelItem" onblur="update('<bean:write id="resultset" property="entity/ConferenceAttLogsID"/>')">
			              <option value="1">正常</option>
			              <option value="5">事假</option>
			              <option value="7">缺席</option>
			              </select>
					</div>
                  	<div id='<bean:write id="resultset" property="entity/ConferenceAttLogsID"/>'><bean:write id="resultset" property="entity/AttendanceItemName" /></div>
                  </td>
                  <td nowrap align="center">
                  	<SCRIPT>
                  		var isManual='<bean:write id="resultset" property="entity/IsManual" />';
                  		if(isManual==''||isManual==0){
                  		}else{
                  			document.write('手动');
                  		}
                  	</SCRIPT>
                  </td>
                  </tr>
				</logic:iterate>
              </table></td>
      </tr>


      <tr>
        <td class="text">
		<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
				<tr><td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px"><input name="back" type="button" class="button_02" value="返 回" onClick="history.back()"></td></tr>
			</table>
</td>
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
<%
//if (count != 0) {
//BigDecimal b1 = new BigDecimal((maxCount * count-truancy-pholiday-leave) * 100);
//BigDecimal b2 = new BigDecimal(maxCount * count);
//precent = b1.divide(b2,2,BigDecimal.ROUND_HALF_UP).doubleValue();
//}
%>
<script>
var i=0;
var j=0;
 document.getElementById('Statistics').innerHTML = "总人数 ：<%=totle%>人，出勤人数 ：<%=rtotle%>人，<font color='green'>事假人数 ：<%=ototle%>人</font>，<font color='red'>缺席人数 ：<%=nrtotle%>人</font>，出勤率为<%=precent%>%。"; 
 function toquery(){
 	var frm =document.forms[0];
 	/*
 	if(frm.elements["QueryKaoqinTotal/ClassID/criteria/value"].value==-1){
 		alert("请选择班级");
 		return;
 	}
 	*/
 	
 	frm.action = frm.elements["queryaction"].value;
 	frm.submit();
 }
 
 function toEdit(id){
 	var id1=id+'';
 	var id2=id+'Sel';
 	document.getElementById(id1).style.display="none";
 	document.getElementById(id2).style.display="block";
 }
 
 function updateEntity(){
 	if(i>0){
 		var frm = document.forms[0];
 		frm.action = 'oa.prMeetingManage.prDoMeetingAtt.do';
 		frm.submit();
 	}else{
 		alert('没有可更新数据!');
 	}
 }
 
 function update(id){
 	var id1=id+'SelItem';
 	var id2=id+'';
 	var id3=id+'Sel';
 	var obj=document.getElementById(id1);
 	var index=document.getElementById(id+'SelItem').selectedIndex;
 	var txt=obj.options[index].text;
 	document.getElementById(id2).style.display="block";
 	document.getElementById(id3).style.display="none";
 	document.getElementById(id2).innerHTML="<font color='red'>"+txt+"</font>";
 	
 	var tempid="updateEntity/entity"+j+"/item";
 	var tempEle=document.getElementById(tempid);
 	var frm = document.forms[0];
 	if(tempEle==null){
 		var newElemnt1 = document.createElement("<input type='hidden' name='updateEntity/entity"+i+"/id' value='" + id2 + "'>");
 		var newElemnt2 = document.createElement("<input type='hidden' name='updateEntity/entity"+i+"/item' value='" + obj.value + "'>");
	    frm.appendChild(newElemnt1);
	    frm.appendChild(newElemnt2);
	    j=i;
	    i++;
 	}else{
 		tempEle.value=obj.value;
 	}

	

	//i++;
 }
 
 function deploy(){
 	var applyid=document.getElementById('applyid').value;
 	var url="oa.prMeetingManage.prMeetingToNews?applyid="+applyid;
 	window.local.href=url;
 }
 
 function cleanA(){
 		var frm = document.forms[0];
 		frm.action = "oa.prMeetingManage.prMeetingCleanAtt.do?applyid="+applyid;
 		frm.submit();
 }
</script>