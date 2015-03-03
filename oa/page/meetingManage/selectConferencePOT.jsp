<%@include file="/internet/common.jsp"%>
 <html>
<body>
<form name="form_query" method="post" action="">
<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
      
	  <tr>
	    <td height="30" align="center" class="text">选择会议室</td>
	    </tr>
	  
	  
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text"><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
          <tr class="td_title">
            <td width="15%" align="center" nowrap>&nbsp;</td>
            <td width="39%" align="center" nowrap id="ConferencePOT.DeviceNO" onClick="talentsort()">签到机ID</td>
            <td width="46%" align="center" nowrap id="ConferencePOT.Name" onClick="talentsort()">签到机名称</td>
            </tr>
          <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
          <logic:iterate id="resultset" property="list[@type='ConferencePOT']">
            <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
						
					
			       %>
             <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" >
	      
	            <td align="center">
	          <input type="radio" onclick="doOK()" name="ConferencePOTID"  value="<bean:write id="resultset" property="ConferencePOT/ConferencePOTID"/>#<bean:write id="resultset" property="ConferencePOT/Name"/>"  />
	           <td nowrap align="center"><bean:write id="resultset" property="ConferencePOT/ConferencePOTID"/></td>
	            <td nowrap align="center"><bean:write  id="resultset" property="ConferencePOT/Name" /></td>
	            </tr>
          </logic:iterate>
        </table>
        </td>
      </tr>
      <tr>
        <td class="text">&nbsp;</td>
      </tr>
    </table>    </td>
  </tr>
</table>
</form>
</body>
 </html>
<script type="text/javascript">
function doOK(){
	
	var head,dw,id,pl;
	var retArr=[];
	var retObj = null;
	if(document.all("ConferencePOTID").length != undefined){
	for(  i=0; i<document.all("ConferencePOTID").length; i++ ){
			if( document.all("ConferencePOTID").item( i ).checked ){
				head = document.all("ConferencePOTID").item(i).value;
				break;
			}
		}
	}else{
		head = document.all("ConferencePOTID").value;
	}
    pl=head.lastIndexOf("#");
    id=head.substring(0,pl);
    dw=head.substring(pl+1); 
    retObj=new returnObj();  
	retObj.value = id ;
	retObj.text = dw ;
	retArr[0] = retObj ;
	window.returnValue = retArr;
	window.close();
}
var returnObj=function(){
	this.value="";
	this.text="";
}
</script>