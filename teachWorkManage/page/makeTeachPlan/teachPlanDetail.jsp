<%@include file="/internet/common.jsp"%>


<body>
<form name="addUPdateForm" method="post">
<html:hidden property="isAdd"/>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;��ѧ�ƻ����ơ�&gt;�鿴��ѧ�ƻ����</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8">
      <html:hidden property="TeachingPlan/PlanID"/> 
      <html:hidden property="TeachingPlan/State"/> 
      </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr  onClick="changeTRBgColor(this)">
            <td width="12%" align="right" class="td2">��ѧ�ƻ����ƣ�</td>
            <td width="88%" class="td1">
            <bean:write property="TeachingPlan/PlanName"/>
           </td>    
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">��&nbsp;&nbsp;&nbsp;&nbsp;����</td>
            <td class="td1">
            <logic:iterate id="clsssResult" property="list[@type='Class']">
             <logic:equal value="Class/ClassID" valueType="variable" valueId="clsssResult" property="TeachingPlan/ClassID">
               <bean:write id="clsssResult" property="Class/ClassName"/>
                </logic:equal>
            </logic:iterate>         
       </td>    
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">ʱ&nbsp;&nbsp;&nbsp;&nbsp;�䣺</td>
            <td class="td1">��<bean:write property="TeachingPlan/StartTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
         ��  <bean:write property="TeachingPlan/EndTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
          </td>    
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">��ѧ�ƻ����ͣ���</td>
            <td class="td1">
            <dict:write businTypeId="BNDICT_teachPlanType" property="TeachingPlan/PlanType"/>
          </td>
          </tr>
          <tr>
            <td align="right" class="td2">��ѧĿ�ģ�</td>
            <td class="td1">
             <bean:write property="TeachingPlan/Purpose"/>
         </td>   
          </tr>
         
          <tr>
            <td align="right" class="td2">��ѧ������</td>
            <td class="td1">
             <bean:write property="TeachingPlan/Arrange"/>
          </td>   
          </tr>
         
          <tr>
            <td align="right" class="td2">ѧϰ���ݼ����ţ�</td>
            <td class="td1">
              <bean:write property="TeachingPlan/Method"/>
         </td>   
          </tr>
        
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">ʵʩҪ�󣨽�ѧ��֯������</td>
            <td class="td1">
            <bean:write property="TeachingPlan/Implement"/>
              &nbsp;</td>   
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">ѧϰ���ˣ�</td>
            <td class="td1">
            <bean:write property="TeachingPlan/ck"/>
              &nbsp;</td>   
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">��ע��</td>
            <td class="td1">
            <bean:write property="TeachingPlan/reamrk"/>
              &nbsp;</td>   
          </tr>
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">&nbsp; 
                <input name="Submit2" type="button" class="button_02" value="�� ��" onclick="window.history.go(-1)"></td>
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
var frm=document.addUPdateForm;

function save(){
if(frm.elements["TeachingPlan/ClassID"].value=="-1"){
  alert("��ѡ��༶��");
  return;
}else{
  frm.action="teachWorkManage.prMakeTeachPlan.saveTeachPlan.do";
  frm.submit();
  }
}

function checkContentLen(objName,obj){
  if(obj.value.length>1000){
      alert(objName+"�������ܳ���1000����");
      obj.focus();
      return;
  }
}

function goBak(){
 frm.action="teachWorkManage.prMakeTeachPlan.teachPlanFrame.do?PageCond=";
 frm.target="_self";
 frm.submit();
}

function selectClass(){
     var refresMark=new Date().getTime();
  var loc="teachWorkManage.prMakeTeachPlan.selectClass.do?Class/isHistoryClass=0&refrSSSeshMark="+refresMark;
  var acceptValue="";
  try{
     acceptValue=window.showModalDialog(loc,"","dialogWidth:660px;DialogHeight=480px;status:no;scroll:yes");  
   }catch(e){}
}
</script>