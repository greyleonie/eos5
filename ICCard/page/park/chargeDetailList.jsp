<%@include file="/internet/common.jsp"%>
<body >
<form method="post" action="ICCard.prPark.chargeDetailList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;һ��ͨ��&gt;ͣ������&gt;ͣ��������ϸ
              </td></tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="ICCard.prPark.chargeDetailList.do">
		
		<html:hidden property="QueryBusinessLogs/_order/col1/field"/>
		<html:hidden property="QueryBusinessLogs/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		
		<input type="hidden" name="Card/fromCardData0" />
		<input type="hidden" name="Card/fromCardData1" />
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
	   �ֿ��ˣ�
	    <html:text property="QueryBusinessLogs/UserName/criteria/value" attributesText='class="input"' size="15"/>
        
&nbsp; ����ţ�
	    <html:text property="QueryBusinessLogs/CardID/criteria/value" attributesText='class="input"' size="15"/>

&nbsp; ¼��ʱ�䣺�� <html:text property="QueryBusinessLogs/HappeningTime/criteria/min" attributesText='class="input" size="15"' readonly="true"/>
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onclick=calendar(document.forms[0].elements["QueryBusinessLogs/HappeningTime/criteria/min"],"yyyy-MM-dd")>
	    	�� <html:text property="QueryBusinessLogs/HappeningTime/criteria/max" attributesText='class="input" size="15"' readonly="true"/>
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onclick=calendar(document.forms[0].elements["QueryBusinessLogs/HappeningTime/criteria/max"],"yyyy-MM-dd")>
			<INPUT type="hidden" name="QueryBusinessLogs/HappeningTime/criteria/operator" value="between">
			<INPUT type="hidden" name="QueryBusinessLogs/HappeningTime/criteria/criteriaPattern" value="yyyy-MM-dd">

				</td>
	    </tr>
	  <tr>
	    <td height="30" class="text">
	    �������ͣ�
	    <html:select property="QueryBusinessLogs/BusinessTypeID/criteria/value" styleClass="input">
	    	<html:option value="">ȫ��</html:option>
	    	<html:option value="9">�±����ֽ��ֵ</html:option>
	    	<html:option value="10">�±���ˢ����ֵ</html:option>
	    	<html:option value="11">ͣ���ֽ�����</html:option>
	    	<html:option value="12">ͣ��ˢ������</html:option>
	    </html:select>
	   &nbsp; 
	  
<input name="B32" type="button" class="button_02" value="�� ѯ" onclick="talentquery()">
<input name="ieprint" type="button" class="button_02" value="�� ӡ" onclick="iePrint()">
<input name="export" type="button" class="button_02" value="�� ��" onclick="exporttoexcel()">
	���������<input type="checkbox" name="checkbox" onclick="servertoorder()" marked="">	
		</td>
	    </tr>
	  
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
          <tr class="td_title">
            <td width="4%" align="center" nowrap ><input type="checkbox" name="checkbox" value="checkbox" onclick="eosCheckAll(document.forms[0],this)" ></td>
            <td width="16%" align="center" nowrap id="QueryBusinessLogs.CardID" onclick="talentsort()">�����</td>
            <td width="16%" align="center" nowrap id="QueryBusinessLogs.UserName" onclick="talentsort()">�ֿ���</td>
            <td width="20%" align="center" nowrap id="QueryBusinessLogs.HappeningTime" onclick="talentsort()">�շ�ʱ��</td>
            <td width="14%" align="center" nowrap id="QueryBusinessLogs.BusinessMoney" onclick="talentsort()">�շѽ��</td>
            <td width="14%" align="center" nowrap id="QueryBusinessLogs.userTypeID" onclick="talentsort()">������</td>
            <td width="16%" align="center" nowrap id="QueryBusinessLogs.BusinessType" onclick="talentsort()">��������</td>
          </tr>
          <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
          <logic:iterate id="resultset" property="list[@type='QueryBusinessLogs']">
            <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
						String CardID= talent.core.TalentFunctions.getAvailStr(base.util.TalentContext.getValue(pageContext,"resultset","QueryBusinessLogs/CardID"));
						java.util.Hashtable h = new java.util.Hashtable();
						h.put("CardID", CardID);
						
			       %>
            <tr class="<%=trClass%>" onclick="changeTRBgColor(this)">
              <td nowrap align="center">
			  <html:checkbox name="list[@name='update']/BusinessLogs/BusinessLogsID" id="resultset" property="QueryBusinessLogs/BusinessLogsID" indexed="true" attributes="<%=h%>" /> </td>
	            <td nowrap align="center"><bean:write id="resultset" property="QueryBusinessLogs/CardID"/></td>
	            <td nowrap align="center"><bean:write  id="resultset" property="QueryBusinessLogs/UserName" /></td>
	            <td  nowrap align="center"><bean:write id="resultset" property="QueryBusinessLogs/HappeningTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd HH:mm:ss"/></td>
	            <td  nowrap align="center"><bean:write  id="resultset" property="QueryBusinessLogs/BusinessMoney" />Ԫ</td>
	            <td  nowrap align="center"><dict:write id="resultset" businTypeId="dx_userTypeID" property="QueryBusinessLogs/userTypeID"/></td>
	            <td  nowrap align="center"><bean:write id="resultset" property="QueryBusinessLogs/BusinessType"/></td>
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
<OBJECT ID="Card Control" WIDTH="" HEIGHT=""
	CLASSID="CLSID:AEA5E7AD-4A2F-44BE-88FE-0CF9A8E648D4"
	codebase="/internet/ActiveX/card.cab"
	name="cardcontrol"> </OBJECT>
</body>
<script>
 function cancelDeposit(){
 	if(window.confirm("ȷ��Ҫ������")){
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
				    	alert("ֻ��ѡ��һ����¼");
				    	return;
				    }
				    var CardID = obj.getAttribute("CardID");
				    var id=cardcontrol.GetCardID();
				    if(id==-2)
				    	return;
				    if(CardID!=id){
				    	alert("�ó�ֵ��¼�����������������ϵĿ���Ų����������Խ��в�����");
				    	return;
				    }
				    
				}
			}
			i++;
		}
		if(j==0){
			alert("������ѡ��һ����¼");
			return;
		}
		var errinfo="�˿���δע����߻�δʹ�ã�";
		var data2=cardcontrol.ReadData(7,2);
		if(data2.length==0){
			errinfo="�˿���δע���뵳У���⣡";
			alert(errinfo);
			return;
		}else if(data2==0 || isContainChar(data2,"f",30,false)){	//2��ȫΪ0��Ϊδע�Ῠ�����߳���25��f�ַ���Ҳ��Ϊδע�Ῠ
			errinfo="�˿���δ����ʹ�ã��뷢�����ٳ�ֵ��";
			alert(errinfo);
			return;
		}
		var data0=cardcontrol.ReadData(7,0);
		var data1=cardcontrol.ReadData(7,1);
		if(data0.length==0){
			alert(errinfo);
		}
		else if(data1.length==0){
			alert(errinfo);
		}else{
			frm.elements["Card/fromCardData0"].value=data0;
			frm.elements["Card/fromCardData1"].value=data1;
			fid = getChechedValue(frm);
			frm.action = frm.elements["cancelaction"].value;
			frm.action += "?fid=" + fid;
    		frm.submit();
    	}
 	}
 }

	function isContainChar(srcString,chr,len,mode){
		rtv = false;
		match = 0;
		for(i=0;i<srcString.length;i++){
			if (mode){
				if( chr==srcString.charAt(i)){
					match++;
				}
			}else{
				if(chr.toLowerCase()==srcString.charAt(i).toLowerCase()){
					match++;
				}
			}
		}
		if(match>=len){
			rtv = true;
		}
		return rtv;
	}

</script>