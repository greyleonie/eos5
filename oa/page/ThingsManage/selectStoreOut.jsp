<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prThingsManage.selectPurchase.do">
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte" align="center">   选择领用申请单 </td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prThingsManage.selectPurchase.do">
		<html:hidden  property="COMM_STOREOUT/_order/col1/field"/>
		<html:hidden  property="COMM_STOREOUT/_order/col1/asc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		<html:hidden property="temptype" />
		
	  </td>
    </tr>
  </table>
  
  
<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
      
	  <tr>
            <td height="30" class="text">
				申请人：
				<html:text property="COMM_STOREOUT/PROPOSER/criteria/value" attributesText='class="input" size="15"'/>
				<html:hidden property="COMM_STOREOUT/PROPOSER/criteria/operator" value="like"/>
				<html:hidden property="COMM_STOREOUT/PROPOSER/criteria/likeRule" value="center"/>
				&nbsp;
				申请部门：
				<html:text property="COMM_STOREOUT/BRANCH/criteria/value" attributesText='class="input" size="15"'/>
				<html:hidden property="COMM_STOREOUT/BRANCH/criteria/operator" value="like"/>
				<html:hidden property="COMM_STOREOUT/BRANCH/criteria/likeRule" value="center"/>
				&nbsp;
				申请单编号：
				<html:text property="COMM_STOREOUT/STOREOUTID/criteria/value" attributesText='class="input" size="15"'/>
				<html:hidden property="COMM_STOREOUT/STOREOUTID/criteria/operator" value="like"/>
				<html:hidden property="COMM_STOREOUT/STOREOUTID/criteria/likeRule" value="center"/>
				
			    <input name="query" type="button" class="button_02" value="查 询" onClick="talentquery()">
				

			</td>
      </tr>
	  <tr>
	  	<td class="text">
				
			
				
		</td>
	  </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="3%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                  <td width="10%" align="center" nowrap id="COMM_STOREOUT.STOREOUTID" onClick="talentsort()">申请单编号</td>
                  <td width="25%" align="center" nowrap id="COMM_STOREOUT.PROPOSER" onClick="talentsort()">申请人</td>
                  <td width="15%" align="center" nowrap id="COMM_STOREOUT.BRANCH" onClick="talentsort()">申请部门</td>

                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='COMM_STOREOUT']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="COMM_STOREOUT/STOREOUTID"/>','true')">  
                <td align="center"> 
					<logic:present  id="resultset" property="COMM_STOREOUT/STOREOUTID"> 
                  		<html:checkbox id="resultset" name="list[@name='update']/COMM_STOREOUT/STOREOUTID" property="COMM_STOREOUT/STOREOUTID" indexed="true"/> 
                  	</logic:present> 
				</td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="COMM_STOREOUT/STOREOUTID"/></td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="COMM_STOREOUT/operatorName"/></td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="COMM_STOREOUT/orgName"/></td>
              </tr>
                </logic:iterate> 
              </table>
          <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="30" class="text">
			  <script>
				PageCond(document.forms[0]);
		  </script>
			  </td>
            </tr>
			 
          </table>
          
           <table width="98%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="Button" type="button" class="button_02" value="保 存" onClick="javascript:add()">
              <input name="Submit2" type="button" class="button_02" value="关 闭" onClick="javascript:window.close()"></td>
            </tr>
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

<script>
	loadOrderImg(document.forms[0],'COMM_STOREOUT');
</script>
<script>
function add(){
   var frm=document.forms[0];  
   if(chechedCount(frm)<1){
       alert("请选择一个！");
       return;
   }else if(chechedCount(frm)>1){
       alert("只能选择一个！");
       return;

   }
      getChechedValue(frm);
}
 
 
function getChechedValue(form) {
	var eles = form.elements;
		var i=0;
		var id="";	


	while(i<eles.length){
			var obj= eles[i];
			if(obj.type == "checkbox" && !obj.disabled && obj.getAttribute("marked")==null){
				if(obj.checked){
				   id=obj.value;
			     }			   
			}
			i++;
		}//while		
		var parentFrm =window.opener.document.forms[0];
		parentFrm.action="oa.prThingsManage.drawAdd.do?fid="+id;
		parentFrm.submit();
		window.close();
}

</script>

<script>
	loadOrderImg(document.forms[0],'QueryTextbookOrder');
</script>