<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="teachWorkManage.prNetCenter.remoteTeachList.do" name="opeForm">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;�������Ľ�ѧ����&gt;<span id="printTable">Զ�̽�ѧ¼�ư���</span></td>
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
            �༶��<input  type="text" name="DistanceTeaching/Class/criteria/value"  value='<bean:write  property="DistanceTeaching/Class/criteria/value"/>'    size="35" class="input"  />
				  <input class="button_02" type="button" id="bt1" value="ѡ��" onclick="selectClass()"/>
            ���⣺
                <html:text property="DistanceTeaching/CourseTitle/criteria/value" attributesText='class="input" size="20"'/>
                <html:hidden property="DistanceTeaching/CourseTitle/criteria/operator" value="like"/>
                <html:hidden property="DistanceTeaching/CourseTitle/criteria/likeRule" value="center"/>
            �ڿ���ʦ�� 
                <html:text property="DistanceTeaching/Teacher/criteria/value" attributesText='class="input" size="20"'/>
                <html:hidden property="DistanceTeaching/Teacher/criteria/operator" value="like"/>
                <html:hidden property="DistanceTeaching/Teacher/criteria/likeRule" value="center"/>
            
            <br/>
				Ƶ����
            <html:select property="DistanceTeaching/Channel/criteria/value">
							<html:option value="">--��ѡ��--</html:option>
							<html:option value="1">���뵳У�ļ�Ƶ��</html:option>
							<html:option value="2">���뵳Уֱ��Ƶ��</html:option>
							<html:option value="11">ʡ��Уֱ��Ƶ��</html:option>
							<html:option value="12">ʡ��У����Ƶ��</html:option>
							<html:option value="13">ʡ��У����Ƶ��</html:option>
							<html:option value="14">ʡ��У�γ�Ƶ��</html:option>
							<html:option value="15">ʡ��У����Ƶ��</html:option>
							<html:option value="21">����Ƶ��</html:option>
							<html:option value="22">�ֳ�ֱ��</html:option>
							<html:option value="31">�Լ�¼��</html:option>
							<html:option value="32">����</html:option>
			</html:select>
			<html:hidden property="DistanceTeaching/Channel/criteria/operator" value="="/>
            ���ڣ� ��
            	<html:text property="DistanceTeaching/RecordDate/criteria/min" attributesText='class="input" size="10"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["DistanceTeaching/RecordDate/criteria/min"],"yyyy-MM-dd")> 
           		��
           		<html:text property="DistanceTeaching/RecordDate/criteria/max" attributesText='class="input" size="10"' readonly="true"/>
          	    <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["DistanceTeaching/RecordDate/criteria/max"],"yyyy-MM-dd")>
			    <input type="hidden" name="DistanceTeaching/RecordDate/criteria/criteriaPattern" value="yyyy-MM-dd"/>
			    <input type="hidden" name="DistanceTeaching/RecordDate/criteria/operator" value="between"/>
			 <br/>
			 
                <input name="query" type="button" class="button_02" value="�� ѯ" onClick="talentquery()">               
                <qx:talentButton property="add" type="button" styleClass="button_02" value="�� ��" onclick="talentaddNew()" operation="DX_TEACH_MANAGE_NETCENTER_DT.DX_TEACH_MANAGE_NETCENTER_DT_ADD"/>
				 <qx:talentButton property="modify" type="button" styleClass="button_02" value="�� ��" onclick="talentmodify()" operation="DX_TEACH_MANAGE_NETCENTER_DT.DX_TEACH_MANAGE_NETCENTER_DT_MODIFY"/>
				  <qx:talentButton property="delete" type="button" styleClass="button_02" value="ɾ ��" onclick="talentdelete()" operation="DX_TEACH_MANAGE_NETCENTER_DT.DX_TEACH_MANAGE_NETCENTER_DT_DELETE"/>
				<input name="delete" type="button" class="button_02" value="�� ��" onClick="talentview()">
				<input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">	
				&nbsp;&nbsp;&nbsp;&nbsp;<input name="down" type="button" class="button_02" value="����ģ��" onclick="downModel()">	
				<input name="import" type="button" class="button_02"  value="�� ��" onclick="importExcel()"/>	
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
                  <td width="10%" align="center"  nowrap id="DistanceTeaching.RecordDate" onClick="talentsort()">����</td>
                  <td width="7%" align="center"  nowrap id="DistanceTeaching.RecordTime" onClick="talentsort()">ʱ��</td>
                  <td width="5%" align="center"  nowrap id="DistanceTeaching.RecordNoon" onClick="talentsort()">���</td>
                  <td width="10%" align="center"  nowrap id="DistanceTeaching.Channel" onClick="talentsort()">Ƶ��</td>
                  <td width="20%" align="center"  nowrap id="DistanceTeaching.CourseTitle" onClick="talentsort()">�γ̱���</td>
                  <td width="10%"  align="center"  nowrap id="DistanceTeaching.Class" onClick="talentsort()">�༶</td>
                  <td width="10%"  align="center"  nowrap id="DistanceTeaching.Teacher" onClick="talentsort()">�ڿν�ʦ</td>
                  <td width="3%"  align="center"  nowrap id="DistanceTeaching.IsRecord" onClick="talentsort()">¼��</td>
                  <td width="3%"  align="center"  nowrap id="DistanceTeaching.IsLive " onClick="talentsort()">ֱ��</td>
                  <td width="3%"  align="center"  nowrap id="DistanceTeaching.IsPlay " onClick="talentsort()">��ӳ</td>
                  <td width="8%"  align="center"  nowrap id="DistanceTeaching.ClassRooms" onClick="talentsort()">����</td>
                  <td width="8%"  align="center"  nowrap id="DistanceTeaching.Remarks" onClick="talentsort()">��ע</td>
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
                  <td  align="center"   ><logic:equal id="resultset" property="DistanceTeaching/RecordNoon" value="1">����</logic:equal>
			                 					 <logic:equal id="resultset" property="DistanceTeaching/RecordNoon" value="2">����</logic:equal>
			                  					<logic:equal id="resultset" property="DistanceTeaching/RecordNoon" value="3">����</logic:equal></td>
                  <td  align="center"   > <logic:equal id="resultset" property="DistanceTeaching/Channel" value="1" >���뵳УһƵ��</logic:equal>
								              <logic:equal id="resultset" property="DistanceTeaching/Channel" value="2">���뵳У��Ƶ��</logic:equal>
								              <logic:equal id="resultset" property="DistanceTeaching/Channel" value="3">���뵳У��Ƶ��</logic:equal>
								              <logic:equal id="resultset" property="DistanceTeaching/Channel" value="11">ʡ��Уֱ��Ƶ��</logic:equal>
								              <logic:equal id="resultset" property="DistanceTeaching/Channel" value="12">ʡ��У����Ƶ��</logic:equal>
								              <logic:equal id="resultset" property="DistanceTeaching/Channel" value="13">ʡ��У����Ƶ��</logic:equal>
								              <logic:equal id="resultset" property="DistanceTeaching/Channel" value="14">ʡ��У�γ�Ƶ��</logic:equal>
								              <logic:equal id="resultset" property="DistanceTeaching/Channel" value="15">ʡ��У����Ƶ��</logic:equal>
								              <logic:equal id="resultset" property="DistanceTeaching/Channel" value="21">����Ƶ��</logic:equal>
								              <logic:equal id="resultset" property="DistanceTeaching/Channel" value="22">�ֳ�ֱ��</logic:equal>
								              <logic:equal id="resultset" property="DistanceTeaching/Channel" value="31">�Լ�¼��</logic:equal>
								              <logic:equal id="resultset" property="DistanceTeaching/Channel" value="32">����</logic:equal></td>
                   <td  align="center"  ><bean:write id="resultset" property="DistanceTeaching/CourseTitle" /></td>
                  <td  align="center"  ><bean:write id="resultset" property="DistanceTeaching/Class" /></td>
                  <td  align="center"  ><bean:write id="resultset" property="DistanceTeaching/Teacher" /></td>
                  <td  align="center"  ><logic:equal id="resultset" property="DistanceTeaching/IsRecord" value="1">��</logic:equal>
			                  					<logic:equal id="resultset" property="DistanceTeaching/IsRecord" value="0">��</logic:equal></td>
                  <td  align="center"   ><logic:equal id="resultset" property="DistanceTeaching/IsLive" value="1">��</logic:equal>
			                  					<logic:equal id="resultset" property="DistanceTeaching/IsLive" value="0">��</logic:equal></td>
                  <td   align="center"   ><logic:equal id="resultset" property="DistanceTeaching/IsPlay" value="1">��</logic:equal>
			                  					<logic:equal id="resultset" property="DistanceTeaching/IsPlay" value="0">��</logic:equal></td>
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