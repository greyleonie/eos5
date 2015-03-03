<%@include file="/internet/common.jsp"%>
<html>
<head>
<title>广州市委党校信息一体化平台</title>

</head>

<body>
<form name="resultForm" method="post" action="">

  <table width="100%"  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" id="beforefixtable1">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页 -&gt; 教务管理 -&gt; 选择班级</td> 
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr id="beforefixtable2">
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" id="beforefixtable3">
        <tr>
          <td height="30" class="text">  
              
          </td>      
        </tr>
      </table>        
      <table width="100%" height="6"  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" id="beforefixtable4">
        <tr>
          <td> </td>
        </tr>
      </table>
      <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
          <tr align="center" bgcolor="#A2C4DC">
            <td width="2%" class="td_title" >
              <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked="firstChk">
            </td>
            <td width="18%" align="center" nowrap id="Class.ClassName" onClick="talentsort()" class="td_title" >班名</td>
            <td width="11%" align="center" nowrap id="Class.Commission" onClick="talentsort()" class="td_title" >调训单位</td>               
            <td width="6%" align="center" nowrap id="Class.BeginTime" onClick="talentsort()" class="td_title" >开班时间</td>        
          </tr>
          <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
         	<logic:iterate id="resultSet" property="list[@type='Class']">
					<%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
          <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="detail('<bean:write id="resultSet" property="Class/ClassID"/>')">
            <td align="center">
           	<html:radio id="resultSet" name="list[@name='update']/Class/ClassID" property="Class/ClassID" indexed="true"/>
		    <input type="hidden" name="ClassName"  value="<bean:write id="resultSet" property="Class/ClassName"/>">
         </td>
           <td><bean:write id="resultSet"  property="Class/ClassName"/></td><!--班名-->
            <td align="center"><bean:write id="resultSet"  property="Class/Commission"/></td><!--调训单位-->
            <td align="center"><bean:write id="resultSet"  property="Class/BeginTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
         
          </tr>
        </logic:iterate>                 
        </table>
          <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="30" class="text">
           
              </td>
            </tr>
          </table>     <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td align="center">
          <input name="Submit" type="button" class="button_02" onClick="add()" value="确 定">
          <input name="Submit" type="button" class="button_02" value="关 闭" onclick="window.close()">
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
</html>

<script language="javascript">

 
 //选中的是第几个checkbox
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

function getChechedValue(form) {
	
		var eles = form.elements;
		var i=0;
	    var array=new Array(2);
    
		
		while(i<eles.length){
			var obj= eles[i];
			if(obj.type == "checkbox" && !obj.disabled && obj.getAttribute("marked")==null){
				if(obj.checked){
				    array[0]=obj.value;
				    array[1]=eles[i+1];
				    return array;
			     }
			}
			i++
		}//while
}


function add(){
    var frm=document.forms[0];
    var id_name=getChechedValue(frm);
    window.returnValue=id_name;
 

}


</script>