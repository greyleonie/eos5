<%@include file="/internet/common.jsp"%>
<%
	int count=0;
	int normal=0;
	int delay=0;
	int truancy=0;
	int pholiday=0;
	int leave=0;
	int sick=0;
	String trClass = "result_content"; 
%>
<body>
<script language="javascript" type="text/javascript">
var options=new Array("����","�ٵ�","ȱ��","����","�¼�/����");
</script>
<form method="post" action="studentmanage.prKaoqin.kaoqinList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">ѧԱ����&gt;�༶���ڹ���</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="studentmanage.prKaoqin.kaoqinList.do">
		<input type="hidden" name="viewaction" value="studentmanage.prKaoqin.kaoqingView.do">
		<input type="hidden" name="modifytoSave" value="studentmanage.prKaoqin.kaoqinModify.do">
		<html:hidden property="QueryStudentlaterLogs/_order/col1/field"/>
		<html:hidden property="QueryStudentlaterLogs/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
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
            <td class="text">�� ���� <html:select property="QueryStudentlaterLogs/ClassID" attributesText='id="printTable"'> 
              <html:option value="-1">--��ѡ��༶--</html:option> <html:options property="list[@type='studentclass']/Class/ClassID" labelProperty="list[@type='studentclass']/Class/ClassName"/> 
              </html:select> 
			  &nbsp;�� �ڣ�<html:text property="QueryStudentlaterLogs/checkTime" attributesText='class="input" size="14"' readonly="true"/>
            <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["QueryStudentlaterLogs/checkTime"],"yyyy-MM-dd")>
			&nbsp;
			
			���<dict:select businTypeId="dx_kqWubie" property="QueryStudentlaterLogs/wubie" ></dict:select>
			&nbsp;
			  
			  </td>
      </tr>
	
	  <tr>
	    <td height="30" class="text">
	    <input name="query" type="button" class="button_02" value="�� ѯ" onClick="toquery()">
	     <logic:present property="QueryStudentlaterLogs/ClassID">
        <logic:notEqual property="QueryStudentlaterLogs/ClassID" value="-1"> 
	    <qx:talentButton property="modifyandsave" type="button" styleClass="button_02" value="�޸ı���" onclick="Statistics()" operation="DX_STUDENT_MANAGE_KQ_LIST.DX_STUDENT_MANAGE_KQ_LIST_SAVE"/>
	    <input name="view" type="button" class="button_02" value="�� ��" onClick="talentview()">
	    <input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
		<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">
	    <logic:notPresent property="QueryCourse/CourseID">
	    	<font color="red"> ��ʱ��ð༶û�пγ�.</font>
	    </logic:notPresent>
	    </td>
	    </tr>
	  
      <tr>
        <td height="8" id="Statistics" class="td1"></td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="100%"  border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="3%" align="center" nowrap >    
                  <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                  <td width="7%" align="center" nowrap id="QueryStudentlaterLogs.StudentNO" onClick="talentsort()">ѧ��</td>
                  <td width="8%" align="center" nowrap id="QueryStudentlaterLogs.operatorname" onClick="talentsort()">����</td>
                  <td width="16%" align="center" nowrap id="QueryStudentlaterLogs.ThesisTitle" onClick="talentsort()">�γ�����</td>
                  <td width="16%" align="center" nowrap id="QueryStudentlaterLogs.TeachingGroupID" onClick="talentsort()">�Ͽεص�</td>
                  <td width="12%" align="center" nowrap id="QueryStudentlaterLogs.CommitTime" onClick="talentsort()">״&nbsp;&nbsp;̬</td>
                  <td width="6%" align="center" nowrap id="QueryStudentlaterLogs.Score" onClick="talentsort()">�ٵ��ۼ�</td>
                  <td width="6%" align="center" nowrap id="QueryStudentlaterLogs.commentTeacher" onClick="talentsort()">ȱ���ۼ�</td>
                  <td width="21%" align="center" nowrap id="QueryStudentlaterLogs.commentTeacher" onClick="talentsort()">��λ</td>
                  <td width="11%" align="center" nowrap id="QueryStudentlaterLogs.commentTeacher" onClick="talentsort()">ְ��</td>
                </tr>
				<logic:iterate id="resultset" property="list[@type='QueryStudentlaterLogs']">
					
					<%
					    String style = "";
				        String state = base.util.TalentContext.getValue(pageContext,"resultset","QueryStudentlaterLogs/state");
				       if ("0".equals(state)) normal++;
				       if ("1".equals(state)) {delay++;style="color='gray'";}
				       if ("2".equals(state)) {truancy++;;style="color='red'";}
				       if ("3".equals(state)) {pholiday++;;style="color='blue'";}
				       if ("4".equals(state)) {leave++;;style="color='green'";}
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
                <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" > 
                 <td align="center" >
                 
                 <html:checkbox id="resultset" name="list[@name='update']/QueryStudentlaterLogs/StudentId" property="QueryStudentlaterLogs/StudentId" indexed="true"/>
				  			  </td>
                  <td width="4%" align="center" nowrap style="display: none">      
                  	<bean:write id="resultset" property="QueryStudentlaterLogs/StudentlaterLogsId"/>
                  </td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudentlaterLogs/StudentNO"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudentlaterLogs/operatorname" /></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudentlaterLogs/CourseTitle" /></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudentlaterLogs/RoomName" /></td>
                  <td nowrap onDblClick="toEditSelect(options)" style="<%=style%>">
                  <dict:write id="resultset" property="QueryStudentlaterLogs/state" businTypeId="dx_kqState"/>
                  </td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudentlaterLogs/laterCount"/> </td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudentlaterLogs/lackCount"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudentlaterLogs/WorkingOrgan"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudentlaterLogs/Duty" />                   </td>
                  </tr>
				</logic:iterate>
              </table>
          	  </td>
      </tr>
      </logic:notEqual>
        </logic:present>
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
 document.all.Statistics.innerHTML = "Ӧ����<%=count%>�˴Σ����� ��<%=normal%>�˴Σ�<font color='gray'>�ٵ�</font> ��<%=delay%>�ˣ�<font color='red'>ȱ��</font> ��<%=truancy%>�ˣ�<font color='blue'>����</font> ��<%=pholiday%>�ˣ�<font color='green'>�¼�/����</font> ��<%=leave%>�ˡ�"; 

 function toquery(){
 	var frm =document.forms[0];
 	if(frm.elements["QueryStudentlaterLogs/ClassID"].value==-1){
 		alert("��ѡ��༶");
 		return;
 	}
 	if(frm.elements["QueryStudentlaterLogs/checkTime"].value==""){
 		alert("��ѡ������");
 		return;
 	}
 	frm.action = frm.elements["queryaction"].value;
 	frm.submit();
 }
 
 
function Statistics()
     {   	var now= new Date();
			var year=now.getYear();
			var month=now.getMonth()+1;
			var day=now.getDate();
			var hour=now.getHours();
			var minute=now.getMinutes();
			var second=now.getSeconds();
	   var ThisTime=year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
       var SetTime=document.getElementById("QueryStudentlaterLogs/checkTime").value;
       var wb=document.getElementById("QueryStudentlaterLogs/wubie").value;
       var flag=compdate(SetTime);
       if(flag==0){
       if(wb==0){
       		SetTime=SetTime+" 11:50:00";
       }
       if(wb==1){
       		SetTime=SetTime+" 17:30:00";
       }
        if(SetTime =="")
        {
        alert("��ѡ������");
        }else{
        var reg=new RegExp("-","g"); //��������RegExp����
        var tempSetTime=SetTime.replace(reg,"\/");
        var tempThisTime=ThisTime.replace(reg,"\/");
        if(Date.parse(new Date(tempSetTime))>Date.parse(new Date(tempThisTime)))
        {
        alert("���ڿκ�����ѧԱ�������!");
        } else{
        modifySave('listdetail');
        }
}
}if(flag>0){
	modifySave('listdetail');
}
if(flag<0){
	alert("������ǰ����ѧԱ�������!");
}
}
function compdate(SetTime){
var now= new Date();
var year=now.getYear();
var month=now.getMonth()+1;
var day=now.getDate();

 var a,ass,aD,aS;
 var b,bss,bD,bS;
 
 a=year+"-"+month+"-"+day; //�õ�����ʱ�䣻
 b=SetTime;     //�õ�ѡ��ʱ�䣻 
 
 ass=a.split("-");        //��"-"�ָ��ַ������������飻
 aD=new Date(ass[0],ass[1],ass[2]);  //��ʽ��ΪDate����;
 aS=aD.getTime(); //�õ��� 1970 �� 1 �� 1 �տ�ʼ���㵽 Date �����е�ʱ��֮��ĺ�����
 
 bss=b.split("-");
 
 bD=new Date(bss[0],bss[1],bss[2]);
 bS=bD.getTime();
 if(bS==aS){
  return 0;
 }
 if(bS>aS){
  return -1;
 }
  if(bS<aS){
  return 1;
 }
 
}
</script>