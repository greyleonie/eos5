<%@include file="/internet/common.jsp"%>
<style type="text/css">
<!--
.STYLE1 {
	font-family: "������κ";
	font-size: 16px;
}
.style2 {font-family: "����"}
.STYLE3 {
	font-family: "������";
	font-size: 18px;
	font-weight: bold;
}
.STYLE4 {
	font-family: "������";
	font-size: x-large;
	font-weight: bold;
}
.STYLE5 {
	font-family: "������";
	font-size: 16px;
}
.STYLE6 {
	font-family: "������";
	font-size: 16px;
	font-weight: bold;
}
.STYLE11 {font-size: 12px}
.noinput {
		BORDER-RIGHT: #a3a3a3 1px solid;
		BORDER-TOP: #636562 1px solid;
		DISPLAY: none;
		FONT-SIZE: 12px;
		BORDER-LEFT: #636562 1px solid;
		WIDTH: 600px;
		COLOR: #000000;
		BORDER-BOTTOM: #a3a3a3 1px solid;
		HEIGHT: 25px
	}
	
	.showinput {
		BORDER-RIGHT: #a3a3a3 1px solid;
		BORDER-TOP: #636562 1px solid;
		DISPLAY: block;
		FONT-SIZE: 12px;
		BORDER-LEFT: #636562 1px solid;
		WIDTH: 600px;
		COLOR: #000000;
		BORDER-BOTTOM: #a3a3a3 1px solid;
		HEIGHT: 25px
	}
	
	.showversion {
		FONT-SIZE: 12px;
		WIDTH: 50px;
		COLOR: #000000;
	}
	
	.noversion {
	    DISPLAY: none;
		FONT-SIZE: 12px;
		WIDTH: 50px;
		COLOR: #000000;
	}
-->
</style>
<script language="javascript">
function formatLevText(objname,levname) {
   var tmpText = "";
   for (var i=0;i<levname.length;i++) {
       if (i != (levname.length-1))
          tmpText += levname.substr(i, 1) + "<br>";
       else
          tmpText += levname.substr(i, 1);
   }
   document.getElementById(objname).innerHTML = tmpText;
}
	
function formatItemText(objname,itemName) {
	var name_tmp = "";
	if (itemName.length <= 6) {
       for (var i=0;i < itemName.length;i++) {
           name_tmp = name_tmp + itemName.substr(i,1) + " ";
       }
       document.getElementById(objname).innerHTML = name_tmp + "<br>";
       return;
    }
    if (itemName.length > 8) {
       document.getElementById(objname).innerHTML = itemName.substring(0,Math.floor(itemName.length/2)) + "<br>" + itemName.substring(Math.floor(itemName.length/2),itemName.length) + "<br>";
       return;
    }
    document.getElementById(objname).innerHTML = itemName + "<br>";
}
	
</script>

<body>
<form>
<html:hidden property="Evaluation/EvaluationID" />
<html:hidden property="Evaluation/Period" />
<html:hidden property="Evaluation/IsNeedAdvice" />
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="24" background="../../image/lz_bg.gif">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�������&gt;��ѧ����������&gt;�����̰��ۺ�������</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="20" align="center"><span class="STYLE3">������ί��У&nbsp;&nbsp;��������ѧԺ</span><br>
        <SPAN class="STYLE4" id="titleText"><bean:write property="Evaluation/Title"/></SPAN><BR>
	    <div align="left" class="STYLE5"><strong>��λѧԱ��</strong><br />&nbsp;&nbsp;&nbsp;&nbsp;
        <SPAN id="remarksText"><bean:write property="Evaluation/Remarks"/></SPAN></div>
        <div id="version" width="100%" align="right">�汾:<bean:write property="Evaluation/Version"/></div>
      </td>
    </tr>
    <tr>
      <td class="text" valgin="top"><table width="100%" border="0" cellspacing="10" cellpadding="0">
        <tr>
          <td><span class="STYLE6">&nbsp;&nbsp;&nbsp;&nbsp;һ�����Ļ�����Ϣ</span></td>
        </tr>
		<tr>
		  <td><table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#000000">
            <tr>
              <td width="10%" bgcolor="#FFFFFF" align="center" valign="middle">���<br />ѧ��</td>
              <td width="40%" bgcolor="#FFFFFF" align="center" valign="middle">
			    <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="40%" align="center">��ʿ�о���</td>
                    <td width="10%" align="center"><input type="checkbox" name="checkbox" value="checkbox" /></td>
                    <td width="40%" align="center">��ѧ����</td>
                    <td width="10%" align="center"><input type="checkbox" name="checkbox4" value="checkbox" /></td>
                  </tr>
                  <tr>
                    <td align="center">˶ʿ�о���</td>
                    <td align="center"><input type="checkbox" name="checkbox2" value="checkbox" /></td>
                    <td align="center">��ѧר��</td>
                    <td align="center"><input type="checkbox" name="checkbox5" value="checkbox" /></td>
                  </tr>
                  <tr>
                    <td align="center">��У�о���</td>
                    <td align="center"><input type="checkbox" name="checkbox3" value="checkbox" /></td>
                    <td align="center">&nbsp;</td>
                    <td align="center">&nbsp;</td>
                  </tr>
                </table>
			    </td>
              <td width="5%" bgcolor="#FFFFFF" align="center" valign="middle">��<br />
                ��</td>
              <td width="20%" bgcolor="#FFFFFF" align="center" valign="middle">�� 
                <input type="checkbox" name="checkbox6" value="checkbox" />                &nbsp;&nbsp;&nbsp;&nbsp;Ů 
                <input type="checkbox" name="checkbox7" value="checkbox" /></td>
              <td width="5%" bgcolor="#FFFFFF" align="center" valign="middle">��<br />
                ��</td>
              <td width="20%" bgcolor="#FFFFFF" align="center" valign="middle"><table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="60%" align="left">40������</td>
                  <td width="40%" align="center"><input type="checkbox" name="checkbox8" value="checkbox" /></td>
                </tr>
                <tr>
                  <td align="left">40�ꡫ50��</td>
                  <td align="center"><input type="checkbox" name="checkbox9" value="checkbox" /></td>
                </tr>
                <tr>
                  <td align="left">50������</td>
                  <td align="center"><input type="checkbox" name="checkbox10" value="checkbox" /></td>
                </tr>
              </table>
                </td>
            </tr>
          </table></td>
		</tr>
		<tr>
		  <td>
		  <table id="allCourse" width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#000000">
            <tr id="allCourse_item0_tr">
              <td id="allCourse_lev0_td" width="18%" bgcolor="#FFFFFF"> &nbsp;&nbsp;����̶�
                <br />��<br />��<br />��
              <% int levLen = 0; %>
              <logic:iterate id="allev" property="list[@type='allCourseLevs']">
              <% levLen++; %>
              <td id="allCourse_lev<%=levLen%>_td" width="10%" align="center" bgcolor="#FFFFFF">
			   <table id="allCourse_lev<%=levLen%>_tb" width="100%" height="100%" border="0" align="center" cellpadding="1" cellspacing="1">
                   <tr valign="middle">
                     <td align="center">
					   <span id="allCourse_lev<%=levLen%>_text"><script>formatLevText("allCourse_lev<%=levLen%>_text","<bean:write id="allev" property="allCourseLevs/LevelName"/>");</script></span></td>
                     </tr>
                 </table>
              </td>
              </logic:iterate>
			  <logic:equal property="Evaluation/IsNeedAdvice" value="1">
              <td id="allCourse_item0_suggest" width="42%" align="center" bgcolor="#FFFFFF">�� �� �� �� ��</td>
			  </logic:equal>
            </tr>
            <% int itemLen = 0; %>
			<logic:iterate id="allCourseItem" property="list[@type='allCourseItems']">
			<% itemLen++; %>
            <tr id="allCourse_item<%=itemLen%>_tr">
              <td id="allCourse_item<%=itemLen%>_td" width="18%" height="45" align="center" bgcolor="#FFFFFF">
			  <table width="100%" height="100%" border="0" cellpadding="1" cellspacing="1">
                <tr>
                  <td width="80%" align="center" valign="middle">
                  <span id="allCourse_item<%=itemLen%>_text">
                  <script>formatItemText("allCourse_item<%=itemLen%>_text","<bean:write id="allCourseItem" property="allCourseItems/Title"/>");</script>
                  </span></td>
                </tr>
              </table></td>
              <% for (int i=0;i<levLen;i++) { %>
              <td width="10%" align="center" bgcolor="#FFFFFF">&nbsp;</td>
              <% } %>
			  <logic:equal property="Evaluation/IsNeedAdvice" value="1">
              <td id="allCourse_item<%=itemLen%>_suggest" width="42%" align="center" bgcolor="#FFFFFF">&nbsp;</td>
			  </logic:equal>
            </tr>
            </logic:iterate>
          </table></td>
		</tr>
        <tr>
          <td><span class="STYLE6">&nbsp;&nbsp;&nbsp;&nbsp;��������ר��ε�����</span>
		      <span class="STYLE5">��������ѡ��Ŀ�ġ������ڴ򡰡̡�����Ըÿ��ⲻ���⣬���á������հ׼��ɣ�</span></td>
        </tr>
		<tr>
		  <td>
		  <table id="special" width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#000000">
            <tr id="class0_tr">
              <td width="30%" align="center" bgcolor="#FFFFFF">ר�⣨�����ˣ�
			  </td>
              <td width="20%" align="center" bgcolor="#FFFFFF">
			  <span id="class_itemText1">�������</span>
			  <input type="hidden" id="class_item1" value="�������">
			  </td>
			  <logic:equal property="Evaluation/IsNeedAdvice" value="1">
              <td id="special_item0_suggest" width="50%" align="center" bgcolor="#FFFFFF">�� �� �� �� ��</td>
			  </logic:equal>
            </tr>
            <% itemLen = 0; %>
			<logic:iterate id="specialItem" property="list[@type='specialItems']">
			<% 
			  itemLen++;
			  int itemId = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"specialItem","specialItems/ItemID"));
			  int itemLevLen = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"specialItem","specialItems/levlen"));
			%>
            <tr id="class<%=itemLen%>_tr">
              <td width="30%" bgcolor="#FFFFFF">
			  <span id="class<%=itemLen%>_text"><bean:write id="specialItem" property="specialItems/Course"/>��</span><br />
			  2008-6-2<br />
              <span id="class<%=itemLen%>_topic">��Ŀ��**********</span><br />
			  <table width="100%">
			  <tr>
			    <td id="class<%=itemLen%>_teacher" align="right">��ĳĳ�쵼��</td>
			  </tr>
			  </table></td>
              <td id="class<%=itemLen%>_lev" width="20%" align="center" bgcolor="#FFFFFF">
			  <table id="class<%=itemLen%>_lev_tb" width="90%" border="0" cellspacing="3" cellpadding="0">
			  <%
				for (int i=1;i<=itemLevLen;i++) {
			  %>
              <logic:iterate id="specialev" property="list[@type='specialLevs']">
              <% 
              int levItemId = Integer.parseInt(base.util.TalentContext.getValue(pageContext,"specialev","specialLevs/ItemID"));
              int levOrder =  Integer.parseInt(base.util.TalentContext.getValue(pageContext,"specialev","specialLevs/OrderNO"));
				if (levItemId==itemId && levOrder==i) {
              %>
                <tr id="class<%=itemLen%>_lev<%=i%>_tr">
                  <td width="30%" align="center">
				    <input type="checkbox" id="class<%=itemLen%>_lev<%=i%>_checkbox" value="" /></td>
                  <td id="class<%=itemLen%>_lev<%=i%>_td" width="70%" align="left"><bean:write id="specialev" property="specialLevs/LevelName"/></td>
                </tr>
              <% } %>
              </logic:iterate>
              <% } %>
              </table></td>
			  <logic:equal property="Evaluation/IsNeedAdvice" value="1">
              <td id="special_item<%=itemLen%>_suggest" width="50%" bgcolor="#FFFFFF">&nbsp;</td>
			  </logic:equal>
            </tr>
            </logic:iterate>
          </table></td>
		</tr>
		<tr>
          <td><span class="STYLE6">&nbsp;&nbsp;&nbsp;&nbsp;�ġ�������ε�����</span>
		      <span class="STYLE5">�������Դ˿β����⣬�ɲ��򡰡̡���</span>
		      <BR><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ע������ογ̼��ȼ����ø�ר�����ͬ��
		  </td>
        </tr>
      </table></td>
    </tr>
  </table>
</form>
<p align="right" class="STYLE1"> ��ϸ�л���Ĳ�����֧�֣�</p>
<div align="center"><INPUT type="button" class="button_02" value="���" onclick="window.history.go(-1);"></div>
</body>