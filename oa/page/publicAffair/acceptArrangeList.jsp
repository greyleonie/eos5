<%@include file="/internet/common.jsp"%>
<style type="text/css">
<!--
.STYLE1 {color: #CC0000}
-->
</style>
<body>
<form method="post" action="oa.prAffair.workArrangeList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;办公系统—&gt;公共事务—&gt;工作安排—&gt;接收工作安排</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">

		<input type="hidden" name="deleteaction" value="oa.prAffair.acceptArrangeDelete.do">
		<input type="hidden" name="viewaction" value="oa.prAffair.acceptArrangeView.do">
		<input type="hidden" name="replayaction" value="oa.prAffair.acceptArrangeReplay.do">
		<input type="hidden" name="replayviewaction" value="oa.prAffair.acceptArrangeReplayView.do">
		
		<html:hidden property="WorkArrange/_order/col1/field"/>
		<html:hidden property="WorkArrange/_order/col1/desc" />
		
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
	  	<td class="text">
				<input name="view" type="button" class="button_02" value="查 看" onClick="talentview()">
              	<!--input name="delete" type="button" class="button_02" value="删 除" onClick="talentdelete()"-->
				
		</td>
	  </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="4%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                  <td width="11%" align="center" nowrap id="WorkArrange.CALENDAR" onClick="talentsort()">安排日期</td>
                  <td width="16%" align="center" nowrap id="WorkArrange.USERID" onClick="talentsort()">制定人</td>
                  <td width="41%" align="center" nowrap id="WorkArrange.TASKSUM" onClick="talentsort()">工作概要</td>
                  <td width="14%" align="center" nowrap id="WorkArrange.type" onClick="talentsort()">是否查看</td>
                  <td width="14%" align="center" >回复</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='WorkArrange']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="WorkArrange/ArrangeID"/>','true')">  
                <td align="center"> 
					<logic:present  id="resultset" property="WorkArrange/ArrangeID"> 
                  		<html:checkbox id="resultset" name="list[@name='update']/WorkArrange/ArrangeID" property="WorkArrange/ArrangeID" indexed="true"/> 
                  	</logic:present> 
				</td>
				<td nowrap align="center"><bean:write id="resultset" property="WorkArrange/CALENDAR"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
				</td>
                <td nowrap align="center">&nbsp;<bean:write id="resultset" property="WorkArrange/USERIDName"/></td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="WorkArrange/TASKSUM"/></td>
                <td nowrap align="center">
                <logic:equal id="resultset" property="WorkArrange/type" value="0">
                <span class="STYLE1">未查看</span>
				<!--img src="/internet/image/new_01.gif" width="26" height="16" border="0" align="absmiddle"-->
				</logic:equal>
				<logic:equal id="resultset" property="WorkArrange/type" value="1">已查看</logic:equal>
				</td>
                <td nowrap align="center">
                <logic:present id="resultset" property="WorkArrange/WorkArrangeReplay/ReplayID">
                  <a href='#' onClick="replayView('<bean:write id="resultset" property="WorkArrange/WorkArrangeReplay/ReplayID"/>')">查看回复</a>
                </logic:present>
                
                <logic:notPresent id="resultset" property="WorkArrange/WorkArrangeReplay/ReplayID">
                  <a href='#' onClick="replay('<bean:write id="resultset" property="WorkArrange/ArrangeID"/>')">写回复</a>
                </logic:notPresent>
                </td>
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


</body>
<script>

	function replay(id){
		var frm = document.forms[0];

		frm.action = frm.elements["replayaction"].value;
		frm.action += "?fid=" + id;
   		frm.submit();
	}
	
	function replayView(id){
		var frm = document.forms[0];

		frm.action = frm.elements["replayviewaction"].value;
		frm.action += "?fid=" + id;
   		frm.submit();
	}
	

</script>