<%@include file="/internet/common.jsp"%>
<body>
<form>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
 			<td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;�ʲ�����&gt;<span id="printTable">�ʲ���</span>�鿴</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<html:hidden property="CAPT_CAPITALINFO/_order/col1/field"/>
		<html:hidden property="CAPT_CAPITALINFO/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count" value="-1"/>
		<html:hidden property="PageCond/length" />
	  </td>
    </tr>
  </table>
  
  <table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0" class="table" >
      <tr>
      <td height="8"></td>
      </tr>
      
        <tr>
          <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC"  id="listdetail">
<!-- �ʲ���*******************************************-->
          <logic:iterate property="list[@name='update']" id="ResultSet">
          <tr ><td colspan="4" height="30" class="td1">  &nbsp;&nbsp;</td></tr>
               <tr>
                  <td align="right" class="td2">�ʲ���ţ�</td>
                  <td colspan="3" height="80" valign="bottom" class="td1">
                  <%
                  String code = base.util.TalentContext.getValue(pageContext,"ResultSet","CAPT_CAPITALINFO/CAPTCODE");
                  String imgPath = "";
                  if (code != null && !"".equals(code)) {
					 imgPath = common.assets.Barcode.getImgPath(code,request,180,100);
	        	  %>
                  <img src="<%=imgPath%>">
                  <%}%>
                  </td>
                </tr>
                <tr> 
                  <td align="right"  class="td2">�ʲ����룺</td>
                  <td colspan="3" class="td1"><bean:write id="ResultSet" property="CAPT_CAPITALINFO/BARCODE"/></td>
                </tr>
                <tr>
                  <td width="16%" align="right"  class="td2">�ʲ����ƣ�</td>
                  <td colspan="3" class="td1"><bean:write id="ResultSet" property="CAPT_CAPITALINFO/CAPTNAME"/></td>
                </tr>
                <tr>
                  <td align="right"  class="td2">Ʒ&nbsp;&nbsp;&nbsp; �ƣ�</td>
                  <td width="45%" class="td1"><bean:write id="ResultSet" property="CAPT_CAPITALINFO/BRANDNAME"/></td>
                  <td width="14%" align="right"  class="td2">����ͺţ�</td>
                  <td width="28%" class="td1"><bean:write id="ResultSet" property="CAPT_CAPITALINFO/SEPCIFICATION"/></td>
                </tr>
                <tr> 
                  <td align="right"  class="td2">������ڣ�</td>
                  <td class="td1"><bean:write id="ResultSet" property="CAPT_CAPITALINFO/HQDATE" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>                          
               </td>
                  <td align="right"  class="td2">����۸�</td>
                  <td width="20%" class="td1"><bean:write id="ResultSet" property="CAPT_CAPITALINFO/PURCHPRICE"/>
                 </td>
                </tr>
                <tr> 
                  <td align="right"  class="td2">�� Ӧ �̣�</td>
                  <td colspan="3" class="td1">
                  <bean:write id="ResultSet" property="CAPT_CAPITALINFO/PROVNAME"/>
                  </td>
                </tr>
                <tr>
                  <td align="right"  class="td2">�ۺ�����̣�</td>
                  <td colspan="3" class="td1"> 
                  <bean:write id="ResultSet" property="CAPT_CAPITALINFO/VINDNAME"/> 
                  </td>
                </tr>
                <tr>
                  <td align="right"  class="td2">��&nbsp;&nbsp;&nbsp; ע��</td>
                  <td colspan="3" height="80" class="td1">

                  </td>
                </tr>

              </logic:iterate>
     
</table>
   <table width="98%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">
               <input name="Button" type="button" class="button_02" value="�� ��" onClick="javascript:history.go(-1)">
               </td>
            </tr>
 </table>
 
 		</td>
 	</tr>
 </table>
 
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title" value="�ʲ���">
<input type="hidden" name="xmlfcc">
</form>