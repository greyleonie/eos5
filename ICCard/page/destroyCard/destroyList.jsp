<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="ICCard.prDestroyCard.destroyList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;һ��ͨ��&gt;��ע����&gt;������¼�б� </td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="ICCard.prDestroyCard.destroyList.do">
		<input type="hidden" name="addaction" value="ICCard.prDestroyCard.destroyCard.do">
		<input type="hidden" name="deleteaction" value="ICCard.prDestroyCard.destroyCardDelete.do">
		<input type="hidden" name="viewaction" value="">
		<html:hidden property="QueryDestroyCard/_order/col1/field"/>
		<html:hidden property="QueryDestroyCard/_order/col1/asc" />
		
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
	    <td height="30" class="text">�ֿ��ˣ�
	    <html:text property="QueryDestroyCard/UserName/criteria/value" attributesText='class="input"' size="15"/>
        
&nbsp; �ѷ��ط��¿���
<html:select property="QueryDestroyCard/IsReIssue/criteria/value">
<html:option value="-1">��ѡ��</html:option>
<html:option value="0">��</html:option>
<html:option value="1">��</html:option>
</html:select>

	  
<input name="B32" type="button" class="button_02" value="�� ѯ" onclick="talentquery()">
&nbsp;���������<input type="checkbox" name="checkbox" onclick="servertoorder()" marked=""></td>
	    </tr>
	  <tr>
	    <td height="30" class="text">
		<qx:talentButton property="add" type="button" styleClass="button_02" value="�����Ǽ�" onclick="talentadd()" operation="DX_CARD_MANAGE_DESTROY.DX_CARD_MANAGE_DESTROY_ADD"/>
		<qx:talentButton property="gengxin" type="button" styleClass="button_02" value="�������" onclick="updateGroup()" operation="DX_CARD_MANAGE_DESTROY.DX_CARD_MANAGE_DESTROY_GXYE"/>
		<qx:talentButton property="reIssue" type="button" styleClass="button_02" value="�ط��¿�" onclick="reIssueCard()" operation="DX_CARD_MANAGE_DESTROY.DX_CARD_MANAGE_DESTROY_REISSUE"/>
		<qx:talentButton property="virement1" type="button" styleClass="button_02" value="���ת��" onclick="cardVirement(1)" operation="DX_CARD_MANAGE_DESTROY.DX_CARD_MANAGE_DESTROY_YEZC"/>
		<qx:talentButton property="virement2" type="button" styleClass="button_02" value="�� ��" onclick="cardVirement(2)" operation="DX_CARD_MANAGE_DESTROY.DX_CARD_MANAGE_DESTROY_TK"/>
<qx:talentButton property="del" type="button" styleClass="button_02" value="ɾ ��" onclick="carddel()" operation="DX_CARD_MANAGE_DESTROY.DX_CARD_MANAGE_DESTROY_DEL"/>
<input name="ieprint" type="button" class="button_02" value="�� ӡ" onclick="iePrint()">
<input name="export" type="button" class="button_02" value="�� ��" onclick="exporttoexcel()"></td>
	    </tr>
	  
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
          <tr class="td_title">
            <td width="4%" align="center" nowrap><input type="checkbox" name="checkbox2" value="checkbox" onclick="eosCheckAll(document.forms[0],this)" marked="">            </td>
            <td width="12%" align="center" nowrap id="QueryDestroyCard.CardCoverNO" onclick="talentsort()">������</td>
            <td width="16%" align="center" nowrap id="QueryDestroyCard.UserName" onclick="talentsort()">�ֿ���</td>
            <td width="12%" align="center" nowrap id="QueryDestroyCard.ReasonID" onclick="talentsort()">����ԭ��</td>
            <td width="18%" align="center" nowrap id="QueryDestroyCard.DestroyTime" onclick="talentsort()">����ʱ��</td>
            <td width="10%" align="center" nowrap id="QueryDestroyCard.CardLastSumCache" onclick="talentsort()">�����</td>
            <td width="12%" align="center" nowrap id="QueryDestroyCard.OperatorName" onclick="talentsort()">����Ա</td>
            <td width="16%" align="center" nowrap id="QueryDestroyCard.IsReIssue" onclick="talentsort()">�Ƿ������·��¿�</td>
          </tr>
          <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
          <logic:iterate id="resultset" property="list[@type='QueryDestroyCard']">
            <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
						String IsReIssue= talent.core.TalentFunctions.getAvailStr(base.util.TalentContext.getValue(pageContext,"resultset","QueryDestroyCard/IsReIssue"));
						String CardLastSumCache= talent.core.TalentFunctions.getAvailStr(base.util.TalentContext.getValue(pageContext,"resultset","QueryDestroyCard/CardLastSumCache"));
						String UserID= talent.core.TalentFunctions.getAvailStr(base.util.TalentContext.getValue(pageContext,"resultset","QueryDestroyCard/UserID"));
						java.util.Hashtable h = new java.util.Hashtable();
						h.put("IsReIssue", IsReIssue);
						h.put("CardLastSumCache", CardLastSumCache);
						h.put("UserID", UserID);
						
			       %>
            <tr class="<%=trClass%>" onclick="changeTRBgColor(this)">
	            <td align="center">
	          
	           <html:checkbox name="list[@name='update']/DestroyCard/DestroyCardID" id="resultset" property="QueryDestroyCard/DestroyCardID" indexed="true" attributes="<%=h%>" />	                       </td>
	        	<td nowrap align="center"><bean:write id="resultset" property="QueryDestroyCard/CardCoverNO"/></td>
	            <td nowrap align="center"><bean:write  id="resultset" property="QueryDestroyCard/UserName" /></td>
	            <td nowrap align="center"><dict:write  id="resultset" property="QueryDestroyCard/ReasonID" businTypeId="dx_DestroyCard_ReasonID"/></td>
	            <td  nowrap align="center"><bean:write id="resultset" property="QueryDestroyCard/DestroyTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd HH:mm:ss"/></td>
	            <td  nowrap align="center">
	            
							<logic:equal id="resultset" property="QueryDestroyCard/IsReIssue" value="1">
								<bean:write  id="resultset" property="QueryDestroyCard/CardLastSumCache" />
							</logic:equal>
							<logic:greaterEqual id="resultset" property="QueryDestroyCard/CardLastSumCache" value="0">
								<logic:equal id="resultset" property="QueryDestroyCard/IsReIssue"  value="0">
									<font color="#FF0000">
										<bean:write  id="resultset" property="QueryDestroyCard/CardLastSumCache" />
									</font>
								</logic:equal>
							</logic:greaterEqual>
							<logic:lessThan id="resultset" property="QueryDestroyCard/CardLastSumCache" value="0">
								(δ����)
							</logic:lessThan>
	            
	           </td>
	            <td  nowrap align="center"><bean:write id="resultset" property="QueryDestroyCard/OperatorName"/></td>
	            <td align="center"  nowrap>
	            <logic:present id="resultset" property="QueryDestroyCard/IsReIssue">
	            	<logic:equal id="resultset" property="QueryDestroyCard/IsReIssue" value="1">��</logic:equal>
	            	<logic:equal id="resultset" property="QueryDestroyCard/IsReIssue" value="0">
	            		<font color="#FF0000">��</font>	            	</logic:equal>
	            </logic:present>	              </td>
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
 function reIssueCard(){
 	var fid=checkCard();
 	if(fid.length>0){
 		window.open("ICCard.prIssueCard.issueCard.do?fid="+fid,"","height=250,width=460,top=130,left=300");
    }
 }
 
 function cardVirement(n){
 	var frm =document.forms[0];
 	if(checkCard().length>0){
 		fid = getChechedValue(frm);
 		var src="ICCard.prDestroyCard.cardVirement.do?QueryDestroyCard/DestroyCardID="+fid+"&QueryDestroyCard/Type="+n;
 		window.open(src,"","height=250,width=460,top=130,left=300");
    }
 
 }

function updateGroup(){
			location.href="ICCard.prDestroyCard.updateBalance.do";
}

function checkCard(){
	var frm =document.forms[0];
 	var i=0;
	var j=0;
	var UserID;
	eles = frm.elements;
	while(i<eles.length){
			obj= eles[i];
			if(obj.type == "checkbox" && !obj.disabled && obj.getAttribute("marked")==null){
				if(obj.checked){
				    j++;
				    if(j>1){
				    	alert("ֻ��ѡ��һ����¼");
				    	return "";
				    }
				    var IsReIssue = obj.getAttribute("IsReIssue");
				    if(IsReIssue!=0){
				    	alert("���ط��¿������ܲ�����");
				    	return "";
				    }
				    var CardLastSumCache = obj.getAttribute("CardLastSumCache");
				    if(CardLastSumCache<0){
				    	alert("����δ���£������Բ�����\n\n(������������������Сʱ�ڻ�δ���£��뼰ʱ֪ͨ����Ա)");
				    	return "";
				    }
				    UserID = obj.getAttribute("UserID");
				}
			}
			i++;
		}
		if(j==0){
			alert("��ѡ��һ����¼");
			return "";
		}
		return UserID;
}

function   carddel(){
	var frm =document.forms[0];
 	var i=0;
	var j=0;
	var UserID;
	eles = frm.elements;
	while(i<eles.length){
			obj= eles[i];
			if(obj.type == "checkbox" && !obj.disabled && obj.getAttribute("marked")==null){
				if(obj.checked){
				    var IsReIssue = obj.getAttribute("IsReIssue");
				    if(IsReIssue!=0){
				    	alert("��ѡ�еļ�¼�д������ط��¿������ܲ�����");
				    	return ;
				    }
				    j++;
				}
			}
			i++;
		}
		if(j==0){
			alert("������ѡ��һ����¼");
			return "";
		}
	frm.action=frm.deleteaction.value;
	frm.submit();
}
</script>