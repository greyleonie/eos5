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
            <td class="text_wirte">��ҳ -&gt; ���ع��� -&gt; ���ҳ��� -&gt; Ԥ����ѯ</td>
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
             <a title="�ؼ��ֿ����� ʹ�õ�λ����;��Ԥ�������ˣ����������ˣ���ϵ��"> �ؼ��֣�</a><html:text property="fcc/search" attributesText='class="input" size="30"' maxlength="50"/>

                 <br/>
                 
                <input name="query" type="button" class="button_02" value="�� ѯ" onClick="talentquery()">  
				<input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">
				<input name="viewType" type="radio"  value="0"  checked="checked">����Ԥ����¼
				<input name="viewType" type="radio"  value="1" onClick="changeViewType()">����ȡ����¼
				<input name="viewType" type="radio"  value="1" onClick="changeViewType()">���ҽ��ʼ�¼
			</td>
      </tr>
       <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text">
	<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="3%" align="center" nowrap> ���</td>
                  <td width="17%" align="center" nowrap id="ClassroomBusinessRec.UsingOrgan" onClick="talentsort()">ʹ�õ�λ</td>
                  <td width="5%" align="center" nowrap id="ClassroomBusinessRec.Purpose" onClick="talentsort()">��;</td>
                  <td width="10%" align="center" nowrap id="ClassroomBusinessRec.UsingDate" onClick="talentsort()">Ԥ������</td>
                  <td width="10%" align="center" nowrap id="ClassroomBusinessRec.LinkMan" onClick="talentsort()">��ϵ��</td>
                  <td width="5%" align="center" nowrap id="ClassroomBusinessRec.LinkTel" onClick="talentsort()">��ϵ�绰</td>
                  <td width="10%" align="center" nowrap id="ClassroomBusinessRec.BookActionMan" onClick="talentsort()">Ԥ&nbsp;&nbsp;��<br/>������</td>
                  <td width="10%" align="center" nowrap id="ClassroomBusinessRec.SysBookTime" onClick="talentsort()">��������</td>
                  <td width="5%" align="center" nowrap id="ClassroomBusinessRec.CheckOutMan" onClick="talentsort()">��&nbsp;&nbsp;��<br/>������</td>
                  <td width="10%" align="center" nowrap id="ClassroomBusinessRec.CheckOutDate" onClick="talentsort()">��������</td>
                  <td width="5%" align="center" nowrap id="ClassroomBusinessRec.Worth" onClick="talentsort()">Ӧ��<br/>���</td>
                  <td width="5%" align="center" nowrap id="ClassroomBusinessRec.RealWorth" onClick="talentsort()">ʵ��<br/>���</td>
                  <td width="5%" align="center" nowrap id="ClassroomBusinessRec.CutDownStd" onClick="talentsort()">�ۿ�<br/>��׼</td>
                  <td width="5%" align="center" nowrap id="ClassroomBusinessRec.AuthorizeMan" onClick="talentsort()">��׼��</td>
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