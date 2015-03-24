
<%@include file="/internet/WFCOMMON/wfappbase.jsp"%>
<html>
<head>
<title>strategy select</title>
</head>
<title>策略选择</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<script  language="JavaScript">       
		
    function getActInstIDByStra(){
    	document.queryForm.select.selectedIndex==document.queryForm.flag.value;
		var val=document.queryForm.select.value;
		var val1;
      	if(val=="backByOneStep"||val=="backByManul"){
	      	t1.style.display="none"; 	
	      	document.queryForm.bt.disabled=false;
	      	if(val=="backByOneStep"){
	      		val="one_step";
	      	}else{
	      		val="recent_manual";
	      	}
	      	//if(document.queryForm.elements[WFActivityInstView/actDefID].value
      	}else if(val=="backByTime"||val=="backByPath"||val=="backBySimple"){
	      	//alert(document.queryForm.elements[WFActivityInstView/actDefID].value);
	      	document.queryForm.bt.disabled=true;   	
	      	if(val=="backByTime"){
	      		val1="time";
	      	}else{
	      		val1="path";
	      	}
	      	//val1="path";
	      	document.queryForm.elements['WFActivityInstView/strategy'].value=val1;
	      	document.queryForm.action="WFINSTMGR.pr_automata.WFINSTMGR_P_QueryBackActivityByStrategy.do";	      		
     		//document.queryForm.target="_self";
	     	document.queryForm.flag.value=document.queryForm.select.selectedIndex;
	  		document.queryForm.submit();
	      	//t1.style.display="block";  
      	}
    
    }
    
	function pp(){	
			var val=document.queryForm.select.value;
			var val2;
			if(val=="backByOneStep"){
				val2="one_step";
			}else if(val=="backByManul"){
				val2="recent_manual";
			}else if(val=="backByTime"){
				val2="time";
			}else if(val=="backByPath"){
				val2="path";
			}else if(val=="backBySimple"){
				val2="simple";
			}
			document.queryForm.elements['WFActivityInstView/strategy'].value=val2;
	      	document.queryForm.action="WFINSTMGR.pr_automata.WFINSTMGR_P_BackActivityByStrategy.do";	
	      	document.queryForm.target="moonpiazza";      
	  		document.queryForm.submit();
	}
	
	function check(){
		if(document.queryForm.elements['WFActivityInstView/actDefID'].checked){
		document.queryForm.bt.disabled=true;
	}else{
		document.queryForm.bt.disabled=false;
	}
	}
	   	
</script>
<%  
    	String showWhich=request.getParameter("showWhich");
    if(showWhich==null)
    	 showWhich="1";
    %>
<display:pageHead bodyColor="#FFFFFF"/>
<form name="queryForm" action="" method="POST">
<html:hidden property="processInstID"/>
  <html:hidden property="WFActivityInstView/activityInstID"/>
  <html:hidden   name="showWhich" value="<%=showWhich%>"/>
  <html:hidden property="WFActivityInstView/strategy"/>
  <html:hidden property="flag"/>
  <input type="hidden" name="WFActivityInstView/DestActivity" value="_START">
  
  
  
  <table width="100%" height="100%" class="wfTable" border="0" bordercolor="#B6B5B5" style="border-collapse: collapse" bgColor="#EEEEEE">
    <tr> 
      <td width="150"> 请选择回退策略： </td>
      <td width="170"> 
        <html:select onchange="javascript:getActInstIDByStra();" property="select">
          <option value="backByOneStep">单步回退</option>
          <option value="backBySimple">简单回退</option>
          <option value="backByTime">基于两个节点之间的时间</option>
          <option value="backByManul">回退到最近的手工活动</option>
          <option value="backByPath">基于两个节点之间的路径</option>
        </html:select>
      </td>
    </tr>
  </table>
  <p></p>
 <table width="100%" class="wfTable" border="1" bordercolor="#B6B5B5" style="display:block" id="t1" name="t1" bgColor="#EEEEEE">
<tr>请选择要回退到的活动:</tr>
  <tr class="tableHeadTR"> 
      <td width="25%"  nowrap>活动定义ID</td>
      <td width="30%"  nowrap>活动定义名称</td>
      <td width="45%"  nowrap>活动定义描述</td>
  </tr>
    <script language= "JavaScript">
		
</script>
     <% int flag=0;%>
     <logic:iterate id="ResultSet" property="list">
  <tr class="<%=((flag%2)==1)?"tableContentTR":"tableContentTR"%>" align="center"> 
      <td  >
      <input type="radio" name="WFActivityInstView/actDefID" onclick="javascript:check();" value="<bean:write id="ResultSet" property="Activity/actDefID"/>"/> 
      <bean:write id="ResultSet" property="Activity/actDefID"/></td>
	  <td  ><bean:write id="ResultSet" property="Activity/actDefName"/></td>                
      <td  ><bean:write id="ResultSet" property="Activity/actDefDesc"/></td>                                        
  </tr>
        <% 	flag++;  %>
     </logic:iterate>

    </table>
    <tabel>
      <html:hidden property="WFActivityInstView/actDefID"/>
<tr><td><input name="bt" type="button" value="执行回退" onclick="javascript:pp();"/></td></tr>
</tabel>
<display:detailTail/>
</form>
<display:pageTail/>
</html>
<script language= "JavaScript">
//alert(document.queryForm.flag.value);
      	if(document.queryForm.flag.value==""||document.queryForm.flag.value=="3"||document.queryForm.flag.value=="5"){
	      	t1.style.display="none"; 	
	      	document.queryForm.bt.disabled=false;
      	}else if(document.queryForm.flag.value=="4"||document.queryForm.flag.value=="2"||document.queryForm.flag.value=="1"){
	      	t1.style.display="block";    
	      	document.queryForm.bt.disabled=true;   	
      	}else{
      		//alert("all nonoe");
      	}
		document.queryForm.select.selectedIndex=document.queryForm.flag.value;
		
</script>
