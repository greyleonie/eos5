<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prAssetsManage.reportMaintainList.do" name="opeForm">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
 			<td class="text_wirte">首页—&gt;办公系统—&gt;资产管理—&gt;<span id="printTable">资产维修报表</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prAssetsManage.reportMaintainList.do">
		
			
		<html:hidden property="CAPT_MAINTAINDETAILVIEW/_order/col1/field"/>
		<html:hidden property="CAPT_MAINTAINDETAILVIEW/_order/col1/asc" />
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
            <td height="30" class="text">
				<a title="资产编码，资产名称，品牌，规格型号，维修人，维修单位">关键字： </a>
			  <html:text property="CAPT_MAINTAINDETAILVIEW/searchText" attributesText='class="input" size="30"'/>
				<html:hidden property="CAPT_MAINTAINDETAILVIEW/searchField" value="CAPTCODE,CAPTNAME,BRANDNAME,SPECIA,MAINTAINER,VINDNAME"/>


			    <input name="query" type="button" class="button_02" value="统 计" onClick="talentquery()">
				<input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
				服务端排序：<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""> 
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text" >
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
               <tr class="td_title">
		<td width="5%" align="center">序号</td>
          <td width="10%" align="center" id="CAPT_MAINTAINDETAILVIEW.CAPTCODE" onClick="talentsort()">资产编码</td>
          <td width="25%" align="center" id="CAPT_MAINTAINDETAILVIEW.CAPTNAME" onClick="talentsort()">资产名称</td>
          <td width="10%" align="center" id="CAPT_MAINTAINDETAILVIEW.BRANDNAME" onClick="talentsort()">品牌</td>
          <td width="10%" align="center"  id="CAPT_MAINTAINDETAILVIEW.SPECIA" onClick="talentsort()">规格型号</td>
          <td width="10%" align="center" id="CAPT_MAINTAINDETAILVIEW.MAINTAINER" onClick="talentsort()">维修人</td>
          <td width="10%" align="center" id="CAPT_MAINTAINDETAILVIEW.VINDNAME" onClick="talentsort()">维修单位</td>
          <td width="10%" align="center" id="CAPT_MAINTAINDETAILVIEW.MAINTAINDATE" onClick="talentsort()">维修日期</td>
          <td width="10%" align="center" id="CAPT_MAINTAINDETAILVIEW.RETURNDATE" onClick="talentsort()">归还日期</td>
        </tr>
        
               
                    <%
		 		
			         int count=0;
			         String trClass = "result_content"; 
			        %>
       <logic:iterate property="list[type='CAPT_MAINTAINDETAILVIEW']" id="resultset">
                   <%
			       	if(count%2==0)
			       	    trClass = "td1";
			       	else
			       	    trClass = "td2";
			       	count++;
			       %>
           <tr class="<%=trClass%>">
			<td align="center"><%=count %> </td>
           <td>
           <bean:write id="resultset" property="CAPT_MAINTAINDETAILVIEW/CAPTCODE"/>
          </td>
           <td>
           <bean:write id="resultset" property="CAPT_MAINTAINDETAILVIEW/CAPTNAME"/>
          </td>
          <td align="left">
           <bean:write id="resultset" property="CAPT_MAINTAINDETAILVIEW/BRANDNAME"/>
          </td>
          <td align="left">
           <bean:write id="resultset" property="CAPT_MAINTAINDETAILVIEW/SPECIA"/>
           </td>
           <td align="left">
           	<bean:write id="resultset" property="CAPT_MAINTAINDETAILVIEW/MAINTAINER"/>
           </td>
           <td align="left">
           	<bean:write id="resultset" property="CAPT_MAINTAINDETAILVIEW/VINDNAME"/>
           </td>
          <td align="left">
           <bean:write id="resultset" property="CAPT_MAINTAINDETAILVIEW/MAINTAINDATE" formatType="yyyy-MM-dd"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" />
           </td>
           <td align="left">
           <bean:write id="resultset" property="CAPT_MAINTAINDETAILVIEW/RETURNDATE" formatType="yyyy-MM-dd"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" />
           </td>

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
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title" value="资产维修报表">
<input type="hidden" name="xmlfcc">
</form>
</body>
