<%@include file="/internet/common.jsp"%>
<style type="text/css">
<!--
.style2 {font-family: "����"}
-->
</style>
<script language="javascript">
function modify_evl() {
var i = 1;
var j = 0;
var evlId = "";
var path = "teachWorkManage.prTeachEvaluate.prShortEvlModify.do?EvaluationID=";

while (document.getElementById("checkbox"+i) != undefined) {
   if (document.getElementById("checkbox"+i).checked == true) {
      j++;
      if (document.getElementById("canfix"+i).value == "canfix")
         evlId = document.getElementById("checkbox"+i).value;
      else {
         alert("��ѡ�����������������������У������޸ģ�");
         return;
      }
   }
   i++;
}
if (j == 0) {
   alert("��ѡ������һ���汾������������޸ģ�");
   return;
} else if (j > 1) {
   alert("��ѡ������һ���汾������������޸ģ�");
   return;
} else {
   path = path + evlId + "&status=modify";
   window.location.href = path;
}

}

function del_evl() {
var i = 1;
var j = 0;
var evlId = "";
var nofix = "";
var path = "teachWorkManage.prTeachEvaluate.prShortListDel.do?Evaluation/ClassType=2&Evaluation/Period=ÿ��";

while (document.getElementById("checkbox"+i) != undefined) {
   if (document.getElementById("checkbox"+i).checked == true) {
      j++;
      if (document.getElementById("canfix"+i).value == "canfix") {
         evlId = document.getElementById("checkbox"+i).value;
         path = path + "&evlList/Evaluation" + j + "/EvaluationID="+evlId;
      }
      else
         nofix = nofix + i + ",";
   }
   i++;
}
if (j == 0) {
   alert("��ѡ������һ�����������ͽ���ɾ����");
   return;
} else if (nofix != "") {
   alert("��" + nofix.substr(0,nofix.length-1) + "�������������������������У�����ɾ����");
   return;
}

if (i<=2) {
   alert("ʣ��һ������ɾ��!");
   return;
}

if (confirm("ȷ��ɾ����Щ��¼����")) window.location.href = path;

}
				
function add_evl() {
   if (confirm("ȷ������һ���̰���������"))
      window.location.href = 'teachWorkManage.prTeachEvaluate.prShortEvlAdd.do?Evaluation/ClassType=2&Evaluation/Period=ÿ��&status=add';
}

function dispView(evlId) {
   window.location.href = "teachWorkManage.prTeachEvaluate.prShortEvlView.do?EvaluationID=" + evlId;
}

function selectClasses(){
    var i = 1;
    var j = 0;
    var evlId = "";
    var remark=(new Date()).getTime();
    var loc="teachWorkManage.prTeachEvaluate.prSelectClasses.do?single=false&remark="+remark;
    
    while (document.getElementById("checkbox"+i) != undefined) {
      if (document.getElementById("checkbox"+i).checked == true) {
         j++;
         evlId = document.getElementById("checkbox"+i).value;
      } 
      i++;
    }
    
    if (j == 0) {
       alert("������ѡ��һ��������汾��");
       return;
    } else if (j > 1) {
       alert("��ѡ��һ��������汾��");
       return;
    }
  
    window.open(loc+"&Evaluation/EvaluationID="+evlId,'selectClasses','width=540,height=330,status=yes,toolbar=no,menubar=no,location=no');
}
</script>
<body>
<form method="post" action="teachWorkManage.prTeachEvaluate.prShortEvlList.do">
<input type="hidden" name="dataEntity/_order/col1/field" value="me">
<input type="hidden" name="dataEntity/_order/col1/asc" value="ASC">
<html:hidden property="Evaluation/ClassType" value="2"/>
<html:hidden property="Evaluation/Period" value="ÿ��"/>
<html:hidden property="PageCond/begin"/>
<html:hidden property="PageCond/count"/>
<html:hidden property="PageCond/length" />
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td id="printTable" class="text_wirte">��ҳ��&gt;�������&gt;��ѧ����������&gt;�̰�����������</td>
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
	  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td height="30" class="text">&nbsp;
              <td height="30" class="text">
              <qx:talentButton property="add_button" type="button" styleClass="button_02" value="����" onclick="add_evl();" operation="DX_TEACH_MANAGE_TeachEvl_EvlSetup_ShortEvl.DX_TEACH_MANAGE_TeachEvl_EvlSetup_ShortEvl_Add"/>
              <qx:talentButton property="modify_button" type="button" styleClass="button_02" value="�޸�" onclick="modify_evl();" operation="DX_TEACH_MANAGE_TeachEvl_EvlSetup_ShortEvl.DX_TEACH_MANAGE_TeachEvl_EvlSetup_ShortEvl_Modify"/>
              <qx:talentButton property="del_button" type="button" styleClass="button_02" value="ɾ��" onclick="del_evl();" operation="DX_TEACH_MANAGE_TeachEvl_EvlSetup_ShortEvl.DX_TEACH_MANAGE_TeachEvl_EvlSetup_ShortEvl_Del"/>
              <qx:talentButton property="del_button" type="button" styleClass="button_03" value="ѡ�����ð༶" onclick="selectClasses();" operation="DX_TEACH_MANAGE_TeachEvl_EvlSetup_ShortEvl.DX_TEACH_MANAGE_TeachEvl_EvlSetup_ShortEvl_Del"/>
              <input name="print_button" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
              <input type="hidden" name="queryaction" value="teachWorkManage.prTeachEvaluate.prShortEvlList.do?Evaluation/ClassType=2&Evaluation/Period=ÿ��">
              <input type="hidden" name="addaction" value="">
              <input type="hidden" name="viewaction">
             </td>
             </td>
        </tr>
      </table>      
        
      </td>
    </tr>
    <tr>
      <td class="text">
	  <table id="listdetail" width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr align="center" class="td_title"> 
            <td width="7%"><input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""></td>
            <td nowrap id="dataEntity.me1" onClick="talentsort()" width="13%">����</td>
            <td nowrap id="dataEntity.me3" onClick="talentsort()" width="25%">���ð༶</td>
            <td nowrap id="dataEntity.me4" onClick="talentsort()" width="11%">����ʱ��</td>
            <td nowrap id="dataEntity.me6" onClick="talentsort()" width="11%">���������</td>
            <td nowrap id="dataEntity.me7" onClick="talentsort()" width="10%">�汾��</td>
            <td nowrap id="dataEntity.me5" onClick="talentsort()" width="19%">��ע</td>
          </tr>
          <% int evllen = 0; %>
          <logic:iterate id="evaluator" property="list[@type='Evaluation']">
          <% evllen++; %>
          <tr align="center" <%if (evllen%2 != 0) out.print("class='td1'"); else out.print("class='td2'");%> onclick="changeTRBgColor(this)" ondblclick="dispView('<bean:write id="evaluator" property="Evaluation/EvaluationID"/>')"> 
            <td width="7%">
            <input type="checkbox" id="checkbox<%=evllen%>" value="<bean:write id="evaluator" property="Evaluation/EvaluationID"/>">
            <input type="hidden" id="canfix<%=evllen%>" value="<bean:write id="evaluator" property="Evaluation/CanFix"/>">
            </td>
            <td width="12%"><bean:write id="evaluator" property="Evaluation/Title"/></td>
            <td id="tdClassName<%=evllen%>" width="18%">
            <%
              String classNames = base.util.TalentContext.getValue(pageContext,"evaluator","Evaluation/ClassName");
            if (!"".equals(classNames)) {
               if (classNames.indexOf(",")>=0) {
                     String[] classes = classNames.split(",");
                     classNames = "";
                  for (int k=0;k<classes.length;k++) {
                         classNames += classes[k] + "<Br>";
                     }
                     out.println(classNames);
                 } else {
                    out.println(classNames);
                 }
              } else {
                 out.println("δ����");
              }
            %>
            </td>
            <td width="12%"><bean:write id="evaluator" property="Evaluation/Period"/></td>
            <td width="10%"><bean:write id="evaluator" property="Evaluation/IsAdvice"/></td>
            <td width="9%"><bean:write id="evaluator" property="Evaluation/Version"/></td>
            <td width="18%" align="left"><bean:write id="evaluator" property="Evaluation/Remarks"/></td>
          </tr>
          </logic:iterate>
        </table>
      </td>
    </tr>
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
</form>
</body>