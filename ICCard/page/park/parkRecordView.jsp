<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">一卡通—&gt;停车管理—&gt;停车记录查看</td>
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
          
          <tr >
            <td width="15%" align="right" class="td2">持卡人：</td>
            <td width="35%" class="td1">&nbsp;
            <bean:write property="QueryParkRecord/operatorName"/>		</td>
            <td width="15%" colspan="-1" align="right" class="td2">卡编号：</td>
            <td width="35%" class="td1">&nbsp;<bean:write property="QueryParkRecord/CardID"/>	</td>
          </tr>
          
          <tr  >
            <td align="right" class="td2">卡类型：</td>
            <td class="td1">&nbsp;
            <%
            int CardType= talent.core.TalentFunctions.getInt(base.util.TalentContext.getValue(pageContext,null,"QueryParkRecord/CardType"));
			if(CardType == 0 ) out.print("无效卡");
	        if(CardType == 1 ) out.print("学员卡");
	        if(CardType == 2 ) out.print("教师卡");
	        if(CardType == 3 ) out.print("学校办公用车");
	        if(CardType == 4 ) out.print("月保卡");
	        if(CardType == 5 ) out.print("临时卡");
	       	if(CardType == 6 ) out.print("绿卡");			
             %>
                                  </td>
            <td colspan="-1" align="right" class="td2">车牌号：</td>
            <td class="td1">&nbsp; <bean:write property="QueryParkRecord/CarNO"/> </td>
          </tr>
          <tr  >
            <td align="right" class="td2">进入时间：</td>
            <td class="td1">&nbsp;<bean:write property="QueryParkRecord/ComeTime"/>                      </td>
            <td colspan="-1" align="right" class="td2">离开时间：</td>
            <td class="td1">&nbsp;<bean:write property="QueryParkRecord/LeaveTime"/></td>
          </tr>
          <tr  >
            <td align="right" class="td2">总停车时间：</td>
            <td colspan="3" class="td1">&nbsp;
            <bean:write property="QueryParkRecord/CountTime"/></td>
          </tr>
          <tr  >
            <td align="right" class="td2">费率：</td>
            <td class="td1">&nbsp;
            <bean:write property="QueryParkRecord/ParkRate"/>            </td>
            <td colspan="-1" align="right" class="td2">收费方式：</td>
            <td class="td1">
			&nbsp; <%
            int PayStyle= talent.core.TalentFunctions.getInt(base.util.TalentContext.getValue(pageContext,null,"QueryParkRecord/PayStyle"));
			
	        if(PayStyle == 1 ) out.print("刷卡收费");
	        if(PayStyle == 2 ) out.print("现金收费");
	      
             %>
			
			</td>
          </tr>
          <tr  >
            <td align="right" class="td2">应收金额：</td>
            <td class="td1">&nbsp;
            <bean:write property="QueryParkRecord/ShouldMoney"/>            </td>
            <td colspan="-1" align="right" class="td2">实收金额：</td>
            <td class="td1">&nbsp;<bean:write property="QueryParkRecord/ArtualMoney"/> </td>
          </tr>
          <tr  >
            <td align="right" class="td2">是否补刷：</td>
            <td colspan="3" class="td1">
			&nbsp; <%
            int IsChkRead= talent.core.TalentFunctions.getInt(base.util.TalentContext.getValue(pageContext,null,"QueryParkRecord/IsChkRead"));
			
	        if(IsChkRead == 1 ) out.print("是");
	        if(IsChkRead == 0 ) out.print("否");
	      
             %>
			</td>
          </tr>
          <tr  >
            <td align="right" class="td2">补刷卡号：</td>
            <td class="td1">&nbsp;
            <bean:write property="QueryParkRecord/ChkReadCardID"/>            </td>
            <td colspan="-1" align="right" class="td2">补刷卡类型：</td>
            <td class="td1">&nbsp;
			<%
            int ChkReadType= talent.core.TalentFunctions.getInt(base.util.TalentContext.getValue(pageContext,null,"QueryParkRecord/ChkReadType"));
			
	        if(ChkReadType == 1 ) out.print("学员补刷");
	        if(ChkReadType == 2 ) out.print("教工补刷");
	      
             %>
			
			</td>
          </tr>
          <tr  >
            <td align="right" class="td2">备注：</td>
            <td class="td1" colspan="3" >&nbsp;<bean:write property="QueryParkRecord/Remark"/></td>
           
          </tr>
          <tr  >
            <td colspan="2" align="center" class="td2">进入抓拍图片</td>
            <td colspan="2" align="center" class="td2">离开抓拍图片</td>
          </tr>
          <tr  >
            <td colspan="2" align="center" class="td1"><img src='/common/page/viewimgdb/viewFromDB.jsp?table=ParkReadCardRecord&pkn=RecordID&field=ComeCarPic&pkv=<bean:write property="QueryParkRecord/RecordID"/>' width="80" height="100"></td>
            <td colspan="2" align="center" class="td1"><img src='/common/page/viewimgdb/viewFromDB.jsp?table=ParkReadCardRecord&pkn=RecordID&field=LeaveCarPic&pkv=<bean:write property="QueryParkRecord/RecordID"/>' width="80" height="100"></td>
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
 