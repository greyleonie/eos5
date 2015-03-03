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
	    <td height="30" align="center" class="text">选择司机</td>
	    </tr>
	  
	  
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text"><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
          <tr class="td_title">
            <td width="15%" align="center" nowrap>&nbsp;</td>
            <td width="39%" align="center" nowrap id="DriverInfo.DriverID" onClick="talentsort()">司机ID</td>
            <td width="46%" align="center" nowrap id="DriverInfo.DriverName" onClick="talentsort()">司机姓名</td>
            </tr>
          <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
          <logic:iterate id="resultset" property="list[@type='DriverInfo']">
            <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
						
					
			       %>
             <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" >
	      
	            <td align="center">
	          <input type="radio" onclick="doOK()" name="DriverID"  value="<bean:write id="resultset" property="DriverInfo/DriverID"/>#<bean:write id="resultset" property="DriverInfo/DriverName"/>"  />
	           <td nowrap align="center"><bean:write id="resultset" property="DriverInfo/DriverID"/></td>
	            <td nowrap align="center"><bean:write  id="resultset" property="DriverInfo/DriverName" /></td>
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
	//alert(document.getElementsByName('DriverID').length);
	for(var  i=0; i<document.getElementsByName("DriverID").length; i++ ){
			if( document.getElementsByName("DriverID").item( i ).checked ){
				head = document.getElementsByName("DriverID").item(i).value;
				break;
			}
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