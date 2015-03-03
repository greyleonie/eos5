<%@include file="/internet/common.jsp"%>
<form method="post"  action="ICCard.prField.classRoomBookQuery.do" target="_self">
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length"/>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">首页 -&gt; 场地管理 -&gt; 课室出租 -&gt; 预定查询</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5"></td>
    </tr>
  </table>
  <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>

            <td height="30" class="text">
             <a title="关键字可以是 使用单位，用途，预定受理人，结帐受理人，联系人"> 关键字：</a><html:text property="fcc/search" attributesText='class="input" size="30"' maxlength="50"/>

                 <br/>
                 
                <input name="query" type="button" class="button_02" value="查 询" onClick="talentquery()">  
				<input name="ieprint" type="button" class="button_02" value="打 印" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="导 出" onClick="exporttoexcel()">
				<input name="viewType" type="radio"  value="0"  checked="checked">课室预订记录
				<input name="viewType" type="radio"  value="1" onClick="changeViewType()">课室取消记录
				<input name="viewType" type="radio"  value="1" onClick="changeViewType()">课室结帐记录
			</td>
      </tr>
       <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">
	<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="3%" align="center" nowrap> 序号</td>
                  <td width="17%" align="center" nowrap id="ClassroomBusinessRec.UsingOrgan" onClick="talentsort()">使用单位</td>
                  <td width="5%" align="center" nowrap id="ClassroomBusinessRec.Purpose" onClick="talentsort()">用途</td>
                  <td width="10%" align="center" nowrap id="ClassroomBusinessRec.UsingDate" onClick="talentsort()">预租日期</td>
                  <td width="10%" align="center" nowrap id="ClassroomBusinessRec.LinkMan" onClick="talentsort()">联系人</td>
                  <td width="5%" align="center" nowrap id="ClassroomBusinessRec.LinkTel" onClick="talentsort()">联系电话</td>
                  <td width="10%" align="center" nowrap id="ClassroomBusinessRec.BookActionMan" onClick="talentsort()">预&nbsp;&nbsp;订<br/>受理人</td>
                  <td width="10%" align="center" nowrap id="ClassroomBusinessRec.SysBookTime" onClick="talentsort()">受理日期</td>
                  <td width="5%" align="center" nowrap id="ClassroomBusinessRec.CheckOutMan" onClick="talentsort()">结&nbsp;&nbsp;帐<br/>受理人</td>
                  <td width="10%" align="center" nowrap id="ClassroomBusinessRec.CheckOutDate" onClick="talentsort()">结帐日期</td>
                  <td width="5%" align="center" nowrap id="ClassroomBusinessRec.Worth" onClick="talentsort()">应付<br/>金额</td>
                  <td width="5%" align="center" nowrap id="ClassroomBusinessRec.RealWorth" onClick="talentsort()">实付<br/>金额</td>
                  <td width="5%" align="center" nowrap id="ClassroomBusinessRec.CutDownStd" onClick="talentsort()">折扣<br/>标准</td>
                  <td width="5%" align="center" nowrap id="ClassroomBusinessRec.AuthorizeMan" onClick="talentsort()">批准人</td>
                </tr>
				<%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
				<logic:iterate id="resultset" property="list[@type='ClassroomBusinessRec']">
					<%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
                <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" > 
                  <td align="center"><%=count %> </td>
                  <td  align="center" ><bean:write id="resultset" property="ClassroomBusinessRec/UsingOrgan" /></td>
                  <td  align="center" ><bean:write id="resultset" property="ClassroomBusinessRec/Purpose" /></td>
                  <td  align="center" ><bean:write id="resultset" property="ClassroomBusinessRec/UsingDate" formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" /></td>
                  <td  align="center" ><bean:write id="resultset" property="ClassroomBusinessRec/LinkMan" /></td>
                  <td  align="center" ><bean:write id="resultset" property="ClassroomBusinessRec/LinkTel" /></td>
                  <td  align="center" ><bean:write id="resultset" property="ClassroomBusinessRec/BookActionMan" /></td>
                  <td  align="center" ><bean:write id="resultset" property="ClassroomBusinessRec/SysBookTime" formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/></td>
                  <td  align="center" ><bean:write id="resultset" property="ClassroomBusinessRec/CheckOutMan" /></td>
                  <td  align="center" ><bean:write id="resultset" property="ClassroomBusinessRec/CheckOutDate" formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/></td>
                  <td  align="center" ><bean:write id="resultset" property="ClassroomBusinessRec/Worth" language="zh" country="CN" /></td>
                  <td  align="center" ><bean:write id="resultset" property="ClassroomBusinessRec/RealWorth" language="zh" country="CN"/></td>
                  <td  align="center" ><bean:write id="resultset" property="ClassroomBusinessRec/CutDownStd"  formatType="#.##%" formatClass="com.primeton.eos.webtag.bean.BeanWriteNumberFormatImpl"/></td>
                  <td  align="center" ><bean:write id="resultset" property="ClassroomBusinessRec/AuthorizeMan" /></td>
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
  </table>
  </form>

  <script>
	loadOrderImg(document.forms[0],'UsingClassroomRec');
</script>