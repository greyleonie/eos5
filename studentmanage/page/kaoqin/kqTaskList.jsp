<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="studentmanage.prKaoqin.kqTaskList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;ѧԱ����&gt;�༶���ڹ���&gt;�����������
            </td></tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="studentmanage.prKaoqin.kqTaskList.do">
		<input type="hidden" name="finishaction" value="studentmanage.prKaoqin.kqTaskFinish.do">
		<html:hidden property="KqTaskManage/_order/col1/field"/>
		<html:hidden property="KqTaskManage/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		
		
	  </td>
    </tr>
  </table>


<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
      
	  <tr>
	    <td height="30" class="text">
	   ��ʱ���ڣ��� <html:text property="KqTaskManage/KqDate/criteria/min" attributesText='class="input" size="15"' />
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onclick=calendar(document.forms[0].elements["KqTaskManage/KqDate/criteria/min"],"yyyy-MM-dd")>
	    	�� <html:text property="KqTaskManage/KqDate/criteria/max" attributesText='class="input" size="15"' />
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onclick=calendar(document.forms[0].elements["KqTaskManage/KqDate/criteria/max"],"yyyy-MM-dd")>
			
&nbsp; 
	  
<input name="B32" type="button" class="button_02" value="�� ѯ" onClick="talentquery()">

<qx:talentButton property="tofinish0" type="button" styleClass="button_02" value="ǿ�����" onclick="tofinish()" title="ǿ�������ѡ����" operation=""/>
<input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()"></td>
	    </tr>
	  
      <tr>
        <td valign="top" class="text"><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
          <tr class="td_title">
            <td width="8%" align="center" nowrap><input type="checkbox" name="checkbox2" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked="">            </td>
            <td width="14%" align="center" nowrap id="KqTaskManage.KqDate" onClick="talentsort()">��ʱ����</td>
            <td width="12%" align="center" nowrap id="KqTaskManage.KqNoon" onClick="talentsort()">���</td>
            <td width="25%" align="center" nowrap id="KqTaskManage.ExeTime" onClick="talentsort()">ִ��ʱ��</td>
            <td width="15%" align="center" nowrap id="KqTaskManage.IsExecute" onClick="talentsort()">������</td>
            <td width="13%" align="center" nowrap id="KqTaskManage.Method" onClick="talentsort()">��ɷ�ʽ</td>
            <td width="13%" align="center" nowrap id="KqTaskManage.Countf" onClick="talentsort()">ȱ������</td>
          </tr>
          <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
          <logic:iterate id="resultset" property="list[@type='KqTaskManage']">
            <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
						String Finished= talent.core.TalentFunctions.getAvailStr(base.util.TalentContext.getValue(pageContext,"resultset","KqTaskManage/IsExecute"));
						java.util.Hashtable h = new java.util.Hashtable();
						h.put("Finished", Finished);
			 %>
            <tr class="<%=trClass%>" onClick="changeTRBgColor(this)">
	            <td align="center">
	          
	           <html:checkbox name="list[@name='update']/KqTaskManage/TaskID" id="resultset" property="KqTaskManage/TaskID" indexed="true" attributes="<%=h%>" /></td>
	        	
	        	<td nowrap align="center" >
	        	   <bean:write id="resultset" property="KqTaskManage/KqDate" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
	            <td nowrap align="center">
	              <logic:equal id="resultset" property="KqTaskManage/KqNoon" value="0">����</logic:equal>
                  <logic:equal id="resultset" property="KqTaskManage/KqNoon" value="1">����</logic:equal>
                  <logic:equal id="resultset" property="KqTaskManage/KqNoon" value="2">����</logic:equal>
                </td>
	            <td  nowrap align="center">
	               <bean:write id="resultset" property="KqTaskManage/ExeTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd HH:mm:ss"/></td>
	            <td  nowrap align="center">
	             <logic:equal id="resultset" property="KqTaskManage/IsExecute" value="0"><font color="red">δ���</font></logic:equal>
                 <logic:equal id="resultset" property="KqTaskManage/IsExecute" value="1">�����</logic:equal>
	            </td>
	            <td  nowrap align="center">
	            <logic:equal id="resultset" property="KqTaskManage/Method" value="1">�Զ�</logic:equal>
                 <logic:equal id="resultset" property="KqTaskManage/Method" value="2">�ֶ�</logic:equal>
                </td>
                <td  nowrap align="center">
                <logic:notEqual id="resultset" property="KqTaskManage/Countf" value="-1">
                  <bean:write id="resultset" property="KqTaskManage/Countf" />
                </logic:notEqual>
                </td>

            </tr>
          </logic:iterate>
        </table>
        <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="30" class="text">
			  <script>
				PageCond(document.forms[0]);
		  </script>			  </td>
            </tr>
          </table>		  </td>
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

</body>
<script>
 function moreSelect(){
 	if(moreSel.style.display=="none"){
 		moreSel.style.display=""
 	}
 	else{
 		moreSel.style.display="none"
 		
 		}
 }
 
 function tofinish(){
 	var frm =document.forms[0];
 	var i=0;
	var j=0;
	eles = frm.elements;
	
	    while(i<eles.length){
		obj= eles[i];
			if(obj.type == "checkbox" && !obj.disabled && obj.getAttribute("marked")==null){
			   if(obj.checked){
					 var Finished = obj.getAttribute("Finished");
					 if(Finished!="0"){
					    alert("ֻ��δ��ɵ�����ſ���ǿ����ɣ�");
					    return ;
					 }
				  j++;
			   }
			     
			}
			i++;
		}
			
		if(j<1){
    		alert("���ٱ���ѡ��һ�У�");
    		return ;
    	}
    	if(confirm("�Ƿ�ȷ��Ҫǿ����ɴ�����")==false){
			return ;
		}    	 
    
    	frm.action = frm.elements["finishaction"].value;
    	frm.submit();
    	
 }

</script>