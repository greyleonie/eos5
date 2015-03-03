<%@include file="/internet/common.jsp"%>
<body onload="fillCurrentTime()">
<form method="post"  action="ICCard.prField.classRoomCheckOutDo.do">
<html:hidden property="ClassroomBusinessRec/ID"/>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页 -&gt; 场地管理 -&gt; 客户管理 -&gt; 客户出租 -&gt; 预订结帐</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
	  </td>
    </tr>
  </table>
  <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="5%" align="left" bgcolor="#4A82D1"><img src="image/left_01.gif" width="12" height="23"></td>
      <td width="10%" align="center" bgcolor="#4A82D1" class="textb_wirte">预订信息</td>
      <td width="5%" align="right" bgcolor="#4A82D1"><img src="image/left_02.gif" width="12" height="23"></td>
      <td width="80%" align="right" valign="bottom"><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#4A82D1">
          <tr>
            <td height="4"> </td>
          </tr>
      </table></td>
    </tr>
    
    <tr>
      <td height="2" colspan="4" align="left"> </td>
    </tr>
  </table>
      
      
	  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
        <tr> 
          <td align="right" class="td2" width="20%">使用单位： </td>
          <td class="td1" width="30%" >&nbsp;<bean:write property="ClassroomBusinessRec/UsingOrgan"/> </td> 
          <td align="right" class="td2" width="20%">使用日期： </td> 
          <td class="td1" width="30%">&nbsp;<bean:write property="ClassroomBusinessRec/UsingDate" formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" /> </td>
        </tr>
        <tr> 
          <td align="right" class="td2">联 系 人： </td>
          <td class="td1" >&nbsp;<bean:write property="ClassroomBusinessRec/LinkMan" /></td>
          <td align="right" class="td2">联系电话： </td>
          <td class="td1" >&nbsp;<bean:write property="ClassroomBusinessRec/LinkTel"  /></td>
        </tr>
          <tr> 
          <td align="right" class="td2">用&nbsp;&nbsp;&nbsp; 途： </td>
          <td class="td1" colspan="3">&nbsp;<bean:write  property="ClassroomBusinessRec/Purpose" /></td>
        </tr>
          <tr> 
          <td align="right" class="td2">受 理 人：</td>
          <td class="td1" >&nbsp;<bean:write   property="ClassroomBusinessRec/BookActionMan"/></td>
          <td align="right" class="td2">受理时间： </td>
          <td class="td1" >&nbsp;<bean:write property="ClassroomBusinessRec/SysBookTime"   formatType="yyyy-MM-dd HH:mm:ss" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/></td>
        </tr>
        <tr> 
          <td align="right" class="td2">预存金额： </td>
          <td class="td1" >&nbsp;<bean:write property="ClassroomBusinessRec/PreWorth"   language="zh" country="CN"/></td>
          <td align="right" class="td2">是否使用空调：</td>
          <td class="td1" >&nbsp;<logic:equal property="ClassroomBusinessRec/IsUseAirConditioning" value="1" >是</logic:equal>
							<logic:equal  property="ClassroomBusinessRec/IsUseAirConditioning" value="0">否</logic:equal></td>
        </tr>
      </table>
      <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" >
                <tr class="td_title"> 
                  <td width="20%" align="center" nowrap id="ClassroomBusinessRec.ClassroomBusinessRecName" onClick="talentsort()">时间</td>
                  <td width="20%" align="center" nowrap id="ClassroomBusinessRec.LayerNum" onClick="talentsort()">出租时段</td>
                  <td width="60%" align="center" nowrap id="ClassroomBusinessRec.RoomNum" onClick="talentsort()">课室名称</td>
                </tr>

	<%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
				<logic:iterate id="resultset" property="list[@type='UsingClassroomLogs']">
					<%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
                <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" > 
				  <html:hidden id="resultset" name="list[@type='UsingClassroomLogs']/UsingClassroomLogs/UsingClassroomLogsID" property="UsingClassroomLogs/UsingClassroomLogsID" indexed="true"/>
                  <td >&nbsp;<bean:write id="resultset"  property="UsingClassroomLogs/UsingDate"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                  <td >&nbsp;<logic:equal id="resultset" property="UsingClassroomLogs/UsingNoon" value="0"> 上午</logic:equal>
                  <logic:equal id="resultset" property="UsingClassroomLogs/UsingNoon" value="1"> 下午</logic:equal>
                  <logic:equal id="resultset" property="UsingClassroomLogs/UsingNoon" value="2"> 晚上</logic:equal>
                  </td>
                  <td >&nbsp;<bean:write id="resultset"  property="UsingClassroomLogs/RoomName"/></td>
                </tr>
				</logic:iterate>

				
      </table> 
      
      
      
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="5%" align="left" bgcolor="#4A82D1"><img src="image/left_01.gif" width="12" height="23"></td>
      <td width="10%" align="center" bgcolor="#4A82D1" class="textb_wirte">结帐信息</td>
      <td width="5%" align="right" bgcolor="#4A82D1"><img src="image/left_02.gif" width="12" height="23"></td>
      <td width="80%" align="right" valign="bottom"><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#4A82D1">
          <tr>
            <td height="4"> </td>
          </tr>
      </table></td>
    </tr>
    
    <tr>
      <td height="2" colspan="4" align="left"> </td>
    </tr>
  </table>
          
	  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
        <tr> 
          <td align="right" class="td2">帐受理人： </td>
          <td class="td1" ><input type="text"  name="ClassroomBusinessRec/CheckOutMan" value='<bean:write property="SessionEntity/userID" formatClass="username" formatType="userid"/>' maxlength="50"   class="input" size="10"  ValidateType="notempty" Msg="受理人不能为空"/> <span class="text_red">*</span> </td> 
          <td align="right" class="td2">结帐日期： </td> 
          <td class="td1" ><html:text property="ClassroomBusinessRec/CheckOutDate" attributesText='class="input" size="10"  ValidateType="notempty" Msg="使用日期不能为空"' readonly="true"/> <span class="text_red">*</span>
          	    <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["ClassroomBusinessRec/UsingDate"],"yyyy-MM-dd")></td>
        </tr>
        <tr> 
          <td align="right" class="td2">应付金额： </td>
           <td class="td1" ><html:text property="ClassroomBusinessRec/Worth"   attributesText='class="input" size="10" ValidateType="money" Msg="应付金额必须为数字"'/>元</td>
           <td align="right" class="td2">实付金额： </td>
          <td class="td1" ><html:text property="ClassroomBusinessRec/RealWorth"   attributesText='class="input" size="10" ValidateType="money" Msg="实付金额必须为数字"'/>元</td>
        </tr>
        <tr> 
           <td align="right" class="td2">折扣标准： </td>
          <td class="td1" ><html:text property="ClassroomBusinessRec/CutDownStd"   onkeyup="doCutDown()" attributesText='class="input" size="10" '/>（例如：0.9）</td>
          <td align="right" class="td2">批准人： </td>
          <td class="td1" ><input type="text"  name="ClassroomBusinessRec/AuthorizeMan"    maxlength="50"   class="input" size="10" /></td>
        </tr>
      </table>  
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="保 存" onClick="save()">
              <input name="Submit2" type="button" class="button_02" value="关 闭" onClick="window.close()"></td>
            </tr>
          </table>
          </td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
  </form>
  </body>
  <script>
//validater函数功能
//用法:ValidateType="alphanumeric,email",Msg="必须是字母数字;邮件"
//验证类型有:url,postalcode,phone,money,int,notempty,email,numeric
//function validater(frmObj)
 function save(){
	var frm = document.forms[0];
	
	if(parseInt(frm["ClassroomBusinessRec/CutDownStd"].value)<1&&frm["ClassroomBusinessRec/AuthorizeMan"].value==""){
  		alert("请输入折扣批准人！");	
  		return;
  	} 
  
	if (validater(frm)){
		frm .submit();
	}
}
 
  
  
  function doCutDown(){
  	var form = document.forms[0];
  	var worth = form["ClassroomBusinessRec/Worth"].value;
  	try{
  		if(!isNaN(parseFloat(form["ClassroomBusinessRec/CutDownStd"].value))){
  			var cutdown = parseFloat(form["ClassroomBusinessRec/CutDownStd"].value);
  			worth *= cutdown;
  		}else{
			form["ClassroomBusinessRec/CutDownStd"].value = "1.0";
  		}  		
  	}catch(exception){}
  	
  	form["ClassroomBusinessRec/RealWorth"].value = worth;
  }
	
	
	function  fillCurrentTime(){
		var curTime = new Date();
		var curDateStr = "";
		var curTimeStr = "";
		var form = document.forms[0];
		var datetime = form["ClassroomBusinessRec/CheckOutDate"].value;
		if(datetime==""){
			//设置为当前时间
             var month = curTime.getMonth()+1;
			if (month<10){
					month = "0"+month;
			}
			var curDateOfMonth = curTime.getDate();
			if (curDateOfMonth<10){
				curDateOfMonth = "0"+curDateOfMonth;
			}
			curDateStr = curTime.getFullYear()+"-"+month+"-"+curDateOfMonth;

			var hours = curTime.getHours();
            if (hours<10){
				hours = "0"+hours;
			}
			var minutes = curTime.getMinutes();
			if(minutes<10){
				minutes = "0"+minutes;
			}
			var second = curTime.getSeconds();
			if(second<10){
				second ="0"+second;
			}
			curTimeStr =curDateStr+" "+ hours+":"+minutes+":"+second;
			form["ClassroomBusinessRec/CheckOutDate"].value = curDateStr;
			}
		}
  </script>
  