<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="studentmanage.prSearch.studentSearch.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">ѧԱ����&gt;ѧԱ���ϼ���</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="studentmanage.prSearch.studentSearch.do">
		<input type="hidden" name="viewaction" value="studentmanage.student_xj.xjXueji.do">
		<input type="hidden" name="toviewaction" value="studentmanage.student_xj.xjview.do">

		
		<html:hidden property="QueryStudentSearch/_order/col1/field"/>
		<html:hidden property="QueryStudentSearch/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		
		<!--INPUT value="like" type="hidden" name="QueryStudentSearch/operatorname/criteria/operator">
		<INPUT value="center" type="hidden" name="QueryStudentSearch/operatorname/criteria/likeRule"-->
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
            <td class="text">�ࡡ������ <html:select property="QueryStudentSearch/ClassID/criteria/value" attributesText='id="printTable"'> 
              <html:option value="-1">--��ѡ��༶--</html:option> <html:options property="list[@type='studentclass']/Class/ClassID" labelProperty="list[@type='studentclass']/Class/ClassName"/> 
              </html:select> 
			  &nbsp;
			    ������λ�� 
			    <html:text property="QueryStudentSearch/WorkingOrgan/criteria/value" attributesText='class="input"'/>
			   <input type="hidden" name="QueryStudentSearch/WorkingOrgan/criteria/operator" value="like">
			   <input type="hidden" name="QueryStudentSearch/WorkingOrgan/criteria/likeRule" value="center">
			   &nbsp; ְ�� 
			    <html:text property="QueryStudentSearch/Duty/criteria/value" attributesText='class="input"'/>
			 	<input type="hidden" name="QueryStudentSearch/Duty/criteria/operator" value="like">
			   <input type="hidden" name="QueryStudentSearch/Duty/criteria/likeRule" value="center">
			  
			 
			 </td>
      </tr>
	  <tr>
            <td height="30" class="text">
				
			    ѧԱ������ 
			    <html:text property="QueryStudentSearch/operatorname/criteria/value" attributesText='class="input"' size="10"/>
			   <input type="hidden" name="QueryStudentSearch/operatorname/criteria/operator" value="like">
			   <input type="hidden" name="QueryStudentSearch/operatorname/criteria/likeRule" value="center">
			   &nbsp; ѧ�ţ� 
			    <html:text property="QueryStudentSearch/StudentNO/criteria/value" attributesText='class="input"' size="10"/>
			     <input type="hidden" name="QueryStudentSearch/StudentNO/criteria/operator" value="like">
			   <input type="hidden" name="QueryStudentSearch/StudentNO/criteria/likeRule" value="center">
			   
			    &nbsp;
			    ί�е�λ�� 
			    <html:text property="QueryStudentSearch/Commission/criteria/value" attributesText='class="input"'/>
			   <input type="hidden" name="QueryStudentSearch/Commission/criteria/operator" value="like">
			   <input type="hidden" name="QueryStudentSearch/Commission/criteria/likeRule" value="center">
			   &nbsp; ʱ�䣺<html:text property="QueryStudentSearch/EndTime/criteria/value" attributesText='class="input" size="15"' readonly="true"/>
           		<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["QueryStudentSearch/EndTime/criteria/value"],"yyyy-MM-dd")>
	    		��
				<html:text property="QueryStudentSearch/BeginTime/criteria/value" attributesText='class="input" size="15"' readonly="true"/>
           		<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["QueryStudentSearch/BeginTime/criteria/value"],"yyyy-MM-dd")> 
			    <input type="hidden" name="QueryStudentSearch/EndTime/criteria/operator" value=">=">
			   <input type="hidden" name="QueryStudentSearch/EndTime/criteria/criteriaPattern" value="yyyy-MM-dd">
			  <input type="hidden" name="QueryStudentSearch/BeginTime/criteria/operator" value="<=">
			   <input type="hidden" name="QueryStudentSearch/BeginTime/criteria/criteriaPattern" value="yyyy-MM-dd">
			  
			</td>
      </tr>
      <tr>
        <td height="30" class="text">
        <input name="query" type="button" class="button_02" value="�� ѯ" onClick="talentquery()">
			    <input name="view" type="button" class="button_02" value="ѧ����" onClick="talentview()">
				<input name="xueji" type="button" class="button_02" value="ѧԱ����" onClick="totalentview()">
				<input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">
			���������<input type="checkbox" name="checkbox" onClick="servertoorder()" marked="">
         </td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="2%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked="">                  </td>
                  <td width="10%" align="center" nowrap id="QueryStudentSearch.StudentNO" onClick="talentsort()">ѧ��</td>
                  <td width="7%" align="center" nowrap id="QueryStudentSearch.operatorname" onClick="talentsort()">����</td>
                  <td width="5%" align="center" nowrap id="QueryStudentSearch.Sex" onClick="talentsort()">�Ա�</td>
                  <td width="15%" align="center" nowrap id="QueryStudentSearch.WorkingOrgan" onClick="talentsort()">������λ</td>
                  <td width="7%" align="center" nowrap id="QueryStudentSearch.Duty" onClick="talentsort()">ְ��</td>
                  <td width="24%" align="center" nowrap id="QueryStudentSearch.TeamID" onClick="talentsort()">���</td>
                  <td width="15%" align="center" nowrap id="QueryStudentSearch.TeamID" onClick="talentsort()">��У��Ժ��ѧϰʱ��</td>
                  <td width="7%" align="center" nowrap id="QueryStudentSearch.TeamID" onClick="talentsort()">�Ƿ��ҵ</td>
                  <td width="10%" align="center" nowrap id="QueryStudentSearch.TeamID" onClick="talentsort()">֤����</td>
                </tr>
				<%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
				<logic:iterate id="resultset" property="list[@type='QueryStudentSearch']">
					<%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
                 <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="QueryStudentSearch/StudentID"/>','true')"> 
                 <td align="center">
				  <logic:present  id="resultset" property="QueryStudentSearch/StudentID">
				  	<html:checkbox id="resultset" name="list[@name='update']/QueryStudentSearch/StudentID" property="QueryStudentSearch/StudentID" indexed="true"/>
				  </logic:present>				  </td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudentSearch/StudentNO"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudentSearch/operatorname"/></td>
                  <td nowrap>&nbsp;<dict:write businTypeId="BNDICT_gender" property="QueryStudentSearch/Sex" id="resultset"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudentSearch/WorkingOrgan" maxLength="16"/></td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudentSearch/Duty" maxLength="16"/></td>
                  <td >&nbsp;<bean:write id="resultset" property="QueryStudentSearch/ClassName" /></td>
                  <td nowrap>&nbsp;
                  <logic:present id="resultset" property="QueryStudentSearch/BeginTime">
                  <bean:write id="resultset" property="QueryStudentSearch/BeginTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy.MM.dd"/>
                  -
                  <bean:write id="resultset" property="QueryStudentSearch/EndTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy.MM.dd"/>
                  </logic:present>
                  </td>
                  <td nowrap>&nbsp;
                  <%
                  String IsQuit= base.util.TalentContext.getValue(pageContext,"resultset","QueryStudentSearch/IsQuit");
                   
                   if(IsQuit!=null&&IsQuit.equals("1"))
                   		out.println("��ѧ");
            		else{
            			String ClassName= base.util.TalentContext.getValue(pageContext,"resultset","QueryStudentSearch/ClassName");
            			String isHistoryClass= base.util.TalentContext.getValue(pageContext,"resultset","QueryStudentSearch/isHistoryClass");
            			if(ClassName==null)
            				out.println("����");
            			else{
            				if(isHistoryClass!=null&&isHistoryClass.equals("1"))
                   				out.println("�ѱ�ҵ");
                   			else
                   				out.println("δ��ҵ");
                   		}
            		}
                   
                   %>
                  
                  </td>
                  <td nowrap>&nbsp;<bean:write id="resultset" property="QueryStudentSearch/DiplomaNO"/></td>
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
<script>

function totalentview(){
    	var frm =document.forms[0];
		if(chechedCount(frm)<1){
    		alert("���ٱ���ѡ��һ�У�");
    		return ;
    	}
		if(chechedCount(frm)>1){
    		alert("ֻ��ѡ��һ�У�");
    		return ;
    	}
		if(chechedCount(frm)==1){
			id = getChechedValue(frm);
    		frm.action = frm.elements["toviewaction"].value;
    		frm.action += "?fid=" + id;
			frm.submit();		
    	}

}

</script>