<%@include file="/internet/common.jsp"%>
<body>
<form method="post"  name="opeForm">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;�������Ľ�ѧ����&gt;<span id="printTable">Զ�̽�ѧ¼�ư���</span>�鿴</td>
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
      <td><input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()"> </td>
    </tr>
        <tr>
      <td height="8"> </td>
    </tr>
    <tr>
	  <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
          <tr  onClick="changeTRBgColor(this)">
            <td width="12%" align="right" class="td2">��&nbsp;&nbsp;&nbsp;&nbsp;�ڣ�</td>
            <td width="88%" class="td1"><bean:write property="DistanceTeaching/RecordDate"/>
            <bean:write  property="DistanceTeaching/RecordTime"  />
			<logic:equal  property="DistanceTeaching/RecordNoon" value="1">����</logic:equal>
			<logic:equal  property="DistanceTeaching/RecordNoon" value="2">����</logic:equal>
			<logic:equal  property="DistanceTeaching/RecordNoon" value="3">����</logic:equal>
</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">Ƶ&nbsp;&nbsp;&nbsp;&nbsp;����</td>
            <td class="td1">
              <logic:equal  property="DistanceTeaching/Channel" value="1">���뵳УһƵ��</logic:equal>
              <logic:equal  property="DistanceTeaching/Channel" value="2">���뵳У��Ƶ��</logic:equal>
              <logic:equal  property="DistanceTeaching/Channel" value="3">���뵳У��Ƶ��</logic:equal>
              <logic:equal  property="DistanceTeaching/Channel" value="11">ʡ��Уֱ��Ƶ��</logic:equal>
              <logic:equal  property="DistanceTeaching/Channel" value="12">ʡ��У����Ƶ��</logic:equal>
              <logic:equal  property="DistanceTeaching/Channel" value="13">ʡ��У����Ƶ��</logic:equal>
              <logic:equal  property="DistanceTeaching/Channel" value="14">ʡ��У�γ�Ƶ��</logic:equal>
              <logic:equal  property="DistanceTeaching/Channel" value="15">ʡ��У����Ƶ��</logic:equal>
              <logic:equal  property="DistanceTeaching/Channel" value="21">����Ƶ��</logic:equal>
              <logic:equal  property="DistanceTeaching/Channel" value="22">�ֳ�ֱ��</logic:equal>
              <logic:equal  property="DistanceTeaching/Channel" value="31">�Լ�¼��</logic:equal>
              <logic:equal  property="DistanceTeaching/Channel" value="32">����</logic:equal>
              </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">�γ̱��⣺</td>
            <td class="td1"><bean:write  property="DistanceTeaching/CourseTitle"/></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">��&nbsp;&nbsp;&nbsp;&nbsp;����</td>
            <td class="td1"><bean:write  property="DistanceTeaching/Class" /></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">�ڿν�ʦ��</td>
            <td class="td1"><bean:write   property="DistanceTeaching/Teacher"  /></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">�ڿν�ʦ��λ��</td>
            <td class="td1"><bean:write   property="DistanceTeaching/TeacherOrg"  /></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">�ڿν�ʦְ��</td>
            <td class="td1"><bean:write  property="DistanceTeaching/TeacherPost"  /></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">¼&nbsp;&nbsp;&nbsp;&nbsp;�ƣ�</td>
            <td class="td1"><logic:equal  property="DistanceTeaching/IsRecord" value="1">��</logic:equal>
			                  					<logic:equal  property="DistanceTeaching/IsRecord" value="0">��</logic:equal></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">ֱ&nbsp;&nbsp;&nbsp;&nbsp;����</td>
            <td class="td1"><logic:equal  property="DistanceTeaching/IsLive" value="1">��</logic:equal>
			                  					<logic:equal  property="DistanceTeaching/IsLive" value="0">��</logic:equal></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">��&nbsp;&nbsp;&nbsp;&nbsp;ӳ��</td>
            <td class="td1"><logic:equal  property="DistanceTeaching/IsPlay" value="1">��</logic:equal>
			                  					<logic:equal  property="DistanceTeaching/IsPlay" value="0">��</logic:equal></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">��&nbsp;&nbsp;&nbsp;&nbsp;�ң�</td>
            <td class="td1"><bean:write  property="DistanceTeaching/ClassRooms"/> </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">��&nbsp;&nbsp;&nbsp;&nbsp;ע��</td>
            <td class="td1"><bean:write  property="DistanceTeaching/Remarks"/></td>
          </tr>
        </table>
      
      
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Submit2" type="button" class="button_02" value="�� ��" onClick="javascript:history.go(-1)"></td>
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