<%@include file="/internet/common.jsp"%>
<%
base.util.RightParse RP = new base.util.RightParse();
boolean canDelegate = RP.parse("DX_TEACH_MANAGE_TeachPlan_frame.DX_TEACH_MANAGE_TeachPlan_frame_sq",session) ; %>
<body>
<form name="listForm" method="post">

<html:hidden property="PageCond/begin"/>
<html:hidden property="PageCond/count"/>
<html:hidden property="PageCond/length"/>
<html:hidden property="isAdd"/>
  <table width="98%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="98%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;��ѧ�ƻ����ơ�&gt;��ѧ�ƻ����</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" class="text">  
          <qx:talentButton property="add2" type="button" styleClass="button_02" value="�������" onclick="add()" operation="DX_TEACH_MANAGE_TeachPlan_frame.DX_TEACH_MANAGE_TeachPlan_frame_update"/>
           <qx:talentButton property="add23" type="button" styleClass="button_02" value="�޸Ŀ��" onclick="update()" operation="DX_TEACH_MANAGE_TeachPlan_frame.DX_TEACH_MANAGE_TeachPlan_frame_update"/>
            <qx:talentButton property="add3" type="button" styleClass="button_02" value="ɾ�����" onclick="delFrame()" operation="DX_TEACH_MANAGE_TeachPlan_frame.DX_TEACH_MANAGE_TeachPlan_frame_del"/>
            <qx:talentButton property="add24" type="button" styleClass="button_02" value="�༭��Ԫ" onclick="editUnit()" operation="DX_TEACH_MANAGE_TeachPlan_frame.DX_TEACH_MANAGE_TeachPlan_frame_uu"/>
            <qx:talentButton property="add55" type="button" styleClass="button_02" value="��Ϊ�ո�" onclick="set4FinalPlan()" operation="DX_TEACH_MANAGE_TeachPlan_frame.DX_TEACH_MANAGE_TeachPlan_frame_over"/>
            <input name="add23" type="button" class="button_02" value="�鿴���" onClick="toDetail()"> 
            <input type="hidden" name="queryaction">
         
            </td>  
        </tr>
      </table>        
      <table width="98%" height="6"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td></td>
        </tr>
      </table>
      <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr align="center" class="td_title">
            <td width="41">
              <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked="">
            </td>
            <td width="240" nowrap id="TeachingPlan.PlanName" onClick="talentsort()">�ƻ�����</td>
            <td width="390" nowrap id="TeachingPlan.ClassID" onClick="talentsort()">�༶</td>
            <td width="70" nowrap id="TeachingPlan.StartTime" onClick="talentsort()">��ʼʱ��</td>
            <td width="70" nowrap id="TeachingPlan.EndTime" onClick="talentsort()">����ʱ��</td>
            <td width="120" nowrap id="TeachingPlan.PlanType" onClick="talentsort()">��ѧ�ƻ�����</td>
            <td  nowrap id="TeachingPlan.PlanType" onClick="talentsort()">״̬</td>
            <td  nowrap id="TeachingPlan.PlanType" onClick="talentsort()">����</td>
          </tr>
           <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
        <logic:iterate id="resultSet" property="list[@type='TeachingPlan']">
          	<%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
          <tr class="<%=trClass %>" onClick="changeTRBgColor(this)" onDBlClick="detail('<bean:write id="resultSet" property="TeachingPlan/PlanID"/>')">
            <td align="center" width="41">
          	<html:checkbox id="resultSet" name="list[@name='update']/TeachingPlan/PlanID" property="TeachingPlan/PlanID" indexed="true"/>
            <input type="hidden" name="classType" value='<bean:write id="resultSet" property="TeachingPlan/PlanType"/>'>
            <td align="left" width="240"><bean:write id="resultSet" property="TeachingPlan/PlanName"/></td>
            <td align="center"width="390"><bean:write id="resultSet" property="TeachingPlan/className"/></td>
            <td align="center" width="70"><bean:write id="resultSet" property="TeachingPlan/StartTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
            <td align="center" width="70"><bean:write id="resultSet" property="TeachingPlan/EndTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
            <td align="center" width="120">
            <dict:write businTypeId="BNDICT_teachPlanType" property="TeachingPlan/PlanType" id="resultSet"/>
            </td>
             <td align="center" nowrap>
             <logic:equal id="resultSet" property="TeachingPlan/State" value="-4">δͨ�������壩</logic:equal>
             <logic:equal id="resultSet" property="TeachingPlan/State" value="-1">δͨ������ܣ�</logic:equal>
             <logic:equal id="resultSet" property="TeachingPlan/State" value="1">����ˣ���ܣ�</logic:equal>
             <logic:equal id="resultSet" property="TeachingPlan/State" value="2">��ˣ���ܣ�</logic:equal>
             <logic:equal id="resultSet" property="TeachingPlan/State" value="3">���������ɸѡ</logic:equal>
             <logic:equal id="resultSet" property="TeachingPlan/State" value="4">���������壩</logic:equal>
             <logic:equal id="resultSet" property="TeachingPlan/State" value="5">����ͨ��</logic:equal>
             <logic:equal id="resultSet" property="TeachingPlan/State" value="6">�ո�</logic:equal>
              </td>
               <td align="center" nowrap>
              <%if(canDelegate){ %>
                  <a href="javascript:delegate('<bean:write id="resultSet" property="TeachingPlan/PlanID"/>','<bean:write id="resultSet" property="TeachingPlan/PlanName"/>')">��Ȩ</a>
              <%} %>
               
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
</body>
<script language="javascript">
var frm=document.listForm;

function delegate(planId,planName){
  var remark=(new Date()).getTime();
  var loc="teachWorkManage.prMakeTeachPlan.delegate.do?remark="+remark+"&TeachingPlanUnit/PlanID="+planId+"&planName="+planName;
  window.open(loc,"","width=600,height=350,left=250,top=250,status=yes,scroll=yes");  
     
  
}

function add(){
   frm.action="teachWorkManage.prMakeTeachPlan.toAddTeachPlanPage.do?Class/isHistoryClass=0";
   frm.submit();
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
    var planID=getChechedValue(frm);
    frm.elements["isAdd"].value="2";  
    frm.action="teachWorkManage.prMakeTeachPlan.updateTeachPlan.do?TeachingPlan/PlanID="+planID;
    frm.submit();
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

function detail(planId){
    frm.elements["isAdd"].value="3";  
    frm.action="teachWorkManage.prMakeTeachPlan.updateTeachPlan.do?TeachingPlan/PlanID="+planId;
    frm.submit();
}

function toDetail(){
  if(chechedCount(frm)<1){
    alert("���ٱ���ѡ��һ�У�");
    		return ;
  }
  if(chechedCount(frm)>1){
    		alert("ֻ��ѡ��һ�У�");
    		return ;
  }
   var planID=getChechedValue(frm);
   detail(planID);
}

function editUnit(){
   if(chechedCount(frm)<1){
    alert("���ٱ���ѡ��һ�У�");
    		return ;
  }
  if(chechedCount(frm)>1){
    		alert("ֻ��ѡ��һ�У�");
    		return ;
  }
  var planID=getChechedValue(frm);
  frm.action="teachWorkManage.prMakeTeachPlan.editUnit_new.do?TeachingPlan/PlanID="+planID;
  
  var index=getChechedIndex(frm); 
  var classType=frm.elements[++index].value;
 
  if(classType=="2"){//�����ר�����������
    var planID=getChechedValue(frm);
    frm.action="teachWorkManage.prMakeTeachPlan.editMajorSuject.do?export=0&TeachingPlan/PlanID="+planID;
  }
  frm.submit();
}

function delFrame(){
 if(chechedCount(frm)<1){
    alert("���ٱ���ѡ��һ�У�");
    		return ;
  }
 
   if(confirm("�����صĵ�Ԫ���γ�ͬʱɾ����ȷ����")==false){
      return;
   }else{   
   frm.action="teachWorkManage.prMakeTeachPlan.delFrame.do";
   frm.submit();
   }
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

function set4FinalPlan(){
 if(chechedCount(frm)<1){
    alert("���ٱ���ѡ��һ�У�");
    		return ;
  }
  if(confirm("ȷʵ��Ϊ�ո���")){
    frm.action="teachWorkManage.prMakeTeachPlan.set4FinalPlan.do";
    frm.submit();
  }
}
</script>