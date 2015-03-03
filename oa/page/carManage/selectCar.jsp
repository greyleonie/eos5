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
	    <td height="30" align="center" class="text">选择车辆</td>
	    </tr>
	  
	  
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text"><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
          <tr class="td_title">
            <td width="16%" align="center" nowrap>&nbsp;</td>
            <td width="28%" align="center" nowrap id="CAR_CARINFO.CarNO" onClick="talentsort()">车牌号</td>
            <td width="28%" align="center" nowrap id="CAR_CARINFO.MANUNO" onClick="talentsort()">厂牌型号</td>
            <td width="28%" align="center" nowrap id="CAR_CARINFO.CARTYPE" onClick="talentsort()">类型</td>
            </tr>
          <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
          <logic:iterate id="resultset" property="list[@type='CAR_CARINFO']">
            <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
						
					
			       %>
             <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" >
	      
	            <td align="center">
	          <input type="radio" onclick="doOK()" name="CarID"  value="<bean:write id="resultset" property="CAR_CARINFO/CarID"/>#<bean:write id="resultset" property="CAR_CARINFO/CARNO"/>"  />
	           <td nowrap align="center"><bean:write  id="resultset" property="CAR_CARINFO/CARNO" /></td>
	            <td nowrap align="center"><bean:write  id="resultset" property="CAR_CARINFO/MANUNO" /></td>
	            <td nowrap align="center"><bean:write  id="resultset" property="CAR_CARINFO/CARTYPE" /></td>
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
	for(  i=0; i<document.getElementsByName("CarID").length; i++ ){
			if( document.getElementsByName("CarID").item( i ).checked ){
				head = document.getElementsByName("CarID").item(i).value;
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