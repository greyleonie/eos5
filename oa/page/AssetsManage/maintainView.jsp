 <%@include file="/internet/common.jsp"%>
<body>
<form>
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">办公系统—&gt;资产管理—&gt;资产维修查看</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<html:hidden  property="CAPT_MAINTAINVIEW/_order/col1/field"/>
		<html:hidden  property="CAPT_MAINTAINVIEW/_order/col1/asc" />
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		<html:hidden property="temptype" />
		
	  </td>
    </tr>
  </table>
      <table width="96%" height="10"  border="0" cellpadding="0" cellspacing="0" class="table">
      <tr>
      <td height="8"></td>
      </tr>

               
            <tr><td>
            
            
			<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup" >
				<tr>
				  <td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px"><span id="printTable"> 广州市党校资产维修</span></td>
				</tr>
			</table>
              <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CBCBCB" id="listdetail">
                <tr > 
                  <td align="right" class="td2">维修单位：</td>
                  <td class="td1" colspan="2"><bean:write  property="CAPT_MAINTAINVIEW/VINDNAME"   />
                   </td>
                  <td align="right" class="td2">维 修 人：</td>
                  <td class="td1" colspan="2"><bean:write  property="CAPT_MAINTAINVIEW/MAINTAINER"  />
                  </td>
                </tr>
                
                <tr class="td1"> 
                  <td width="20%" align="right" class="td2">维修日期：</td>
                  <td width="30%" class="td1" colspan="2">
                 <bean:write  property="CAPT_MAINTAINVIEW/MAINTAINDATE" formatType="yyyy-MM-dd"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" />
                  
                  </td>
                <td width="20%" align="right" class="td2">归还日期：</td>
                  <td width="30%" class="td1" colspan="2">
               <bean:write property="CAPT_MAINTAINVIEW/RETURNDATE" formatType="yyyy-MM-dd"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" />
                  </td>
                </tr>
                <tr class="td2"> 
                  <td align="right" class="td2">备注：</td>
                  <td colspan="5" class="td1"><bean:write  property="CAPT_MAINTAINVIEW/REMARK" />
                  </td>
                </tr>
             <tr> <td valign="bottom" colspan="7" class="td1" align="center"><font style="font-size: 14;color: #FF9900;font-weight: bold;"  >资产维修明细</font></td></tr>
                
                
               <tr class="td_title">
				  <td width="5%" align="center">序号</td>
                  <td width="35%" align="center">品名</td>
                  <td width="10%" align="center">编码</td>
                  <td width="20%" align="center">规格</td>
                  <td width="10%" align="center">单价（元）</td>
                  <td width="*" align="center">备注</td>
                </tr>
                    <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type=CAPT_MAINTAINDETAILVIEW']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
               <tr class="<%=trClass %>" onClick="changeTRBgColor(this)" id="row_<%=count %>">  
                <td align="center"> 
				<%=count%>
				</td>
                <td nowrap><bean:write id="resultset" property='CAPT_MAINTAINDETAILVIEW/CAPTNAME'/></td> 
                <td nowrap> <bean:write id="resultset" property='CAPT_MAINTAINDETAILVIEW/CAPTCODE'/></td>
                <td nowrap><bean:write id="resultset" property='CAPT_MAINTAINDETAILVIEW/SPECIA' /></td>
                <td nowrap><bean:write id="resultset" property='CAPT_MAINTAINDETAILVIEW/PRICE'/></td>
                <td nowrap><bean:write id="resultset" property='CAPT_MAINTAINDETAILVIEW/REMARK'/></td>
              </tr>
				</logic:iterate>
              </table>
              
             
			  </td>
        </tr>
</table>


	  <table width="96%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
               <input name="Button" type="button" class="button_02" value="返 回" onClick="goBack()">
               </td>
            </tr>
          </table>
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title" value="资产维修表">
<input type="hidden" name="xmlfcc">
</form>
</body>

<script>
   function goBack() {
  	var frm = document.forms[0];
  	frm.action = "oa.prAssetsManage.maintainList.do";
	frm.submit();
  }

</script>