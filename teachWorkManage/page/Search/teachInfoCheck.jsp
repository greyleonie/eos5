<%@include file="/internet/common.jsp"%>
<SCRIPT language="jscript" src="/internet/scripts/processCaller.js"></SCRIPT>
<SCRIPT language="jscript" src="/internet/scripts/string.js"></SCRIPT>
<SCRIPT language="jscript" src="/internet/scripts/dynamicSelect.js"></SCRIPT>


<html>
<head>
<title>������ί��У��Ϣһ�廯ƽ̨</title>
</head>
<body>
<form name="opeForm" method="post" action="teachWorkManage.prSearch.teachInfoList.do">
<table width="100%"  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ -&gt; ������� -&gt; ��ѯͳ��
              -&gt; ��ʦ�Ͽ����</td> 
          </tr>
      </table></td>
    </tr>
  </table>
  
  <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
    <tr >
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text"> 
       <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" >
        <tr>
            <td class="td2" align="right" >ʱ&nbsp;&nbsp;&nbsp;&nbsp;�䣺</td>
            <td class="td1"  >
            ��
            	<html:text property="SearchTeaching/ClassDate/criteria/min" attributesText='class="input" size="12" ValidateType="notempty" Msg="ʱ�䲻��Ϊ��"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["SearchTeaching/ClassDate/criteria/min"],"yyyy-MM-dd")> 
           		<font color="red">*</font>
           		��
           		<html:text property="SearchTeaching/ClassDate/criteria/max" attributesText='class="input" size="12"  ValidateType="notempty" Msg="ʱ�䲻��Ϊ��"' readonly="true"/>
          	    <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["SearchTeaching/ClassDate/criteria/max"],"yyyy-MM-dd")>
			    <font color="red">*</font>
			    <input type="hidden" name="SearchTeaching/ClassDate/criteria/operator" value="between"/>
			    <input type="hidden" name="SearchTeaching/ClassDate/criteria/criteriaPattern" value="yyyy-MM-dd"/>
			    
			  </td>
			  
			  
			    <td class="td2" align="right">����ν�ʦ��</td> 
			<td class="td1"  ><html:text property="input/searchText"  />
			</td>
      </tr>
	  <tr>
            <td class="td2" align="right"> �������в���</td> 
			<td class="td1" >  	    
         <select  name="SearchTeaching/TeachingGroupID"  id="select1" bizAction="teachWorkManage.bizSearch.selectTeachGroup"   paramXML="" listXpath="list[@type='TeachGroup']" entityName="TeachGroup" valueField="orgID"    textField="orgName"        childID="select2"  nullLable="true" nullLableText="��ѡ����в�" nullLableValue="" onchange="refreshChild_DS(this)" ></select> 
           </td> 
          <td class="td2" align="right"> У�ڽ�ʦ��</td> 
          <td class="td1" >  	
         <select name="SearchTeaching/TeacherID/criteria/value"        id="select2" bizAction="teachWorkManage.bizSearch.selectTeacher"    paramXML="" listXpath="list[@type='Teacher']"     entityName="Teacher"    valueField="TeacherID" textField="operatorName"  childID=""       mainSelectID="select1" nullLable="true" nullLableText="��ѡ����ʦ" nullLableValue="" onclick="queryTeaching()" ></select>
		 <script language="JavaScript" type="text/JavaScript">	 	
			initSel_DS(document.getElementById("select1"));
		</script>
		<html:hidden property="SearchTeaching/TeacherID/criteria/operator" value="="/></td>
	
	</tr>
        </table>
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="30" class="text" align="center">
			<input name="query" type="button" class="button_02" value="�� ѯ" onClick="search()">	
            <logic:notPresent property="input/isFirst" >
            <input name="view2" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
            <input name="view" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">     
            
            </logic:notPresent>
            <input type="hidden" name="queryaction" value="teachWorkManage.prSearch.teachInfoList.do">    
            </td>
          </tr>
        </table> 
          </td>      
        </tr>
         <tr><td>
             <logic:notPresent property="input/isFirst">  
          
         <table width="100%" height="6"  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr>
          <td class="td1"  align="center"><span id="printTable"> <b> <bean:write property="input/TeacherName"/>��ʦ�Ͽΰ������ </b>
          <br/>
          (<bean:write  property="Class/EndTime/criteria/min"/>��<bean:write  property="Class/EndTime/criteria/max"/>)
          </span></td>
        </tr>
      </table>
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC"   id="listdetail">	  
	    <tr class="td_title"> 
                  <td width="10%" align="center" nowrap id="Textbook.Title" onClick="talentsort()">����</td>
                  <td width="10%" align="center" nowrap id="Textbook.Author" onClick="talentsort()">����</td>
                  <td width="10%" align="center" nowrap id="Textbook.Publisher" onClick="talentsort()">ʱ��</td>
                  <td width="20%" align="center" nowrap id="Textbook.PublishTime" onClick="talentsort()">�༶</td>
                  <td width="20%" align="center" nowrap id="Textbook.PublishTime" onClick="talentsort()">�ص�</td>
                  <td width="30%" align="center" nowrap id="Textbook.PublishTime" onClick="talentsort()">��������</td>
                </tr>
                <%
		             int count=0;
		             int i=0;
		             int j=0;
			           String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="dateresult" property="list[@type='ClassDate']">                
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
						i=0;
						
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)">            
                <td align="center" nowrap rowspan="<bean:write id="dateresult" property="ClassDate/RowSpan"/>"><bean:write id="dateresult" property="ClassDate/ClassDate" formatType="yyyy-MM-dd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" /> </td>
                <td align="center" nowrap rowspan="<bean:write id="dateresult" property="ClassDate/RowSpan"/>"><bean:write id="dateresult" property="ClassDate/WeekDay" /> </td>
                <logic:iterate id="timeresult" property="list[@type='ClassTime']"> 
                	<logic:equal id="timeresult" property="ClassTime/ClassDate" value="ClassDate/ClassDate" valueType="variable" valueId="dateresult">	                             
		                              <%i++;j=0; if(i!=1){%>
		               <tr class="<%=trClass%>" onClick="changeTRBgColor(this)"> <%}%>	               
		               <td align="center" nowrap rowspan="<bean:write id="timeresult" property="ClassTime/RowSpan"/>"><bean:write id="timeresult" property="ClassTime/ClassTime" formatType="HH:mm" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" /></td>
	                 
	                <logic:iterate id="teachresult" property="list[@type='SearchTeaching']"> 
                	<logic:equal id="teachresult" property="SearchTeaching/ClassDate" value="ClassTime/ClassDate" valueType="variable" valueId="timeresult">	                             
		            <logic:equal id="teachresult" property="SearchTeaching/ClassTime" value="ClassTime/ClassTime" valueType="variable" valueId="timeresult">	
		                              <%j++; if(j!=1){%>
		               <tr class="<%=trClass%>" onClick="changeTRBgColor(this)"> <%}%>	               
		               <td><bean:write id="teachresult" property="SearchTeaching/ClassName" /></td>
		               <td><bean:write id="teachresult" property="SearchTeaching/RoomName" /></td>
		               <td><bean:write id="teachresult" property="SearchTeaching/CourseTitle" /></td>
	               </logic:equal>
	               </logic:equal>
                </logic:iterate> 
	               
	               </logic:equal>
                </logic:iterate>             
                </logic:iterate> 
        </table></logic:notPresent>
</td>
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
</html>

<script language="javascript">
function queryTeaching(){	
var teacherID = document.opeForm['SearchTeaching/TeacherID/criteria/value'].value;
	if(teacherID == ""){
		alert("����ѡ���������в���ѡУ����ʦ");
		return;
	}
  	var frm = document.forms[0];
	if(validater(frm)) frm.submit();
}


 function search() {
 	var teacherID = document.opeForm['input/searchText'].value;
	if(teacherID == ""){
		alert("����ν�ʦ����Ϊ��");
		return;
	}
  	var frm = document.forms[0];
	if(validater(frm)) frm.submit();
  
  }
</script>