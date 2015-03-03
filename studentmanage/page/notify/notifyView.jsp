<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="studentmanage.prNotify.notifyAddDo.do">
  <html:hidden property="QueryClassNotify/ClassID/criteria/value" name="QueryClassNotify/ClassID"/>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">学员管理—&gt;班级通知—&gt;通知查看</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          
          <tr  onClick="changeTRBgColor(this)">
            <td width="15%" align="right" class="td2">班 级：</td>
            <td width="85" colspan="3" class="td1">&nbsp;
            <bean:write property="Class/ClassName"/>			</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">发布时间：</td>
            <td class="td1">&nbsp;
            <bean:write property="ClassNotify/PublishTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
            </td>
            <td align="right" class="td2">结束时间：</td>
            <td class="td1">&nbsp;
            <bean:write property="ClassNotify/endTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
            </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">通知内容：</td>
            <td colspan="3" class="td1">&nbsp;
            <%
            String content=talent.core.TalentFunctions.transformHtmlTags(base.util.TalentContext.getValue(pageContext,null,"ClassNotify/Content"));
            
             %>
             <%=content %>
			
			</td>
          </tr>
          
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
                <input name="Submit2" type="button" class="button_02" value="返 回" onClick="javascript:history.go(-1)">
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
 
  <script>

  function save() {
  	var frm = document.forms[0];
  	
	if(validater(frm)) frm.submit();
  
  }
  
  </script>
 