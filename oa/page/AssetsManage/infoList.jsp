<%@include file="/internet/common.jsp"%>
 <logic:present property="Msg">
	 <script>
	 	alert("<bean:write property="Msg"/>");
	 </script>
 </logic:present>

<script type="text/javascript">
function DArray(rowLength, colLength) { 
var dArray = new Array(rowLength); 
//��ÿһ�ж����һ������colLength������ 
for (var i = 0; i < rowLength; i++) { 
dArray[i] = new Array(colLength); 
} 
return dArray; 
} 
var depList=new DArray(<bean:write property="rowCount"/>, 2); 
	<%
		int rowCount=0;
	%>
	<logic:iterate id="resultset" property="list[@type='TeachGroup']">
	depList[<%=rowCount %>][0]='<bean:write id="resultset" property="TeachGroup/orgID" />';
	depList[<%=rowCount %>][1]='<bean:write id="resultset" property="TeachGroup/orgName" />';
	<%
		rowCount++;
	%>
	</logic:iterate>
</script>
<body>

<form method="post" action="oa.prAssetsManage.infoList.do">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="5">

		<input type="hidden" name="queryaction" value="oa.prAssetsManage.infoList.do">
		<input type="hidden" name="addaction" value="oa.prAssetsManage.infoAdd.do">
		<input type="hidden" name="modifyaction" value="oa.prAssetsManage.infoModify.do">
		<input type="hidden" name="deleteaction" value="oa.prAssetsManage.infoDelete.do">
		<input type="hidden" name="viewaction" value="oa.prAssetsManage.infoView.do">
		<span id="printTable" style="visibility: hidden">�ʲ�������Ϣ��</spa>
		<html:hidden property="CAPT_CAPITALINFO/_order/col1/field"/>
		<html:hidden property="CAPT_CAPITALINFO/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
	  </td>
    </tr>
  </table>


<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
      
	  <tr>
            <td class="text" nowrap="nowrap">
             <a  title="���ղ��Ų�ѯ">�ʲ��������ţ�</a>
                <html:select property="CAPT_CAPITALINFO/OWNER" styleClass="input" onchange="select()"> 
              <html:option value="" >-��ѡ��-</html:option> <html:options property="list[@type='TeachGroup']/TeachGroup/orgID" labelProperty="list[@type='TeachGroup']/TeachGroup/orgName"/> 
              </html:select>
					<a title="�ʲ�����,�ʲ�����,Ʒ��,����ͺ� ">�ؼ��֣�</a>
					
				<html:text property="CAPT_CAPITALINFO/searchText" attributesText='class="input" size="15"'/>
				<html:hidden property="CAPT_CAPITALINFO/searchField" value="CAPTCODE,CAPTNAME,BRANDNAME,SPECIA"/>
   			    <input name="query" type="button" class="button_02" value="�� ѯ" onClick="talentsearch()">
				<qx:talentButton property="modify" type="button" styleClass="button_02" value="�� ��" onclick="talentmodify()" operation="DX_OASYS_ASSETSMANAGE_INFO.DX_OASYS_ASSETSMANAGE_INFO_MODIFY" />
				<qx:talentButton property="delete" type="button" styleClass="button_02" value="ɾ ��" onclick="talentdelete()" operation="DX_OASYS_ASSETSMANAGE_INFO.DX_OASYS_ASSETSMANAGE_INFO_DEL" />
              	
              	<input name="view" type="button" class="button_02" value="�� ��" onClick="talentview()">
				<input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text" >
		<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="3%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                 <td width="10%" align="center" nowrap id="CAPT_CAPITALINFO.PROVNAME" onClick="talentsort()">����</td>
          <td width="13%" align="center" nowrap id="CAPT_CAPITALINFO.CAPTNAME" onClick="talentsort()">�ʲ�����</td>
          <td width="13%" align="center" nowrap id="CAPT_CAPITALINFO.OWNER" onClick="talentsort()">ʹ�ò���</td>
          <td width="10%" align="center" nowrap id="CAPT_CAPITALINFO.BRANDNAME" onClick="talentsort()">Ʒ��</td>
          <td width="10%" align="center" nowrap id="CAPT_CAPITALINFO.SPECIA" onClick="talentsort()">����ͺ�</td>
          <td width="10%" align="center" nowrap id="CAPT_CAPITALINFO.HQDATE" onClick="talentsort()">�������</td>
          <td width="10%" align="center" nowrap id="CAPT_CAPITALINFO.PRICE" onClick="talentsort()">����۸�(Ԫ)</td>
          <td width="8%"  align="center" nowrap id="CAPT_CAPITALINFO.STATE" onClick="talentsort()">״̬</td>
          <td width="*"   align="center" nowrap id="CAPT_CAPITALINFO.REMARK" onClick="talentsort()">��ע</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='CAPT_CAPITALINFO']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="CAPT_CAPITALINFO/CAPTID"/>','true')">  
                <td align="center"> 
					<logic:present  id="resultset" property="CAPT_CAPITALINFO/CAPTID"> 
                  		<html:checkbox id="resultset" name="list[@name='update']/CAPT_CAPITALINFO/CAPTID" property="CAPT_CAPITALINFO/CAPTID" indexed="true"/> 
                  	</logic:present> 
				</td>
               <td nowrap="nowrap"><bean:write id="resultset" property="CAPT_CAPITALINFO/CAPTCODE"/></td>
		  	   <td nowrap="nowrap"><bean:write id="resultset" property="CAPT_CAPITALINFO/CAPTNAME" /></td>
		  	    <td nowrap="nowrap">
				<SCRIPT>
		  	     	var tmp='<bean:write id="resultset" property="CAPT_CAPITALINFO/OWNER" />';
		  	     	for(var i=0;i<depList.length;i++){
		  	     		if(tmp==depList[i][0]){
		  	     			document.write(depList[i][1]);
		  	     			break;
		  	     		}
		  	     	}
		  	     </SCRIPT>
				</td>
			   <td nowrap="nowrap"><bean:write id="resultset" property="CAPT_CAPITALINFO/BRANDNAME" /></td>
			   
			   <td nowrap="nowrap"><bean:write id="resultset" property="CAPT_CAPITALINFO/SPECIA" /></td>
			   <td nowrap="nowrap"><bean:write id="resultset" property="CAPT_CAPITALINFO/HQDATE" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>	
			   <td nowrap="nowrap"><bean:write id="resultset" property="CAPT_CAPITALINFO/PRICE"  language="zh" country="CN"/></td>
			   <td nowrap="nowrap">
			   <logic:equal property="CAPT_CAPITALINFO/STATE" id="resultset" value="1">
					    ����
					</logic:equal>
				 	<logic:equal property="CAPT_CAPITALINFO/STATE" id="resultset" value="2">
					    ʹ����
					</logic:equal>
					<logic:equal property="CAPT_CAPITALINFO/STATE" id="resultset" value="3">
					   ά��
					</logic:equal>
					<logic:equal property="CAPT_CAPITALINFO/STATE" id="resultset" value="4">
					   ����
					</logic:equal>
								
					</td>
					<td  nowrap="nowrap">
					<a title="<bean:write id="resultset" property="CAPT_CAPITALINFO/REMARK"/>"><bean:write id="resultset" property="CAPT_CAPITALINFO/REMARK" maxLength="15"/></a>
					</td>
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
<input type="hidden" name="title" value="�ʲ�����б�">
<input type="hidden" name="xmlfcc">
</form>
</body>
<script>
	loadOrderImg(document.forms[0],'CAPT_CAPITALINFO');
		function select(){
	   var frm = document.forms[0];  
	   if(frm.elements["PageCond/begin"] && frm.elements["PageCond/count"] && frm.elements["PageCond/length"]) {
		 frm.elements["PageCond/begin"].value=0;
		 frm.elements["PageCond/count"].value=-1;
		if(frm.elements["PageCond/talentlength"]) {
			frm.elements["PageCond/length"].value = frm.elements["PageCond/talentlength"].value;
		}else{
			frm.elements["PageCond/length"].value=10;
		}
		
		frm.action = "oa.prAssetsManage.infoList.do";
		
		event.srcElement.blur();
		frm.submit();
	}
	}
</script>