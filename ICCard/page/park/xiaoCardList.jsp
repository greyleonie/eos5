<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="ICCard.prPark.xiaoCardList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;一卡通—&gt;停车管理—&gt;校内车辆卡管理  </td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="ICCard.prPark.xiaoCardList.do">
		
		<html:hidden property="QueryCarInfo/_order/col1/field"/>
		<html:hidden property="QueryCarInfo/_order/col1/asc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
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
	    <td height="30" class="text">车牌号：
	      <html:text property="QueryCarInfo/CARNO/criteria/value" attributesText='class="input"' size="15"/>
        
&nbsp;
发卡状态：
<html:select property="QueryCarInfo/StateID"  > 
			<html:option  value="-1">请选择</html:option> 
			<html:option value="0">未发卡</html:option>
			<html:option value="1">已发卡</html:option>
</html:select>
&nbsp;
	  
<input name="B32" type="button" class="button_02" value="查 询" onClick="talentquery()">

<input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
服务端排序：
<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""></td>
	    </tr>
	  
	  
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text"><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
          <tr class="td_title">
            <td width="4%" align="center" nowrap><input type="checkbox" name="checkbox2" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked="">            </td>
            <td width="16%" align="center" nowrap id="QueryCarInfo.MANUNO" onClick="talentsort()">厂牌型号</td>
            <td width="20%" align="center" nowrap id="QueryCarInfo.CARNO" onClick="talentsort()">车牌号</td>
            <td width="16%" align="center" nowrap id="QueryCarInfo.DRIVER" onClick="talentsort()">驾驶员</td>
            <td width="16%" align="center" nowrap id="QueryCarInfo.CARTYPE" onClick="talentsort()">类 型 </td>
            <td width="14%" align="center" nowrap id="QueryCarInfo.CardID" onClick="talentsort()">发卡状态</td>
            <td width="14%" align="center" nowrap  onClick="talentsort()">操作</td>
          </tr>
          <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
          <logic:iterate id="resultset" property="list[@type='QueryCarInfo']">
            <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
						
						
			       %>
           <tr class="<%=trClass%>" onClick="changeTRBgColor(this)">
	             <td align="center">
	          
	           <html:checkbox name="list[@name='update']/QueryCarInfo/CarID" id="resultset" property="QueryCarInfo/CarID" indexed="true"  />	                       </td>
	        	<td nowrap align="center"><bean:write id="resultset" property="QueryCarInfo/MANUNO"/></td>
	            <td nowrap align="center"><bean:write  id="resultset" property="QueryCarInfo/CARNO" /></td>
	            <td nowrap align="center"><bean:write  id="resultset" property="QueryCarInfo/DRIVER" /></td>
	            <td  nowrap align="center"><bean:write  id="resultset" property="QueryCarInfo/CARTYPE" /></td>
	            <td  nowrap align="center">
				<%
	            String cardID= base.util.TalentContext.getValue(pageContext,"resultset","QueryCarInfo/CardID");
	            
	            if(cardID==null)
	            	out.println("<font color='red'>未发卡</font>");
	            else
	            	out.println("已发卡");
	             %>	   

				</td>
	            <td  nowrap align="center">
					<%if(cardID==null||cardID.equals("")){
	             	%>
	            <input name="issue" type="button" class="button_02" value="发 卡" onClick="issueCard(<bean:write id="resultset" property="QueryCarInfo/CarID"/>)">
	           	<%}%>
				</td>
           </tr>
          </logic:iterate>
        </table>
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
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
    </table>    </td>
  </tr>
</table>
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>
<script >
	function issueCard(id){
		window.open("ICCard.prPark.xiaoCardIssue.do?fid="+id,"","height=250,width=460,top=130,left=300");
	}

</script>