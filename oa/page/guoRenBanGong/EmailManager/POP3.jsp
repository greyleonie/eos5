<%@ include file="/internet/common.jsp" %>

<body>
<form name="queryForm" method="post" action="oa.prPersonOffice.pop3server.do">
<html:hidden property="PageCond/begin" />
<html:hidden property="PageCond/length" />
<html:hidden property="PageCond/count" />
<html:hidden property="Order/col1"/>
<html:hidden property="Order/col1/@order"/>
<input name="marked" type="hidden" value="1">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="24" background="/internet/image/lz_bg.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="12"></td>
        <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;���˰칫��&gt;����POP3�ʼ�</td>
      </tr>
    </table></td>
  </tr>
</table>
  <table width="98%" height="30"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td align="left"><input name="Submit" type="button" class="button_eight" value="ͳ��POP3�ʼ���" onclick="pop3Count()" />
          <input name="Submit3" type="button" class="button_eight" value="����POP3�ʼ�" onclick="pop3Receive()" />
          <input name="Submit3" type="button" class="button_eight" value="ɾ��POP3�ʼ�" onclick="pop3Delete()" />
      </td>
    </tr>
  </table>
  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CBCBCB">
    <tr class="tdtitle">
      <td width="5%" height="20" align="center" class="td_title"><input type="checkbox" name="checkbox" onclick="eosCheckAll(document.queryForm,this)" /></td>
      <td width="26%" align="center" class="td_title" onClick="talentsort()">POP3������</td>
      <td width="17%" align="center" class="td_title" onClick="talentsort()">�����ʼ���</td>
      <td width="10%" align="center" class="td_title" onClick="talentsort()">ɾ��Զ��</td>
      <td width="29%" align="center" class="td_title" onClick="talentsort()">�ʺ�����</td>
      <td width="13%" align="center" class="td_title" onClick="talentsort()">Զ���ʼ���</td>
    </tr>
    <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  %>
		<logic:iterate id="resultset" property="list[@type='TOOL_MAILSERVER']">
		 <%
				     
			       	if(count%2==0)
			       	    trClass = "td1";
			       	else
			       	    trClass = "td2";
			       	count++;
		%>
        <tr class="<%=trClass%>" onclick="changeTRBgColor(this)"> 
          <td height="20" align="center" class="text"><html:checkbox id="resultset" name="list[@name='update']/TOOL_MAILSERVER/SERVERID" property="TOOL_MAILSERVER/SERVERID" indexed="true"/></td>
          <td align="left" class="text"><bean:write id="resultset" property="TOOL_MAILSERVER/POP3ADDRESS"/></td>
          <td align="left" class="text">
		  <logic:equal id="resultset" property="TOOL_MAILSERVER/INCEPTMAILDIR" value="0">
          	�ռ��� 
          </logic:equal>
          <logic:equal id="resultset" property="TOOL_MAILSERVER/INCEPTMAILDIR" value="1">
          	������
          </logic:equal>
          <logic:equal id="resultset" property="TOOL_MAILSERVER/INCEPTMAILDIR" value="2">
          	�ݸ���
          </logic:equal>
          <logic:equal id="resultset" property="TOOL_MAILSERVER/INCEPTMAILDIR" value="3">
          	������
          </logic:equal>
          </td>
          <td align="left" class="text">
		  <logic:equal id="resultset" property="TOOL_MAILSERVER/DELFLAG" value="0">
		  	��
		  </logic:equal>
		  <logic:equal id="resultset" property="TOOL_MAILSERVER/DELFLAG" value="1">
		  	��
		  </logic:equal>
		  </td>
          <td align="left" class="text"><bean:write id="resultset" property="TOOL_MAILSERVER/POP3NAME"/></td>
          <td align="left" class="text">
		  <bean:write id="resultset" property="TOOL_MAILSERVER/REMARK"/>
          </td>
        </tr>
		</logic:iterate>
  </table>
  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="30" class="text"><script>
				PageCond(document.forms[0]);
		     </script>
      </td>
    </tr>
  </table>
<div id="processing" style="position:absolute; top:230px; left:20px; z-index:10; visibility:hidden">
	<table WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
	<td width="30%"></td>
	<td bgcolor="#0">
	<table WIDTH="100%" height="70" BORDER="0" CELLSPACING="2" CELLPADDING="0">
	<tr><td bgcolor="#eeeeee" align="center" class="text" id="processingStr">&nbsp;&nbsp;�ʼ����ڽ���, ���ܻ�ҪЩʱ�䣬��ȴ�...&nbsp;&nbsp;</td></tr>
	</table>
	</td>
	<td width="30%"></td>
	</tr>
	</table>
</div>
</form>

<script>
function chechedCount(form){
		var length =0;
	    var i=0;
	    var count =0;
		eles = form.elements;
		while(i<eles.length){
			obj= eles[i];
			if(obj.type == "checkbox"&&obj.getAttribute("marked")==null){
				if(obj.checked){
				  count++;
			     }
			}
			i++;
		}
		return count;
	}
	
function chechedValue(form){
		var length =0;
	    var i=0;
	    var count =0;
		eles = form.elements;
		while(i<eles.length){
			obj= eles[i];
			if(obj.type == "checkbox"&&obj.getAttribute("marked")==null){
				if(obj.checked){
				  count = obj.value;
				  break;
			     }
			}
			i++;
		}
		return count;
	}
</script>

<script language="JavaScript">
function pop3Count(){
    	var frm = document.forms[0];
   		if(chechedCount(frm)<1){
    		alert("���ٱ���ѡ��һ�У�");
    		return ;
    	}
    	
    	if(confirm("�Ƿ�ȷ��ͳ��ָ���ʼ���������")==false){
			return ;
		}    	 
    
    	frm.action="oa.prPersonOffice.pop3count.do";
    	frm.submit();
    }
	function pop3Receive(){
    	var frm = document.forms[0];
   		if(chechedCount(frm)<1){
    		alert("���ٱ���ѡ��һ�У�");
    		return ;
    	}
    	
    	if(confirm("�Ƿ�ȷ��ͳ��ָ���ʼ���������")==false){
			return ;
		}    	 
    
    	frm.action="oa.prPersonOffice.pop3receives.do";
		processing.style.visibility = "visible";
    	frm.submit();
    }
	
	function pop3Delete(){
    	var frm = document.forms[0];
   		if(chechedCount(frm)<1){
    		alert("���ٱ���ѡ��һ�У�");
    		return ;
    	}
    	
    	if(confirm("�Ƿ�ȷ��ɾ��ָ���ʼ��������ϵ��ʼ���ɾ�����Ҳ��ָܻ���")==false){
			return ;
		}    	 
    
    	frm.action="oa.prPersonOffice.pop3deletetrue.do";
    	frm.submit();
    }
</script>