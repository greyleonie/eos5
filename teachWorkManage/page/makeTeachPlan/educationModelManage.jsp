<%@include file="/internet/common.jsp"%>

<body>
<form>

  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;��ѧ�ƻ����ơ�&gt;��ѧģʽά��</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text"><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" class="text" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input name="daochu" type="button" class="button_02" value="����" onClick="add()">
  <input name="daochu" type="button" class="button_02" value="ɾ��" onClick="del()">
  <!--<input name="daochu" type="button" class="button_02" value="�����޸�" onClick="modifySave('listdetail')">-->
         <!--<input name="B3" type="button" class="button_02" value="�� ӡ">--> 
<input type="hidden" name="modifytoSave" value="teachWorkManage.prMakeTeachPlan.updateEducationModel.do">              
<html:hidden property="PageCond/begin"/>
<html:hidden property="PageCond/count"/>
<html:hidden property="PageCond/length"/>
<html:hidden property="recordsId"/>
</td> 
        </tr>
      </table>      
      
        <table width="86%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
          <tr align="center" class="td_title">
            <td width="30" align="center">
            <input type="checkbox" name="C1" value="ON"></td>
           <td width="10%">���</td>
            <td width="90%">����</td>
          </tr>
          <%
          int i=0; 
            String trClass="";
          %>
          <logic:iterate id="resultSet" property="list[@type='EducatingMode']">
           <%
           if(i%2==0)
							trClass = "td1";
						else
							trClass = "td2";
           i++; 
           %>
          <tr class="<%=trClass %>">
            <td width="30" align="center">
             	<html:checkbox id="resultSet" name="list[@type='EducatingMode']/EducatingMode/EducatingModeID" property="EducatingMode/EducatingModeID" indexed="true"/>
			<html:hidden name="educationModalId" id="resultSet" property="EducatingMode/EducatingModeID"/>
			</td>
            
           <td width="81" align="center"><%=i %>
             </td>
            <td width="95" onClick="toEditable()"><bean:write id="resultSet" property="EducatingMode/EducatingMode"/></td>
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
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
</form>
</body>
<script>
 var frm=document.forms[0];
function add(){
 var loc="teachWorkManage.prMakeTeachPlan.addEducationModel.do?isAdd=1";
 window.open(loc,"","left=200,top=200,width=450,height=200,status=yes");
}

function update(){ 
  if(chechedCount(frm)<1){
    alert("���ٱ���ѡ��һ�У�");
    		return ;
  }
  if(chechedCount(frm)>1){
    		alert("ֻ��ѡ��һ�У�");
    		return ;
  }
}

function del(){
  if(chechedCount(frm)<1){
    alert("����ѡ��һ�У�");
    		return ;
  }
  if(chechedCount(frm)>1){
    alert("ֻ��ѡ��һ�У�");
    return ;
  }
  
 var recordsId=selectedId();
 if(recordsId!=""){
    document.forms[0].elements["recordsId"].value=recordsId;
    frm.action="teachWorkManage.prMakeTeachPlan.delEducationModal.do";
    frm.submit();
  }
}

function selectedId(){
   var objs=document.forms[0].elements;
   var len=objs.length;
 
   for(var i=0;i<len;i++){
     var item=objs[i];   
     
     if(item.type=="checkbox"&&item.checked==true){      
          return item.value;         
     }
   }
}
</script>