<%@include file="/internet/common.jsp"%>
<script>

<logic:present property="message" >
alert('<bean:write property="message"/>');
</logic:present>

</script>


<body>
<form method="post" action="teachWorkManage.prWorkLoad.convertModifyDo.do">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;��ʦ������ͳ�ơ�&gt;�����׼</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td>
	

		
		
		
	  </td>
    </tr>
  </table>
   <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td class="text">
      <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" class="table" >
      <tr><td>
      			
      			<qx:talentButton property="add" type="button" styleClass="button_02" value="�� ��" onclick="talentAddNew()" operation="DX_TEACH_MANAGE_WORKLOAD_CONVERT.DX_TEACH_MANAGE_WORKLOAD_CONVERT_ADD"/>
      			
      			
      			<qx:talentButton property="modifyandsave" type="button" styleClass="button_02" value="�޸ı���" onclick="saveDetail('listdetail')" operation="DX_TEACH_MANAGE_WORKLOAD_CONVERT.DX_TEACH_MANAGE_WORKLOAD_CONVERT_SAVE"/>

      			<input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">
      </td></tr>
      <tr><td class="td1" align="center"><b><span id="printTable">��ʦ�����������׼</span></b></td></tr>
      </table>
      
	  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
	  
	  <tr class="td_title"> 
                  <td width="10%" align="center" nowrap  >���</td>
                  <td width="50%" align="center" nowrap >��Ŀ</td>
                  <td width="30%" align="center" nowrap  colspan="2">�����׼</td>
                  <td width="10%" align="center" nowrap >�Ƿ����</td>
                </tr>
                <%
		             int count=0;
		             int i=0;
		             int j=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="typeresult" property="list[@type='WorkType']"> 
                
                
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
						i=0;
						
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)">
              
                <td nowrap rowspan="<bean:write id="typeresult" property="WorkType/TypeNum"/>">&nbsp;<bean:write id="typeresult" property="WorkType/WorkType"/> </td> 
                <logic:iterate id="convertresult" property="list[@type='WorkLoadConvert']"> 
                	<logic:equal id="convertresult" property="WorkLoadConvert/WorkType" value="WorkType/WorkType" valueType="variable" valueId="typeresult">
		                              <%i++;j++; if(i!=1){%>
		               <tr class="<%=trClass%>" onClick="changeTRBgColor(this)"> <%}%> 
		                 
		                <td ondblclick="toEditable()">&nbsp;<bean:write   id="convertresult" property="WorkLoadConvert/WorkItem" /></td>
		                <td ondblclick="toEditable()"  name="classNum">&nbsp;<bean:write  id="convertresult" property="WorkLoadConvert/ClassNum" /></td>
		                <td ondblclick="toEditable()">&nbsp;<bean:write  id="convertresult" property="WorkLoadConvert/Unit" /></td>
		                <td align="center" ><html:hidden id="convertresult" property="WorkLoadConvert/ConvertID" />
		                <html:checkbox  id="convertresult" property="WorkLoadConvert/IsAdopted" value="1"  onchange="changeStatus()"/> </td>
		                </tr>
	               </logic:equal>
                </logic:iterate>
             
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
<font color="#C0C0C0"><b>˵����</b></font><br/>
<font color="#C0C0C0">˫������޸ģ��޸����㡰�޸ı��桱��ť</font>
</body>
  <script>
//validater��������
//�÷�:ValidateType="alphanumeric,email",Msg="��������ĸ����;�ʼ�"
//��֤������:url,postalcode,phone,money,int,notempty,email,numeric
//function validater(frmObj)
  function save() {
  	var frm = document.forms[0];
	if(validater(frm)) frm.submit();
  
  }
   function talentAddNew(){ //������׼
    
     var loc="teachWorkManage.prWorkLoad.convertAdd.do";
     createWindow(loc,100,100,500,400);
 }
 

    var listNameUpdate = "listUpdate/WorkLoadConvert[@hciTagIndex='"; 
    var nameArray = new Array();  //Ҫ��ʾ�ֶ�����
	nameArray[0] = "WorkItem"; 
	nameArray[1] = "ClassNum";
	nameArray[2] = "Unit"; 
	nameArray[3] = "ConvertID"; 
	nameArray[4] = "IsAdopted"; 

//���б�ҳ���޸Ĳ�����
function saveDetail(tableName) {
    var canAdd=1;
	var tableObj = document.getElementById(tableName);
	var frm = document.forms[0];
	if(!tableObj) return;
	var rowsObj = tableObj.rows;
	var modify = false;
	for(var i = 1; i < rowsObj.length; i++) {
		
		if(rowsObj[i].getAttribute("modify")!=null && rowsObj[i].getAttribute("modify") == "yes") {
		    modify = true;
			var tds = rowsObj[i].cells;
			var k = 0;
			if(tds.length == 5){  //��ͬ�е��в�ͬ
				k=1;
			}

			for(var j = k; j < tds.length; j++) {
				if(j-k == 3) {
					
					var hiddenObj = tds[j].childNodes[0];
					var checkBoxObj = tds[j].childNodes[2];
					var isAdopted = 0;
					if(checkBoxObj.checked){
						isAdopted = 1;
					}
					var elementName = listNameUpdate + i +  "']/" + nameArray[j-k]; 
					var newElemnt = document.createElement("<input type='hidden' name="+elementName+"  value=" + hiddenObj.value + ">");
					frm.appendChild(newElemnt);
					var elementName1 = listNameUpdate + i +  "']/" + nameArray[j-k+1];
					var newElemnt1 = document.createElement("<input type='hidden' name="+elementName1+"  value=" + isAdopted + ">");
					frm.appendChild(newElemnt1);
				}else{
					var elementName = listNameUpdate + i +  "']/" + nameArray[j-k];
					var pattern1 = /&nbsp;/gi;
					var pattern2 = /<INPUT .*?>/gi;
					var pattern3 = /(< *IMG [^>]*>)/gi;
					var tdObjValue = tds[j].innerText.replace(pattern1,"");
					tdObjValue = tdObjValue.replace(pattern2,"");
					tdObjValue = tdObjValue.replace(pattern3,"");
					var newElemnt = document.createElement("<input type='hidden' name="+elementName+" value='" + tdObjValue + "'>");
					frm.appendChild(newElemnt);
					
					//var status=checkValue(elementName,tdObjValue);
					//if(status==false)return;
				}
				

			}//for
		}//if
	}//for
		
	if(modify==true){
	
	  	frm.action = "teachWorkManage.prWorkLoad.convertModifyDo.do";
	   frm.submit();
	}else{
	 alert("û���޸�");
	
	} 
  }

function checkValue(element,value){
  if(element.indexOf("ClassNum")>-1&&value!=""&&isNaN(value)){
    alert("�����׼����������飡");
    return false;
  }else{
   return true;
  }
}  
  
  
  function changeStatus() {
	var pattern = /&nbsp;/gi;
	var tdObj = event.srcElement;//td
	var parentObj = tdObj.parentElement.parentElement;//tr
	if(parentObj.tagName!="TR") return;
	var firstTd = parentObj.cells[0];
	if(firstTd.childNodes[0].disabled) return;
	parentObj.setAttribute("modify","yes");

}
  
  function toEditable2() {
	var pattern = /&nbsp;/gi;
	var tdObj = event.srcElement;//td
	var parentObj = tdObj.parentElement;//tr
	if(parentObj.tagName!="TR") return;
	var firstTd = parentObj.cells[0];
	if(firstTd.childNodes[0].disabled) return;
	var tdObjIndex = tdObj.cellIndex;
	var trProName = "cell" + tdObjIndex;

	var tdObjValue = tdObj.innerHTML.replace(pattern,"");//td������
	//alert(tdObjValue)
	var trProValue = parentObj.getAttribute(trProName);//tr ������
	if(trProValue == null) {
		parentObj.setAttribute("modify","no");
	}

	if(trProValue == null || trProValue!=tdObjValue) {
		parentObj.setAttribute(trProName,tdObjValue)
	}
	
	var edittype = tdObj.getAttribute("edittype");//�༭����
	if(edittype==null) {
		tdObj.setAttribute("edittype","text");
	}

	var str = '<input type="' + tdObj.getAttribute("edittype") + '" style="width:95%;border:1 soild;background-color:#FFFCF0" value="' + parentObj.getAttribute(trProName) + '" onBlur="toPlain2(this)" >';

	if(tdObj.getAttribute("edittype")!="text") {
		str = '<select name="select" style="width:95%;border:1 soild;background-color:#FFFCF0" onChange="toPlain2()" onBlur="toPlain()">'
		for(var i = 0; i < ops.length; i++) {
			str += '<option value="' + ops[i] + '"';
			if(parentObj.getAttribute(trProName)==ops[i]) str += ' selected ';
			str += '>'  + ops[i] + '</option>';
		}
		str += '</select>'
	}
	tdObj.innerHTML = str;
	tdObj.firstChild.focus();
    //flag = true;

}

function toPlain2(obj) {
  var theValue=obj.value;
  if(theValue!="")
  if(theValue.indexOf("-")==0){
    alert("�������븺����");
    return;
  }
	var t = event.srcElement;
	var v= t.value;
	var tdObj = t.parentNode;
	var parentObj = tdObj.parentElement;
	var tdObjIndex = tdObj.cellIndex;
	var trProName = "cell" + tdObjIndex;
	if(v!=parentObj.getAttribute(trProName)) {
		parentObj.setAttribute("modify","yes");
		parentObj.setAttribute(trProName,v);
	}
	
	tdObj.innerHTML = '';
	tdObj.innerHTML = '&nbsp;'  + v;
	
}
</script>