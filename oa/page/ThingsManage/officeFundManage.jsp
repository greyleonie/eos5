<%@include file="/internet/common.jsp"%>
<script>

<logic:present property="message" >
alert('<bean:write property="message"/>');
</logic:present>

</script>


<body>
<form method="post" >
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
               <td class="text_wirte">�칫ϵͳ��&gt;��Ʒ����&gt;�칫���ѹ���</td>
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
			
      </td></tr>
      <tr><td class="td1" align="center"><b><span id="printTable">�칫�������ñ�׼</span></b></td></tr>
      </table>
      
	  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
	  
	  <tr class="td_title"> 
                  <td width="50%" align="center" nowrap  >����</td>
                  <td width="25%" align="center" nowrap >�����ܶ�(Ԫ)</td>
                  <td width="25%" align="center" nowrap >���(Ԫ)</td>
                </tr>
                <%
		             int count=0;
		             int i=0;
		             int j=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="setresult" property="list[@type='COMM_OfficeFund']"> 
                
                
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
						i=0;
						
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)">
                <td nowrap>&nbsp;<bean:write id="setresult" property="COMM_OfficeFund/DepName"/> 
                <html:hidden id="setresult" property="COMM_OfficeFund/FundID"/>
                <html:hidden id="setresult" property="COMM_OfficeFund/DepID"/>
                <html:hidden id="setresult" property="COMM_OfficeFund/Total"/>
                <html:hidden id="setresult" property="COMM_OfficeFund/Balance"/>
                </td> 
                <td nowrap onclick="toEditable2()">&nbsp;<bean:write id="setresult" property="COMM_OfficeFund/Total"/> </td> 
                <td nowrap >&nbsp;<bean:write id="setresult" property="COMM_OfficeFund/Balance"/> </td> 
              
             
             
             </tr>
                </logic:iterate> 
        </table>
        
        
</td>
    </tr>
</table>

       <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td class="text" align="center">	<input name="ieprint" type="button" class="button_02" value="�޸ı���" onClick="saveDetail('listdetail')">
      			<input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">
				</td>
    </tr>
  </table>
  </form>
  <form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
<font color="#C0C0C0"><b>˵����</b></font><br/>
<font color="#C0C0C0">��������޸ġ������ܶ���޸����㡰�޸ı��桱��ť</font>
</body>
  <script>
//validater��������
//�÷�:ValidateType="alphanumeric,email",Msg="��������ĸ����;�ʼ�"
//��֤������:url,postalcode,phone,money,int,notempty,email,numeric
//function validater(frmObj)


    var listNameUpdate = "listUpdate/COMM_OfficeFund[@hciTagIndex='"; 
    var nameArray = new Array();  //Ҫ��ʾ�ֶ�����
	nameArray[0] = "FundID"; 
	nameArray[1] = "DepID";
	nameArray[2] = "Total"; 
	nameArray[3] = "Balance"; 


//���б�ҳ���޸Ĳ�����
function saveDetail(tableName) {
	var tableObj = document.getElementById(tableName);
	var frm = document.forms[0];
	var haslist = false;
	if(!tableObj) return;
	var rowsObj = tableObj.rows;
	var modify = false;
	for(var i = 1; i < rowsObj.length; i++) {
		if(rowsObj[i].getAttribute("modify")!=null && rowsObj[i].getAttribute("modify") == "yes") {
			modify = true;
			var tds = rowsObj[i].cells;
			
			var elementName0 = listNameUpdate + i + "']/" +nameArray[0];//Ԫ����
			var checkBoxObj0 = tds[0].children[0];
			var newElemnt0 = document.createElement("<input type='hidden' name="+elementName0+" value=" + checkBoxObj0.value + ">");
			frm.appendChild(newElemnt0);
					
			var elementName1 = listNameUpdate + i + "']/" +nameArray[1];//Ԫ����
			var checkBoxObj1 = tds[0].children[1];
			var newElemnt1 = document.createElement("<input type='hidden' name="+elementName1+" value=" + checkBoxObj1.value + ">");
			frm.appendChild(newElemnt1);

			var pattern1 = /&nbsp;/gi;
			var pattern2 = /<INPUT .*?>/gi;
			var pattern3 = /(< *IMG [^>]*>)/gi;
			
			var elementName2 = listNameUpdate + i + "']/" +nameArray[2];//Ԫ����
			var tdObjValue2 = tds[1].innerText.replace(pattern1,"");
			tdObjValue2 = tdObjValue2.replace(pattern2,"");
			tdObjValue2 = tdObjValue2.replace(pattern3,"");
			var newElemnt2 = document.createElement("<input type='hidden' name="+elementName2+"' value=" + tdObjValue2 + ">");
			frm.appendChild(newElemnt2);
			

			
			var elementName3 = listNameUpdate + i + "']/" +nameArray[3];//Ԫ����
			var tdObjValue3 = tds[2].innerText.replace(pattern1,"");
			tdObjValue3 = tdObjValue3.replace(pattern2,"");
			tdObjValue3 = tdObjValue3.replace(pattern3,"");
			var newElemnt3 = document.createElement("<input type='hidden' name="+elementName3+"' value=" + tdObjValue3 + ">");
			frm.appendChild(newElemnt3);
				
		
		}
	}//for
	
	if(modify==true){
	  	frm.action = "oa.prThingsManage.officeFundModifyDo.do";
	    frm.submit();
	}else{
	 alert("û���޸�");
	
	}

  
  }
  
  
  //�޸��������Ϊ��
function modifyBalance() {
	var frm = document.forms[0];
	if(confirm("��ȷ���޸��������Ϊ����")==false){
			return ;
		}    
	frm.action = "oa.prThingsManage.officeFundBalanceDo.do";
    frm.submit();
  }
  
  //���TD���<input type="text">
var ops = [];
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

	var str = '<input type="' + tdObj.getAttribute("edittype") + '" style="width:95%;border:1 soild;background-color:#FFFCF0" value="' + parentObj.getAttribute(trProName) + '" onBlur="toPlain2()" >';

	if(tdObj.getAttribute("edittype")!="text") {
		str = '<select name="select" style="width:95%;border:1 soild;background-color:#FFFCF0" onChange="toPlain2()" onBlur="toPlain2()">'
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

//�������ѡ�������ı�
function toPlain2() {
	var t = event.srcElement;
	var v= t.value;
	if(!isNumeric(v)||isEmpty(v)){
		alert("����������");
		return;
	}
	var tdObj = t.parentNode;
	var parentObj = tdObj.parentElement;
	var tdObjIndex = tdObj.cellIndex;
	var trProName = "cell" + tdObjIndex;
	if(v!=parentObj.getAttribute(trProName)) {
		parentObj.setAttribute("modify","yes");
		parentObj.setAttribute(trProName,v);
	}
	
	/////////////////
	var tds = parentObj.cells;
    var sTotal = tds[0].children[2].value;
	var sBalance = tds[0].children[3].value;


	var tBalance =  Number(v) - Number(sTotal) + Number(sBalance);
	tds[2].innerHTML = tBalance;
	
	
	tdObj.innerHTML = '';
	tdObj.innerHTML = '&nbsp;'  + v;
	
}


</script>