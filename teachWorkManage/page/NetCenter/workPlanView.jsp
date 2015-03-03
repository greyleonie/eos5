<%@include file="/internet/common.jsp"%>
<body>
<form method="post" >
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页—&gt;教务管理—&gt;网络中心教学管理—&gt;<span id="printTable">中心工作计划查看</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" />
		<input type="hidden" name="addaction" />
		<input type="hidden" name="modifyaction" />
		<input type="hidden" name="deleteaction" />
		<input type="hidden" name="viewaction"/>
		<html:hidden property="CenterPlan/_order/col1/field"/>
		<html:hidden property="CenterPlan/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/length" />
	  </td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    
    
    <tr>
	  <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
          <tr  onClick="changeTRBgColor(this)">
            <td width="12%" align="right" class="td2">日&nbsp;&nbsp;&nbsp;&nbsp;期：</td>
            <td width="88%" class="td1"><bean:write property="CenterPlan/PlanDate" formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/>
              <bean:write   property="CenterPlan/PlanTime" />

<logic:equal  property="CenterPlan/PlanNoon" value="1">
上午</logic:equal>
<logic:equal   property="CenterPlan/PlanNoon" value="2">
下午</logic:equal>
<logic:equal  property="CenterPlan/PlanNoon" value="3">
晚上</logic:equal>
</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">任务类别：</td>
            <td class="td1">
                <dict:write businTypeId="dx_workType" property="CenterPlan/WorkType"  />
              </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">任务/课程：</td>
            <td class="td1"><bean:write  property="CenterPlan/Task" /> </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">课&nbsp;&nbsp;&nbsp;&nbsp;室：</td>
            <td class="td1"><bean:write  property="CenterPlan/ClassRoom"  />
             
			</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">地&nbsp;&nbsp;&nbsp;&nbsp;点：</td>
            <td class="td1"><bean:write  property="CenterPlan/Place"    /></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">单位/班别：</td>
            <td class="td1"><bean:write  property="CenterPlan/Class"    /></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">负 责 人：</td>
            <td class="td1"><bean:write  property="CenterPlan/DirectorName"/></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">协 助 人：</td>
            <td class="td1"><bean:write  property="CenterPlan/AssistantName"/></td>
          </tr>
                    <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">加班时长：</td>
            <td class="td1"><bean:write  property="CenterPlan/LongOvertime" />小时</td>
          </tr>

                    <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">出租金额：</td>
            <td class="td1"><bean:write  property="CenterPlan/Rent"  language="zh" country="CN"/>元 </td>
          </tr>
                    <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">联 系 人：</td>
            <td class="td1"><bean:write  property="CenterPlan/Linker"   /></td>
          </tr>
                              <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">电&nbsp;&nbsp;&nbsp;&nbsp;话：</td>
            <td class="td1"><bean:write  property="CenterPlan/LinkTel"    /></td>
          </tr>
                                        <tr  onClick="changeTRBgColor(this)">
                      <td align="right" class="td2">使用设备：</td>
              <td class="td1">    <dict:write property="CenterPlan/Equipments"  businTypeId="dx_equipment"/></td> </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">备&nbsp;&nbsp;&nbsp;&nbsp;注：</td>
            <td class="td1"><bean:write   property="CenterPlan/Remarks"  /></td>

          </tr>
        </table>
      
      
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><td align="center"><input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">	
                 <input name="Submit2" type="button" class="button_02" value="返 回" onClick="javascript:history.go(-1)"></td>
            </tr>
        </table></td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>
  </form>
  <form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>
