<%@include file="/internet/common.jsp"%>
<html>
<head>
<title>������ί��У��Ϣһ�廯ƽ̨</title>

</head>

<body>
<form name="resultForm" method="post" action="">
<html:hidden property="Class/_order/col1/field"/>
<html:hidden property="Class/_order/col1/asc"/>
<html:hidden property="PageCond/begin"/>
<html:hidden property="PageCond/count"/>
<html:hidden property="PageCond/length"/>
<html:hidden property="QueryStudent/ClassID/criteria/value"/>


  <table width="100%"  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" id="beforefixtable1">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ-&gt;�������-&gt;�༶����-&gt;�༶��Ϣ����
              <logic:equal property="Class/isHistoryClass/criteria/value" value="2">(�ƻ��༶)</logic:equal>
              <logic:equal property="Class/isHistoryClass/criteria/value" value="0">(��ǰ�༶)</logic:equal>
              <logic:equal property="Class/isHistoryClass/criteria/value" value="1">(����༶)</logic:equal>
              </td> 
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr id="beforefixtable2">
      <td height="8">
      <html:hidden property="Class/isHistoryClass/criteria/value"/>     
       </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" id="beforefixtable3">
        <tr>
          <td height="30" class="text">  
            <html:select  property="Class/ClassTypeID/criteria/value">
          			<html:option  value="-1">ѡ��༶����</html:option>
                   <html:options property="list[@type='ClassType']/ClassType/ClassTypeID" labelProperty="list[@type='ClassType']/ClassType/ClassType"/>
             </html:select>����ʱ�䣺 <html:text property="Class/BeginTime/criteria/min"  attributesText='class="input" size="12"' readonly="true"/>
           
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["Class/BeginTime/criteria/min"],"yyyy-MM-dd")>
           - 
           <html:text property="Class/BeginTime/criteria/max" attributesText='class="input" size="14"' readonly="true"/>
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["Class/BeginTime/criteria/max"],"yyyy-MM-dd")>
               <html:hidden property="Class/BeginTime/criteria/criteriaPattern" value="yyyy-MM-dd"/> 
               <html:hidden property="Class/BeginTime/criteria/operator" value="between"/> 
           
           <html:select size="1" property="Class/Commission">      
                  <html:option  value="-1" >--��ѵ��λ--</html:option>
                  <html:option value="�����¾�">�����¾�</html:option>
                  <html:option value="��ί��֯��">��ί��֯��</html:option>                
           </html:select>
           �༶���ƣ�<html:text property="Class/key" size="15"/>
            <input name="query" type="button" class="button_02" value="�� ѯ" onClick="talentquery()"><br>
            <qx:talentButton styleId="bAdd" property="btnAdd" type="button" styleClass="button_02" value="�� ��" onclick="add()" operation="DX_TEACH_MANAGE_CLASS.DX_TEACH_MANAGE_CLASS_ADD"/>     
            <qx:talentButton styleId="bUpdate" property="btnUpate" type="button" styleClass="button_02" value="�� ��" onclick="update()" operation="DX_TEACH_MANAGE_CLASS.DX_TEACH_MANAGE_CLASS_update"/>     
            <qx:talentButton styleId="bDel" property="btnDel" type="button" styleClass="button_02" value="ɾ ��" onclick="talentdelete()" operation="DX_TEACH_MANAGE_CLASS.DX_TEACH_MANAGE_CLASS_del"/>     
            <!--<input name="add0" type="button" class="button_02" value="�� ��" onClick="toView()">-->     
            <qx:talentButton property="modify" type="button" styleClass="button_02" value="�� ��" onclick="courseDetail()" operation="DX_TEACH_MANAGE_CLASS.DX_TEACH_MANAGE_CLASS_course"/>     
             <qx:talentButton property="stu" type="button" styleClass="button_02" value="ѧԱ����" onclick="queryStudent()" operation="DX_TEACH_MANAGE_CLASS.DX_TEACH_MANAGE_CLASS_student"/>     
            <qx:talentButton styleId="bE" property="btnEnd" type="button" styleClass="button_02" value="�����༶" onclick="setClass2HistoryClass()" operation="DX_TEACH_MANAGE_CLASS.DX_TEACH_MANAGE_CLASS_endClass"/>     
            <qx:talentButton styleId="bR" property="btnEnd" type="button" styleClass="button_eight" value="��Ϊ��ǰ�༶" onclick="return2CurrentClass()" operation="DX_TEACH_MANAGE_CLASS.DX_TEACH_MANAGE_CLASS_getClass"/>     
            <input name="view" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">     
            <input name="view2" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">      
            <!--<input type="checkbox" name="checkbox" onClick="servertoorder()" marked="">-->
            <input type="hidden" name="isAdd" ><!--1:add 2:update 3:view-->    
            <input type="hidden" name="queryaction" value="teachWorkManage.prClassInfoManage.classInfoList.do">      
            <input type="hidden" name="addaction" value="">      
            <input type="hidden" name="modifyaction" value="teachWorkManage.prClassInfoManage.toUpateDetailPage.do">      
            <input type="hidden" name="deleteaction" value="teachWorkManage.prClassInfoManage.delClass.do">      
            <input type="hidden" name="viewaction">      
          </td>      
        </tr>
      </table>        
      <table width="100%" height="6"  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" id="beforefixtable4">
        <tr>
          <td> </td>
        </tr>
      </table>
      <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
          <tr align="center" bgcolor="#A2C4DC">
            <td width="2%" class="td_title" >
              <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked="firstChk">
            </td>
            <td width="8%" align="center" nowrap id="Class.ClassTypeID" onClick="" class="td_title" >�༶<br>
            ����</td>
            <td width="17%" align="center" nowrap id="Class.ClassName" onClick="talentsort()" class="td_title" >����</td>
            <td width="11%" align="center" nowrap id="Class.Commission" onClick="talentsort()" class="td_title" >��ѵ<br>��λ</td>
            <td width="5%" align="center" nowrap id="Class.RecruitNum" onClick="talentsort()" class="td_title" >�ƻ���<br>
            ������</td>
            <td width="5%" align="center" nowrap id="Class.factNum" onClick="talentsort()" class="td_title" >ʵ��<br>����</td>
            <td width="6%" align="center" nowrap id="Class.regTime" onClick="talentsort()" class="td_title" >ע��ʱ��</td>
            <td width="7%" align="center" nowrap id="Class.reachTime" onClick="talentsort()" class="td_title" >����ʱ��</td>
            <td width="6%" align="center" nowrap id="Class.BeginTime" onClick="talentsort()" class="td_title" >����ʱ��</td>
            <td width="9%" align="center" nowrap id="Class.EndTime" onClick="talentsort()" class="td_title" >�ϣ��ᣩ<br>
            ҵʱ��</td>
            <td width="9%" align="center" nowrap id="Class.ClassroomID" onClick="talentsort()" class="td_title" >�Ͽεص�</td>
            <td width="5%" align="center" nowrap id="Class.BuildingID" onClick="talentsort()" class="td_title" >ס�޵ص�</td>
            <td width="6%" align="center" nowrap id="Class.RepastCard" onClick="talentsort()" class="td_title" >�ͲͿ�</td>
            <td width="5%" align="center" nowrap id="Class.Deposit" onClick="talentsort()" class="td_title" >Ԥ��<br>
            ���</td>
            <td width="5%" align="center" nowrap id="Class.HeadTeacherID" onClick="talentsort()" class="td_title" >������
              <p>���������Σ�</p>
            </td>
          </tr>
          <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
         	<logic:iterate id="resultSet" property="list[@type='class']">
					<%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
          <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="detail('<bean:write id="resultSet" property="Class/ClassID"/>')">
            <td align="center">
           	<html:checkbox id="resultSet" name="list[@name='update']/Class/ClassID" property="Class/ClassID" indexed="true"/>
			<input type="hidden" name="isHistoryClass"  value="<bean:write id="resultSet" property="Class/isHistoryClass"/>">
            <input type="hidden" name="ClassName"  value="<bean:write id="resultSet" property="Class/ClassName"/>">
            <input type="hidden" name="factNum"  value="<bean:write id="resultSet" property="Class/factNum"/>">
            <input type="hidden" name="pageBegin"  value="<bean:write  property="PageCond/begin"/>">
         </td>
            <td align="center"><bean:write id="resultSet"  property="Class/classTypeName"/></td>
            <td><bean:write id="resultSet"  property="Class/ClassName"/></td><!--����-->
            <td align="center"><bean:write id="resultSet"  property="Class/Commission"/></td><!--��ѵ��λ-->
            <td align="center"><bean:write id="resultSet" property="Class/RecruitNum"/></td>
            <td align="center"><bean:write id="resultSet" property="Class/factNum"/></td>
            <td align="center">
             <bean:write id="resultSet"  property="Class/regTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
            </td>
            <td align="center"><bean:write id="resultSet"  property="Class/reachTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
            <td align="center"><bean:write id="resultSet"  property="Class/BeginTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
            <td align="center"><bean:write id="resultSet"  property="Class/EndTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
            <td align="center"><bean:write id="resultSet"  property="Class/classRoomName"/></td>
            <td align="center"><bean:write id="resultSet"  property="Class/buildingName"/></td><!--ס�޵ص�-->
            <td align="center">
            <logic:equal id="resultSet" property="Class/RepastCard" value="0">����</logic:equal>
            <logic:equal id="resultSet" property="Class/RepastCard" value="1">IC��</logic:equal>
            <logic:equal id="resultSet" property="Class/RepastCard" value="2">ֽ��</logic:equal>
            <logic:equal id="resultSet" property="Class/RepastCard" value="3">��Ʊ</logic:equal>
           
            </td>
            <td align="center"><bean:write id="resultSet" property="Class/Deposit"/></td>
            <td align="center">
            <bean:write id="resultSet"  property="Class/headTeacher"/>
            <script>
               var headTeacher='<bean:write id="resultSet"  property="Class/teacherAssistant"/>';
               if(headTeacher!=""){
                 document.write("��");
                 document.write(headTeacher);
                 document.write("��");
               }
            </script>          
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
          </table></td>
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
<p><font color="#C0C0C0"><b>˵����</b></font></p>
<p><font color="#C0C0C0">����������༶����ť�����ð�ת�뵽����༶�С�</font></p>
</body>
</html>

<script language="javascript">
 function add(){
    document.all("isAdd").value="1";
    document.resultForm.action="teachWorkManage.prClassInfoManage.toAddUPdatePage.do?isHistoryClass="+document.all("Class/isHistoryClass/criteria/value").value;
    document.resultForm.submit();
 }
 
 function update(){ 
 var frm=document.resultForm;
  if(chechedCount(frm)<1){
    alert("���ٱ���ѡ��һ�У�");
    		return ;
  }
  if(chechedCount(frm)>1){
    		alert("ֻ��ѡ��һ�У�");
    		return ;
  }
  
  var index=getChechedIndex(frm); 
  var isHistoryClass=frm.elements[++index].value;


  if(isHistoryClass=="1"){//�������ʷ�༶���޸�ʵ������

     var className=frm.elements[index+2].value; 
     var stuNum=frm.elements[index+2].value;    
     var pageBegin=frm.elements[index+3].value;     
     var  array=new  Array(4);
     array[0]=getChechedValue(frm);
     array[1]=className;  
     array[2]=stuNum;  
     array[3]=pageBegin;  
     var refreshMark = new Date().getTime();
     var loc="teachWorkManage.prClassInfoManage.showUpdatePage.do?refreshMark="+refreshMark;
     window.showModalDialog(loc,array,"DialogWidth:500px,DialogHeight:150px;status:no;scrollbar:no");
  
  }else{
   frm.elements["isAdd"].value="2";
   talentmodify();
   }
   
 }
 
 function toView(){
  var frm=document.resultForm;
  if(chechedCount(frm)<1){
    alert("���ٱ���ѡ��һ�У�");
    		return ;
  }
  if(chechedCount(frm)>1){
    		alert("ֻ��ѡ��һ�У�");
    		return ;
  }
  var chkValue=getChechedValue(frm);  
  detail(chkValue);
 }
 //ת����ʷ�༶
function setClass2HistoryClass(){
 if(chechedCount(frm)<1){
    alert("���ٱ���ѡ��һ�У�");
    		return ;
  }
  if(chechedCount(frm)>1){
    		alert("ֻ��ѡ��һ�У�");
    		return ;
  }
  if(confirm("����Ϊ��ʷ�༶��ȷ����?")==true){
    document.resultForm.action="teachWorkManage.prClassInfoManage.setClass2HistoryClass.do";
    document.resultForm.submit();
    }
 }
 
 function detail(classid){

   document.resultForm.elements["isAdd"].value="3";
   document.resultForm.action="teachWorkManage.prClassInfoManage.toUpateDetailPage.do?fid="+classid;
   document.resultForm.submit();
 }
 
 

 
 //ѡ�е��ǵڼ���checkbox
 function getChechedIndex(form) {
	
		var eles = form.elements;
		var i=0;
		while(i<eles.length){
			var obj= eles[i];
			if(obj.type == "checkbox" && !obj.disabled && obj.getAttribute("marked")==null){
				if(obj.checked){
				  return i;
			     }
			}
			i++
		}//while
}

function getChechedValue(form) {
	
		var eles = form.elements;
		var i=0;
		while(i<eles.length){
			var obj= eles[i];
			if(obj.type == "checkbox" && !obj.disabled && obj.getAttribute("marked")==null){
				if(obj.checked){
				  return obj.value;
			     }
			}
			i++
		}//while
}


function queryStudent(){
  var frm=document.resultForm;
  
  if(chechedCount(frm)<1){
    alert("���ٱ���ѡ��һ�У�");
    		return ;
  }
  if(chechedCount(frm)>1){
    		alert("ֻ��ѡ��һ�У�");
    		return ;
  }
frm.elements["PageCond/begin"].value="";
frm.elements["PageCond/count"].value="";
frm.elements["PageCond/length"].value="";

var index=getChechedIndex(frm);
var className=frm.elements[index+2].value; 
 
    var classId=getChechedValue(frm);
    frm.elements["QueryStudent/ClassID/criteria/value"].value=classId;
    document.resultForm.action="teachWorkManage.prClassInfoManage.queryStudents.do?PageCond=&theClassName="+className;
    frm.target="";
    document.resultForm.submit();
}

function courseDetail(){ 
  var classId=getChechedValue(frm);
   if(chechedCount(frm)<1){
    alert("���ٱ���ѡ��һ�У�");
    		return ;
  }
  if(chechedCount(frm)>1){
    		alert("ֻ��ѡ��һ�У�");
    		return ;
  }
  
var index=getChechedIndex(frm);
var className=frm.elements[index+2].value; 
  
  frm.action="teachWorkManage.prClassInfoManage.courseDetail.do?isAdopted=1&TeachingPlan/ClassID="+classId+"&theClassName="+className;
  frm.target="_blank";
  frm.submit();
}

function init(){
   var isHistory='<bean:write property="Class/isHistoryClass/criteria/value"/>';
   if(isHistory=="1"){
       if(document.forms[0].elements["btnAdd"]!=null) document.forms[0].elements["btnAdd"].style.display="none";
       if(document.forms[0].elements["bUpdate"]!=null) document.forms[0].elements["bUpdate"].style.display="none";
       if(document.forms[0].elements["bDel"]!=null) document.forms[0].elements["bDel"].style.display="none";
       if(document.forms[0].elements["bE"]!=null) document.forms[0].elements["bE"].style.display="none";
   }else{
   if(document.forms[0].elements["bR"]!=null) document.forms[0].elements["bR"].style.display="none";
   if(isHistory=="2"){
       if(document.forms[0].elements["modify"]!=null)  document.forms[0].elements["modify"].style.display="none";
       if(document.forms[0].elements["stu"]!=null) document.forms[0].elements["stu"].style.display="none";
       if(document.forms[0].elements["bE"]!=null) document.forms[0].elements["bE"].style.display="none";
       if(document.forms[0].elements["bR"]!=null)  document.forms[0].elements["bR"].style.display="";
    }
   }
}

function return2CurrentClass(){
 if(chechedCount(frm)<1){
    alert("���ٱ���ѡ��һ�У�");
    		return ;
  }
  if(chechedCount(frm)>1){
    		alert("ֻ��ѡ��һ�У�");
    		return ;
  }
   if(confirm("����Ϊ��ǰ�༶��ȷ����?")==true){
   frm.action="teachWorkManage.prClassInfoManage.return2CurrentClass.do";
   frm.submit();
   }
}

init();
</script>