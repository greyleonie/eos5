<%@include file="/internet/common.jsp"%>
<%@ page import=" java.util.GregorianCalendar"%>
<body>
<form method="post" action="teachWorkManage.prBookManage.selectOrder.do">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte" align="center">选择订购单</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="teachWorkManage.prBookManage.selectOrder.do">

		<html:hidden property="QueryTextbookOrder/_order/col1/field"/>
		<html:hidden property="QueryTextbookOrder/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		<html:hidden property="flag"/>
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
			年度：
			<html:select property="QueryTextbookOrder/Yearth/criteria/value">
			<html:option value="">请选择</html:option>
			<%
			GregorianCalendar today=new GregorianCalendar();
          int thisYear=today.get(GregorianCalendar.YEAR);
			for(int i=thisYear+1;i>=thisYear-4;i--){%>
            <html:option value="<%=i+""%>"><%=i%></html:option>
           <%}%>
			</html:select>
			<html:hidden property="QueryTextbookOrder/Yearth/criteria/operator" value="="/>
            时期：
           	<html:select property="QueryTextbookOrder/Season/criteria/value">		
                <html:option value="">请选择</html:option>
                <html:option value="春">春</html:option>
                <html:option value="夏">夏</html:option>
                <html:option value="秋">秋</html:option>
                <html:option value="冬">冬</html:option>         
			</html:select>
            <html:hidden property="QueryTextbookOrder/Season/criteria/operator" value="like"/>
            <html:hidden property="QueryTextbookOrder/Season/criteria/likeRule" value="begin"/>
			<input name="query" type="button" class="button_02" value="查 询" onClick="talentquery()">
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text" >
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="3%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""></td>
                  <td width="10%" align="center" nowrap id="QueryTextbookOrder.Yearth" onClick="talentsort()">年度</td>
                  <td width="10%" align="center" nowrap id="QueryTextbookOrder.Season" onClick="talentsort()">季节</td>
                  <td width="65%" align="center" nowrap id="QueryTextbookOrder.OrderTitle" onClick="talentsort()">标题</td>
                  <td width="12%" align="center" nowrap id="QueryTextbookOrder.OrderTime" onClick="talentsort()">订购时间</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='querytextbookorder']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="Textbook/TextbookID"/>','true')">  
                <td align="center"> 
					<logic:present  id="resultset" property="QueryTextbookOrder/OrderTitle"> 
                  		<html:checkbox id="resultset" name="list[@type='update']/QueryTextbookOrder/OrderTitle" property="QueryTextbookOrder/OrderTitle" indexed="true"/> 
                  	</logic:present> 
				</td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="QueryTextbookOrder/Yearth"/>年</td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="QueryTextbookOrder/Season"/>季</td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="QueryTextbookOrder/OrderTitle"/></td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="QueryTextbookOrder/OrderTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
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
	var flag = form["flag"].value;
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
		if(flag==1){
			parentFrm.action="teachWorkManage.prBookManage.buyAdd.do?fid="+id;
		}else if(flag=2){
			parentFrm.action="teachWorkManage.prBookManage.issueAdd.do?fid="+id;
		}
		
		parentFrm.submit();
		window.close();
}

</script>

<script>
	loadOrderImg(document.forms[0],'QueryTextbookOrder');
</script>