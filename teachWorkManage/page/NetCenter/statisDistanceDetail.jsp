<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="teachWorkManage.prNetCenter.statisDistanceDetail.do" name="opeForm">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;�������Ľ�ѧ����&gt;Զ�̽�ѧ��¼�����ϸ</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="teachWorkManage.prNetCenter.statisDistanceDetail.do">
		
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
								Ƶ����
            <dict:select businTypeId="dx_distanceType" property="DistanceTeaching/Channel/criteria/value" nullOption="true" nullLabel="��ѡ��..."></dict:select>
			<html:hidden property="DistanceTeaching/Channel/criteria/operator" value="="/>
              ���ڣ� ��
            	<html:text property="input/BeginTime" attributesText='class="input" size="10"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["input/BeginTime"],"yyyy-MM-dd")> 
           		��
           		<html:text property="input/EndTime" attributesText='class="input" size="10"' readonly="true"/>
          	    <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["input/EndTime"],"yyyy-MM-dd")>

                <input name="query" type="button" class="button_02" value="�� ϸ" onClick="talentquery()"> 
                <input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()"> 
				<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">&nbsp;&nbsp;&nbsp;&nbsp;
				<input name="add" type="button" class="button_02" value="�� ��" onClick="statistotal()">		
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
              <tr>
        <td class="td1" align="center"><span id="printTable"><b>Զ�̽�ѧ��¼�����ϸ��</b><br/></span> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
	<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="3%" align="center"  nowrap>���</td>
                  <td width="10%" align="center"  nowrap id="DistanceTeaching.RecordDate" onClick="talentsort()">����</td>
                  <td width="7%" align="center"  nowrap id="DistanceTeaching.RecordTime" onClick="talentsort()">����</td>
                  <td width="5%" align="center"  nowrap id="DistanceTeaching.RecordNoon" onClick="talentsort()">���</td>
                  <td width="10%"  align="center"  nowrap id="DistanceTeaching.Class" onClick="talentsort()">�ص�</td>
                  <td width="10%"  align="center"  nowrap id="DistanceTeaching.Class" onClick="talentsort()">�༶</td>
                  <td width="10%" align="center"  nowrap id="DistanceTeaching.CourseTitle" onClick="talentsort()">�γ̱���</td>
                  <td width="5%"  align="center"  nowrap id="DistanceTeaching.IsRecord" onClick="talentsort()">�ڿ��˵�λ</td>
                  <td width="10%"  align="center"  nowrap id="DistanceTeaching.Teacher" onClick="talentsort()">�ڿν�ʦ</td>
                  <td width="5%"  align="center"  nowrap id="DistanceTeaching.IsPlay " onClick="talentsort()">¼������</td>
                  <td width="10%"  align="center"  nowrap id="DistanceTeaching.ClassRooms" onClick="talentsort()">Ƶ��</td>
                 
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
                  <td align="center"><%=count %></td>
				  <td align="center"   ><bean:write id="resultset" property="DistanceTeaching/RecordDate" formatType="yyyy-MM-dd"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" /></td>
				  <td  align="center"   ><bean:write id="resultset" property="DistanceTeaching/week" /></td>
                  <td  align="center"   ><logic:equal id="resultset" property="DistanceTeaching/RecordNoon" value="1">����</logic:equal>
			                 					 <logic:equal id="resultset" property="DistanceTeaching/RecordNoon" value="2">����</logic:equal>
			                  					<logic:equal id="resultset" property="DistanceTeaching/RecordNoon" value="3">����</logic:equal></td>
                  <td   align="center"   ><bean:write id="resultset" property="DistanceTeaching/ClassRooms" /></td>
                  <td  align="center"  ><bean:write id="resultset" property="DistanceTeaching/Class" /></td>
                  <td  align="center"  ><bean:write id="resultset" property="DistanceTeaching/CourseTitle" /></td>
                  <td  align="center"  ><bean:write id="resultset" property="DistanceTeaching/TeacherOrg" /></td>
                  <td  align="center"  ><bean:write  id="resultset" property="DistanceTeaching/Teacher" /></td>
                  <td  align="center"  ><logic:equal id="resultset" property="DistanceTeaching/IsRecord" value="1" >¼</logic:equal>
                  <logic:equal id="resultset" property="DistanceTeaching/IsPlay" value="1" >��</logic:equal>
                  
                  </td>
                  <td  align="center"  ><dict:write id="resultset" businTypeId="dx_distanceType" property="DistanceTeaching/Channel"/></td>
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
	loadOrderImg(document.forms[0],'DistanceTeaching');
</script>
<script>
function statistotal(){
 	var frm = document.forms[0];
	var BeginTime = frm["input/BeginTime"].value;
	var EndTime = frm["input/EndTime"].value;
	if(BeginTime==""||EndTime ==""){
		alert("ʱ�䲻��Ϊ��");
		return ;
	}
	window.location.href="teachWorkManage.prNetCenter.statisDistanceTotal.do?input/BeginTime="+BeginTime+"&input/EndTime="+EndTime;

}

</script>