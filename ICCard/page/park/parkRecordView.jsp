<%@include file="/internet/common.jsp"%>
<form method="post" enctype="multipart/form-data" action="">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">һ��ͨ��&gt;ͣ������&gt;ͣ����¼�鿴</td>
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
            <td width="15%" align="right" class="td2">�ֿ��ˣ�</td>
            <td width="35%" class="td1">&nbsp;
            <bean:write property="QueryParkRecord/operatorName"/>		</td>
            <td width="15%" colspan="-1" align="right" class="td2">����ţ�</td>
            <td width="35%" class="td1">&nbsp;<bean:write property="QueryParkRecord/CardID"/>	</td>
          </tr>
          
          <tr  >
            <td align="right" class="td2">�����ͣ�</td>
            <td class="td1">&nbsp;
            <%
            int CardType= talent.core.TalentFunctions.getInt(base.util.TalentContext.getValue(pageContext,null,"QueryParkRecord/CardType"));
			if(CardType == 0 ) out.print("��Ч��");
	        if(CardType == 1 ) out.print("ѧԱ��");
	        if(CardType == 2 ) out.print("��ʦ��");
	        if(CardType == 3 ) out.print("ѧУ�칫�ó�");
	        if(CardType == 4 ) out.print("�±���");
	        if(CardType == 5 ) out.print("��ʱ��");
	       	if(CardType == 6 ) out.print("�̿�");			
             %>
                                  </td>
            <td colspan="-1" align="right" class="td2">���ƺţ�</td>
            <td class="td1">&nbsp; <bean:write property="QueryParkRecord/CarNO"/> </td>
          </tr>
          <tr  >
            <td align="right" class="td2">����ʱ�䣺</td>
            <td class="td1">&nbsp;<bean:write property="QueryParkRecord/ComeTime"/>                      </td>
            <td colspan="-1" align="right" class="td2">�뿪ʱ�䣺</td>
            <td class="td1">&nbsp;<bean:write property="QueryParkRecord/LeaveTime"/></td>
          </tr>
          <tr  >
            <td align="right" class="td2">��ͣ��ʱ�䣺</td>
            <td colspan="3" class="td1">&nbsp;
            <bean:write property="QueryParkRecord/CountTime"/></td>
          </tr>
          <tr  >
            <td align="right" class="td2">���ʣ�</td>
            <td class="td1">&nbsp;
            <bean:write property="QueryParkRecord/ParkRate"/>            </td>
            <td colspan="-1" align="right" class="td2">�շѷ�ʽ��</td>
            <td class="td1">
			&nbsp; <%
            int PayStyle= talent.core.TalentFunctions.getInt(base.util.TalentContext.getValue(pageContext,null,"QueryParkRecord/PayStyle"));
			
	        if(PayStyle == 1 ) out.print("ˢ���շ�");
	        if(PayStyle == 2 ) out.print("�ֽ��շ�");
	      
             %>
			
			</td>
          </tr>
          <tr  >
            <td align="right" class="td2">Ӧ�ս�</td>
            <td class="td1">&nbsp;
            <bean:write property="QueryParkRecord/ShouldMoney"/>            </td>
            <td colspan="-1" align="right" class="td2">ʵ�ս�</td>
            <td class="td1">&nbsp;<bean:write property="QueryParkRecord/ArtualMoney"/> </td>
          </tr>
          <tr  >
            <td align="right" class="td2">�Ƿ�ˢ��</td>
            <td colspan="3" class="td1">
			&nbsp; <%
            int IsChkRead= talent.core.TalentFunctions.getInt(base.util.TalentContext.getValue(pageContext,null,"QueryParkRecord/IsChkRead"));
			
	        if(IsChkRead == 1 ) out.print("��");
	        if(IsChkRead == 0 ) out.print("��");
	      
             %>
			</td>
          </tr>
          <tr  >
            <td align="right" class="td2">��ˢ���ţ�</td>
            <td class="td1">&nbsp;
            <bean:write property="QueryParkRecord/ChkReadCardID"/>            </td>
            <td colspan="-1" align="right" class="td2">��ˢ�����ͣ�</td>
            <td class="td1">&nbsp;
			<%
            int ChkReadType= talent.core.TalentFunctions.getInt(base.util.TalentContext.getValue(pageContext,null,"QueryParkRecord/ChkReadType"));
			
	        if(ChkReadType == 1 ) out.print("ѧԱ��ˢ");
	        if(ChkReadType == 2 ) out.print("�̹���ˢ");
	      
             %>
			
			</td>
          </tr>
          <tr  >
            <td align="right" class="td2">��ע��</td>
            <td class="td1" colspan="3" >&nbsp;<bean:write property="QueryParkRecord/Remark"/></td>
           
          </tr>
          <tr  >
            <td colspan="2" align="center" class="td2">����ץ��ͼƬ</td>
            <td colspan="2" align="center" class="td2">�뿪ץ��ͼƬ</td>
          </tr>
          <tr  >
            <td colspan="2" align="center" class="td1"><img src='/common/page/viewimgdb/viewFromDB.jsp?table=ParkReadCardRecord&pkn=RecordID&field=ComeCarPic&pkv=<bean:write property="QueryParkRecord/RecordID"/>' width="80" height="100"></td>
            <td colspan="2" align="center" class="td1"><img src='/common/page/viewimgdb/viewFromDB.jsp?table=ParkReadCardRecord&pkn=RecordID&field=LeaveCarPic&pkv=<bean:write property="QueryParkRecord/RecordID"/>' width="80" height="100"></td>
          </tr>
          
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
                <input name="Submit2" type="button" class="button_02" value="�� ��" onClick="javascript:history.go(-1)">
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
 