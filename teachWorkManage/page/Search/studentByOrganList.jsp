<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="teachWorkManage.prSearch.studentByOrganList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">�������&gt;��ѯͳ�ơ�&gt;��ѵ�����ѯ</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
      	<input type="hidden" name="queryaction" value="teachWorkManage.prSearch.studentByOrganList.do">
		<html:hidden property="StudentByOrgan/_order/col1/field"/>
		<html:hidden property="StudentByOrgan/_order/col1/asc" />
		<html:hidden property="StudentByOrgan/IsQuit" value="0"/>
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
	  </td>
    </tr>
  </table>


<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
    
    <tr><td>
    
       <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" >
         <tr>
          
		   <td class="td2" align="right">��&nbsp;&nbsp;&nbsp;&nbsp;����</td> 
			<td class="td1"  >
				       <input type='text' name="StudentByOrgan/ClassName"  value='<bean:write  property="StudentByOrgan/ClassName"/>'   id="text1"  size="35" class="input"  />
				       &nbsp;<input class="button_02" type="button" id="bt1" value="ѡ��" onclick="selectClass()"/>

             	</td>
             	  <td  class="td2" align="right" width="20%">	 ��&nbsp;&nbsp;&nbsp;&nbsp;���� </td>
			   <td class="td1"  width="30%"><html:text property="StudentByOrgan/StudentName" attributesText='class="input"' size="35"/>
</td>
             	
             	</tr>
           <tr>

		  <td class="td2" align="right">ְ&nbsp;&nbsp;&nbsp;&nbsp;�� </td> 
			<td class="td1" ><html:text property="StudentByOrgan/Duty" attributesText='class="input" size="35"'/>

             	</td>
			 <td  class="td2" align="right">ְ&nbsp;&nbsp;&nbsp;&nbsp;���� </td>
			<td class="td1" colspan="3"><dict:select businTypeId="dx_dutylevel" property="StudentByOrgan/DutyLevel" nullOption="true" nullLabel="--��ѡ��--" /> 
			   </td>
			   
           </tr>
           <tr>
            <td  class="td2" align="right"> ��ѵ��λ�� </td>
			<td class="td1"><input type='text' name="StudentByOrgan/WorkingOrgan"  value='<bean:write  property="StudentByOrgan/WorkingOrgan"/>'   id="text2"  size="35" class="input"  />
				       &nbsp;<input class="button_02" type="button" id="bt2" value="ѡ��" onclick="selectOrgan()"/>
			</td>
		  <td class="td2" align="right">��ѵʱ�䣺</td> 
			<td class="td1" >��<html:text property="StudentByOrgan/min" attributesText='class="input" size="10"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["StudentByOrgan/min"],"yyyy-MM-dd")> 
                ��<html:text property="StudentByOrgan/max" attributesText='class="input" size="10"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["StudentByOrgan/max"],"yyyy-MM-dd")> 
             	</td></tr>
        </table>
    
    
    </td></tr>
      <tr>
        <td class="text">
          <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" >
          <tr> 
            <td  align="left" nowrap class="text">
            
			    ���������<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""> 
			    <input name="query" type="button" class="button_02" value="�� ѯ" onclick="talentquery()"> 
				<input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">
				
			</td>
          </tr>
        </table>
         </td>
      </tr>
     
	  <tr>
            <td  class="reportTitle" align="center" >
            <span id="printTable">�μӵ�У��ѵ��Ա��</span>
            

            </td>
    </tr>
     
      <tr>
        <td valign="top" class="text">

		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
		<tr>
		<td colspan="12" class="td1">
		<b>�쵼ְ��</b>&nbsp;&nbsp;����(<bean:write property="DutyLevel/DutyLevel1"/>)
				&nbsp;&nbsp;����(<bean:write property="DutyLevel/DutyLevel3"/>)
				&nbsp;&nbsp;����(<bean:write property="DutyLevel/DutyLevel5"/>)
				&nbsp;&nbsp;����(<bean:write property="DutyLevel/DutyLevel7"/>)
				&nbsp;&nbsp;����(<bean:write property="DutyLevel/DutyLevel9"/>)
				&nbsp;&nbsp;����(<bean:write property="DutyLevel/DutyLevel11"/>)
				
		<br/><b>���쵼ְ��</b>
				&nbsp;&nbsp;Ѳ��Ա(<bean:write property="DutyLevel/DutyLevel2"/>)
				&nbsp;&nbsp;����Ѳ��Ա(<bean:write property="DutyLevel/DutyLevel4"/>)
				&nbsp;&nbsp;����Ա(<bean:write property="DutyLevel/DutyLevel6"/>)
				&nbsp;&nbsp;�������Ա(<bean:write property="DutyLevel/DutyLevel8"/>)
				&nbsp;&nbsp;���ο�Ա(<bean:write property="DutyLevel/DutyLevel10"/>)
				&nbsp;&nbsp;�����ο�Ա(<bean:write property="DutyLevel/DutyLevel12"/>)
				&nbsp;&nbsp;��Ա(<bean:write property="DutyLevel/DutyLevel13"/>)
				&nbsp;&nbsp;����Ա(<bean:write property="DutyLevel/DutyLevel14"/>)
				&nbsp;&nbsp;����(<bean:write property="DutyLevel/DutyLevel15"/>)

		
		</td>
		
		</tr>
                <tr class="td_title"> 
                  <td width="5%" align="center" nowrap id="StudentByOrgan.StudentName" onClick="talentsort()">����</td>
                  <td width="20%" align="center" nowrap id="StudentByOrgan.WorkingOrgan" onClick="talentsort()">������λ</td>
                  <td width="5%" align="center" nowrap id="StudentByOrgan.Duty" onClick="talentsort()">ְ��</td>
                  <td width="5%" align="center" nowrap id="StudentByOrgan.DutyLevel" onClick="talentsort()">����</td>
                  <td width="5%" align="center" nowrap id="StudentByOrgan.Sex" onClick="talentsort()">�Ա�</td>
                  <td width="5%" align="center" nowrap id="StudentByOrgan.Age" onClick="talentsort()">����</td>
                  <td width="5%" align="center" nowrap id="StudentByOrgan.DegreeID" onClick="talentsort()">�Ļ��̶�</td>
                  <td width="25%" align="center" nowrap id="StudentByOrgan.ClassName" onClick="talentsort()">���ڰ༶</td>
                  <td width="5%" align="center" nowrap id="StudentByOrgan.HeadTeacherName" onClick="talentsort()">������</td>
                  <td width="10%" align="center" nowrap id="StudentByOrgan.BeginTime" onClick="talentsort()">��ѵʱ��</td>
                  <td width="5%" align="center" nowrap id="StudentByOrgan.StudyDay" onClick="talentsort()">ѧϰ��</td>
                  <td width="5%" align="center" nowrap id="StudentByOrgan.Remark" onClick="talentsort()">��ע</td>
                </tr>
				<%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
				<logic:iterate id="resultset" property="list[@type='StudentByOrgan']">
					<%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
                 <tr class="<%=trClass%>" onClick="changeTRBgColor(this)"> 
                  <td nowrap="nowrap" >&nbsp;<bean:write id="resultset" property="StudentByOrgan/StudentName"/></td>
                  <td >&nbsp;<bean:write id="resultset" property="StudentByOrgan/WorkingOrgan"/></td>
                  <td >&nbsp;<bean:write id="resultset" property="StudentByOrgan/Duty" /></td>
                  <td >&nbsp;<dict:write businTypeId="dx_dutylevel" id="resultset" property="StudentByOrgan/DutyLevel"  /></td>
                  <td >&nbsp;<dict:write businTypeId="BNDICT_gender" property="StudentByOrgan/Sex" id="resultset"/></td>
                  <td >&nbsp;<bean:write id="resultset" property="StudentByOrgan/Age" /></td>
                  <td >&nbsp;<dict:write businTypeId="dx_education" id="resultset" property="StudentByOrgan/DegreeID"  /></td>
                  <td >&nbsp;<bean:write id="resultset" property="StudentByOrgan/ClassName" /></td>
                  <td nowrap="nowrap">&nbsp;<bean:write id="resultset" property="StudentByOrgan/HeadTeacherName" /></td>
				  <td >&nbsp;<bean:write id="resultset" property="StudentByOrgan/BeginTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
				  	�� <bean:write id="resultset" property="StudentByOrgan/EndTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
				  </td>
                  <td nowrap="nowrap">&nbsp;<bean:write id="resultset" property="StudentByOrgan/StudyDay" /></td>
                   <td nowrap="nowrap">&nbsp;<bean:write id="resultset" property="StudentByOrgan/Remark" /></td>
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
	loadOrderImg(document.forms[0],'StudentByOrgan');
</script>


<script>

  function selectOrgan(){ 
   	var frm =document.forms[0];
     var refreshMark = new Date().getTime();
     var loc="teachWorkManage.prSearch.selectOrgan.do?refreshMark="+refreshMark;
     var acceptValue="";
     try{
    acceptValue= window.showModalDialog(loc,"","dialogWidth:400px;DialogHeight=550px;status:no;scroll:auto");      
        }catch(e){}
        
    if(acceptValue == "undefined"){
    	acceptValue="";
    }
        frm["StudentByOrgan/WorkingOrgan"].value=acceptValue;

 
 }
 

  function selectClass(){ 
   	var frm =document.forms[0];
     var refreshMark = new Date().getTime();
     var loc="teachWorkManage.prSearch.selectClass.do?refreshMark="+refreshMark;
     var acceptValue="";
     try{
    acceptValue= window.showModalDialog(loc,"","dialogWidth:400px;DialogHeight=550px;status:no;scroll:auto");      
        }catch(e){}
        frm["StudentByOrgan/ClassName"].value=acceptValue;
    if(acceptValue == "undefined"){
    	acceptValue="";
    }
 
 }
</script>