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
		alert("请选择可删除的流程实例");
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
     	if(confirm("您确实要进入该流程的管理页面吗?")){
	     document.queryForm.action="WFINSTMGR.pr_automata.WFINSTMGR_P_ProcessInst.do";
	     //document.getElementsByName("WFProcessInst/processInstID").value=s;
	     document.queryForm.elements['WFProcessInst/processInstID'].value=s;
	     document.queryForm.target="moonpiazza";
	     document.queryForm.submit();    
	 }else{
   		//没有进入该流程的管理页面
              }
     }
</script>
<display:pageHead bodyColor="#EEEEEE"/>
<display:queryHead title="【流程实例监控】" />
        
<form name="queryForm" method="post">    
        <html:hidden   property="list[@name='procInst']"/>       
        <html:hidden   property="PageCond/begin"/>
        <html:hidden   property="PageCond/length"/>
        <html:hidden   property="PageCond/count"/> 
        
        <html:hidden name="WFProcessInst/processInstID" value=""/>
    <!--查询条件显示-->
  <table border="0" cellspacing="1" cellpadding="1" class="result" align="center" width="100%"  bgColor="#EEEEEE">
  
  <tr> 
      <td width="10%" class="queryLabelTD" >实例ID</td>
	  <td width="39%"class="queryFieldTD"> <html:text property="WFProcessInstView/processInstID" size="20" /> 
      </td>
      <td width="10%" class="queryLabelTD" > 实例名称</td>
      <td width="41%"class="queryFieldTD"><html:text property="WFProcessInstView/processInstName" size="20" /> 
      </td>
  </tr>
  <tr> 
      <td width="10%" class="queryLabelTD" >流程包名称</td>
      <td width="39%" class="queryFieldTD"><html:text property="WFProcessInstView/packageName" size="20" /> 
      </td>
      <td width="10%" class="queryLabelTD" > 流程包ID</td>
      <td width="41%" class="queryFieldTD"><html:text property="WFProcessInstView/packageID" size="20" /> 
      </td>
  </tr>
  <tr> 
      <td width="10%" class="queryLabelTD" > 是否超时</td>
      <td width="39%"class="queryFieldTD"><dict:select businTypeId="WFDICT_YN" property="WFProcessInstView/isTimeOut" nullOption="true"  nullLabel="--请选择是否超时--"  style="width:152px"/> 
      </td>
      <td width="10%" class="queryLabelTD" > 创建者</td>
      <td width="41%" class="queryFieldTD"> <html:text property="WFProcessInstView/creator" size="20" /> </td>
  </tr>
  <tr> 
      <td width="10%" class="queryLabelTD" >当前状态</td>
      <td width="39%" class="queryFieldTD"><dict:select  businTypeId="WFDICT_ProcessState" property="WFProcessInstView/currentState" nullOption="true"  nullLabel="--请选择状态--"  style="width:152px"/> 
      </td>
      <td width="10%" class="queryLabelTD" >创建时间</td>
      <td width="41%" class="queryFieldTD"> 
      
	  <input type="text"  name="WFProcessInstView/createTime[name='start']" value="<bean:write property="WFProcessInstView/createTime[name='start']"/>" dtype="d(YYYYMMDD)" size="10" readonly/>
	   <img style=cursor:hand;  border=0 width=16 height=16 src="/internet/WFCOMMON/images/date_icon.gif" onClick="showCalendar(this)" bindingFld="WFProcessInstView/createTime[name='start']">
        - 
	  <input type="text"  name="WFProcessInstView/createTime[name='end']" value="<bean:write property="WFProcessInstView/createTime[name='end']"/>" dtype="d(YYYYMMDD)" size="10" readonly/>
	   <img style=cursor:hand;  border=0 width=16 height=16 src="/internet/WFCOMMON/images/date_icon.gif" onClick="showCalendar(this)" bindingFld="WFProcessInstView/createTime[name='end']">
	   </td>
  </tr>
  <tr> 
      <td width="10%" class="queryLabelTD" >流程名称</td>
      <td width="39%" class="queryFieldTD"><html:select property="WFProcessInstView/processDefName" size="1" style="width:152px"> <option value="">
        --请选择类型--&nbsp;&nbsp;&nbsp;</option> <html:options  labelProperty="list[name='procDef']/WFProcessDefine/processChName" property="list[name='procDef']/WFProcessDefine/processDefName"/> 
        </html:select> 
      </td>
      <td width="10%" class="queryLabelTD" >启动时间</td>
      <td width="41%" class="queryFieldTD">
      <input type="text"  name="WFProcessInstView/startTime[name='start']" value="<bean:write property="WFProcessInstView/startTime[name='start']"/>" dtype="d(YYYYMMDD)" size="10" readonly/>
	   <img style=cursor:hand;  border=0 width=16 height=16 src="/internet/WFCOMMON/images/date_icon.gif" onClick="showCalendar(this)" bindingFld="WFProcessInstView/startTime[name='start']">
	 -  <input type="text"  name="WFProcessInstView/startTime[name='end']" value="<bean:write property="WFProcessInstView/startTime[name='end']"/>" dtype="d(YYYYMMDD)" size="10" readonly/>
	   <img style=cursor:hand;  border=0 width=16 height=16 src="/internet/WFCOMMON/images/date_icon.gif" onClick="showCalendar(this)" bindingFld="WFProcessInstView/startTime[name='end']">
	 </td>
  </tr>
    <tr> 
      <td width="10%" class="queryLabelTD" > 优先级</td>
      <td width="41%" class="queryFieldTD"><dict:select businTypeId="WFDICT_Priority" property="WFProcessInstView/priority" nullOption="true"  nullLabel="--请选择--"  style="width:152px"/>  
      </td>
      <td width="10%" class="queryLabelTD" >结束时间</td>
      <td width="41%" class="queryFieldTD">
       <input type="text"  name="WFProcessInstView/endTime[name='start']" value="<bean:write property="WFProcessInstView/endTime[name='start']"/>" dtype="d(YYYYMMDD)" size="10" readonly/>
	   <img style=cursor:hand;  border=0 width=16 height=16 src="/internet/WFCOMMON/images/date_icon.gif" onClick="showCalendar(this)" bindingFld="WFProcessInstView/endTime[name='start']">
	   -  <input type="text"  name="WFProcessInstView/endTime[name='end']" value="<bean:write property="WFProcessInstView/endTime[name='end']"/>" dtype="d(YYYYMMDD)" size="10" readonly/>
	   <img style=cursor:hand;  border=0 width=16 height=16 src="/internet/WFCOMMON/images/date_icon.gif" onClick="showCalendar(this)" bindingFld="WFProcessInstView/endTime[name='end']">
	  </td>
  </tr>
  <tr> 
    <td align="center" colspan="4">
    	<input type="button" class="button" value = "查询" onclick="javascript:query();">
        <input type="reset" class="button" value = "重置"">
    </td>
  </tr>
</table>
</form>
    
<display:queryTail/>

<!--列表信息显示-->    
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
      <td width="4%"  nowrap><input type="checkbox" name="chkAll" value="checkbox" onClick="doCheckAll(this);">实例ID</td>
      <td width="8%"  nowrap>实例名称</td>
      <td width="8%"  nowrap>创建者</td>
      <td width="6%" nowrap>当前状态</td>
      <td width="10%" nowrap>启动时间</td>
      <td width="9%"  nowrap>结束时间</td>
      <td width="6%"  nowrap>是否超时</td>
      <td width="13%" nowrap>流程名称</td>
      <td width="7%"  nowrap>流程包名称</td>
  </tr>
     <% int flag=0;%>
     <logic:iterate id="ResultSet" property="list[type='WFProcessInstView']">
  <tr class="<%=((flag%2)==1)?"tableContentTR":"tableContentTR"%>" align="center"> 
      <td  nowrap>
       <input type="checkbox" name="list[@index='true']/processInstID" value="<bean:write id="ResultSet" property="WFProcessInstView/processInstID"/>"> <bean:write id="ResultSet" property="WFProcessInstView/processInstID"/></a></td>
	  <td  ><a href="#" onClick="javascript:jump(<bean:write id="ResultSet" property="WFProcessInstView/processInstID"/>);"> <bean:write id="ResultSet" property="WFProcessInstView/processInstName"/></a></td>                
      <td  ><bean:write id="ResultSet" property="WFProcessInstView/creator"/></td>                
      <td  ><dict:write id="ResultSet" businTypeId="WFDICT_ProcessState" property="WFProcessInstView/currentState" /></td>
      <td  ><bean:write id="ResultSet" property="WFProcessInstView/startTime"  formatType='yyyy年MM月dd日' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/>	  </td>
      <td  ><bean:write id="ResultSet" property="WFProcessInstView/endTime"  formatType='yyyy年MM月dd日' formatClass='com.primeton.tp.web.taglib.bean.BeanWriteDateFormatImpl'/>	  </td>              
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
<input type="button" name="Submit3" value="删除" onClick="doActionDeleteProcessInst('WFINSTMGR.pr_automata.WFINSTMGR_P_DelProcInstBatch.do');">
           <logic:present property="PageCond/begin">
           <!--
            <a href="javascript:myPage.previousPage();"><img src="/internet/theme/style0/prevpage.gif" width="48" height="18" border="0" align="absbottom"></a> 
              <a href="javascript:myPage.nextPage();">
            <img src="/internet/theme/style0/nextpage.gif" border="0" align="absbottom" width="48" height="19"></a> 
              第<script>document.write(myPage.current)</script>页/共<script>document.write(myPage.total)</script>页
              -->
              <script>myPage.printPageCode(<%=flag%>)</script>
           </logic:present>
         </td>
      </tr>
	  </table>
    </form>
<display:pageTail/></HTML>