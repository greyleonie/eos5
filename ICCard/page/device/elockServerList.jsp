<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="ICCard.prDevice.elockServerList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;һ��ͨ��&gt;ˢ���ն˹���&gt;������������
              </td></tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="ICCard.prDevice.elockServerList.do">
		<input type="hidden" name="addaction" value="ICCard.prDevice.elockServerAdd.do">
		<input type="hidden" name="modifyaction" value="ICCard.prDevice.elockServerModify.do">
		<input type="hidden" name="deleteaction" value="ICCard.prDevice.elockServerDelete.do">
		<input type="hidden" name="viewaction" value="">
		<html:hidden property="ElockServer/_order/col1/field"/>
		<html:hidden property="ElockServer/_order/col1/asc" />
		<html:hidden property="ElockServer/elockServerID" />
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
<input name="B32" type="button" class="button_02" value="�� ѯ" onClick="talentquery()">
<qx:talentButton property="add" type="button" styleClass="button_02" value="�� ��" onclick="talentadd()" operation="DX_CARD_MANAGE_DEVICE_ELOCKSERVER.DX_CARD_MANAGE_DEVICE_ELOCKSERVER_ADD"/>
<qx:talentButton property="modify" type="button" styleClass="button_02" value="�� ��" onclick="talentmodify()" operation="DX_CARD_MANAGE_DEVICE_ELOCKSERVER.DX_CARD_MANAGE_DEVICE_ELOCKSERVER_MODIFY"/>
<qx:talentButton property="del" type="button" styleClass="button_02" value="ɾ ��" onclick="elockserverdel()" operation="DX_CARD_MANAGE_DEVICE_ELOCKSERVER.DX_CARD_MANAGE_DEVICE_ELOCKSERVER_DEL"/>
<input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">
&nbsp;���������<input type="checkbox" name="checkbox" onClick="servertoorder()" marked="">
</td>
	    </tr>
	  
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
          <tr class="td_title">
            <td width="6%" align="center" nowrap><input type="checkbox" name="checkbox2" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked="">            </td>
            <td width="8%" align="center" nowrap id="ElockServer.ElockServerID" onClick="talentsort()">���������</td>
            <td width="20%" align="center" nowrap id="ElockServer.IP" onClick="talentsort()">������IP</td>
            <td width="14%" align="center" nowrap id="ElockServer.Mask" onClick="talentsort()">��������</td>
            <td width="14%" align="center" nowrap id="ElockServer.Gateway" onClick="talentsort()">����</td>
            <td width="20%" align="center" nowrap id="ElockServer.DeviceTypeID" onClick="talentsort()">�豸����</td>
            <td width="8%" align="center" nowrap id="ElockServer.MinReaderID" onClick="talentsort()">��С�豸��</td>
            <td width="8%" align="center" nowrap id="ElockServer.MaxReaderID" onClick="talentsort()">����豸��</td>
            <td width="20%" align="center" nowrap id="ElockServer.LastUpdatingTime" onClick="talentsort()">����´�ʱ��</td>
            <td width="8%" align="center" nowrap id="ElockServer.Enable" onClick="talentsort()">�Ƿ���Ч</td>
          </tr>
          <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
          <logic:iterate id="resultset" property="list[@type='ElockServer']">
            <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
						String Enable= talent.core.TalentFunctions.getAvailStr(base.util.TalentContext.getValue(pageContext,"resultset","ElockServer/Enable"));
						java.util.Hashtable h = new java.util.Hashtable();
						h.put("Enable", Enable);
						
			       %>
            <tr class="<%=trClass%>" onClick="changeTRBgColor(this)">
	            <td align="center">
	          
	           <html:checkbox name="list[@name='update']/ElockServer/ElockServerID" id="resultset" property="ElockServer/ElockServerID" indexed="true" attributes="<%=h%>" /> 
	                       </td>
	        	<td nowrap align="center"><bean:write id="resultset" property="ElockServer/ElockServerID"/></td>
	            <td nowrap align="center"><bean:write  id="resultset" property="ElockServer/IP"/></td>
	            <td nowrap align="center"><bean:write id="resultset" property="ElockServer/Mask"/></td>
	            <td nowrap align="center"><bean:write  id="resultset" property="ElockServer/Gateway"/></td>
	            <td nowrap align="center"><dict:write  id="resultset" property="ElockServer/DeviceTypeID" businTypeId="dx_deviceTypeID"/></td>
	            <td  nowrap align="center"><bean:write id="resultset" property="ElockServer/MinReaderID"/></td>
	            <td  nowrap align="center"><bean:write id="resultset" property="ElockServer/MaxReaderID"/></td>
	            <td  nowrap align="center"><bean:write id="resultset" property="ElockServer/LastUpdatingTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd HH:mm:ss"/></td>
	            <td  nowrap align="center"><dict:write  id="resultset" property="ElockServer/Enable" businTypeId="dx_01"/></td>
            </tr>
          </logic:iterate>
        </table>
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="30" class="text">
			  <script>
				PageCond(document.forms[0]);
		  </script>			  </td>
            </tr>
          </table>		  </td>
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
 function elockserverdel(){
 	if(window.confirm("ȷ��Ҫɾ����")){
 		var frm =document.forms[0];
 		var i=0;
	    var j=0;
		eles = frm.elements;
		while(i<eles.length){
			obj= eles[i];
			if(obj.type == "checkbox" && !obj.disabled && obj.getAttribute("marked")==null){
				if(obj.checked){
				    var Enable = obj.getAttribute("Enable");
				    if(Enable!=1){
				    	alert("��ѡ�е�����������������ֱ��ɾ����");
				    	return;
				    }
				    j++;
				}
			}
			i++;
		}
		if(j==0){
			alert("������ѡ��һ����¼");
			return;
		}
		frm.action = frm.elements["deleteaction"].value;
    	frm.submit();
 	}
 }

</script>