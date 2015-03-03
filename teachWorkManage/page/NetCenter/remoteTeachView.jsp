<%@include file="/internet/common.jsp"%>
<body>
<form method="post"  name="opeForm">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;网络中心教学管理—&gt;<span id="printTable">远程教学录制安排</span>查看</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" />
		<input type="hidden" name="addaction" />
		<input type="hidden" name="modifyaction" />
		<input type="hidden" name="deleteaction" />
		<input type="hidden" name="viewaction"/>
		<html:hidden property="DistanceTeaching/_order/col1/field"/>
		<html:hidden property="DistanceTeaching/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/length" />
		<html:hidden property="DistanceTeaching/RecordID"/>
	  </td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
       <tr>
      <td><input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()"> </td>
    </tr>
        <tr>
      <td height="8"> </td>
    </tr>
    <tr>
	  <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
          <tr  onClick="changeTRBgColor(this)">
            <td width="12%" align="right" class="td2">日&nbsp;&nbsp;&nbsp;&nbsp;期：</td>
            <td width="88%" class="td1"><bean:write property="DistanceTeaching/RecordDate"/>
            <bean:write  property="DistanceTeaching/RecordTime"  />
			<logic:equal  property="DistanceTeaching/RecordNoon" value="1">上午</logic:equal>
			<logic:equal  property="DistanceTeaching/RecordNoon" value="2">中午</logic:equal>
			<logic:equal  property="DistanceTeaching/RecordNoon" value="3">晚上</logic:equal>
</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">频&nbsp;&nbsp;&nbsp;&nbsp;道：</td>
            <td class="td1">
              <logic:equal  property="DistanceTeaching/Channel" value="1">中央党校一频道</logic:equal>
              <logic:equal  property="DistanceTeaching/Channel" value="2">中央党校二频道</logic:equal>
              <logic:equal  property="DistanceTeaching/Channel" value="3">中央党校三频道</logic:equal>
              <logic:equal  property="DistanceTeaching/Channel" value="11">省党校直播频道</logic:equal>
              <logic:equal  property="DistanceTeaching/Channel" value="12">省党校备份频道</logic:equal>
              <logic:equal  property="DistanceTeaching/Channel" value="13">省党校测试频道</logic:equal>
              <logic:equal  property="DistanceTeaching/Channel" value="14">省党校课程频道</logic:equal>
              <logic:equal  property="DistanceTeaching/Channel" value="15">省党校加密频道</logic:equal>
              <logic:equal  property="DistanceTeaching/Channel" value="21">电视频道</logic:equal>
              <logic:equal  property="DistanceTeaching/Channel" value="22">现场直播</logic:equal>
              <logic:equal  property="DistanceTeaching/Channel" value="31">自己录制</logic:equal>
              <logic:equal  property="DistanceTeaching/Channel" value="32">其他</logic:equal>
              </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">课程标题：</td>
            <td class="td1"><bean:write  property="DistanceTeaching/CourseTitle"/></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">班&nbsp;&nbsp;&nbsp;&nbsp;级：</td>
            <td class="td1"><bean:write  property="DistanceTeaching/Class" /></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">授课教师：</td>
            <td class="td1"><bean:write   property="DistanceTeaching/Teacher"  /></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">授课教师单位：</td>
            <td class="td1"><bean:write   property="DistanceTeaching/TeacherOrg"  /></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">授课教师职务：</td>
            <td class="td1"><bean:write  property="DistanceTeaching/TeacherPost"  /></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">录&nbsp;&nbsp;&nbsp;&nbsp;制：</td>
            <td class="td1"><logic:equal  property="DistanceTeaching/IsRecord" value="1">是</logic:equal>
			                  					<logic:equal  property="DistanceTeaching/IsRecord" value="0">否</logic:equal></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">直&nbsp;&nbsp;&nbsp;&nbsp;播：</td>
            <td class="td1"><logic:equal  property="DistanceTeaching/IsLive" value="1">是</logic:equal>
			                  					<logic:equal  property="DistanceTeaching/IsLive" value="0">否</logic:equal></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">放&nbsp;&nbsp;&nbsp;&nbsp;映：</td>
            <td class="td1"><logic:equal  property="DistanceTeaching/IsPlay" value="1">是</logic:equal>
			                  					<logic:equal  property="DistanceTeaching/IsPlay" value="0">否</logic:equal></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">课&nbsp;&nbsp;&nbsp;&nbsp;室：</td>
            <td class="td1"><bean:write  property="DistanceTeaching/ClassRooms"/> </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">备&nbsp;&nbsp;&nbsp;&nbsp;注：</td>
            <td class="td1"><bean:write  property="DistanceTeaching/Remarks"/></td>
          </tr>
        </table>
      
      
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Submit2" type="button" class="button_02" value="返 回" onClick="javascript:history.go(-1)"></td>
            </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
  </form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>