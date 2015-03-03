<%@include file="/internet/common.jsp"%>

<form method="post" action="teachWorkManage.prSubjectDeclare.subjectPlateModifyDo.do">

  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;课题申报—&gt;定板块—&gt;修改申报</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">
          <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="plate">
            <tr>
              <td width="197" height="9" align="right" nowrap class="td2" >申报名称：</td>
              <td height="9" class="td1" >&nbsp;
              <html:text property="SubjectDeclare/DeclareName" maxlength="50" attributesText='class="input" size="30" ValidateType="notempty" Msg="申报名称不能为空"'/>
              <font color="#FF0000">*</font> <html:hidden property="SubjectDeclare/DeclareID"/></td>
            </tr>
            <tr>
              <td height="8" class="td2" align="right" nowrap >申报截止时间：</td>
              <td height="8" class="td1">&nbsp;
                <html:text name="SubjectDeclare/DateLine[@pattern='yyyy-MM-dd']" property="SubjectDeclare/DateLine" maxlength="50" attributesText='class="input" size="13" ValidateType="notempty" Msg="申报截止时间不能为空"' readonly="true"/>
                <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["SubjectDeclare/DateLine[@pattern='yyyy-MM-dd']"],"yyyy-MM-dd")>
              </td>
            </tr>
            <tr>
              <td height="5" class="td2" align="right" nowrap >包含板块：</td>
              <td height="5" class="td1">&nbsp;
              <input name="add24" type="button" class="button_02" value="新增板块" onClick="insertPlate()"></td>
            </tr>
            <% int count=0;%>
            <logic:iterate id="resultset" property="list[@type='SubjectPlate']">
            <%count++; %>
            <tr id='td<bean:write id="resultset" property="SubjectPlate/OrderID" />0'>
			  <td height="8" class="td1"></td>
			  <td class="td1"><INPUT type="hidden" name="list[@type='SubjectPlate']/SubjectPlate[@hciTagIndex='<%=count%>']/PlateID" value='<bean:write id="resultset" property="SubjectPlate/PlateID" /> ' >
              </td>
			</tr>
			  
			    <tr id='td<bean:write id="resultset" property="SubjectPlate/OrderID" />1'>
				  <td  class="td2" align="right" >板块序号：</td>
				  <td width="1006" class="td1">&nbsp;
				  <input type="text" name="list[@type='SubjectPlate']/SubjectPlate[@hciTagIndex='<%=count%>']/OrderID" class="input" size="4" value='<bean:write id="resultset" property="SubjectPlate/OrderID" /> ' readonly>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input name="add25" type="button" class="button_02" value="删除板块" onClick="deletePlate('<bean:write id="resultset" property="SubjectPlate/OrderID" />')">
				  </td> 
		    </tr>

				  <tr id='td<bean:write id="resultset" property="SubjectPlate/OrderID" />2'>
				  <td class="td2" align="right" nowrap >板块名称：</td>
				  <td class="td1">&nbsp;
				  <input type="text" name="list[@type='SubjectPlate']/SubjectPlate[@hciTagIndex='<%=count%>']/PlateName" class='input' size="40" value='<bean:write id="resultset" property="SubjectPlate/PlateName" /> '>
                  </td>
			    </tr>
				<tr id='td<bean:write id="resultset" property="SubjectPlate/OrderID" />3'>
                    <td height="23" class="td2" align="right" nowrap >内容说明：</td>
                  <td class="td1">&nbsp;
                  <textarea name="list[@type='SubjectPlate']/SubjectPlate[@hciTagIndex='<%=count%>']/content" class="input" cols="70" rows="4"><bean:write id="resultset" property="SubjectPlate/content" /> </textarea>		      
                  </td>
                </tr>
                </logic:iterate>
			  </table>
               
      </td>
            </tr>

          </table></td>
    </tr>
    <tr>
      <td class="text">
        <p align="center">&nbsp;<input name="add2" type="button" class="button_02" value="保 存" onClick="save()">
        &nbsp;
          <input name="add22" type="button" class="button_02" value="返 回" onClick="history.back()"></p>
      </td>
    </tr>
  </table>
</form>
<script>
  function save() {
  	var frm = document.forms[0];
	if(validater(frm)) frm.submit();
  
  }
  
var i ='<bean:write property="SubjectPlate/MaxOrderID"/>';
function insertPlate(){
    i++;
	var getTable= document.getElementById("plate");   

	var otr1 = getTable.insertRow();                  //新增一行
	var otda1 = otr1.insertCell();                     //新增一列
	otr1.id = "td"+i+"0";
	otda1.height = "8";
	otda1.className = "td1";
	var otda2 = otr1.insertCell();                     //新增一列
	otda2.className = "td1";
	
	var otr2 = getTable.insertRow();                  //新增一行
	var otdb1 = otr2.insertCell();                     //新增一列
	otr2.id = "td"+i+"1";
	otdb1.className = "td2";
	otdb1.align = "right";
	var otdb2 = otr2.insertCell();                     //新增一列
	otdb2.className = "td1";
	otdb1.innerHTML = "板块序号：";
	otdb2.innerHTML = "&nbsp; <input type='text' name=list[@type='SubjectPlate']/SubjectPlate[@hciTagIndex='"+i+"']/OrderID size='4' class='input' value='"+i+"' readonly>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input name='add25' type='button' class='button_02' value='删除板块' onClick='deletePlate("+i+")'>";
	
	var otr3 = getTable.insertRow();                  //新增一行
	var otdc1 = otr3.insertCell();                     //新增一列
	otr3.id = "td"+i+"2";
	otdc1.className = "td2";
	otdc1.align = "right";
	var otdc2 = otr3.insertCell();                     //新增一列
	otdc2.className = "td1";
	otdc1.innerHTML = "板块名称：";
	otdc2.innerHTML = "&nbsp; <input type='text' name=list[@type='SubjectPlate']/SubjectPlate[@hciTagIndex='"+i+"']/PlateName class='input' size='40' >";

	var otr4 = getTable.insertRow();                  //新增一行
	var otdd1 = otr4.insertCell();                     //新增一列
	otr4.id = "td"+i+"3";
	otdd1.className = "td2";
	otdd1.align = "right";
	var otdd2 = otr4.insertCell();                     //新增一列
	otdd2.className = "td1";
	otdd1.innerHTML = "内容说明：";
	otdd2.innerHTML = "&nbsp; <textarea name=list[@type='SubjectPlate']/SubjectPlate[@hciTagIndex='"+i+"']/content class='input' cols='70' rows='4'></textarea>";
}

function deletePlate(id){

    var getTable= document.getElementById("plate"); 

   for(var j=0;j<4;j++){
     var objRows   =   document.getElementById("td"+id+j);  
    
     getTable.deleteRow(objRows.rowIndex);
   }
}
</script>