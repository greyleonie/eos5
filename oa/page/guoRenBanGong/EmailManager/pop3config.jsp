<%@ include file="/internet/common.jsp" %>

<form name="queryForm" method="post" action="oa.prPersonOffice.pop3config.do">
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
        <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;���˰칫��&gt;POP3�ʼ�����</td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="15">&nbsp;</td>
    <td>
    <table width="100%" height="30"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr class="td1">
		    <td align="left"> 
			 <input name="Submit" type="button" class="button_02" value="�� ��" onClick="pop3add()">
			   &nbsp;
			  <input name="Submit3" type="button" class="button_02" value="ɾ ��" onClick="deleteRows()">
			  &nbsp;
			  <input name="Submit3" type="button" class="button_02" value="�� ��" onClick="pop3View()">
		 </td>
        </tr>
      </table>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1"  bgcolor="#A2C4DC" id="listdetail">
          <tr class="tdtitle"> 
            <td width="4%" height="20" align="center" class="td_title"><input type="checkbox" name="checkbox" onclick="eosCheckAll(document.queryForm,this)"></td>
            <td id="POP3ADDRESS" width="23%" align="center" class="td_title" onClick="talentsort()">POP3������</td>
            <td id="INCEPTMAILDIR" width="15%" align="center" class="td_title" onClick="talentsort()">�����ʼ���</td>
            <td id="SMTPSERVER" width="20%" align="center" class="td_title" onClick="talentsort()">SMTP������</td>
            <td id="POP3NAME" width="12%" align="center" class="td_title" onClick="talentsort()">�ʺ�����</td>
            <td id="DEFAULTFLAG" width="12%" align="center" class="td_title" onClick="talentsort()">�ʺ�״̬</td>
            <td width="14%" align="center" class="td_title" onClick="talentsort()">����</td>
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
          <tr class="<%=trClass%>" onclick="changeTRBgColor(this)" onDblClick="pop3ViewParam('<bean:write id="resultset" property="TOOL_MAILSERVER/SERVERID"/>')"> 
         
            <td height="20" align="center" class="text"><html:checkbox id="resultset" name="list[@name='update']/TOOL_MAILSERVER/SERVERID" property="TOOL_MAILSERVER/SERVERID" indexed="true"/></td>
            <td align="left" class="text"><bean:write id="resultset" property="TOOL_MAILSERVER/POP3ADDRESS"/></td>
            <td align="left" class="text"> <logic:equal id="resultset" property="TOOL_MAILSERVER/INCEPTMAILDIR" value="0"> 
              �ռ��� </logic:equal> <logic:equal id="resultset" property="TOOL_MAILSERVER/INCEPTMAILDIR" value="1"> 
              ������ </logic:equal> <logic:equal id="resultset" property="TOOL_MAILSERVER/INCEPTMAILDIR" value="2"> 
              �ݸ��� </logic:equal> <logic:equal id="resultset" property="TOOL_MAILSERVER/INCEPTMAILDIR" value="3"> 
              ������ </logic:equal> </td>
            <td align="left" class="text"><bean:write id="resultset" property="TOOL_MAILSERVER/SMTPSERVER"/></td>
            <td align="left" class="text"><bean:write id="resultset" property="TOOL_MAILSERVER/POP3NAME"/></td>
            <td align="center" class="text"> <logic:equal id="resultset" property="TOOL_MAILSERVER/DEFAULTFLAG" value="0"> 
              ���� </logic:equal> <logic:equal id="resultset" property="TOOL_MAILSERVER/DEFAULTFLAG" value="1"> 
              ͣ�� </logic:equal> <logic:equal id="resultset" property="TOOL_MAILSERVER/DEFAULTFLAG" value="2"> 
              Ĭ���ʺ� </logic:equal> </td>
            <td align="center" class="text"><a href="#" onClick="pop3modifyLink('<bean:write id="resultset" property="TOOL_MAILSERVER/SERVERID"/>')">�޸�</a></td>
          </tr>
          </logic:iterate> 
        </table>
      <table width="96%" height="15"  border="0" align="center" cellpadding="0" cellspacing="0" class="text">
        <tr>
          <td><Script language="JavaScript">
                PageCond(queryForm);
             </Script>
		 </td>
        </tr>
      </table>
      </td>
    <td width="15">&nbsp;</td>
  </tr>
</table>
</form>
<script>
function chechedCount(form){
		var length =0;
	    var i=0;
	    var count =0;
		eles = form.elements;
		while(i<eles.length){
			obj= eles[i];
			if(obj.type == "checkbox"&&obj.name.indexOf("SERVERID")>=0){
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
			if(obj.type == "checkbox"&&obj.name.indexOf("SERVERID")>=0){
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
function pop3add(){
	var frm = document.forms[0];
	frm.action = "oa.prPersonOffice.pop3add.do";
	frm.submit();

}
function deleteRows(){
    	var frm = document.forms[0];
   		if(chechedCount(frm)<1){
    		alert("���ٱ���ѡ��һ�У�");
    		return ;
    	}
    	
    	if(confirm("�Ƿ�ȷ��ɾ��ָ����¼��")==false){
			return ;
		}    	 
    
    	frm.action="oa.prPersonOffice.pop3delete.do";
    	frm.submit();
    }
	
function pop3modify(){
	var frm = document.forms[0];
	var vid = "";
	if(chechedCount(frm)<1){
    	alert("���ٱ���ѡ��һ�У�");
    	return ;
    }
	if(chechedCount(frm)>1){
    	alert("ֻ��ѡ��һ�У�");
    	return ;
    }
	if(chechedCount(frm)==1){
    	vid = chechedValue(frm)
    }
	if(vid==""||vid==null) return;
	var action = "oa.prPersonOffice.pop3modify.do?TOOL_MAILSERVER/SERVERID=" + vid;
	frm.action = action;
	frm.submit();
}

function pop3modifyLink(sid){
	var frm = document.forms[0];
	var vid = "";
	vid = sid;
	if(vid==""||vid==null) return;
	var action = "oa.prPersonOffice.pop3modify.do?TOOL_MAILSERVER/SERVERID=" + vid;
	frm.action = action;
	frm.submit();
}

function pop3View(){
	var frm = document.forms[0];
	var vid = "";

		if(chechedCount(frm)<1){
    		alert("���ٱ���ѡ��һ�У�");
    		return ;
    	}
		if(chechedCount(frm)>1){
    		alert("ֻ��ѡ��һ�У�");
    		return ;
    	}
		if(chechedCount(frm)==1){
    		vid = chechedValue(frm);
    	}
	
	if(vid==""||vid==null) return;
	var action = "oa.prPersonOffice.pop3view.do?TOOL_MAILSERVER/SERVERID=" + vid;
	frm.action = action;
	frm.submit();
}

function pop3ViewParam(objmark){
	var frm = document.forms[0];
	var vid = "";
	
	vid = objmark;

	if(vid==""||vid==null) return;
	var action = "oa.prPersonOffice.pop3view.do?TOOL_MAILSERVER/SERVERID=" + vid;
	frm.action = action;
	frm.submit();
}

</script>
