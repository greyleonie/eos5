<%@include file="/internet/common.jsp"%>

 <logic:present property="Msg">
 <script>
 alert('<bean:write property="Msg"/>');
 </script>
  </logic:present>
<body>
<form method="post" action="oa.prThingsManage.checkList.do" name="opeForm">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
 			<td class="text_wirte">首页—&gt;办公系统—&gt;用品管理—&gt;<span id="printTable">用品盘点列表</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prThingsManage.checkList.do">
		<input type="hidden" name="addaction" value="oa.prThingsManage.checkAdd.do">
		<input type="hidden" name="modifyaction" value="oa.prThingsManage.checkModify.do">
		<input type="hidden" name="deleteaction" value="oa.prThingsManage.checkDelete.do">
		<input type="hidden" name="viewaction" value="oa.prThingsManage.checkView.do">
	
		<html:hidden property="COMM_CHECK/_order/col1/field"/>
		<html:hidden property="COMM_CHECK/_order/col1/asc" />
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
				盘点单编号： 
			    <html:text property="COMM_CHECK/CHECKCODE/criteria/value" attributesText='class="input"'/>
			    <html:hidden property="COMM_CHECK/CHECKCODE/criteria/operator" value="like"/>
			    <html:hidden property="COMM_CHECK/CHECKCODE/criteria/likeRule" value="center"/>
			    盘点日期：从
            	<html:text property="COMM_CHECK/CHECKDATE/criteria/min" attributesText='class="input" size="10"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["COMM_CHECK/CHECKDATE/criteria/min"],"yyyy-MM-dd")> 
           		到
           		<html:text property="COMM_CHECK/CHECKDATE/criteria/max" attributesText='class="input" size="10"' readonly="true"/>
          	    <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["COMM_CHECK/CHECKDATE/criteria/max"],"yyyy-MM-dd")>
			    <input type="hidden" name="COMM_CHECK/CHECKDATE/criteria/criteriaPattern" value="yyyy-MM-dd"/>
			    <input type="hidden" name="COMM_CHECK/CHECKDATE/criteria/operator" value="between"/>
			    <input name="query" type="button" class="button_02" value="查 询" onClick="talentquery()">
			    服务端排序：<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""> <br/>
			    
                <input name="add" type="button" class="button_02" value="新 增" onClick="talentadd()">
                <input name="modifyandsave" type="button" class="button_02" value="修 改" onClick="talentmodify()">
              	<input name="delete" type="button" class="button_02" value="删 除" onClick="talentdelete()">
              	<input name="view" type="button" class="button_02" value="查 看" onClick="talentview()">
				<input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
				
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text" >
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="3%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                  <td width="10%" align="center" nowrap id="COMM_CHECK.CHECKCODE" onClick="talentsort()">盘点单编号</td>
                  <td width="20%" align="center" nowrap id="COMM_CHECK.CHECKDATE" onClick="talentsort()">盘点日期</td>
                  <td width="20%" align="center" nowrap id="COMM_CHECK.CHECKER" onClick="talentsort()">盘点人</td>
                  <td width="17%" align="center" nowrap id="COMM_CHECK.REMARK" onClick="talentsort()">备 注</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='COMM_CHECK']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)">  
                <td align="center"> 
					<logic:present  id="resultset" property="COMM_CHECK/CHECKID"> 
                  		<html:checkbox id="resultset" name="list[@name='update']/COMM_CHECK/CHECKID" property="COMM_CHECK/CHECKID" indexed="true"/> 
                  	</logic:present> 
				</td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="COMM_CHECK/CHECKCODE"/></td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="COMM_CHECK/CHECKDATE" formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/></td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="COMM_CHECK/operatorName"/></td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="COMM_CHECK/REMARK" /></td>
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
<input type="hidden" name="title" value="用品盘点列表">
<input type="hidden" name="xmlfcc">
</form>
</body>
<script>
	loadOrderImg(document.forms[0],'COMM_CHECK');
</script>