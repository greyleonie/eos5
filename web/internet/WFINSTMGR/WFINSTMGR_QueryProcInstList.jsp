<%@include file="/internet/WFCOMMON/wfappbase.jsp"%>
  <HTML><HEAD><TITLE></TITLE>
<META http-equiv=Content-Type content="text/html; charset=GBK">
</HEAD>
<script  language="JavaScript">

function doCheckAll(chkObj){                       
		var checkBoxObj = document.resultForm.elements["list[@index='true']/processInstID"];
		if(checkBoxObj != null && checkBoxObj.length == null){
			if(chkObj.checked){
				checkBoxObj.checked=true;
			}else{
				checkBoxObj.checked=false;
			}
		}
		for(i=0;checkBoxObj != null && i<checkBoxObj.length;i++){
			if(chkObj.checked){
				checkBoxObj[i].checked=true;
			}else{
				checkBoxObj[i].checked=false;
			}
		}
}

function checkCkBox(checkBoxObj){
	if(checkBoxObj != null && checkBoxObj.length == null){
		if(checkBoxObj.checked)
			return true;
	}
	for(i=0;checkBoxObj != null && i<checkBoxObj.length;i++){
		if(checkBoxObj[i].checked){
			return true;
		}
	}
	return false;
}

function doActionDeleteProcessInst(action){
    	document.queryForm.elements("PageCond/begin").value="0";
    	document.queryForm.elements("PageCond/count").value="noCount";  
	if(checkCkBox(document.resultForm.elements["list[@index='true']/processInstID"])){	
		document.resultForm.action=action;
		document.resultForm.target="_self";
		document.resultForm.submit();
		return true;
	}else if(document.resultForm.elements["list[@index='true']/processInstID"] != null){
		alert("��ѡ���ɾ��������ʵ��");
		return false;
	}
	return false;
}
     function query(){ 
    	document.queryForm.elements("PageCond/begin").value="0";
    	document.queryForm.elements("PageCond/count").value="noCount";  
    	document.queryForm.action="WFINSTMGR.pr_automata.WFINSTMGR_P_queryProcInst.do";
    	queryForm.submit();   	
     	   	
      }
      function previousPage(){
        document.queryForm.elements("PageCond/begin").value = parseInt(resultForm.elements("PageCond/begin").value) - parseInt(resultForm.elements("PageCond/length").value);
    	document.queryForm.submit();    
     }
     function nextPage(){
        document.queryForm.elements("PageCond/begin").value =  parseInt(resultForm.elements("PageCond/begin").value) + parseInt(resultForm.elements("PageCond/length").value);
    	document.queryForm.submit();    
     }
     function jump(s){
     	if(confirm("��ȷʵҪ��������̵Ĺ���ҳ����?")){
	     document.queryForm.action="WFINSTMGR.pr_automata.WFINSTMGR_P_ProcessInst.do";
	     //document.getElementsByName("WFProcessInst/processInstID").value=s;
	     document.queryForm.elements['WFProcessInst/processInstID'].value=s;
	     document.queryForm.target="moonpiazza";
	     document.queryForm.submit();    
	 }else{
   		//û�н�������̵Ĺ���ҳ��
              }
     }
</script>
<display:pageHead bodyColor="#EEEEEE"/>
<display:queryHead title="������ʵ����ء�" />
        
<form name="queryForm" method="post">    
        <html:hidden   property="list[@name='procInst']"/>       
        <html:hidden   property="PageCond/begin"/>
        <html:hidden   property="PageCond/length"/>
        <html:hidden   property="PageCond/count"/> 
        
        <html:hidden name="WFProcessInst/processInstID" value=""/>
    <!--��ѯ������ʾ-->
  <table border="0" cellspacing="1" cellpadding="1" class="result" align="center" width="100%"  bgColor="#EEEEEE">
  
  <tr> 
      <td width="10%" class="queryLabelTD" >ʵ��ID</td>
	  <td width="39%"class="queryFieldTD"> <html:text property="WFProcessInstView/processInstID" size="20" /> 
      </td>
      <td width="10%" class="queryLabelTD" > ʵ������</td>
      <td width="41%"class="queryFieldTD"><html:text property="WFProcessInstView/processInstName" size="20" /> 
      </td>
  </tr>
  <tr> 
      <td width="10%" class="queryLabelTD" >���̰�����</td>
      <td width="39%" class="queryFieldTD"><html:text property="WFProcessInstView/packageName" size="20" /> 
      </td>
      <td width="10%" class="queryLabelTD" > ���̰�ID</td>
      <td width="41%" class="queryFieldTD"><html:text property="WFProcessInstView/packageID" size="20" /> 
      </td>
  </tr>
  <tr> 
      <td width="10%" class="queryLabelTD" > �Ƿ�ʱ</td>
      <td width="39%"class="queryFieldTD"><dict:select businTypeId="WFDICT_YN" property="WFProcessInstView/isTimeOut" nullOption="true"  nullLabel="--��ѡ���Ƿ�ʱ--"  style="width:152px"/> 
      </td>
      <td width="10%" class="queryLabelTD" > ������</td>
      <td width="41%" class="queryFieldTD"> <html:text property="WFProcessInstView/creator" size="20" /> </td>
  </tr>
  <tr> 
      <td width="10%" class="queryLabelTD" >��ǰ״̬</td>
      <td width="39%" class="queryFieldTD"><dict:select  businTypeId="WFDICT_ProcessState" property="WFProcessInstView/currentState" nullOption="true"  nullLabel="--��ѡ��״̬--"  style="width:152px"/> 
      </td>
      <td width="10%" class="queryLabelTD" >����ʱ��</td>
      <td width="41%" class="queryFieldTD"> 
      
	  <input type="text"  name="WFProcessInstView/createTime[name='start']" value="<bean:write property="WFProcessInstView/createTime[name='start']"/>" dtype="d(YYYYMMDD)" size="10" readonly/>
	   <img style=cursor:hand;  border=0 width=16 height=16 src="/internet/WFCOMMON/images/date_icon.gif" onClick="showCalendar(this)" bindingFld="WFProcessInstView/createTime[name='start']">
        - 
	  <input type="text"  name="WFProcessInstView/createTime[name='end']" value="<bean:write property="WFProcessInstView/createTime[name='end']"/>" dtype="d(YYYYMMDD)" size="10" readonly/>
	   <img style=cursor:hand;  border=0 width=16 height=16 src="/internet/WFCOMMON/images/date_icon.gif" onClick="showCalendar(this)" bindingFld="WFProcessInstView/createTime[name='end']">
	   </td>
  </tr>
  <tr> 
      <td width="10%" class="queryLabelTD" >��������</td>
      <td width="39%" class="queryFieldTD"><html:select property="WFProcessInstView/processDefName" size="1" style="width:152px"> <option value="">
        --��ѡ������--&nbsp;&nbsp;&nbsp;</option> <html:options  labelProperty="list[name='procDef']/WFProcessDefine/processChName" property="list[name='procDef']/WFProcessDefine/processDefName"/> 
        </html:select> 
      </td>
      <td width="10%" class="queryLabelTD" >����ʱ��</td>
      <td width="41%" class="queryFieldTD">
      <input type="text"  name="WFProcessInstView/startTime[name='start']" value="<bean:write property="WFProcessInstView/startTime[name='start']"/>" dtype="d(YYYYMMDD)" size="10" readonly/>
	   <img style=cursor:hand;  border=0 width=16 height=16 src="/internet/WFCOMMON/images/date_icon.gif" onClick="showCalendar(this)" bindingFld="WFProcessInstView/startTime[name='start']">
	 -  <input type="text"  name="WFProcessInstView/startTime[name='end']" value="<bean:write property="WFProcessInstView/startTime[name='end']"/>" dtype="d(YYYYMMDD)" size="10" readonly/>
	   <img style=cursor:hand;  border=0 width=16 height=16 src="/internet/WFCOMMON/images/date_icon.gif" onClick="showCalendar(this)" bindingFld="WFProcessInstView/startTime[name='end']">
	 </td>
  </tr>
    <tr> 
      <td width="10%" class="queryLabelTD" > ���ȼ�</td>
      <td width="41%" class="queryFieldTD"><dict:select businTypeId="WFDICT_Priority" property="WFProcessInstView/priority" nullOption="true"  nullLabel="--��ѡ��--"  style="width:152px"/>  
      </td>
      <td width="10%" class="queryLabelTD" >����ʱ��</td>
      <td width="41%" class="queryFieldTD">
       <input type="text"  name="WFProcessInstView/endTime[name='start']" value="<bean:write property="WFProcessInstView/endTime[name='start']"/>" dtype="d(YYYYMMDD)" size="10" readonly/>
	   <img style=cursor:hand;  border=0 width=16 height=16 src="/internet/WFCOMMON/images/date_icon.gif" onClick="showCalendar(this)" bindingFld="WFProcessInstView/endTime[name='start']">
	   -  <input type="text"  name="WFProcessInstView/endTime[name='end']" value="<bean:write property="WFProcessInstView/endTime[name='end']"/>" dtype="d(YYYYMMDD)" size="10" readonly/>
	   <img style=cursor:hand;  border=0 width=16 height=16 src="/internet/WFCOMMON/images/date_icon.gif" onClick="showCalendar(this)" bindingFld="WFProcessInstView/endTime[name='end']">
	  </td>
  </tr>
  <tr> 
    <td align="center" colspan="4">
    	<input type="button" class="button" value = "��ѯ" onclick="javascript:query();">
        <input type="reset" class="button" value = "����"">
    </td>
  </tr>
</table>
</form>
    
<display:queryTail/>

<!--�б���Ϣ��ʾ-->    
  <form name="resultForm">
<display:resultHead  />   
        <html:hidden property="PageCond/begin"/>
        <html:hidden property="PageCond/length"/>
        <html:hidden property="PageCond/count"/>
<script>
	var myPage = new page();
	myPage.init("queryForm", "PageCond/begin", "PageCond/length", "PageCond/count");
</script>
<table width="100%" class="wfTable" border="1" bordercolor="#B6B5B5" style="border-collapse: collapse">
  <tr class="tableHeadTR"> 
      <td width="4%"  nowrap><input type="checkbox" name="chkAll" value="checkbox" onClick="doCheckAll(this);">ʵ��ID</td>
      <td width="8%"  nowrap>ʵ������</td>
      <td width="8%"  nowrap>������</td>
      <td width="6%" nowrap>��ǰ״̬</td>
      <td width="10%" nowrap>����ʱ��</td>
      <td width="9%"  nowrap>����ʱ��</td>
      <td width="6%"  nowrap>�Ƿ�ʱ</td>
      <td width="13%" nowrap>��������</td>
      <td width="7%"  nowrap>���̰�����</td>
  </tr>
     <% int flag=0;%>
     <logic:iterate id="ResultSet" property="list[type='WFProcessInstView']">
  <tr class="<%=((flag%2)==1)?"tableContentTR":"tableContentTR"%>" align="center"> 
      <td  nowrap>
       <input type="checkbox" name="list[@index='true']/processInstID" value="<bean:write id="ResultSet" property="WFProcessInstView/processInstID"/>"> <bean:write id="ResultSet" property="WFProcessInstView/processInstID"/></a></td>
	  <td  ><a href="#" onClick="javascript:jump(<bean:write id="ResultSet" property="WFProcessInstView/processInstID"/>);"> <bean:write id="ResultSet" property="WFProcessInstView/processInstName"/></a></td>                
      <td  ><bean:write id="ResultSet" property="WFProcessInstView/creator"/></td>                
      <td  ><dict:write id="ResultSet" businTypeId="WFDICT_ProcessState" property="WFProcessInstView/currentState" /></td>
      <td  ><bean:write id="ResultSet" property="WFProcessInstView/startTime"  formatType='yyyy��MM��dd��' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/>	  </td>
      <td  ><bean:write id="ResultSet" property="WFProcessInstView/endTime"  formatType='yyyy��MM��dd��' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/>	  </td>              
      <td  ><dict:write id="ResultSet" businTypeId="WFDICT_YN" property="WFProcessInstView/isTimeOut"/></td>                 
      <td  ><bean:write id="ResultSet" property="WFProcessInstView/processChName"/></td>                 
      <td > <bean:write id="ResultSet" property="WFProcessInstView/packageName"/></td>                          
  </tr>
              <% 	flag++;  %>
     </logic:iterate>
    </table>
<display:resultTail/>

<table border="0" width="100%">    
       <tr align="center">            
	   <td colspan="10" align="center" class="detailLabelTD">  
<input type="button" name="Submit3" value="ɾ��" onClick="doActionDeleteProcessInst('WFINSTMGR.pr_automata.WFINSTMGR_P_DelProcInstBatch.do');">
           <logic:present property="PageCond/begin">
           <!--
            <a href="javascript:myPage.previousPage();"><img src="/internet/theme/style0/prevpage.gif" width="48" height="18" border="0" align="absbottom"></a> 
              <a href="javascript:myPage.nextPage();">
            <img src="/internet/theme/style0/nextpage.gif" border="0" align="absbottom" width="48" height="19"></a> 
              ��<script>document.write(myPage.current)</script>ҳ/��<script>document.write(myPage.total)</script>ҳ
              -->
              <script>myPage.printPageCode(<%=flag%>)</script>
           </logic:present>
         </td>
      </tr>
	  </table>
    </form>
<display:pageTail/></HTML>