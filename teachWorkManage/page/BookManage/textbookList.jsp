<%@include file="/internet/common.jsp"%>
<script type="text/javascript">
   function talentmodifymlti(){
  		var frm =document.forms[0];
		
   		if(chechedCount(frm)<1){
    		alert("���ٱ���ѡ��һ�У�");
    		return ;
    	}
    	
    	frm.action = frm.elements["modifyaction"].value;
    	frm.submit();
  }
</script>

<body>
<form method="post" action="teachWorkManage.prBookManage.textbookList.do" name="opeForm">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;�̲Ĺ���&gt;<span  id="printTable">�̲���Ϣ�б�</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="teachWorkManage.prBookManage.textbookList.do">
		<input type="hidden" name="addaction" value="teachWorkManage.prBookManage.textbookAdd.do">
		<input type="hidden" name="modifyaction" value="teachWorkManage.prBookManage.textbookModify.do">
		<input type="hidden" name="deleteaction" value="teachWorkManage.prBookManage.textbookDelete.do">
		<input type="hidden" name="viewaction" value="teachWorkManage.prBookManage.textbookView.do">
		<html:hidden property="Textbook/_order/col1/field"/>
		<html:hidden property="Textbook/_order/col1/asc" />
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
				<a title='�ؼ��ֿ�����"����������������������"' id="keytitle">�ؼ��ֲ�ѯ</a>�� 
			    <html:text property="Textbook/fccsearch" attributesText='class="input"'/>
			    <input name="query" type="button" class="button_02" value="�� ѯ" onClick="talentquery()">
                <qx:talentButton property="add" type="button" styleClass="button_02" value="�� ��" onclick="talentadd()" operation="DX_TEACH_MANAGE_BOOK_INFO.DX_TEACH_MANAGE_BOOK_INFO_ADD"/>
                <qx:talentButton property="modify" type="button" styleClass="button_02" value="�� ��" onclick="talentmodifymlti()" operation="DX_TEACH_MANAGE_BOOK_INFO.DX_TEACH_MANAGE_BOOK_INFO_MODIFY"/> 
              	<qx:talentButton property="delete" type="button" styleClass="button_02" value="ɾ ��" onclick="talentdelete()" operation="DX_TEACH_MANAGE_BOOK_INFO.DX_TEACH_MANAGE_BOOK_INFO_DELETE"/>
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
                  <td width="3%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                  <td width="20%" align="center" nowrap id="Textbook.Title" onClick="talentsort()">����</td>
                  <td width="20%" align="center" nowrap id="Textbook.Author" onClick="talentsort()">����</td>
                  <td width="20%" align="center" nowrap id="Textbook.Publisher" onClick="talentsort()">������</td>
                  <td width="17%" align="center" nowrap id="Textbook.PublishTime" onClick="talentsort()">��������</td>
                  <td width="10%" align="center" nowrap id="Textbook.Price" onClick="talentsort()">�۸�(Ԫ)</td>
                  <td width="10%" align="center" nowrap id="Textbook.TextbookType" onClick="talentsort()">���</td>
                 
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='TEXTBOOK']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)">  
                <td align="center"> 
					<logic:present  id="resultset" property="Textbook/TextbookID"> 
                  		<html:checkbox id="resultset" name="list[@name='update']/Textbook/TextbookID" property="Textbook/TextbookID" indexed="true"/> 
                  	</logic:present> 
				</td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="Textbook/Title"/></td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="Textbook/Author"/></td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="Textbook/Publisher"/></td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="Textbook/PublishTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="Textbook/Price"       language="zh" country="CN"/></td>
                <td nowrap >&nbsp;
                <logic:notEqual  id="resultset" property="Textbook/TextbookType" value="-1">
                <bean:write id="resultset" property="Textbook/TextbookType" />
                </logic:notEqual>
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
<input type="hidden" name="title" value="�̲���Ϣ">
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
	loadOrderImg(document.forms[0],'Textbook');
</script>