<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="teachWorkManage.prNetCenter.videoUnRegList.do" name="opeForm">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;�������Ľ�ѧ����&gt;<span id="printTable">¼�����ϣ�δ�Ǽǣ�</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="teachWorkManage.prNetCenter.videoUnRegList.do">
		<html:hidden property="VideoUnReg/_order/col1/field"/>
		<html:hidden property="VideoUnReg/_order/col1/asc" />
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
			
            ���ڣ� ��
            	<html:text property="VideoUnReg/RecordTime/criteria/min" attributesText='class="input" size="10"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["VideoUnReg/RecordTime/criteria/min"],"yyyy-MM-dd")> 
           		��
           		<html:text property="VideoUnReg/RecordTime/criteria/max" attributesText='class="input" size="10"' readonly="true"/>
          	    <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["VideoUnReg/RecordTime/criteria/max"],"yyyy-MM-dd")>
			    <input type="hidden" name="VideoUnReg/RecordTime/criteria/operator" value="between"/>
			    <input type="hidden" name="VideoUnReg/RecordTime/criteria/criteriaPattern" value="yyyy-MM-dd"/>
			 �ؼ��֣���Ŀ�������ˣ���<html:text property="VideoUnReg/seachText" attributesText='class="input" size="20"' />
			 <br/>
			 
                <input name="query" type="button" class="button_02" value="�� ѯ" onClick="talentquery()">  
				<input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">	
				���������<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""> 		
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="5%" align="center"  nowrap >��� </td>
                  <td width="10%" align="center"  nowrap id="VideoUnReg.RecordTime" onClick="talentsort()">��¼ʱ��</td>
                  <td width="50%" align="center"  nowrap id="VideoUnReg.Title" onClick="talentsort()">��Ŀ</td>
                  <td width="10%" align="center"  nowrap id="VideoUnReg.Speaker" onClick="talentsort()">������</td>
                  <td width="10%" align="center"  nowrap id="VideoUnReg.Org" onClick="talentsort()">��λ</td>
                  <td width="10%"  align="center"  nowrap id="VideoUnReg.Post" onClick="talentsort()">ְ��</td>
                  <td width="5%"  align="center"  nowrap >����</td>
                </tr>
				<%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
				<logic:iterate id="resultset" property="list[@type='VideoUnReg']">
					<%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
                <tr class="<%=trClass%>" onClick="changeTRBgColor(this)"> 
                  <input type="hidden" name="VideoRegister<%=count %>/PlanType"  value="<bean:write id="resultset" property="VideoUnReg/PlanType" />"/>
				  <input type="hidden" name="VideoRegister<%=count %>/PlanID"  value="<bean:write id="resultset" property="VideoUnReg/PlanID" />"/>
				  <input type="hidden" name="VideoRegister<%=count %>/RecordTime"  value="<bean:write id="resultset" property="VideoUnReg/RecordTime" formatType="yyyy-MM-dd"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" />"/>
				  <input type="hidden" name="VideoRegister<%=count %>/Title"  value="<bean:write id="resultset" property="VideoUnReg/Title" />"/>
				  <input type="hidden" name="VideoRegister<%=count %>/Speaker"  value="<bean:write id="resultset" property="VideoUnReg/Speaker" />"/>
				  <input type="hidden" name="VideoRegister<%=count %>/Org"  value="<bean:write id="resultset" property="VideoUnReg/Org" />"/>
				  <input type="hidden" name="VideoRegister<%=count %>/Post"  value="<bean:write id="resultset" property="VideoUnReg/Post" />"/>
                  <td   align="center"  ><%=count %></td>
				  <td   align="center"  nowrap="nowrap"><bean:write id="resultset" property="VideoUnReg/RecordTime" formatType="yyyy-MM-dd"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" /></td>
				  <td   align="center"  ><bean:write id="resultset" property="VideoUnReg/Title"  /></td>
                  <td   align="center"  ><bean:write id="resultset" property="VideoUnReg/Speaker" /></td>
                  <td   align="center"  ><bean:write id="resultset" property="VideoUnReg/Org" /></td>
                  <td   align="center"  ><bean:write id="resultset" property="VideoUnReg/Post" /></td>    
                  <td   align="center"  ><input name="checkIn<%=count %>" type="button" class="button_02" value="�� ��" onClick="checkIn(<%=count %>)"/></td>
                  

                </tr>
				</logic:iterate>
                
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
<script type="text/javascript">
<!--

//-->
function checkIn(index){
	var PlanType_name="VideoRegister"+index+"/PlanType"; 
	var PlanID_name="VideoRegister"+index+"/PlanID";
	var RecordTime_name="VideoRegister"+index+"/RecordTime"; 
	var Title_name="VideoRegister"+index+"/Title";
	var Speaker_name="VideoRegister"+index+"/Speaker";  
	var Org_name="VideoRegister"+index+"/Org";
	var Post_name="VideoRegister"+index+"/Post"; 
	var PlanType_value=document.forms[0].elements[PlanType_name].value;
	var PlanID_value=document.forms[0].elements[PlanID_name].value;
	var RecordTime_value=document.forms[0].elements[RecordTime_name].value;
	var Title_value=document.forms[0].elements[Title_name].value;
	var Speaker_value=document.forms[0].elements[Speaker_name].value;
	var Org_value=document.forms[0].elements[Org_name].value;
	var Post_value=document.forms[0].elements[Post_name].value;

	window.location.href="teachWorkManage.prNetCenter.videoRegAdd.do?VideoRegister/PlanType="+PlanType_value+"&VideoRegister/PlanID="+PlanID_value+"&VideoRegister/RecordTime="+RecordTime_value+"&VideoRegister/Title="+Title_value+"&VideoRegister/Speaker="+Speaker_value+"&VideoRegister/Org="+Org_value+"&VideoRegister/Post="+Post_value;
}
</script>