<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prThingsManage.typeManager.do" name="opeForm">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;��Ʒ����&gt;<span id="printTable">��Ʒ����б�</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prThingsManage.typeManager.do">
		
		<input type="hidden" name="modifytoSave" value="oa.prThingsManage.typeModifyToSave.do">
		
		<html:hidden property="COMM_TYPE/_order/col1/field"/>
		<html:hidden property="COMM_TYPE/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count" />
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
				<a>�������</a>�� 
			    <html:text property="COMM_TYPE/TYPENAME/criteria/value" attributesText='class="input"'/>
			    <html:hidden property="COMM_TYPE/TYPENAME/criteria/operator" value="like"/>
			    <html:hidden property="COMM_TYPE/TYPENAME/criteria/likeRule" value="center"/>
			    <input name="query" type="button" class="button_02" value="�� ѯ" onClick="talentquery()">
                <input name="add" type="button" class="button_02" value="�� ��" onClick="insertDetail()">
                <input name="delete" type="button" class="button_02" value="ɾ ��" onClick="deleteDetails()">
                <input name="modifytoSave" type="button" class="button_02" value="�޸ı���" onClick="saveDetail('listdetail')">
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
                  <td width="30%" align="center" nowrap id="COMM_TYPE.TYPEID" onClick="talentsort()">���</td>
                  <td width="30%" align="center" nowrap id="COMM_TYPE.TYPENAME" onClick="talentsort()">�������</td>
                  <td width="37%" align="center" nowrap id="COMM_TYPE.REMARKS" onClick="talentsort()">�� ע</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='COMM_TYPE']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)">  
                <td align="center">&nbsp;</td>
                <td nowrap onDblClick="toEditable()">&nbsp;<bean:write id="resultset" property="COMM_TYPE/TYPEID"/></td>
                <td nowrap onDblClick="toEditable()">&nbsp;<bean:write id="resultset" property="COMM_TYPE/TYPENAME"/></td>
                <td nowrap onDblClick="toEditable()">&nbsp;<bean:write id="resultset" property="COMM_TYPE/REMARK"/></td>
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
<input type="hidden" name="title" value="��Ʒ����б�">
<input type="hidden" name="xmlfcc">
</form>
<p><font color="#C0C0C0"><b>˵����</b></font></p>
<p><font color="#C0C0C0">˫������޸ģ��޸����㡰�޸ı��桱��ť</font></p>
</body>

<script>
    var listNameInsert = "list[@type='insert']/COMM_TYPE[@hciTagIndex='"; 
    var listNameUpdate = "list[@type='update']/COMM_TYPE[@hciTagIndex='"; 
    var nameArray = new Array();  //Ҫ��ʾ�ֶ�����
	nameArray[0] = "TYPEID"; 
	nameArray[1] = "TYPENAME";
	nameArray[2] = "REMARK"; 
//���б�ҳ���޸Ĳ�����
function saveDetail(tableName) {
	var tableObj = document.getElementById(tableName);
	var frm = document.forms[0];
	if(!tableObj) return;
	var rowsObj = tableObj.rows;
	for(var i = 1; i < rowsObj.length; i++) {
		
		if(rowsObj[i].getAttribute("modify")!=null && rowsObj[i].getAttribute("modify") == "yes") {
			var tds = rowsObj[i].cells;
			for(var j = 0; j < tds.length; j++) {
				if(j == 0) {
					var checkBoxObj = tds[j].childNodes[0];
					//var newElemnt = document.createElement("<input type='hidden' name='"+elementName+"' value='" + checkBoxObj.value + "'>");
					//frm.appendChild(newElemnt);
				}else{
					var elementName = listNameUpdate + i +  "']/" + nameArray[j-1];
					var pattern1 = /&nbsp;/gi;
					var pattern2 = /<INPUT .*?>/gi;
					var pattern3 = /(< *IMG [^>]*>)/gi;
					var tdObjValue = tds[j].innerText.replace(pattern1,"");
					tdObjValue = tdObjValue.replace(pattern2,"");
					tdObjValue = tdObjValue.replace(pattern3,"");
					alert("<input type='hidden' name="+elementName+" value='" + tdObjValue + "'>");
					var newElemnt = document.createElement("<input type='hidden' name="+elementName+" value='" + tdObjValue + "'>");
					frm.appendChild(newElemnt);
				}
			}//for
		}//if
	}//for
  	frm.action = "oa.prThingsManage.typeModifyToSave.do";
	frm.submit();
  
  }



function talentaddNew() {
	var frm = document.forms[0];
	frm.action = frm.elements["addaction"].value ;
   	frm.submit();

}


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
	
	 
	
 // ������ϸ���¼
	function insertDetail() {
		
		var objTable = document.all['listdetail']; // ��ϸ��

	
		addRecordToTable(objTable, nameArray);		
	}
	var checkboxIndex = <%=count+1%>;  //����������
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
			default:
				colHTML += "<td  nowrap>";
				colHTML += "<input type=\"text\" name=\"" + listNameInsert + checkboxIndex + "'" + "]/" + nameArray[i] + "\" style=\"width:100%\" class=\"input_text\" />";
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
<script>
	loadOrderImg(document.forms[0],'COMM_TYPE');
</script>