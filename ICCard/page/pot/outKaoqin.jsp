<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="ICCard.prPot.outKaoqin.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;���ڹ���&gt;�������</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="ICCard.prPot.outKaoqin.do">
		<input type="hidden" name="saveaction" value="ICCard.prPot.saveOutKaoqin.do">
		
		<html:hidden property="QueryStudentSimple/_order/col1/field"/>
		<html:hidden property="QueryStudentSimple/_order/col1/asc" />
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
            <td class="text">�� ����
            <html:select property="QueryStudentSimple/ClassID/criteria/value"  attributesText='id="printTable"' onchange="talentquery()"> 
              <html:option value="-1">--��ѡ��༶--</html:option> <html:options property="list[@type='Class']/Class/ClassID" labelProperty="list[@type='Class']/Class/ClassName"/> 
              </html:select> &nbsp;
			  <input name="query" type="button" class="button_02" value="�� ѯ" onClick="talentquery()"></td>
      </tr>
	  <tr>
            <td height="30" class="text">
				
			    ʱ �䣺 
			    <html:text property="Kaoqin/StartTime" attributesText='class="input" size="14"' readonly="true"/>
            <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["Kaoqin/StartTime"],"yyyy-MM-dd")>
                <html:select property="Kaoqin/StartWubie" styleClass="input">
                	<html:option value="0">����</html:option>
                	<html:option value="1">����</html:option>
                </html:select>
               &nbsp;
              ��&nbsp;
				<html:text property="Kaoqin/EndTime" attributesText='class="input" size="14"' readonly="true"/>
            <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["Kaoqin/EndTime"],"yyyy-MM-dd")>
              <html:select property="Kaoqin/EndWubie" styleClass="input">
                	<html:option value="0">����</html:option>
                	<html:option value="1">����</html:option>
                </html:select>
			   
            <input name="save" type="button" class="button_02" value="�� ��" onClick="checkSave()">
            
            
            </td>
      </tr>
	 
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title">
                  <td width="10%" align="center" nowrap>ȱ��</td>
                  <td width="40%"  nowrap >&nbsp;&nbsp;&nbsp;����</td>
                  <td width="10%" align="center" >ȱ��</td>
                  <td width="40%" nowrap >&nbsp;&nbsp;&nbsp;����</td>
                  
                </tr>
				<%
		             int count=0;
			         String trClass = "result_content"; 
			         int k=0;
		  
		  		%>
				
			       
                 <tr class="td1" onClick="changeTRBgColor(this)">
                    
                 <logic:iterate id="resultset" property="list[@type='QueryStudentSimple']">
                    
                    <td align="center">
				  <logic:present  id="resultset" property="QueryStudentSimple/StudentID">
				  	<html:checkbox id="resultset" name="list[@name='update']/StudentID" property="QueryStudentSimple/StudentID" />
				  </logic:present>				  </td>
                  <td >&nbsp;&nbsp;&nbsp;<bean:write id="resultset" property="QueryStudentSimple/operatorname" maxLength="100"/></td>
                  
                 	<%
                 	k++;
                 	if(k%2==0){
                 		count++;
                 		if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						
                 	 %>
                  </tr>
                  <tr class="<%=trClass %>" onClick="changeTRBgColor(this)">
					<%} %>
				</logic:iterate>
				<%if(k%2!=0){
				 %>
				 <td></td><td></td>
				 <%}%>
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
function checkSave() {
	var frm = document.forms[0];
	if(frm.elements["QueryStudentSimple/ClassID/criteria/value"].value=="-1"){
		alert("��ѡ��༶");
		return;
	}
	var startTime = frm.elements["Kaoqin/StartTime"].value;
	var endTime = frm.elements["Kaoqin/EndTime"].value;
	if(startTime==""||endTime==""){
		alert("��ѡ��ʱ��");
		return;
	}
	var startWubie =  frm.elements["Kaoqin/StartWubie"].value;
	var endWubie = frm.elements["Kaoqin/EndWubie"].value;
	if((startTime > endTime) ||((startTime == endTime) && (startWubie>endWubie)) ){
		alert("��һ��ʱ�䲻�ܴ��ڵڶ���ʱ��");
		return;
	}
	if(compdate()==1)
		return;
	if(window.confirm("���Ѿ��˶Ժ���Ϣ��ȷ���ύ��")){
			frm.action = frm.elements["saveaction"].value;
    		frm.submit();
	}
}

function compdate(){
var now= new Date();
var year=now.getYear();
var month=now.getMonth()+1;
var day=now.getDate();

 var a,ass,aD,aS;
 var b,bss,bD,bS;
 
 a=year+"-"+month+"-"+day; //�õ�����ʱ�䣻
 b=document.getElementById('Kaoqin/EndTime').value;     //�õ�ѡ��ʱ�䣻 
 ass=a.split("-");        //��"-"�ָ��ַ������������飻
 aD=new Date(ass[0],ass[1],ass[2]);  //��ʽ��ΪDate����;
 aS=aD.getTime(); //�õ��� 1970 �� 1 �� 1 �տ�ʼ���㵽 Date �����е�ʱ��֮��ĺ�����
 
 bss=b.split("-");
 
 bD=new Date(bss[0],bss[1],bss[2]);
 bS=bD.getTime();
 
 if(bS>=aS){
  alert("������ǰ�����������ʱ��!");
  return 1;
 }
 return 0;
 
}

</script>