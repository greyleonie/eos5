<%@include file="/internet/common.jsp"%>
<body>
<form method="post" >
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;�������Ľ�ѧ����&gt;<span id="printTable">���Ĺ����ƻ��鿴</span></td>
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
            <td width="12%" align="right" class="td2">��&nbsp;&nbsp;&nbsp;&nbsp;�ڣ�</td>
            <td width="88%" class="td1"><bean:write property="CenterPlan/PlanDate" formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/>
              <bean:write   property="CenterPlan/PlanTime" />

<logic:equal  property="CenterPlan/PlanNoon" value="1">
����</logic:equal>
<logic:equal   property="CenterPlan/PlanNoon" value="2">
����</logic:equal>
<logic:equal  property="CenterPlan/PlanNoon" value="3">
����</logic:equal>
</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">�������</td>
            <td class="td1">
                <dict:write businTypeId="dx_workType" property="CenterPlan/WorkType"  />
              </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">����/�γ̣�</td>
            <td class="td1"><bean:write  property="CenterPlan/Task" /> </td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">��&nbsp;&nbsp;&nbsp;&nbsp;�ң�</td>
            <td class="td1"><bean:write  property="CenterPlan/ClassRoom"  />
             
			</td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">��&nbsp;&nbsp;&nbsp;&nbsp;�㣺</td>
            <td class="td1"><bean:write  property="CenterPlan/Place"    /></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">��λ/���</td>
            <td class="td1"><bean:write  property="CenterPlan/Class"    /></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">�� �� �ˣ�</td>
            <td class="td1"><bean:write  property="CenterPlan/DirectorName"/></td>
          </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">Э �� �ˣ�</td>
            <td class="td1"><bean:write  property="CenterPlan/AssistantName"/></td>
          </tr>
                    <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">�Ӱ�ʱ����</td>
            <td class="td1"><bean:write  property="CenterPlan/LongOvertime" />Сʱ</td>
          </tr>

                    <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">�����</td>
            <td class="td1"><bean:write  property="CenterPlan/Rent"  language="zh" country="CN"/>Ԫ </td>
          </tr>
                    <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">�� ϵ �ˣ�</td>
            <td class="td1"><bean:write  property="CenterPlan/Linker"   /></td>
          </tr>
                              <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">��&nbsp;&nbsp;&nbsp;&nbsp;����</td>
            <td class="td1"><bean:write  property="CenterPlan/LinkTel"    /></td>
          </tr>
                                        <tr  onClick="changeTRBgColor(this)">
                      <td align="right" class="td2">ʹ���豸��</td>
              <td class="td1">    <dict:write property="CenterPlan/Equipments"  businTypeId="dx_equipment"/></td> </tr>
          <tr  onClick="changeTRBgColor(this)">
            <td align="right" class="td2">��&nbsp;&nbsp;&nbsp;&nbsp;ע��</td>
            <td class="td1"><bean:write   property="CenterPlan/Remarks"  /></td>

          </tr>
        </table>
      
      
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><td align="center"><input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">	
                 <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="javascript:history.go(-1)"></td>
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
