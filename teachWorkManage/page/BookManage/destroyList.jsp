<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="teachWorkManage.prBookManage.destroyList.do">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;�̲Ĺ���&gt;<span id="printTable">�̲ı��ϱ�</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="teachWorkManage.prBookManage.destroyList.do">
		<input type="hidden" name="addaction" value="teachWorkManage.prBookManage.destroyAdd.do">
		<input type="hidden" name="modifyaction" value="teachWorkManage.prBookManage.destroyModify.do">
		<input type="hidden" name="deleteaction" value="teachWorkManage.prBookManage.destroyDelete.do">
		<html:hidden property="TextbookDestroy/_order/col1/field"/>
		<html:hidden property="TextbookDestroy/_order/col1/asc" />
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
           ����ʱ�䣺 ��
            	<html:text property="TextbookDestroyDetail/DestroyTime/criteria/min" attributesText='class="input" size="10" ' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["TextbookDestroyDetail/DestroyTime/criteria/min"],"yyyy-MM-dd")> 
           		��
           		<html:text property="TextbookDestroyDetail/DestroyTime/criteria/max" attributesText='class="input" size="10"' readonly="true"/>
          	    <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["TextbookDestroyDetail/DestroyTime/criteria/max"],"yyyy-MM-dd")>
			    <input type="hidden" name="TextbookDestroyDetail/DestroyTime/criteria/operator" value="between"/>
			    <input type="hidden" name="TextbookDestroyDetail/DestroyTime/criteria/criteriaPattertn" value="yyyy-MM-dd"/>
			 ������
			<html:text property="TextbookDestroyDetail/Title/criteria/value" attributesText='class="input" size="20" '/>
            <html:hidden property="TextbookDestroyDetail/Title/criteria/operator" value="like"/>
            <html:hidden property="TextbookDestroyDetail/Title/criteria/likeRule" value="center"/><br>
            
			    <input name="query" type="button" class="button_02" value="�� ѯ" onClick="talentquery()">
			    
                <qx:talentButton property="add" type="button" styleClass="button_02" value="�� ��" onclick="talentadd()" operation="DX_TEACH_MANAGE_BOOK_DESTROY.DX_TEACH_MANAGE_BOOK_DESTROY_ADD"/>
                <qx:talentButton property="modify" type="button" styleClass="button_02" value="�� ��" onclick="talentmodify()" operation="DX_TEACH_MANAGE_BOOK_DESTROY.DX_TEACH_MANAGE_BOOK_DESTROY_MODIFY"/> 
              	<qx:talentButton property="delete" type="button" styleClass="button_02" value="ɾ ��" onclick="talentdelete()" operation="DX_TEACH_MANAGE_BOOK_DESTROY.DX_TEACH_MANAGE_BOOK_DESTROY_DELETE"/>
              	
				<input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">
				���������<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""> 
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text" >
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="3%" align="center" nowrap><input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""></td>
                  <td width="22%" align="center" nowrap id="TextbookDestroyDetail.Title" onClick="talentsort()">�� ��</td>
                  <td width="10%" align="center" nowrap id="TextbookDestroyDetail.Author" onClick="talentsort()">�� ��</td>
                  <td width="10%" align="center" nowrap id="TextbookDestroyDetail.Publisher" onClick="talentsort()">������</td>
                  <td width="5%" align="center" nowrap id="TextbookDestroyDetail.TextbookType" onClick="talentsort()">�� ��</td>
                  <td width="5%" align="center" nowrap id="TextbookDestroyDetail.DestroyIDNum" onClick="talentsort()">������</td>
                  <td width="5%" align="center" nowrap id="TextbookDestroyDetail.Price" onClick="talentsort()">����</td>
                  <td width="5%" align="center" nowrap id="TextbookDestroyDetail.TotalPrice" onClick="talentsort()">���</td>
                  <td width="10%" align="center" nowrap id="TextbookDestroyDetail.DestroyTime" onClick="talentsort()">����ʱ��</td>
                  <td width="10%" align="center" nowrap id="TextbookDestroyDetail.Remarks" onClick="talentsort()">�� ע</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='TextbookDestroyDetail']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)">  
                <td align="center"> 
					<logic:present  id="resultset" property="TextbookDestroyDetail/DestroyID"> 
                  		<html:checkbox id="resultset" name="list[@type='update']/TextbookDestroyDetail/DestroyID" property="TextbookDestroyDetail/DestroyID" indexed="true"/> 
                  	</logic:present> 
				</td>
                  <td  nowrap > <bean:write id="resultset" property="TextbookDestroyDetail/Title" /></td>
                  <td  nowrap > <bean:write id="resultset" property="TextbookDestroyDetail/Author" /></td>
                  <td  nowrap > <bean:write id="resultset" property="TextbookDestroyDetail/Publisher" /></td>
                  <td  nowrap > <bean:write id="resultset" property="TextbookDestroyDetail/TextbookType" /></td>
                  <td  nowrap > <bean:write id="resultset" property="TextbookDestroyDetail/DestroyIDNum" /></td>
                  <td  nowrap > <bean:write id="resultset" property="TextbookDestroyDetail/Price" language="zh" country="CN" /></td>
                  <td  nowrap > <bean:write id="resultset" property="TextbookDestroyDetail/TotalPrice" language="zh" country="CN"/></td>
                  <td  nowrap > <bean:write id="resultset" property="TextbookDestroyDetail/DestroyTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd" /></td>
                  <td  nowrap > <bean:write id="resultset" property="TextbookDestroyDetail/Remarks" /></td>
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
function talentaddNew() {
	var frm = document.forms[0];
	frm.action = frm.elements["addaction"].value ;
   	frm.submit();

}
</script>
<script>
	loadOrderImg(document.forms[0],'QueryTextbookOrder');
</script>