
<%@include file="/internet/common.jsp"%>

<body><title>����ʦ�γ��Ƿ��ͻ</title>
<form name="frm" mehod="post">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="/internet/image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ -&gt; ������� -&gt;��ѧ�ƻ�����     
              -&gt;����ʦ�γ��Ƿ��ͻ</td>
          </tr>
      </table></td>
    </tr>
  </table>
       <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" >
     <tr> 
            <td colspan="13" class="td2">��صĳ�ͻ��Ϣ��</td>
            </tr>
      
   </table>  
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
   <tr>
      <td class="text" width="876">
      <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
          <tr class="td2">
            <td width="" align="center">����</td>
            <td width="" align="center">ʱ��</td>
            <td width="" align="center">���</td>  
            <td width="" align="center">�༶</td>          
            <td width="" align="center">�ڿ���</td>
          </tr><%
          int count=0;
            String style="";
           %>
          <logic:iterate id="resultSet" property="list[@type='Course']">
           <%
          if(count%2==0){
              style="td2";
             }else{
              style="td1";
             }
            %>
             <tr class="<%=style %>">
              <td width="" align="center">
               <bean:write id="resultSet" property="Course/ClassDate" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/>
              </td>
               <td width="" align="center">
               <bean:write id="resultSet" property="Course/ClassTime" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="HH:mm"/>
               </td>
              <td width="" align="center">
               <dict:write businTypeId="BNDICT_classMoon" property="Course/ClassNoon" id="resultSet"/>
              </td>
                <td width="" align="center">
                <bean:write id="resultSet" property="Course/ClassID"/>
             </td>
             <td width="" align="center">
                <bean:write id="resultSet" property="Course/Teachers"/>
             </td>
             </tr><%count++; %>
          </logic:iterate>
          <%if(count==0){ %>
            <tr class="td1"><td colspan="5" align="center">û�г�ͻ�� </tr>
          <%} %>
        </table>
     
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center"><html:hidden property="TeachingPlan/PlanID"/>
              &nbsp;  
                <input name="Submit2" type="button" class="button_02" value="�� ��" onclick="window.close()"></td>
            </tr>
        </table></td>
    </tr>
  
  </table>
</form>
</body>