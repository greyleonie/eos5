<%@include file="/internet/common.jsp"%>
<%@page import="java.math.BigDecimal;"%>
<%
	int count=0;
	int normal=0;
	int delay=0;
	int truancy=0;
	int pholiday=0;
	int leave=0;
	int maxCount=0;
	double precent = 0;
	int maxCourse=0;
%>
<body>
<form method="post" action="studentmanage.prReport.kaoqinTotal.do">
   <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;���ڹ���&gt;����ͳ��
            </td></tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		
	  </td>
    </tr>
  </table>
  
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
   
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="studentmanage.prReport.kaoqinTotal.do">
		<input type="hidden" name="viewaction" value="studentmanage.prKaoqin.kaoqingView.do">
		
		<html:hidden property="QueryKaoqinTotal/_order/col1/field"/>
		<html:hidden property="QueryKaoqinTotal/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		
		<input type="hidden" name="QueryKaoqinTotal/Status" value="1">
		 </td>
    </tr>
  </table>


<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
            <td class="text">�� ����<html:select property="QueryKaoqinTotal/ClassID/criteria/value" attributesText='id="printTable"'  onchange="talentquery()"> 
              <html:option value="-1">--��ѡ��༶--</html:option> <html:options property="list[@type='studentclass']/Class/ClassID" labelProperty="list[@type='studentclass']/Class/ClassName"/> 
              </html:select> 
			  &nbsp;ʱ�䣺�� <html:text property="QueryKaoqinTotal/checkTime/criteria/min" attributesText='class="input" size="15"' />
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["QueryKaoqinTotal/checkTime/criteria/min"],"yyyy-MM-dd")>
	    	�� <html:text property="QueryKaoqinTotal/checkTime/criteria/max" attributesText='class="input" size="15"' />
           <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["QueryKaoqinTotal/checkTime/criteria/max"],"yyyy-MM-dd")>
			  			  </td>
      </tr>
      <tr>
        <td class="text">�� ����<html:text  property="QueryKaoqinTotal/operatorname/criteria/value" styleClass="input" size="15"/>
        &nbsp;
        <input name="query" type="button" class="button_02" value="�� ѯ" onClick="toquery()">
			  <input name="view" type="button" class="button_02" value="�� ��" onClick="talentview()">
              <input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
              <input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">
        
        
        </td>
      </tr>
	 <logic:present property="list[@type='QueryKaoqinTotal']/QueryKaoqinTotal/StudentID">
       
      <tr>
        <td height="25px" id="Statistics" class="td1" valign="middle"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
        
		<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="5%" align="center" nowrap >    
                  <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked="">                    </td>
                  <td width="10%" align="center" nowrap  onClick="talentsort()">����</td>
                  <td width="30%" align="center" nowrap onClick="talentsort()">��λ</td>
                  <td width="10%" align="center" nowrap onClick="talentsort()">����</td>
                  <td width="10%" align="center" nowrap  onClick="talentsort()">�ٵ��ۼ�</td>
                  <td width="10%" align="center" nowrap  onClick="talentsort()">ȱ���ۼ�</td>
                  <td width="10%" align="center" nowrap onClick="talentsort()">�����ۼ�</td>
                  <td width="10%" align="center" nowrap  onClick="talentsort()">�¼�/�����ۼ�</td>
                  <td width="10%" align="center" nowrap  onClick="talentsort()">��ע</td>
                </tr>
				<%
		            String trClass = "result_content";
		  		%>
				<logic:iterate id="resultset" property="list[@type='QueryKaoqinTotal']">
					<%
				        String count0 = base.util.TalentContext.getValue(pageContext,"resultset","QueryKaoqinTotal/Count0");
				        if(count0.equals(""))
				        	count0="0";
				        int c0Tmp=Integer.valueOf(count0).intValue();
				        if(c0Tmp>maxCourse)
				        	maxCourse=c0Tmp;
				        String count1 = base.util.TalentContext.getValue(pageContext,"resultset","QueryKaoqinTotal/Count1");
				        String count2 = base.util.TalentContext.getValue(pageContext,"resultset","QueryKaoqinTotal/Count2");
				        String count3 = base.util.TalentContext.getValue(pageContext,"resultset","QueryKaoqinTotal/Count3");
				        String count4 = base.util.TalentContext.getValue(pageContext,"resultset","QueryKaoqinTotal/Count4");
				       if (count0 != null && !"".equals(count0)) { 
				             normal += Integer.parseInt(count0);
				           if (Integer.parseInt(count0) > maxCount) maxCount = Integer.parseInt(count0);
				        }
				       if (count1 != null && !"".equals(count1)) delay += Integer.parseInt(count1);
				       if (count2 != null && !"".equals(count2)) truancy += Integer.parseInt(count2);
				       if (count3 != null && !"".equals(count3)) pholiday += Integer.parseInt(count3);
				       if (count4 != null && !"".equals(count4)) leave += Integer.parseInt(count4);
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
                <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="QueryKaoqinTotal/StudentID"/>','true')"> 
                 <td align="center" >
                 <html:checkbox id="resultset" name="list[@name='update']/QueryKaoqinTotal/StudentID" property="QueryKaoqinTotal/StudentID" indexed="true"/></td>
                  <td nowrap align="center"><bean:write id="resultset" property="QueryKaoqinTotal/operatorname" /></td>
                  <td nowrap >&nbsp;<bean:write id="resultset" property="QueryKaoqinTotal/WorkingOrgan" /></td>
                  <td nowrap align="center"><bean:write id="resultset" property="QueryKaoqinTotal/Count0" /></td>
                  <td nowrap align="center"><bean:write id="resultset" property="QueryKaoqinTotal/Count1" /></td>
                  <td nowrap align="center"><bean:write id="resultset" property="QueryKaoqinTotal/Count2" /></td>
                  <td nowrap align="center"><bean:write id="resultset" property="QueryKaoqinTotal/Count3" /></td>
                  <td nowrap align="center"><bean:write id="resultset" property="QueryKaoqinTotal/Count4" /></td>
                  <td nowrap align="center">&nbsp;</td>
                  </tr>
				</logic:iterate>
				<tr class="<%=trClass%>" style="display: none;">
        			<td id="Statistics1" class="td1" align="left" valign="middle" colspan="9"></td>
      			</tr>
				<tr style="display: none;" >
        			<td class="td1" align="left" valign="middle" colspan="9">ע��1���ۼƵ�λÿ��Ϊ���ѧϰ�ա�</td>
      			</tr>
              </table></td>
      </tr>

        </logic:present>
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
<%
if (count != 0) {
BigDecimal b1 = new BigDecimal((maxCount * count-truancy-pholiday-leave) * 100);
BigDecimal b2 = new BigDecimal(maxCount * count);
precent = b1.divide(b2,2,BigDecimal.ROUND_HALF_UP).doubleValue();
}
%>
<script>
 document.all.Statistics.innerHTML = "ȫ�������� ��<%=count%>�ˣ��ܳ����� ��<%=normal%>�Σ�<font color='gray'>�ܳٵ���</font> ��<%=delay%>�Σ�<font color='red'>��ȱ����</font> ��<%=truancy%>�Σ�<font color='blue'>�ܹ�����</font> ��<%=pholiday%>�Σ�<font color='green'>���¼�/������</font> ��<%=leave%>�Σ�������Ϊ<%=precent%>%��"; 
 document.all.Statistics1.innerHTML = "ȫ�������� ��<%=count%>�ˣ�ѧԱȫ�ڳ��ڴ���Ϊ<%=maxCourse%>���ܳ����� ��<%=normal%>�Σ�������Ϊ<%=precent%>%��<font color='gray'>�ܳٵ���</font> ��<%=delay%>�Σ�<font color='red'>��ȱ����</font> ��<%=truancy%>�Σ�<font color='blue'>�ܹ�����</font> ��<%=pholiday%>�Σ�<font color='green'>���¼�/������</font> ��<%=leave%>�Ρ�"; 
 function toquery(){
 	var frm =document.forms[0];
 	/*
 	if(frm.elements["QueryKaoqinTotal/ClassID/criteria/value"].value==-1){
 		alert("��ѡ��༶");
 		return;
 	}
 	*/
 	frm.elements["QueryKaoqinTotal/Status"].value = 0;
 	frm.action = frm.elements["queryaction"].value;
 	frm.submit();
 }
</script>