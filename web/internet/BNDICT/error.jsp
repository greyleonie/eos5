<%@ include file="/internet/common.jsp" %> 
<link rel="stylesheet" href="/internet/theme/style0/style.css" type="text/css"/>
<form name="returnFrm" action="" method="post">
<table class="hci" border="0" cellpadding="0" cellspacing="0" width="100%" align="center">

  <tr class="rescontent">
    <td width="16%">返回信息</td>
    <td width="84%"> 
       	<logic:equal property="return/code" value="1">
		      操作成功！
	</logic:equal>
	 <logic:equal property="return/code" value="-600001">
		      操作失败！主键冲突!
	</logic:equal>	
	<logic:notEqual property="return/code" value="1">
	 	<logic:notEqual property="return/code" value="-600001">
		      操作失败！
		</logic:notEqual>
	</logic:notEqual>
     </td>
  </tr>
  <tr class="rescontent_">
    <td width="6%">&nbsp;</td>
    <td width="94%"> 
      <div align="center">【<a 
            href="javascript:history.go(-1)">返回</a>】</div>
    </td>
  </tr>
</table>
</form>
<%@ include file="/internet/commonTail.jsp" %>