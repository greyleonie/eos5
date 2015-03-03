<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="teachWorkManage.prNetCenter.statisDistanceTotal.do" name="opeForm">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;网络中心教学管理—&gt;<span id="printTable">远程教育收录播情况汇总</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="teachWorkManage.prNetCenter.statisDistanceTotal.do">
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
            日期： 从
            	<html:hidden property="DistanceTeaching/Channel/criteria/operator" value="="/>
              日期： 从
            	<html:text property="input/BeginTime" attributesText='class="input" size="10"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["input/BeginTime"],"yyyy-MM-dd")> 
           		到
           		<html:text property="input/EndTime" attributesText='class="input" size="10"' readonly="true"/>
          	    <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["input/EndTime"],"yyyy-MM-dd")>

                <input name="query" type="button" class="button_02" value="汇 总" onClick="statistotal()">  
				<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">&nbsp;&nbsp;&nbsp;&nbsp;
				<input name="add" type="button" class="button_02" value="明 细" onClick="statisdetail()">			
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="50%" align="center"  nowrap >频道</td>
                  <td width="20%" align="center"  nowrap >录（播）</td>
                  <td width="30%" align="center"  nowrap >汇总次数</td>
                </tr>
                <tr class="td1" onClick="changeTRBgColor(this)"> 
                  <td align="center" >中央党校</td>
                  <td align="center" >录</td>
                  <td align="center" ><bean:write property="DistanceTotal/ZhongRecord"/></td>
                </tr>
                <tr class="td2" onClick="changeTRBgColor(this)"> 
                  <td align="center" >中央党校</td>
                  <td align="center" >播</td>
                  <td align="center" ><bean:write property="DistanceTotal/ZhongPlay"/></td>
                </tr>
                <tr class="td1" onClick="changeTRBgColor(this)"> 
                  <td align="center" >省党校</td>
                  <td align="center" >录</td>
                  <td align="center" ><bean:write property="DistanceTotal/ShengRecord"/></td>
                </tr>
                <tr class="td2" onClick="changeTRBgColor(this)"> 
                  <td align="center" >省党校</td>
                  <td align="center" >播</td>
                  <td align="center" ><bean:write property="DistanceTotal/ShengPlay"/></td>
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
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>

<script>
	loadOrderImg(document.forms[0],'Teacher');
</script>
<script>
function statisdetail(){
 	var frm = document.forms[0];
	var BeginTime = frm["input/BeginTime"].value;
	var EndTime = frm["input/EndTime"].value;
	window.location.href="teachWorkManage.prNetCenter.statisDistanceDetail.do?input/BeginTime="+BeginTime+"&input/EndTime="+EndTime;

}

function statistotal(){

 	var frm = document.forms[0];
	var BeginTime = frm["input/BeginTime"].value;
	var EndTime = frm["input/EndTime"].value;
	if(BeginTime==""||EndTime ==""){
		alert("时间不能为空");
		return ;
	}
	window.location.href="teachWorkManage.prNetCenter.statisDistanceTotal.do?input/BeginTime="+BeginTime+"&input/EndTime="+EndTime;

}
</script>