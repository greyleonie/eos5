<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="teachWorkManage.prNetCenter.videoRegList.do" name="opeForm">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;�������Ľ�ѧ����&gt;<span id="printTable">¼�����ϣ��ѵǼǣ�</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="teachWorkManage.prNetCenter.videoRegList.do">
		<input type="hidden" name="modifyaction" value="teachWorkManage.prNetCenter.videoRegModify.do">
		<input type="hidden" name="deleteaction" value="teachWorkManage.prNetCenter.videoRegDelete.do">
		<html:hidden property="VideoRegister/_order/col1/field"/>
		<html:hidden property="VideoRegister/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
	  </td>
    </tr>
  </table>


<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
	  <tr>
            <td height="30" class="text">
				���
            <html:select property="VideoRegister/DataType/criteria/value">
							<html:option value="">--��ѡ��--</html:option>
							<html:option value="¼���">¼���</html:option>
							<html:option value="DV��">DV��</html:option>
							<html:option value="��Ƶ�ļ�">��Ƶ�ļ�</html:option>
							<html:option value="DVD">DVD</html:option>
							<html:option value="VCD">VCD</html:option>
							<html:option value="VCD">VCD</html:option>
			</html:select>
			<html:hidden property="VideoRegister/DataType/criteria/operator" value="="/>
			��Դ��
            <html:select property="VideoRegister/Source/criteria/value">
							<html:option value="">--��ѡ��--</html:option>
							<html:option value="��¼">��¼</html:option>
							<html:option value="���뵳У">���뵳У</html:option>
							<html:option value="ʡ��У">ʡ��У</html:option>
							<html:option value="����">����</html:option>
			</html:select>
            ���ڣ� ��
            	<html:text property="VideoRegister/RecordTime/criteria/min" attributesText='class="input" size="10"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["VideoRegister/RecordTime/criteria/min"],"yyyy-MM-dd")> 
           		��
           		<html:text property="VideoRegister/RecordTime/criteria/max" attributesText='class="input" size="10"' readonly="true"/>
          	    <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["VideoRegister/RecordTime/criteria/max"],"yyyy-MM-dd")>
			    <input type="hidden" name="VideoRegister/RecordTime/criteria/operator" value="between"/>
			    <input type="hidden" name="VideoRegister/RecordTime/criteria/criteriaPattern" value="yyyy-MM-dd"/><br>
			 �ؼ��֣���Ŀ�������ˣ���<html:text property="VideoRegister/seachText" attributesText='class="input" size="20"' />
			 <br/>
			 
                <input name="query" type="button" class="button_02" value="�� ѯ" onClick="talentquery()">  
                <input name="modify" type="button" class="button_02" value="�� ��" onClick="talentmodify()">
				<input name="delete" type="button" class="button_02" value="ɾ ��" onClick="talentdelete()">
				<input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">			
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="5%" align="center"  nowrap >ѡ�� </td>
                  <td width="10%" align="center"  nowrap id="VideoRegister.RecordTime" onClick="talentsort()">��¼ʱ��</td>
                  <td width="20%" align="center"  nowrap id="VideoRegister.Title" onClick="talentsort()">��Ŀ</td>
                  <td width="10%" align="center"  nowrap id="VideoRegister.Speaker" onClick="talentsort()">������</td>
                  <td width="10%" align="center"  nowrap id="VideoRegister.Org" onClick="talentsort()">��λ</td>
                  <td width="10%"  align="center"  nowrap id="VideoRegister.Post" onClick="talentsort()">ְ��</td>
                  <td width="5%"  align="center"  nowrap id="VideoRegister.DocumentNO" onClick="talentsort()">������</td>
                  <td width="5%"  align="center"  nowrap id="VideoRegister.Length" onClick="talentsort()">����</td>
                  <td width="5%"  align="center"  nowrap id="VideoRegister.Recorder" onClick="talentsort()">��¼��</td>
                  <td width="5%"  align="center"  nowrap id="VideoRegister.DataType" onClick="talentsort()">��������</td>
                  <td width="5%"  align="center"  nowrap id="VideoRegister.Source" onClick="talentsort()">������Դ</td>
				  <td width="10%"  align="center"  nowrap id="VideoRegister.Remarks" onClick="talentsort()">��ע</td>
                </tr>
				<%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
				<logic:iterate id="resultset" property="list[@type='VideoRegister']">
					<%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
                <tr class="<%=trClass%>" onClick="changeTRBgColor(this)"> 
                  
                  <td align="center"><logic:present  id="resultset" property="VideoRegister/RegisterID">
			       <html:checkbox id="resultset" name="list[@name='update']/VideoRegister/RegisterID" property="VideoRegister/RegisterID" indexed="true"/>
			       </logic:present></td>
				  <td   align="center"  ><bean:write id="resultset" property="VideoRegister/RecordTime" formatType="yyyy-MM-dd"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" /></td>
				  <td   align="center"  ><bean:write id="resultset" property="VideoRegister/Title"  /></td>
                  <td   align="center"  ><bean:write id="resultset" property="VideoRegister/Speaker" /></td>
                  <td   align="center"  ><bean:write id="resultset" property="VideoRegister/Org" /></td>
                  <td   align="center"  ><bean:write id="resultset" property="VideoRegister/Post" /></td>    
                  <td   align="center"  ><bean:write id="resultset" property="VideoRegister/DocumentNO" /></td>
                  <td   align="center"  ><bean:write id="resultset" property="VideoRegister/Length" /></td>
                  <td   align="center"  ><bean:write id="resultset" property="VideoRegister/Recorder" /></td>
                  <td   align="center"  ><bean:write id="resultset" property="VideoRegister/DataType" /></td>
                  <td   align="center"  ><bean:write id="resultset" property="VideoRegister/Source" /></td>
                  <td   align="center"  ><bean:write id="resultset" property="VideoRegister/Remarks" /></td>

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
    </table>    </td>
  </tr>
</table>
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title">
<input type="hidden" name="xmlfcc">
</form>
</body>
<script type="text/javascript">
<!--

//-->

</script>