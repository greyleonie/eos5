<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/hci-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/hci-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/hci-logic.tld" prefix="logic" %>
<%response.setContentType("application/msword;charset=gb2312");
  java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("yyyy-MM-dd"); 
 %>
  <table width="100%"  border="1" align="center" cellpadding="0" cellspacing="0"  height="369" bordercolordark="#FFFFFF" bordercolorlight="#A2C4DC">
    <tr>
      <td height="8" align="center"><bean:write property="className"/></td>
    </tr>
    <tr>
      <td  bgcolor="#FFFFFF">      
        <table width="98%" border="1" align="center" cellpadding="0" cellspacing="0"  height="369" bordercolordark="#FFFFFF" bordercolorlight="#A2C4DC">
          <tr align="center" bgcolor="#FFFFFF">            
            <td width="10%">日期</td>
            <td width="6%">星期</td>
            <td width="7%">午别<br></td>
            <td width="46%">学习内容</td>
            <td width="15%">教学地点</td>
            <td width="12%">授课人或主持人</td>
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