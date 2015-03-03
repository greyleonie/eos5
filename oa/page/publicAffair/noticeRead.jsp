<%@include file="/internet/common.jsp"%>
<style type="text/css">
<!--
.STYLE1 {color: #CC0000}
-->
</style>
<body>
<form method="post" action="oa.prAffair.noticeRead.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;办公系统—&gt;公共事务—&gt;公告通知</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prAffair.noticeList.do">
		<input type="hidden" name="addaction" value="oa.prAffair.noticeAdd.do">
		<input type="hidden" name="modifyaction" value="oa.prAffair.noticeModify.do">
		<input type="hidden" name="deleteaction" value="oa.prAffair.noticeDelete.do">
		<input type="hidden" name="viewaction" value="oa.prAffair.noticeReadView.do">
		
		<html:hidden property="Notice/_order/col1/field"/>
		<html:hidden property="Notice/_order/col1/desc" />
		
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
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="5%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                  <td width="13%" align="center" nowrap id="Notice.CreateTime" onClick="talentsort()">创建时间</td>
                  <td width="14%" align="center" nowrap id="Notice.ReceiveIDs" onClick="talentsort()">发布人</td>
                  <td width="46%" align="center" nowrap id="Notice.Title" onClick="talentsort()">通知标题</td>
                  <td width="10%" align="center" nowrap id="Notice.type" onClick="talentsort()">是否查阅</td>
                  <td width="12%" align="center" nowrap>查阅</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='Notice']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="Notice/NoticeID"/>','true')">  
                <td align="center"> 
					<logic:present  id="resultset" property="Notice/NoticeID"> 
                  		<html:checkbox id="resultset" name="list[@name='update']/Notice/NoticeID" property="Notice/NoticeID" indexed="true"/> 
                  	</logic:present> 
				</td>
				<td nowrap align="center"><bean:write id="resultset" property="Notice/CreateTime"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                <td nowrap align="center"><bean:write id="resultset" property="Notice/PublisherIDName"/></td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="Notice/Title"/></td>
                <td nowrap align="center">
                  <logic:equal id="resultset" property="Notice/type" value="0"><span class="STYLE1">未查阅</span></logic:equal>
                  
  				<logic:equal id="resultset" property="Notice/type" value="1">已查阅</logic:equal>
                </td><td nowrap align="center">
                <a href="#" onclick="toRead('<bean:write id="resultset" property="Notice/NoticeID"/>')">查阅</a>
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
function toRead(id){
	var frm = document.forms[0];
	frm.action = "oa.prAffair.noticeReadView.do?fid=" + id;
   	frm.submit();
}

//function toRead(id){
//	var url = "oa.prAffair.noticeReadView.do?fid="+id;
//	var width = 600;
//	var height = 600;
//	var xposition = (screen.width-width)/2;
//	var yposition = (screen.height-height-25)/2;
	
//	window.open(url,'notice','height='+height+',width='+width+',left='+ xposition +',top='+ yposition +',toolbar=no,menubar=no,scrillbars=no,resizable=no,location=no,status=no');
//}
</script>