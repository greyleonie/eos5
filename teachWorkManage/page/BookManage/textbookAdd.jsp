<%@include file="/internet/common.jsp"%>
<script>
function initOnLoad(){
     <logic:present property="only">
		<logic:greaterThan value="0" property="only">
			alert("����\"<bean:write property="message"/>\"�Ѵ��ڣ����޸�������ɾ�����У�");
		</logic:greaterThan>
	</logic:present>
	<logic:notPresent property="only">
			insertDetail();
	</logic:notPresent>
}
</script>
<body onload="initOnLoad()">
<form method="post" action="teachWorkManage.prBookManage.textbookAddDo.do" name="opeForm">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;�̲Ĺ���&gt;�̲���Ϣ����</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<html:hidden property="Textbook/_order/col1/field"/>
		<html:hidden property="Textbook/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count" value="-1"/>
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
                <input name="add" type="button" class="button_02" value="�� ��" onClick="insertDetail()">
              	<input name="delete" type="button" class="button_02" value="ɾ ��" onClick="deleteDetails()">
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
                  <td width="22%" align="center" nowrap id="Textbook.PublishTime" onClick="talentsort()">��������</td>
                  <td width="5%" align="center" nowrap id="Textbook.Price" onClick="talentsort()">�۸�</td>
                  <td width="10%" align="center" nowrap id="Textbook.TextbookType" onClick="talentsort()">���</td>
                 
                </tr>
                 <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='textbook']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" id="row_<%=count%>"\>
                <td align="center"><input type="checkbox" name="BookCheckBox" value=<%=count%> /></td>
                <td nowrap ><input type="text" name="booklist/Textbook[@hciTagIndex='<%=count%>']/Title" value="<bean:write id="resultset" property="Textbook/Title"/>" class="input" size="25" style="100%" maxlength="50" ValidateType="notempty" Msg="��������Ϊ��" /> </td>
                <td nowrap ><input type="text" name="booklist/Textbook[@hciTagIndex='<%=count%>']/Author" value="<bean:write id="resultset" property="Textbook/Author"/>" class="input" size="25" style="100%" maxlength="20"   /></td>
                <td nowrap ><input type="text" name="booklist/Textbook[@hciTagIndex='<%=count%>']/Publisher" value="<bean:write id="resultset" property="Textbook/Publisher"/>" class="input" size="25" style="100%"  maxlength="50"  /></td>
                <td nowrap ><input type="text" name="booklist/Textbook[@hciTagIndex='<%=count%>']/PublishTime[@pattern='yyyy-MM-dd']" value="<bean:write id="resultset" property="Textbook/PublishTime[@pattern='yyyy-MM-dd']"/>" class="input" size="10" style="100%" />
                			<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["booklist/Textbook[@hciTagIndex='<%=count%>']/PublishTime[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")></td>
                <td nowrap ><input type="text" name="booklist/Textbook[@hciTagIndex='<%=count%>']/Price" value="<bean:write id="resultset" property="Textbook/Price"/>" class="input" size="10" style="100%"  ValidateType="money" Msg="�۸����Ϊ����" /></td>
                <td nowrap ><select name="booklist/Textbook[@hciTagIndex='<%=count%>']/TextbookType"  class="input" style="100%" >
                				<logic:notPresent id="resultset" property="Textbook/TextbookType" ><option value="-1" selected>��ѡ��</option><option value="����" selected>����</option><option value="��ѧ">��ѧ</option><option value="����">����</option><OPTION value="����">����</OPTION><OPTION value="��ѧ">��ѧ</OPTION>
                				<OPTION value="����">����</OPTION><OPTION value="����">����</OPTION><OPTION value="����">����</OPTION></logic:notPresent>
                				<logic:equal id="resultset" property="Textbook/TextbookType" value="����"><option value="-1" >��ѡ��</option><option value="����" selected>����</option><option value="��ѧ">��ѧ</option><option value="����">����</option><OPTION value="����">����</OPTION><OPTION value="��ѧ">��ѧ</OPTION>
                				<OPTION value="����">����</OPTION><OPTION value="����">����</OPTION><OPTION value="����">����</OPTION></logic:equal>
                				<logic:equal id="resultset" property="Textbook/TextbookType" value="��ѧ"><option value="-1" >��ѡ��</option><option value="����" selected>����</option><option value="��ѧ">��ѧ</option><option value="����">����</option><OPTION value="����">����</OPTION><OPTION value="��ѧ">��ѧ</OPTION>
                				<OPTION value="����">����</OPTION><OPTION value="����">����</OPTION><OPTION value="����">����</OPTION></logic:equal>
                				<logic:equal id="resultset" property="Textbook/TextbookType" value="����"><option value="-1" >��ѡ��</option><option value="����" selected>����</option><option value="��ѧ">��ѧ</option><option value="����">����</option><OPTION value="����">����</OPTION><OPTION value="��ѧ">��ѧ</OPTION>
                				<OPTION value="����">����</OPTION><OPTION value="����">����</OPTION><OPTION value="����">����</OPTION></logic:equal>
                			</select>		
                			</td>
              
              </tr>
                </logic:iterate> 
              </table>  
              
            <table width="98%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="�� ��" onClick="javascript:save()">
              <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="javascript:goBack()"></td>
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
  <div style="display:none">
  <Iframe name="verifyFrame"></Iframe>
  </div>
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
	loadOrderImg(document.forms[0],'Textbook');
</script>

<script>
  var listName = "booklist/Textbook[@hciTagIndex='"; 
  function save() {
  	var frm = document.forms[0];
 	if(verifyForm(frm)){
	    frm.submit();
	 }
  
  }

	// ���ص���ѯҳ��
	function goBack() {
		window.location.href = "teachWorkManage.prBookManage.textbookList.do";
	}
	
	//�������ӵļ�¼
    function confirmFrom() { 
    	var frm = document.opeForm;
    	frm.action= "teachWorkManage.prBookManage.textbookVerify.do";
    	frm.submit();
    	/*
    	if(verifyForm(frm)){
	   document.frames["verifyFrame"].location.href = "teachWorkManage.prBookManage.textbookVerify.do";
	   }
	   */
    	
    }
	 // У������ݵĺϷ���
    function verifyForm(frm)
    {
    	var frm = document.opeForm;
    	
    	
    	var objTable = document.all['listdetail'];  
    	var rowIndexId = 0;
    	var rowObj;

    	if (objTable.rows.length <= 1) {
    		alert("����Ҫ��һ����ϸ��");
    		return false;
    	}
		for (var i=1; i<objTable.rows.length; ++i) {
    		rowObj = objTable.rows[i];
    		var rowId = rowObj.id;
    		rowIndexId = rowId.substr(4, rowId.length-4);  
    		if (!verifyEachRow(rowObj, rowIndexId)) 
    			return false;
    	}
    	return true;
    }
    // ���ÿһ�еĺϷ���
    function verifyEachRow(rowObj, rowIndexId) {
    
    	var title = listName + rowIndexId + "']/Title";  
    	var price = listName + rowIndexId + "']/Price";
    	
    	// ��������Ϊ��
        if (isEmpty(rowObj.all[title].value.trim())) {
        	alert("��" + (parseInt(rowIndexId)+1) + "�е���������Ϊ�գ����������룬���߽�����ɾ����");
        	return false;	
        }
        
        //�۸����Ϊ����
        
        if (!isMoney(rowObj.all[price].value)) {
        	alert("��" + (parseInt(rowIndexId)+1) + "�еļ۸���Ϊ��ĸ��");
        	return false;	
        }
        
        return true;
    }
    
    // �ж�һ�����Ƿ���һ�������д���
    function isArrayItem(arr, itemID, itemName) {
    	var len = arr.length;
    	var isFlag = false;
    	for (var i=0; i<len; ++i) {
    		if ((arr[i][0]==itemID && arr[i][2]!=itemName)) {
    			isFlag = false;
    			break;
    		}
    		if ((arr[i][0]==itemID && arr[i][2]==itemName)) {
    			isFlag = true;
    			break;
    		}
    	}
    	
    	return isFlag;
    }
	// ɾ����ϸ���¼
	function deleteDetails() {
		
		var objForm = document.forms['opeForm'];
    	var rowArray = new Array;
    	// ����objForm�����еĿؼ�����ֻ�Ƕ�checkbox���д���
    	// �ҳ�ѡ�е�checkbox����Ϊcheckbox��value�м�¼���������е�id
    	for (var i=0; i<objForm.length; ++i) {
    		if (objForm.elements[i].type == "checkbox" && 
    		    objForm.elements[i].checked == true && objForm.elements[i].name != "chkall") {
    			rowArray[rowArray.length] = objForm.elements[i].value;
    		}
    	}
		if (rowArray.length == 0) {
			alert("���ٱ���ѡ��һ�У�");
    		return;
		}
		
		if(confirm("�Ƿ�ȷ��ɾ��ָ����¼��") == false) { 
			return ;
		}  
		
		// ����rowArray��Ȼ��ɾ����ϸ���¼
		
		for (var i=0; i<rowArray.length; ++i) {
			var objTable = document.all['listdetail']; // ��ϸ��
			var rowId = "row_" + rowArray[i]; 
			removeRowFromTable(objTable, rowId);
		}
	}
	 
	
 // ������ϸ���¼
	function insertDetail() {
		
		var objTable = document.all['listdetail']; // ��ϸ��
		var nameArray = new Array();  //Ҫ��ʾ�ֶ�����
		var i = 0;
		nameArray[i++] = "Title"; 
		nameArray[i++] = "Author";
		nameArray[i++] = "Publisher";
		nameArray[i++] = "PublishTime[@pattern='yyyy-MM-dd']";
		nameArray[i++] = "Price";
		nameArray[i++] = "TextbookType";
		addRecordToTable(objTable, nameArray);		
	}
	var checkboxIndex = <%=count%>;  //����������
	function addRecordToTable(objTable, nameArray) {
		
		var formHTML = "";
		var bodyHTML = objTable.innerHTML;
		bodyHTML = bodyHTML.replace("<TBODY>", "");
		bodyHTML = bodyHTML.replace("</TBODY>", "");
		formHTML += "<table width =\"98%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\"  bgcolor=\"#CAD6E8\" id=\"listdetail\">";
		formHTML += bodyHTML;
		formHTML += "<tr class=\"td1\" id=\"row_" + checkboxIndex + "\">";
		var colHTML = "<td align=\"center\">";
		colHTML += "<input type=\"checkbox\" name=\"BookCheckBox\" value=\"" + checkboxIndex + "\" />";
		colHTML += "</td>";
		formHTML += colHTML;
		
		for (var i=0; i<nameArray.length; i++) {
			var colHTML = "";
			switch (i) {

		    case 3: // ��������
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\" style=\"width:80%\" class=\"input_text\" readonly />";
          	    colHTML += "&nbsp;<img src=\"/internet/image/date.gif\" width=\"13\" height=\"20\" align=\"absmiddle\" onClick=calendar(document.forms[0].elements[\""+listName + checkboxIndex + "'" + "]/" + nameArray[i]+"\"],\"yyyy-MM-dd\")>";
				break;
		   case 5: // ����
				colHTML += "<td  nowrap>";
				colHTML += "<select  name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\" style=\"width:100%\" class=\"input_text\"  />";
          	    colHTML += "<option value=\"-1\"  />��ѡ��</option>";
          	    colHTML += "<option value=\"����\"  />����</option>";
          	    colHTML += "<option value=\"��ѧ\"  />��ѧ</option>";
          	    colHTML += "<option value=\"����\"  />����</option>";
          	    colHTML += "<option value=\"����\"  />����</option>";
          	    colHTML += "<option value=\"��ѧ\"  />��ѧ</option>";
          	    colHTML += "<option value=\"����\"  />����</option>";
          	    colHTML += "<option value=\"����\"  />����</option>";
          	    colHTML += "<option value=\"����\"  />����</option>";
          	    colHTML += "</select>";
				break;	
				

			default:
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listName + checkboxIndex + "'" + "]/" + nameArray[i] + "\" style=\"width:100%\" class=\"input_text\" />";
				break;
			}
			
			colHTML += "</td>";
			formHTML += colHTML;		
		}
		formHTML += "</tr>";
		formHTML += "</table>";  
		objTable.outerHTML = formHTML;
		var objTable = document.all['listdetail']; // ��ϸ��
		// ���� checkboxIndex
		checkboxIndex ++ ;
	}
	
	// �ӱ����ɾ��idΪrowId����
	function removeRowFromTable(objTable, rowId) {
		
		var tableHTML = objTable.outerHTML; 
		var locOfRowId = tableHTML.indexOf(rowId);
		var beginHTML = tableHTML.substr(0, locOfRowId);
		var endHTML = tableHTML.substr(locOfRowId+1, tableHTML.length-locOfRowId-1);
		var lastTRLoc = beginHTML.lastIndexOf("<TR");
		var beforeHTML = beginHTML.substr(0, lastTRLoc);
		var firstTRLoc = endHTML.indexOf("</TR>");
		var latterHTML = endHTML.substr(firstTRLoc+5, endHTML.length-firstTRLoc);
		
		objTable.outerHTML = beforeHTML + latterHTML;

	}
</script>