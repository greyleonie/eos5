<%@include file="/internet/common.jsp"%>
<title>ѡ�����</title>
<body>
<form>
<html:hidden property="PageCond/begin"/>
<html:hidden property="PageCond/count"/>
<html:hidden property="PageCond/length"/>
<html:hidden property="isAdd"/>
<html:hidden property="Course/CourseID"/>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;��ѧ�ƻ����ơ�&gt;��������</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"> </td>
    </tr>
    <tr>
      <td class="text"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" class="text">���в���  
               <html:select onchange="queryByGroup()" property="group" attributesText='id="printTable" '> 
              <html:option value="-1">--��ѡ����в�--</html:option> 
              <html:options property="list[@type='EOSORG_T_Organization']/EOSORG_T_Organization/orgid" labelProperty="list[@type='EOSORG_T_Organization']/EOSORG_T_Organization/orgname"/> 
              </html:select>
              <html:radio property="isHistory" value="0"/>δִ�пγ� <html:radio property="isHistory" value="1"/>��ִ�пγ�
             
              �ؼ��֣�                      
               <html:text property="keyWord" attributesText='class="input" size="20"'/>  
                <input name="B1" type="button" class="button_02" value="��ѯ" onClick="search()"> 
             
                <br>
                    
</td> 
        </tr>
      </table>      
        <table width="100%" height="8"  border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td> </td>
          </tr>
        </table>
        <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
          <tr align="center" class="td_title">
            <td width="4%">
           &nbsp;

           </td>
            <td width="4%">����</td>           
            <td width="6%">���</td>           
            <td width="16%">�γ̱���</td>           
            <td width="10%">�ڿν�ʦ</td>
            <td width="7%">�Ƿ�����</td>
            <td width="6%">�������в�</td>           
          </tr>
          <%
          int count=0; 
            String style="";
          %>
          <logic:iterate id="resultSet" property="list[@type='Subjects']">
          <%
          if(count%2==0){
              style="td1";  
             }else{
             style="td2"; 
             }
           %>
          <tr class="<%=style %>">
            <td width="4%" align="center">      
            <input type="radio" id="resultSet" name="ra" value='<bean:write id="resultSet" property="Subjects/SubjectName"/>'>     
            <input type="hidden" name="orgid" value='<bean:write id="resultSet" property="Subjects/TeachingGroupID"/>'>
            </td>         
            <td width="10%"><bean:write id="resultSet" property="Subjects/ClassTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>��</td>
            <td width="10%"><dict:write businTypeId="BNDICT_classMoon" property="Subjects/ClassNoon" id="resultSet"/></td>
            <td width="7%"><bean:write id="resultSet" property="Subjects/SubjectName"/></td>
            <td width="6%"><bean:write id="resultSet" property="Subjects/Teacher"/></td>
            <td width="7%">
            <logic:equal id="resultSet" property="Subjects/IsOuter" value="0">��</logic:equal>
            <logic:equal id="resultSet" property="Subjects/IsOuter" value="1">��</logic:equal>
            </td>
            <td width="10%"><bean:write id="resultSet" property="Subjects/orgId"/></td>
          </tr>
           <% count++; %>
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
        </table></td>
    </tr>
    <tr>
      <td class="text" align="center">
      <input type="button" value="ȷ ��" class="button_02" onclick="selectTitle()">
      <input type="button" value="�� ��" class="button_02" onclick="window.close()">
      </td>
    </tr>
  </table>
</form>

</body><script language="javascript">
 function selectTitle(){

   var items=document.forms[0].elements["ra"];
   var orgIds=document.forms[0].elements["orgid"];
   var len=items.length;
   var orgId="";
  
   
   for(var i=0;i<len;i++){
    if(items[i].checked){    
      window.opener.document.all("Course/CourseTitle").value=items[i].value;  
      orgId=orgIds[i].value;  
      try{
          var obj=window.opener.document.all("Course/TeachingGroupID");
          var len=obj.options.length;        
          for(var k=0;k<len;k++){      
       
              if(obj.options[k].value==orgId){             
                 obj.selectedIndex=k;
              }
          }
      }catch(e){}
      break;
   }
   }
  
   window.close();
 }
 
 function queryByGroup(){
   frm.elements["keyWord"].value="";
   search();
 }
 
 function search(){
  frm.elements["PageCond/count"].value="";
  frm.elements["PageCond/begin"].value="";
  frm.elements["PageCond/length"].value="";
  frm.action="teachWorkManage.prMakeTeachPlan.selectTitle.do";
  frm.submit();
}
</script>