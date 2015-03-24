<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/app.tld" prefix="app" %>

<%@page import="com.talent.common.TalentFunction"%>
<%@page import="com.talent.common.Pagination"%>
<%@page import="org.apache.struts.util.RequestUtils"%>
<link href="/css/css.css" rel="stylesheet" type="text/css">
<script language='javascript' src='/script/validator.js'></script>
<body>
<html:form action="/thesis.do?action=gradeThesisDo" method="post">
<html:hidden property="thesisId" name="thesis" />
<input type="hidden" name="currentPage" value="<%=request.getParameter("currentPage") %>" >
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#D8D8D8">
          <tr  >
            <td width="15%" align="right" class="td">班     级：</td>
            <td colspan="3" class="td1">&nbsp;
			         <bean:write name="thesis"  property="className"/></td>
          </tr>
          
          <tr  >
            <td align="right" class="td">姓 名：</td>
            <td width="29%" class="td1">&nbsp;
            <bean:write name="thesis"  property="studentName"/></td>
            <td width="15%" align="right" class="td">学 号：</td>
            <td width="41%" class="td1">&nbsp;
                        <bean:write name="thesis"  property="studentNo"/></td>
		  </tr>
          <tr  >
            <td align="right" class="td">文章题目：</td>
            <td colspan="3" class="td1">&nbsp;
            <html:link href="thesis.do?action=viewThesisContent" paramName="thesis" paramProperty="thesisId" paramId="thesisId" >
                 <bean:write name="thesis"  property="thesisTitle"/>
            </html:link>
				      				  </td>
          </tr>
          <tr  >
            <td align="right" class="td">文章类型：</td>
            <td class="td1">&nbsp;
             <bean:write name="thesis"  property="unitTitle"/></td>
            <td align="right" class="td">上传时间：</td>
            <td class="td1">&nbsp;
			<bean:write name="thesis"  property="commitTime"/>			</td>
          </tr>
          <tr  >
            <td align="right" class="td">是否合写：</td>
            <td class="td1">&nbsp;
            <logic:present name="thesis"  property="iscooperate">
            <bean:define id="iscooperate" name="thesis"  property="iscooperate"></bean:define>
            <%
            if(TalentFunction.getAvailStr(iscooperate).equals("1"))
            	out.println("是");
            else 
            	out.println("否");
             %>
            	</logic:present>		</td>
            <td align="right" class="td">合写人：</td>
            <td class="td1">&nbsp;
            <bean:write name="thesis"  property="cooperatorsName"/>
            			</td>
          </tr>
          
          <tr  >
            <td align="right" class="td">文章观点：</td>
            <td colspan="3" class="td1">&nbsp;
            <bean:write name="thesis"  property="opinion"/>
                        </td>
          </tr>
          <tr  >
            <td align="right" class="td">备 注：</td>
            <td colspan="3" class="td1">&nbsp;
             <bean:write name="thesis"  property="remark"/>           </td>
          </tr>
          <tr  >
            <td align="right" class="td">成绩等级：</td>
            <td class="td1">&nbsp;
            
                 <html:select property="score" name="thesis">
                 		<html:options collection="scoreTypeList" property="scoretypename" labelProperty="scoretypename"/>
                 </html:select>
                          
                           </td>
            <td align="right" class="td">是否优秀文章：</td>
            <td class="td1">&nbsp;
            <html:select property="isGood" name="thesis">
                 		<html:option value="0" >否</html:option>
                 		<html:option value="1" >是</html:option>
            </html:select>
					              
         </td>
          </tr>
          <tr  >
            <td align="right" class="td" width="80">文章评语：</td>
            <td colspan="3" class="td1">&nbsp;
            <textarea name="summary" cols="60" rows="6" class="null" class="input" ></textarea> 
</td>
          </tr>
        </table>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">
              <input name="Button" type="Submit" class="button_02" value="保 存" >
                <input name="Submit2" type="button" class="button_02" value="返 回" onClick="javascript:history.go(-1)">
              </td>
            </tr>
        </table>
        </td>
    </tr>
    <tr>
      <td class="text">&nbsp;</td>
    </tr>
  </table>

</html:form>

<script type="text/javascript">
	function toquery(){
		var frm =document.forms[0];
		frm.submit();
	}
</script>
</body>
