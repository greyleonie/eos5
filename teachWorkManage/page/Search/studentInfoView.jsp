<%@include file="/internet/common.jsp"%> 
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页 -&gt; 教务管理 -&gt; 查询统计
              -&gt; <span id="printTable">学员信息表</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction">
		<input type="hidden" name="addaction">
		<input type="hidden" name="modifyaction">
		<input type="hidden" name="deleteaction">
		<input type="hidden" name="viewaction">
		
		<html:hidden property="QueryStudent/_order/col1/field"/>
		<html:hidden property="QueryStudent/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		
		<html:hidden property="PageCond/length" />
		<html:hidden property="QueryStudent/ClassID/criteria/value"/> 
		<html:hidden property="Student/StudentID"/> 
		<html:hidden property="Student/ClassID"/> 
		
		<input type="hidden" name="filepath" value="Student"/>
		<input type="hidden" name="FBFILE_T_FILE/GROUP_ID" value="talentmail">
		<input type="hidden" name="FBFILE_T_FILE/FILE_SAVE" value="F">
		
		
	  </td>
    </tr>
  </table>
 <form method="post" enctype="multipart/form-data" action="teachWorkManage.prSearch.studentInfoView.do">
<input type="hidden" name="docmarked" value="1">
<html:hidden name="fid" property="QueryStudent/StudentID"/>
		
 <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table" id="listdetail">
<tr>
      <td class="text">
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
      <td width="5%" align="left" bgcolor="#4A82D1"><img src="image/left_01.gif" width="12" height="23"></td>
      <td width="15%" align="center" bgcolor="#4A82D1" class="textb_wirte">学员基本信息</td>
      <td width="5%" align="right" bgcolor="#4A82D1"><img src="image/left_02.gif" width="12" height="23"></td>
      <td width="75%" align="right" valign="bottom"><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#4A82D1">
          <tr>
            <td height="4"> </td>
          </tr>
      </table></td>
    </tr>
    
    <tr>
      <td height="2" colspan="4" align="left"> </td>
    </tr>
  </table>
      
      
	  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
	<tr>
 		<td  width="10%" align="right" class="td2" >姓&nbsp;&nbsp;&nbsp;&nbsp;名 ： </td>
        <td width="30%" class="td1" >&nbsp;<bean:write property="QueryStudent/operatorname" filter="true"/></td>
        <td width="10%" class="td2" align="right" >性&nbsp;&nbsp;&nbsp;&nbsp;别 ： </td>
        <td width="30%" class="td1"  >&nbsp;<dict:write businTypeId="BNDICT_gender" property="QueryStudent/Sex" />              </td>
 		<td width="20%"  rowspan="5"  valign="middle" class="td1"><img src='/common/page/viewimgdb/viewFromDB.jsp?table=Student&pkn=StudentID&field=Photo&pkv=<bean:write property="QueryStudent/StudentID"/>'  width="80" height="100"> </td>
    </tr>
    
    <tr>
    <td  align="right" class="td2"  >民&nbsp;&nbsp;&nbsp;&nbsp;族 ： </td>
    <td  class="td1" >&nbsp;<dict:write businTypeId="dx_folk" property="QueryStudent/FolkID"  /> </td>
    <td align="right" class="td2"  > 出生年月：  </td>
    <td    class="td1" >&nbsp;<bean:write property="QueryStudent/Birthdate" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>              </td>
    </tr>
    <tr>
     <td  align="right" class="td2" >学&nbsp;&nbsp;&nbsp;&nbsp;历：  </td>
     <td class="td1"  >&nbsp;<dict:write businTypeId="dx_education" property="QueryStudent/DegreeID"/>(<bean:write property="QueryStudent/Major"/>)              </td>
     <td  align="right" class="td2" > 学&nbsp;&nbsp;&nbsp;&nbsp;位：  </td>
    <td class="td1"  >&nbsp;<bean:write property="QueryStudent/EduLevel"/></td>
    </tr>
    <tr>
     <td align="right" class="td2" >学&nbsp;&nbsp;&nbsp;&nbsp;号：</td >
     <td class="td1"  ><bean:write property="QueryStudent/StudentNO" filter="true"/></td>
     <td align="right" class="td2"> 入党时间：  </td>
     <td class="td1" >&nbsp;<bean:write property="QueryStudent/JoinPartyTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>              </td>
    </tr>
     <tr>
         <td align="right" class="td2"> 分&nbsp;&nbsp;&nbsp;&nbsp;组：  </td>
        <td class="td1">&nbsp;<bean:write id="resultset" property="QueryStudent/TeamName" /></td>
        <td align="right" class="td2"> 参加工作时间 </td>
      <td class="td1"  >&nbsp;<bean:write property="QueryStudent/StartWorkingTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>              </td>
    </tr>
        <tr>
         <td align="right" class="td2">职&nbsp;&nbsp;&nbsp;&nbsp;务：  </td>
          <td class="td1"  >&nbsp;<bean:write property="QueryStudent/Duty"/>  </td>
          <td align="right" class="td2">工作单位：  </td>
         <td class="td1"  colspan="2">&nbsp;<bean:write property="QueryStudent/WorkingOrgan"/></td>

    </tr>
     <tr>
     <td align="right" class="td2">单位电话：  </td>
      <td class="td1"   >&nbsp;<bean:write property="QueryStudent/OrganTel"/>              </td>
      <td align="right" class="td2">电子邮箱： </td>
     <td class="td1"  colspan="2">&nbsp;<bean:write property="QueryStudent/Email"/></td>
    
    
    </tr>
        <tr>
     <td align="right" class="td2">住宅电话： </td>
              <td class="td1"  width="182" height="22" >&nbsp;<bean:write property="QueryStudent/HomeTel"/>              </td>
                  <td align="right" class="td2">手&nbsp;&nbsp;&nbsp;&nbsp;机</td>
              <td class="td1"   colspan="2">&nbsp;<bean:write property="QueryStudent/MobileTel"/>              </td>
    </tr>
        <tr>
     <td align="right" class="td2" >备&nbsp;&nbsp;&nbsp;&nbsp;注： </td>
              <td class="td1"  colspan="4">　&nbsp; <bean:write property="QueryStudent/Remark"/></td>
    </tr>
      </table>
          
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
      <td width="5%" align="left" bgcolor="#4A82D1"><img src="image/left_01.gif" width="12" height="23"></td>
      <td width="15%" align="center" bgcolor="#4A82D1" class="textb_wirte">成绩与文章</td>
      <td width="5%" align="right" bgcolor="#4A82D1"><img src="image/left_02.gif" width="12" height="23"></td>
      <td width="75%" align="right" valign="bottom"><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#4A82D1">
          <tr>
            <td height="4"> </td>
          </tr>
      </table></td>
    </tr>
    
    <tr>
      <td height="2" colspan="4" align="left"> </td>
    </tr>
  </table>
      
<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
  <tr class="td1" >
       <td width="9%" align="center">序号</td>
        <td width="56%" align="center">学习科目</td>
         <td width="17%" align="center">学时</td>
         <td width="18%" align="center">成绩</td>
      </tr>
      <logic:iterate id="resultset" property="list[@type='QueryScore']">
          <tr class="td1" onclick="changeTRBgColor(this)" >
              <td align="center"><bean:write id="resultset" property="QueryScore/SubjectNO" filter="true"/></td>
              <td>&nbsp;<bean:write id="resultset" property="QueryScore/Subject" filter="true"/></td>
                 <td align="center">&nbsp;<bean:write id="resultset" property="QueryScore/ClassHours" filter="true"/></td>
                  <td align="center">&nbsp;<bean:write id="resultset" property="QueryScore/Score" filter="true"/></td>
                    </tr>
    </logic:iterate>
              </table> 
         <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
           <tr><td height="22" align="center">
                <input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onClick="domToDoc()">
                <input name="Submit2" type="button" class="button_02" value="返 回" onclick="history.back()" /></td>
            </tr>
      </table> 
          </td>
    </tr>
  </table>		
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
<script>
function domToDoc(){
    	var frm =document.forms[0];
    		frm.action = "teachWorkManage.prSearch.studentInfoView.do";
			frm.target = "_blank";
			frm.submit();		 	
}
</script>