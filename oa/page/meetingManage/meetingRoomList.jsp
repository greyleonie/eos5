<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prMeetingManage.meetingRoomList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;办公系统—&gt;会议管理—&gt;会议室设置 </td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prMeetingManage.meetingRoomList.do">
		<input type="hidden" name="viewaction" value="oa.prMeetingManage.meetingRoomView.do">
		<input type="hidden" name="addaction" value="oa.prMeetingManage.meetingRoomAdd.do">
		<input type="hidden" name="modifyaction" value="oa.prMeetingManage.meetingRoomModify.do">
		<input type="hidden" name="deleteaction" value="oa.prMeetingManage.meetingRoomDelete.do">
		<html:hidden property="MR_REGISTER/_order/col1/field"/>
		<html:hidden property="MR_REGISTER/_order/col1/asc" />
		
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
	    <td height="30" class="text">会议室名称：
	      <html:text property="MR_REGISTER/MRNAME/criteria/value" attributesText='class="input"' size="15"/>
        <html:hidden property="MR_REGISTER/MRNAME/criteria/operator" value="like"/>
        <html:hidden property="MR_REGISTER/MRNAME/criteria/likeRule" value="center"/>
&nbsp;


	  
<input name="B32" type="button" class="button_02" value="查 询" onClick="talentquery()" >
<qx:talentButton property="add" type="button" styleClass="button_02" value="新 增" onclick="talentadd()" operation="DX_OASYS_MR_MRLIST.DX_OASYS_MR_MRLIST_ADD" />
<qx:talentButton property="modify" type="button" styleClass="button_02" value="修 改" onclick="toModify()" operation="DX_OASYS_MR_MRLIST.DX_OASYS_MR_MRLIST_MODIFY" />
<qx:talentButton property="delete" type="button" styleClass="button_02" value="删 除" onclick="todel()" operation="DX_OASYS_MR_MRLIST.DX_OASYS_MR_MRLIST_DEL" />
<input name="view" type="button" class="button_02" value="查 看" onclick="talentview()">
<input name="ieprint" type="button" class="button_02" value="打 印" onclick="iePrint()">
<input name="export" type="button" class="button_02" value="导 出" onclick="exporttoexcel()">
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
            <td width="14%" align="center" nowrap id="MR_REGISTER.MRNAME" onClick="talentsort()">名称</td>
            <td width="12%" align="center" nowrap id="MR_REGISTER.PERSON" onClick="talentsort()">可容纳人数</td>
            <td width="20%" align="center" nowrap id="MR_REGISTER.Equipment" onClick="talentsort()">设备情况</td>
            <td width="20%" align="center" nowrap id="MR_REGISTER.ADDRESS" onClick="talentsort()">地点</td>
            <td width="20%" align="center" nowrap id="MR_REGISTER.REMARK" onClick="talentsort()">会议室描述</td><!--
            <td width="10%" align="center" nowrap id="MR_REGISTER.STATECODE" onClick="talentsort()">使用状态</td>
            --></tr>
          <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
          <logic:iterate id="resultset" property="list[@type='MR_REGISTER']">
            <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
						
						String ManagerID= talent.core.TalentFunctions.getAvailStr(base.util.TalentContext.getValue(pageContext,"resultset","MR_REGISTER/ManagerID"));
						java.util.Hashtable h = new java.util.Hashtable();
						h.put("ManagerID", ManagerID);
			       %>
            <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="MR_REGISTER/MRCODE"/>','true')">
	            <td align="center">
	          
	           <html:checkbox name="list[@name='update']/MR_REGISTER/MRCODE" id="resultset" property="MR_REGISTER/MRCODE" indexed="true" attributes="<%=h%>" />	                       </td>
	        	<td nowrap align="center"><bean:write id="resultset" property="MR_REGISTER/MRNAME"/></td>
	            <td nowrap align="center"><bean:write  id="resultset" property="MR_REGISTER/PERSON" /></td>
	            <td nowrap align="center"><bean:write  id="resultset" property="MR_REGISTER/Equipment" /></td>
	            <td  nowrap align="center"><bean:write id="resultset" property="MR_REGISTER/ADDRESS" /></td>
	            <td  nowrap align="center"><bean:write id="resultset" property="MR_REGISTER/REMARK" /></td><!--
	            <td  nowrap align="center"><dict:write id="resultset" property="MR_REGISTER/STATECODE" businTypeId="dx_MR_STATECODE"/></td>
	            --></tr>
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
var userID = <bean:write property="SessionEntity/operatorID" /> ;

function toModify(){
	var frm =document.forms[0];
 	var i=0;
	var j=0;
	eles = frm.elements;
	while(i<eles.length){
			obj= eles[i];
			if(obj.type == "checkbox" && !obj.disabled && obj.getAttribute("marked")==null){
				if(obj.checked){
				    j++;
				    if(j>1){
				    	alert("只能选择一条记录");
				    	return ;
				    }
				    var ManagerID = obj.getAttribute("ManagerID");
				    if(userID != ManagerID ){
				    	alert("您没有操作权限！");
				    	return ;
				    }
				}
			}
			i++;
		}
		if(j==0){
			alert("请选择一条记录");
			return ;
		}
		fid = getChechedValue(frm);
		frm.action = frm.elements["modifyaction"].value;
		frm.action += "?fid=" + fid;
    	frm.submit();
}

function   todel(){
	var frm =document.forms[0];
 	var i=0;
	var j=0;
	eles = frm.elements;
	while(i<eles.length){
			obj= eles[i];
			if(obj.type == "checkbox" && !obj.disabled && obj.getAttribute("marked")==null){
				if(obj.checked){
				    var ManagerID = obj.getAttribute("ManagerID");
				    if(userID != ManagerID ){
				    	alert("您没有操作权限！");
				    	return ;
				    }
				    j++;
				}
			}
			i++;
		}
		if(j==0){
			alert("请至少选择一条记录");
			return "";
		}
	frm.action=frm.deleteaction.value;
	frm.submit();
}
</script>