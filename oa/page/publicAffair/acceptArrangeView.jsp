<%@include file="/internet/common.jsp"%>
<head>
<title>�������Ų鿴</title>
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
            <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;��������&gt;�������š�&gt;���չ������š�&gt;�������Ų鿴</td>
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
            <td width="13%" height="30" align="right" class="td2">������Ҫ��</td>
            <td width="87%" class="td1">&nbsp;
            <bean:write property="WorkArrange/TASKSUM"/>
            </td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="94" align="right" class="td2">�������ݣ�</td>
            <td width="87%" class="td1">&nbsp;
             <bean:write property="WorkArrange/TASKCONTENT"/>
            </td>
          </tr>
		  <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="30" align="right" class="td2">����ʱ�䣺</td>
            <td width="87%" class="td1">&nbsp;
            <bean:write property="WorkArrange/CALENDAR" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td width="13%" height="58" align="right" class="td2">�ƶ��ˣ�</td>
            <td width="87%" class="td1">&nbsp;
            <bean:write property="WorkArrange/USERIDName"/>
            </td>
          </tr>

          </table>
          <table width="100%" height="50"  border="0" cellpadding="0" cellspacing="0" >
            <tr>
              <td height="49" align="center">
                <logic:notPresent property="WorkArrange/WorkArrangeReplay/ReplayID">
                <input name="Button" type="button" class="button_02" value="�� ��" onClick="replay()">
                </logic:notPresent>
                <%if(flag!=null&&flag.equals("desk")){ %>
                <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="window.close()">
                <%}else{ %>
                <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="javascript:document.location.href='oa.prAffair.acceptArrangeList.do'">
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
 