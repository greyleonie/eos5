<%@include file="/internet/common.jsp"%>
<head>
<title>工作安排查看</title>
</head>
<%String flag = request.getParameter("flag"); %>
<body>
<form method="post" enctype="multipart/form-data" action="oa.prAffair.acceptArrangeReplay.do">
		
        <html:hidden property="fid" />
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;办公系统—&gt;公共事务—&gt;工作安排—&gt;接收工作安排—&gt;工作安排查看</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="28"> </td>
    </tr>
    <tr>
      <td class="text"><table width="86%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="30" align="right" class="td2">工作概要：</td>
            <td width="87%" class="td1">&nbsp;
            <bean:write property="WorkArrange/TASKSUM"/>
            </td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="94" align="right" class="td2">工作内容：</td>
            <td width="87%" class="td1">&nbsp;
             <bean:write property="WorkArrange/TASKCONTENT"/>
            </td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="30" align="right" class="td2">安排时间：</td>
            <td width="87%" class="td1">&nbsp;
            <bean:write property="WorkArrange/CALENDAR" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="58" align="right" class="td2">制定人：</td>
            <td width="87%" class="td1">&nbsp;
            <bean:write property="WorkArrange/USERIDName"/>
            </td>
          </tr>

          </table>
          <table width="100%" height="50"  border="0" cellpadding="0" cellspacing="0" >
            <tr>
              <td height="49" align="center">
                <logic:notPresent property="WorkArrange/WorkArrangeReplay/ReplayID">
                <input name="Button" type="button" class="button_02" value="回 复" onClick="replay()">
                </logic:notPresent>
                <%if(flag!=null&&flag.equals("desk")){ %>
                <input name="Submit2" type="button" class="button_02" value="关 闭" onClick="window.close()">
                <%}else{ %>
                <input name="Submit2" type="button" class="button_02" value="返 回" onClick="javascript:document.location.href='oa.prAffair.acceptArrangeList.do'">
                <%} %>
              </td>
            </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;
        </td>
    </tr>
  </table>
  </form>
</body>
  <script>

  function replay() {
  	var frm = document.forms[0];
  	
	if(validater(frm)) frm.submit();
  
  }
  
  </script>
 