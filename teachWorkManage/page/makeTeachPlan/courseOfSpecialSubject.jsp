<%@include file="/internet/common.jsp"%>
<%response.setContentType("application/msword;charset=gb2312");
  java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("yyyy-MM-dd"); 
 %>
  <table width="100%"  bgcolor="#FFFFFF" border="0" align="center" cellpadding="0" cellspacing="1">
    <tr>
      <td height="8" align="center"><bean:write property="className"/></td>
    </tr>
    <tr>
      <td  bgcolor="#FFFFFF">      
        <table width="98%" bgcolor="#FFFFFF" border="0" align="center" cellpadding="0" cellspacing="1">
          <tr align="center" bgcolor="#FFFFFF">            
            <td width="10%">����</td>
            <td width="6%">����</td>
            <td width="7%">���<br></td>
            <td width="46%">ѧϰ����</td>
            <td width="15%">��ѧ�ص�</td>
            <td width="12%">�ڿ��˻�������</td>
          </tr>         
          <logic:iterate id="courseResult" property="list[@type='Course']">        
           <tr bgcolor="#FFFFFF">           
            <td width="10%" align="center"><bean:write id="courseResult" property="Course/ClassDate" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
            <td width="6%" align="center"><bean:write id="courseResult" property="Course/weekDate"/></td>
            <td width="7%" align="center"><dict:write businTypeId="BNDICT_classMoon" property="Course/ClassNoon" id="courseResult"/></td>
            <td width="46%" ><bean:write id="courseResult" property="Course/CourseTitle"/></td>
            <td width="15%" align="center"><bean:write id="courseResult" property="Course/classRoom"/></td>
            <td width="12%" align="center">
            <bean:write id="courseResult" property="Course/teachIngMan"/>
            <bean:write id="courseResult" property="Course/dj"/>
            </td>
          </tr>         
        </logic:iterate>
    </table>
       </td>
    </tr>    
  </table>