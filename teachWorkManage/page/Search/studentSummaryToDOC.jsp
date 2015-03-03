<%@include file="/internet/common.jsp"%>
<%
response.setContentType("application/msword;charset=gb2312");
%>


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
      
      
	  <table width="98%"  border="1" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
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
     <td class="td1"  >&nbsp;<dict:write businTypeId="dx_education" property="QueryStudent/DegreeID"/>              </td>
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
              <td class="td1"  width="182" height="22" >　 &nbsp; <bean:write property="QueryStudent/HomeTel"/>              </td>
                  <td align="right" class="td2">手&nbsp;&nbsp;&nbsp;&nbsp;机</td>
              <td class="td1"   colspan="2">　&nbsp; <bean:write property="QueryStudent/MobileTel"/>              </td>
    </tr>
        <tr>
     <td align="right" class="td2" >备&nbsp;&nbsp;&nbsp;&nbsp;注： </td>
              <td class="td1"  colspan="4">　&nbsp; <bean:write property="QueryStudent/Remark"/></td>
    </tr>
      </table>
          
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
      <td width="5%" align="left" bgcolor="#4A82D1"><img src="image/left_01.gif" width="12" height="23"></td>
      <td width="15%" align="center" bgcolor="#4A82D1" class="textb_wirte">文章与评语</td>
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
      
<table width="98%"  border="1" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
                  <tr class="td1" >
                    <td width="42%" align="center">论文评语</td>
                    <td width="45%" align="center">论文标题</td>
                    <td width="10%" align="center">老&nbsp;&nbsp;&nbsp;&nbsp;师</td>
                  </tr>
                  <logic:iterate id="resultset" property="list[@type='ThesisSummary']">
                    <tr class="td1" onclick="changeTRBgColor(this)" > 
                      <td align="center">&nbsp;<bean:write id="resultset" property="ThesisSummary/Summary" filter="true"/></td>
                      <td align="center">&nbsp;<bean:write id="resultset" property="ThesisSummary/ThesisTitle" filter="true"/></td>
                      <td align="center">&nbsp;<bean:write id="resultset" property="ThesisSummary/TeacherName" filter="true"/></td>
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