<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prCarManage.motList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;��������&gt;��������¼ </td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prCarManage.motList.do">
		<input type="hidden" name="viewaction" value="oa.prCarManage.motView.do">
		<input type="hidden" name="addaction" value="oa.prCarManage.motAdd.do">
		<input type="hidden" name="modifyaction" value="oa.prCarManage.motModify.do">
		<input type="hidden" name="deleteaction" value="oa.prCarManage.motDelete.do">
		<html:hidden property="MOT/_order/col1/field"/>
		<html:hidden property="MOT/_order/col1/asc" />
		
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
	    <td height="30" class="text">���ƺţ�
	      <html:text property="MOT/CarNO/criteria/value" attributesText='class="input"' size="15"/>
        <html:hidden property="MOT/CarNO/criteria/operator" value="like"/>
        <html:hidden property="MOT/CarNO/criteria/likeRule" value="center"/>
&nbsp;


	  
<input name="B32" type="button" class="button_02" value="�� ѯ" onClick="talentquery()">
<qx:talentButton property="add" type="button" styleClass="button_02" value="�� ��" onclick="talentadd()" operation="DX_OASYS_CARD_MOT.DX_OASYS_CARD_MOT_ADD" />
<qx:talentButton property="modify" type="button" styleClass="button_02" value="�� ��" onclick="talentmodify()" operation="DX_OASYS_CARD_MOT.DX_OASYS_CARD_MOT_MODIFY" />
<qx:talentButton property="delete" type="button" styleClass="button_02" value="ɾ ��" onclick="talentdelete()" operation="DX_OASYS_CARD_MOT.DX_OASYS_CARD_MOT_DEL" />
<input name="view" type="button" class="button_02" value="�� ��" onClick="talentview()">

<input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">
���������
<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""></td>
	    </tr>
	  
	  
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text"><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
          <tr class="td_title">
            <td width="4%" align="center" nowrap><input type="checkbox" name="checkbox2" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked="">            </td>
            <td width="20%" align="center" nowrap id="MOT.CarNO" onClick="talentsort()">���ƺ�</td>
            <td width="20%" align="center" nowrap id="MOT.Charger" onClick="talentsort()">������</td>
            <td width="20%" align="center" nowrap id="MOT.MOTType" onClick="talentsort()">�����������</td>
            <td width="20%" align="center" nowrap id="MOT.MOTTime" onClick="talentsort()">�������ʱ��</td>
            <td width="16%" align="center" nowrap id="MOT.Cost" onClick="talentsort()">����</td>
          </tr>
          <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
          <logic:iterate id="resultset" property="list[@type='MOT']">
            <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
						
						
			       %>
        <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="MOT/MOTID"/>','true')">
	             <td align="center">
	          
	           <html:checkbox name="list[@name='update']/MOT/MOTID" id="resultset" property="MOT/MOTID" indexed="true"  />	                       </td>
	        	<td nowrap align="center"><bean:write id="resultset" property="MOT/CarNO"/></td>
	            <td nowrap align="center"><bean:write  id="resultset" property="MOT/Charger" /></td>
	            <td nowrap align="center"><bean:write  id="resultset" property="MOT/MOTType" /></td>
	            <td  nowrap align="center"><bean:write id="resultset" property="MOT/MOTTime"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
	            <td  nowrap align="center"><bean:write  id="resultset" property="MOT/Cost" /></td>
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

</script>