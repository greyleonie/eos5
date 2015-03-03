<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="teachWorkManage.prNetCenter.remoteTeachList.do" name="opeForm">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;网络中心教学管理—&gt;<span id="printTable">远程教学录制安排</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="teachWorkManage.prNetCenter.remoteTeachList.do">
		<input type="hidden" name="addaction" value="teachWorkManage.prNetCenter.remoteTeachAdd.do">
		<input type="hidden" name="modifyaction" value="teachWorkManage.prNetCenter.remoteTeachModify.do">
		<input type="hidden" name="deleteaction" value="teachWorkManage.prNetCenter.remoteTeachDelete.do">
		<input type="hidden" name="viewaction" value="teachWorkManage.prNetCenter.remoteTeachView.do">
		<html:hidden property="DistanceTeaching/_order/col1/field"/>
		<html:hidden property="DistanceTeaching/_order/col1/asc" />
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
            <td height="30" class="text">
            班级：<input  type="text" name="DistanceTeaching/Class/criteria/value"  value='<bean:write  property="DistanceTeaching/Class/criteria/value"/>'    size="35" class="input"  />
				  <input class="button_02" type="button" id="bt1" value="选择" onclick="selectClass()"/>
            标题：
                <html:text property="DistanceTeaching/CourseTitle/criteria/value" attributesText='class="input" size="20"'/>
                <html:hidden property="DistanceTeaching/CourseTitle/criteria/operator" value="like"/>
                <html:hidden property="DistanceTeaching/CourseTitle/criteria/likeRule" value="center"/>
            授课老师： 
                <html:text property="DistanceTeaching/Teacher/criteria/value" attributesText='class="input" size="20"'/>
                <html:hidden property="DistanceTeaching/Teacher/criteria/operator" value="like"/>
                <html:hidden property="DistanceTeaching/Teacher/criteria/likeRule" value="center"/>
            
            <br/>
				频道：
            <html:select property="DistanceTeaching/Channel/criteria/value">
							<html:option value="">--请选择--</html:option>
							<html:option value="1">中央党校文件频道</html:option>
							<html:option value="2">中央党校直播频道</html:option>
							<html:option value="11">省党校直播频道</html:option>
							<html:option value="12">省党校备份频道</html:option>
							<html:option value="13">省党校测试频道</html:option>
							<html:option value="14">省党校课程频道</html:option>
							<html:option value="15">省党校加密频道</html:option>
							<html:option value="21">电视频道</html:option>
							<html:option value="22">现场直播</html:option>
							<html:option value="31">自己录制</html:option>
							<html:option value="32">其他</html:option>
			</html:select>
			<html:hidden property="DistanceTeaching/Channel/criteria/operator" value="="/>
            日期： 从
            	<html:text property="DistanceTeaching/RecordDate/criteria/min" attributesText='class="input" size="10"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["DistanceTeaching/RecordDate/criteria/min"],"yyyy-MM-dd")> 
           		到
           		<html:text property="DistanceTeaching/RecordDate/criteria/max" attributesText='class="input" size="10"' readonly="true"/>
          	    <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["DistanceTeaching/RecordDate/criteria/max"],"yyyy-MM-dd")>
			    <input type="hidden" name="DistanceTeaching/RecordDate/criteria/criteriaPattern" value="yyyy-MM-dd"/>
			    <input type="hidden" name="DistanceTeaching/RecordDate/criteria/operator" value="between"/>
			 <br/>
			 
                <input name="query" type="button" class="button_02" value="查 询" onClick="talentquery()">               
                <qx:talentButton property="add" type="button" styleClass="button_02" value="新 增" onclick="talentaddNew()" operation="DX_TEACH_MANAGE_NETCENTER_DT.DX_TEACH_MANAGE_NETCENTER_DT_ADD"/>
				 <qx:talentButton property="modify" type="button" styleClass="button_02" value="修 改" onclick="talentmodify()" operation="DX_TEACH_MANAGE_NETCENTER_DT.DX_TEACH_MANAGE_NETCENTER_DT_MODIFY"/>
				  <qx:talentButton property="delete" type="button" styleClass="button_02" value="删 除" onclick="talentdelete()" operation="DX_TEACH_MANAGE_NETCENTER_DT.DX_TEACH_MANAGE_NETCENTER_DT_DELETE"/>
				<input name="delete" type="button" class="button_02" value="查 看" onClick="talentview()">
				<input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">	
				&nbsp;&nbsp;&nbsp;&nbsp;<input name="down" type="button" class="button_02" value="下载模板" onclick="downModel()">	
				<input name="import" type="button" class="button_02"  value="导 入" onclick="importExcel()"/>	
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="3%" align="center"  nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" ></td>
                  <td width="10%" align="center"  nowrap id="DistanceTeaching.RecordDate" onClick="talentsort()">日期</td>
                  <td width="7%" align="center"  nowrap id="DistanceTeaching.RecordTime" onClick="talentsort()">时间</td>
                  <td width="5%" align="center"  nowrap id="DistanceTeaching.RecordNoon" onClick="talentsort()">午别</td>
                  <td width="10%" align="center"  nowrap id="DistanceTeaching.Channel" onClick="talentsort()">频道</td>
                  <td width="20%" align="center"  nowrap id="DistanceTeaching.CourseTitle" onClick="talentsort()">课程标题</td>
                  <td width="10%"  align="center"  nowrap id="DistanceTeaching.Class" onClick="talentsort()">班级</td>
                  <td width="10%"  align="center"  nowrap id="DistanceTeaching.Teacher" onClick="talentsort()">授课教师</td>
                  <td width="3%"  align="center"  nowrap id="DistanceTeaching.IsRecord" onClick="talentsort()">录制</td>
                  <td width="3%"  align="center"  nowrap id="DistanceTeaching.IsLive " onClick="talentsort()">直播</td>
                  <td width="3%"  align="center"  nowrap id="DistanceTeaching.IsPlay " onClick="talentsort()">放映</td>
                  <td width="8%"  align="center"  nowrap id="DistanceTeaching.ClassRooms" onClick="talentsort()">课室</td>
                  <td width="8%"  align="center"  nowrap id="DistanceTeaching.Remarks" onClick="talentsort()">备注</td>
                </tr>
				<%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
				<logic:iterate id="resultset" property="list[@type='DistanceTeaching']">
					<%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
                <tr class="<%=trClass%>" onClick="changeTRBgColor(this)"> 
                  <td align="center"><logic:present  id="resultset" property="DistanceTeaching/RecordID">
			                  <html:checkbox id="resultset" name="list[@name='update']/DistanceTeaching/RecordID" property="DistanceTeaching/RecordID" indexed="true"/>
			                  </logic:present></td>
				  <td align="center"   ><bean:write id="resultset" property="DistanceTeaching/RecordDate" formatType="yyyy-MM-dd"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" /></td>
				  <td  align="center"   ><bean:write id="resultset" property="DistanceTeaching/RecordTime" /></td>
                  <td  align="center"   ><logic:equal id="resultset" property="DistanceTeaching/RecordNoon" value="1">上午</logic:equal>
			                 					 <logic:equal id="resultset" property="DistanceTeaching/RecordNoon" value="2">下午</logic:equal>
			                  					<logic:equal id="resultset" property="DistanceTeaching/RecordNoon" value="3">晚上</logic:equal></td>
                  <td  align="center"   > <logic:equal id="resultset" property="DistanceTeaching/Channel" value="1" >中央党校一频道</logic:equal>
								              <logic:equal id="resultset" property="DistanceTeaching/Channel" value="2">中央党校二频道</logic:equal>
								              <logic:equal id="resultset" property="DistanceTeaching/Channel" value="3">中央党校三频道</logic:equal>
								              <logic:equal id="resultset" property="DistanceTeaching/Channel" value="11">省党校直播频道</logic:equal>
								              <logic:equal id="resultset" property="DistanceTeaching/Channel" value="12">省党校备份频道</logic:equal>
								              <logic:equal id="resultset" property="DistanceTeaching/Channel" value="13">省党校测试频道</logic:equal>
								              <logic:equal id="resultset" property="DistanceTeaching/Channel" value="14">省党校课程频道</logic:equal>
								              <logic:equal id="resultset" property="DistanceTeaching/Channel" value="15">省党校加密频道</logic:equal>
								              <logic:equal id="resultset" property="DistanceTeaching/Channel" value="21">电视频道</logic:equal>
								              <logic:equal id="resultset" property="DistanceTeaching/Channel" value="22">现场直播</logic:equal>
								              <logic:equal id="resultset" property="DistanceTeaching/Channel" value="31">自己录制</logic:equal>
								              <logic:equal id="resultset" property="DistanceTeaching/Channel" value="32">其他</logic:equal></td>
                   <td  align="center"  ><bean:write id="resultset" property="DistanceTeaching/CourseTitle" /></td>
                  <td  align="center"  ><bean:write id="resultset" property="DistanceTeaching/Class" /></td>
                  <td  align="center"  ><bean:write id="resultset" property="DistanceTeaching/Teacher" /></td>
                  <td  align="center"  ><logic:equal id="resultset" property="DistanceTeaching/IsRecord" value="1">是</logic:equal>
			                  					<logic:equal id="resultset" property="DistanceTeaching/IsRecord" value="0">否</logic:equal></td>
                  <td  align="center"   ><logic:equal id="resultset" property="DistanceTeaching/IsLive" value="1">是</logic:equal>
			                  					<logic:equal id="resultset" property="DistanceTeaching/IsLive" value="0">否</logic:equal></td>
                  <td   align="center"   ><logic:equal id="resultset" property="DistanceTeaching/IsPlay" value="1">是</logic:equal>
			                  					<logic:equal id="resultset" property="DistanceTeaching/IsPlay" value="0">否</logic:equal></td>
                  <td   align="center"   ><bean:write id="resultset" property="DistanceTeaching/ClassRooms" /></td>
                  <td   align="center"   ><bean:write id="resultset" property="DistanceTeaching/Remarks" /></td>
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
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>
<script>
function talentaddNew() {
	var frm = document.forms[0];
	frm.action = frm.elements["addaction"].value ;
   	frm.submit();

}


function downModel(){
	window.open("/internet/download/distanceTeaching.xls","","");
}


function importExcel() {
	var frm = document.forms[0];
	
	frm.action = "teachWorkManage.prNetCenter.remoteTeachImport.do"
   	frm.submit();

}


  function selectClass(){ 
   	var frm =document.forms[0];
     var refreshMark = new Date().getTime();
     var loc="teachWorkManage.prSearch.selectClass.do?refreshMark="+refreshMark;
     var acceptValue="";
     try{
        acceptValue= window.showModalDialog(loc,"","dialogWidth:400px;DialogHeight=550px;status:no;scroll:auto");      
     }catch(e){}
     
     if(acceptValue != undefined){
       frm["DistanceTeaching/Class/criteria/value"].value=acceptValue;
     }
 
 }

</script>
<script>
	loadOrderImg(document.forms[0],'QuerySocialSurvey');
</script>