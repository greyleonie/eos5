<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="ICCard.prDevice.posList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;һ��ͨ��&gt;ˢ���ն˹���&gt;�շѻ�����              </td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="ICCard.prDevice.posList.do">
		<input type="hidden" name="collectaction" value="ICCard.prDevice.posCollecting.do">
		<input type="hidden" name="modifyaction" value="ICCard.prDevice.posModify.do">
		
		<html:hidden property="POS/_order/col1/field"/>
		<html:hidden property="POS/_order/col1/asc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
	  </td>
    </tr>
  </table>


<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
      
	  <tr>
	    <td height="30" class="text">
	  
<qx:talentButton property="modify" type="button" styleClass="button_02" value="�� ��" onclick="talentmodify()" operation="DX_CARD_MANAGE_DEVICE_POS.DX_CARD_MANAGE_DEVICE_POS_MODIFY"/>
<qx:talentButton property="collect" type="button" styleClass="button_02" value="�ز�����" onclick="collecting(2)" operation="DX_CARD_MANAGE_DEVICE_POS.DX_CARD_MANAGE_DEVICE_POS_CCSZ"/>
<qx:talentButton property="collect" type="button" styleClass="button_02" value="�ɼ�����" onclick="collecting(1)" operation="DX_CARD_MANAGE_DEVICE_POS.DX_CARD_MANAGE_DEVICE_POS_CZSJ"/>
<input name="ieprint" type="button" class="button_02" value="�� ӡ" onclick="iePrint()">
<input name="export" type="button" class="button_02" value="�� ��" onclick="exporttoexcel()">		
���������<input type="checkbox" name="checkbox" onclick="servertoorder()" marked="">

		</td>
	    </tr>
	  
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text"><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
          <tr class="td_title">
            <td width="4%" align="center" nowrap ><input type="checkbox" name="checkbox2" value="checkbox" onclick="eosCheckAll(document.forms[0],this)" marked=""></td>
            <td width="10%" align="center" nowrap id="POS.operatorname" onclick="talentsort()">�շѻ����</td>
            <td width="22%" align="center" nowrap id="POS.Sex" onclick="talentsort()">˵��</td>
            <td width="13%" align="center" nowrap id="POS.WorkingOrgan" onclick="talentsort()">���ӱ���</td>
            <td width="8%" align="center" nowrap id="POS.CardID" onclick="talentsort()">�Ƿ�����</td>
            <td width="13%" align="center" nowrap id="POS.CardID" onclick="talentsort()">��ǰ���Ѽ�¼��</td>
            <td width="15%" align="center" nowrap id="POS.CardID" onclick="talentsort()">�������ʱ��</td>
            <td width="15%" align="center" nowrap id="POS.CardID" onclick="talentsort()">����ɼ�ʱ��</td>
          </tr>
          <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
          <logic:iterate id="resultset" property="list[@type='POS']">
            <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
						String Enable= talent.core.TalentFunctions.getAvailStr(base.util.TalentContext.getValue(pageContext,"resultset","POS/Enable"));
						java.util.Hashtable h = new java.util.Hashtable();
						h.put("Enable", Enable);
			       %>
           <tr class="<%=trClass%>" onclick="changeTRBgColor(this)">
	            <td nowrap align="center">
	            <html:checkbox name="list[@name='update']/POS/POSID" id="resultset" property="POS/POSID" indexed="true" attributes="<%=h%>" />	            </td>
	        	<td nowrap align="center">
	        	<logic:equal id="resultset" property="POS/Enable" value="0">
	        		<font color="red">
	        		<bean:write id="resultset" property="POS/POSSN"/>
	        		</font>
	        	</logic:equal>
	        	<logic:notEqual id="resultset" property="POS/Enable" value="0">
	        		<bean:write id="resultset" property="POS/POSSN"/>
	        	</logic:notEqual>
	        	</td>
	            <td nowrap align="center"><bean:write id="resultset" property="POS/Remark"/></td>
	            <td nowrap align="center" >
				<SCRIPT>
					var temp='<bean:write id="resultset" property="POS/IP_COM"/>';
					if(temp.length==1){
						temp="COM"+temp;
					}
					document.write(temp);
				</SCRIPT>
				</td>
	            <td align="center"  nowrap>&nbsp;</td>
	            <td align="center"  nowrap>&nbsp;</td>
	            <td align="center"  nowrap>
					<bean:write  id="resultset" property="POS/LastUpdatingTimeTemp"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd HH:mm:ss"/>			  </td>
	            <td align="center"  nowrap>
                 <bean:write  id="resultset" property="POS/LastCollectingTimeTemp"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd HH:mm:ss"/>			  </td>
            </tr>
          </logic:iterate>
        </table>
   	    </td>
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
<script >
function collecting(n){
	var frm =document.forms[0];
 	var i=0;
	var j=0;
	eles = frm.elements;
	while(i<eles.length){
			obj= eles[i];
			if(obj.type == "checkbox" && !obj.disabled && obj.getAttribute("marked")==null){
				if(obj.checked){
					j++;
					if(j>1){
						alert("ֻ��ѡ��һ����¼��");
				    	return ;
					
					}
				    var Enable = obj.getAttribute("Enable");
				    if(Enable!="1"){
				    	alert("���շѻ�����ʹ���У��޷��ɼ����ݣ�");
				    	return ;
				    }
				}
			}
			i++;
		}
		if(j==0){
			alert("��ѡ��һ����¼");
			return "";
		}
		if(window.confirm("ȷ��Ϊ���շѻ����/���²ɼ�������")){
			var fid = getChechedValue(frm);
			frm.action = frm.elements["collectaction"].value;
			frm.action += "?fid=" + fid+"&tasktypeid="+n;
    		frm.submit();
		}
		
		
	
}
</script>