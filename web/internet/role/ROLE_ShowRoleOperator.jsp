<%@ include file="/internet/common.jsp" %>
<html>
<head>
<script language="JavaScript" src="/internet/scripts/pagination.js"></script>
<link rel="stylesheet" href="/internet/theme/style0/style.css" type="text/css" />
<LINK REL="stylesheet" TYPE="text/css" HREF="/internet/css/style.css"/>
</head>
<form name="frmOperatorList" action="ROLE.pr_automata.ROLE_P_QueryRoleOperator.do" method="POST">
  <!----------Hidden Param Start---------------->

  <html:hidden property="QueryCondition[@entity='EOSVOperatorRole']/PageCond/begin" /> 
  <html:hidden property="QueryCondition[@entity='EOSVOperatorRole']/PageCond/length" /> 
  <html:hidden property="QueryCondition[@entity='EOSVOperatorRole']/PageCond/count" /> 
  <!----------Hidden Param END---------------->
  <html:hidden  property="roleID"/> 
  <html:hidden  property="roleName"/>
  <html:hidden property="EOSRole/roleName"/> 
  <html:hidden property="EOSRole/roleID"/> 
  <script>
		var otherPage = new page();
		otherPage.init("frmOperatorList", "QueryCondition[@entity='EOSVOperatorRole']/PageCond/begin", "QueryCondition[@entity='EOSVOperatorRole']/PageCond/length", "QueryCondition[@entity='EOSVOperatorRole']/PageCond/count");
	</script>
  <table cellpadding=0 cellspacing=0 border="1" class="tab" bgcolor="#EEEEEE" height="100%" width="102%" bordercolor="#B6B5B5" style="border-collapse: collapse" >
    <tr> 
      <td valign="top"> 
        <table width="80%" border="0" cellspacing="0" cellpadding="0" align="center">
          <tr><td>&nbsp;</td></tr>
          <tr class="query_content"> 
            <td align="right">��ɫ��<bean:write property="EOSRole/roleName"/></td>
          </tr>
          <tr > 
            <td class="tb_blue">
              <table width="100%" border="1" cellpadding="0"  cellspacing="0" bordercolor="#B6B5B5" style="border-collapse: collapse" >
                <tr class="tableHeadTR"> 
                  <td width="4%"> ѡ��</td>
                  <td width="48%">�û���ʵ����</td>
                  <td width="48%">�û���¼��</td>
                </tr>
                <logic:iterate id="notePaper" property="QueryCondition[@entity='EOSVOperatorRole']/list[@type='EOSVOperatorRole']"> 
                <tr class="tableContentTR"> 
                  <td width="4%"> <html:checkbox indexed="true" id="notePaper" name="list/EOSOperatorRole/operatorID" property="EOSVOperatorRole/operatorID" /> 
                  </td>
                  <td width="48%"> <bean:write id="notePaper" property="EOSVOperatorRole/operatorName"/> 
                  </td>
                  <td width="48%"> <bean:write id="notePaper" property="EOSVOperatorRole/userID"/> 
                  </td>
                </tr>
                </logic:iterate> 
                </table>
             </td>
          </tr>
           <tr><td>&nbsp;</td></tr>
          <tr class=queryLabelTD> 
              <td align="right"> 
                    <!-------------------��ҳ��ʼ---------------------------->
                    <script>
						if (otherPage.total != 1 && !otherPage.noCount) {
							document.write('<a href="javascript:otherPage.previousPage();">��һҳ</a>&nbsp;');
							document.write('<a href="javascript:otherPage.nextPage();">��һҳ</a>&nbsp;&nbsp;&nbsp;');
							document.write('�ܹ�' + otherPage.count + '��');
							document.write('&nbsp;&nbsp;��');
							document.write(otherPage.current + '/');
							document.write(otherPage.total + 'ҳ')
						}
                    <!-------------------��ҳ����---------------------------->
		   </script>
	       </td>
          </tr>
          <tr><td>&nbsp;</td></tr>
          <tr>
            <td>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td align="left"> 
                   <input type="button" name="button2" value="&nbsp;����&nbsp;" onclick="javascript:add()"/>
                   <input type="button" name="button1" value="&nbsp;ɾ��&nbsp;" onclick="javascript:del()"/>

		  </td>
                </tr>
              </table>
             </td>
          </tr>
        </table>
      </td>
  
    </tr>
  </table>
  </td>
  </tr> </table> 
</form></html>
<%@ include file="/internet/commonTail.jsp" %>
<script language="javascript">
function add(){

		var win = window.open("ROLE.pr_automata.BNOM_P_ShowEmpMain.do?roleID=<bean:write property="roleID"/>&roleName=<bean:write property="EOSRole/roleName"/>","childWIn","menuBar:no,toolbar=no,addressbar=no,width=700,height=500,scrollbars=no,statusbar=no");
		win.opener = window;
  	}
function del() {
	var frm = document.frmOperatorList;
	var selectedName="";
	if(selectedCheckboxCount(frm) < 1){
		alert("������ѡ��һ����¼����ִ��ɾ������!");
		return false;
	} else {
		if(confirm("ȷ��ɾ����?")) {
			frm.action = "ROLE.pr_automata.ROLE_P_DelRoleOperator.do";
			frm.submit();
		} else {
			return false;
		}
	}
}
</script>
<script language="javascript">
function getCheckedValue(frm) {

	var length =0;
	var i=0;
	var count =0;
	eles = frm.elements;
	while(i<eles.length){
		obj= eles.item(i);
		type = obj.attributes.item("type").nodeValue;
		if(type == "checkbox"){
			if(obj.checked){
				return obj.value;
				//count++;
			}
		}
		i++;
	}
	//return count;
}

function selectedCheckboxCount(frm){
	var length =0;
	var i=0;
	var count =0;
	eles = frm.elements;
	while(i<eles.length){
		obj= eles.item(i);
		type = obj.attributes.item("type").nodeValue;
		if(type == "checkbox"){
			if(obj.checked){
				count++;
			}
		}
		i++;
	}
	return count;
}
</script>
