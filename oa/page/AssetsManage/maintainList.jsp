<%@include file="/internet/common.jsp"%>
<script language="jscript" src="/internet/scripts/hiddensubmit.js"></script>
  <logic:present property="Msg">
	 <script>
	 	alert("<bean:write property="Msg"/>");
	 </script>
 </logic:present>
<body>
<form method="post" action="oa.prAssetsManage.maintainList.do" name="opeForm">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
 			<td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;�ʲ�����&gt;<span id="printTable">�ʲ�ά����Ϣ�б�</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prAssetsManage.maintainList.do">
		<input type="hidden" name="addaction" value="oa.prAssetsManage.maintainAdd.do">
		<input type="hidden" name="modifyaction" value="oa.prAssetsManage.maintainModify.do">
		<input type="hidden" name="deleteaction" value="oa.prAssetsManage.maintainDelete.do">
		<input type="hidden" name="viewaction" value="oa.prAssetsManage.maintainView.do">
	
		<html:hidden property="CAPT_MAINTAINVIEW/_order/col1/field"/>
		<html:hidden property="CAPT_MAINTAINVIEW/_order/col1/asc" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
	  </td>
    </tr>
  </table>
<% String column = request.getParameter("SessionEntity/orgID");
                   if   (column == null) column = base.util.TalentContext.getValue(pageContext,null,"SessionEntity/orgID");
 %>

<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="8"> </td>
      </tr>
      
	  <tr>
            <td height="30" class="text">
				<a title="�ʲ�����,�ʲ�����,ά����,ά�޵�λ ">�ؼ��֣�</a>
				<html:text property="CAPT_MAINTAINVIEW/searchText" attributesText='class="input" size="30"'/>
				<html:hidden property="CAPT_MAINTAINVIEW/searchField" value="MAINTAINRECORD,VINDNAME,DepNAME"/>
 				ά�����ڣ���
            	<html:text property="CAPT_MAINTAINVIEW/MAINTAINDATE/criteria/min" attributesText='class="input" size="10"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["CAPT_MAINTAINVIEW/MAINTAINDATE/criteria/min"],"yyyy-MM-dd")> 
           		��
           		<html:text property="CAPT_MAINTAINVIEW/MAINTAINDATE/criteria/max" attributesText='class="input" size="10"' readonly="true"/>
          	    <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["CAPT_MAINTAINVIEW/MAINTAINDATE/criteria/max"],"yyyy-MM-dd")>
			    <input type="hidden" name="CAPT_MAINTAINVIEW/MAINTAINDATE/criteria/criteriaPattern" value="yyyy-MM-dd"/>
			    <input type="hidden" name="CAPT_MAINTAINVIEW/MAINTAINDATE/criteria/operator" value="between"/>
			    <input name="query" type="button" class="button_02" value="�� ѯ" onClick="talentsearch()">
			    ���������<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""> 
			    <br/>
				<qx:talentButton property="add" type="button" styleClass="button_02" value="�� ��" onclick="talentadd()" operation="DX_OASYS_ASSETSMANAGE_MAINTAIN.DX_OASYS_ASSETSMANAGE_MAINTAIN_ADD" />
				<qx:talentButton property="modify" type="button" styleClass="button_02" value="�� ��" onclick="talentmodify()" operation="DX_OASYS_ASSETSMANAGE_MAINTAIN.DX_OASYS_ASSETSMANAGE_MAINTAIN_MODIFY" />
				<qx:talentButton property="delete" type="button" styleClass="button_02" value="ɾ ��" onclick="talentdelete()" operation="DX_OASYS_ASSETSMANAGE_MAINTAIN.DX_OASYS_ASSETSMANAGE_MAINTAIN_DEL" />
              	<input name="delete" type="button" class="button_02" value="�� ��" onClick="talentview()">
				<input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">
			</td>
      </tr>
      <tr>
        <td height="8"> </td>
      </tr>
      <tr>
        <td valign="top" class="text" >
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="3%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                  <td width="47%" align="center" nowrap id="CAPT_MAINTAINVIEW.MAINTAINRECORD" onClick="talentsort()">�ʲ�����[����]</td>
                  <td width="15%" align="center" nowrap id="CAPT_MAINTAINVIEW.MAINTAINER" onClick="talentsort()">ά����</td>
                  <td width="15%" align="center" nowrap id="CAPT_MAINTAINVIEW.VINDNAME" onClick="talentsort()">ά�޵�λ</td>
                  <td width="10%" align="center" nowrap id="CAPT_MAINTAINVIEW.MAINTAINDATE" onClick="talentsort()">ά������</td>
                  <td width="10%" align="center" nowrap id="CAPT_MAINTAINVIEW.RETURNDATE" onClick="talentsort()">�黹����</td>
                  <td width="10%" align="center" nowrap >����</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
		  		  <%int i=1; %>
                <logic:iterate id="resultset" property="list[@type='CAPT_MAINTAINVIEW']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
			   
			    
              <tr class="<%=trClass%>"  id="back<%=i %>" onClick="changeTRBgColor(this)"  onDblClick="talentviewf('<bean:write id="resultset" property="CAPT_MAINTAINVIEW/MAINTAINID"/>','true')">  
                <td align="center"  > 
					<logic:present  id="resultset" property="CAPT_MAINTAINVIEW/MAINTAINID"> 
                  		<html:checkbox id="resultset" name="list[@name='update']/CAPT_MAINTAINVIEW/MAINTAINID" property="CAPT_MAINTAINVIEW/MAINTAINID" indexed="true"/> 
                  	</logic:present> 
				</td>
                <td nowrap title="<bean:write id="resultset" property="CAPT_MAINTAINVIEW/MAINTAINRECORD" />">&nbsp;<bean:write id="resultset" property="CAPT_MAINTAINVIEW/MAINTAINRECORD" maxLength="60"/></td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="CAPT_MAINTAINVIEW/MAINTAINER"/></td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="CAPT_MAINTAINVIEW/VINDNAME"/></td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="CAPT_MAINTAINVIEW/MAINTAINDATE" formatType="yyyy-MM-dd"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" /></td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="CAPT_MAINTAINVIEW/RETURNDATE" formatType="yyyy-MM-dd"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" /></td>
				<td nowrap > 
				 <%if(column=="15"||column.equals("15")){ %>	
				<a href="#" onclick="getBackNew('<bean:write id="resultset" property="CAPT_MAINTAINVIEW/MAINTAINID"/>','<bean:write id="resultset" property="CAPT_MAINTAINVIEW/CAPTID"/>',<%=i %>)">ά�����</a>
				 <%} %>
				 <a href="oa.prAssetsManage.writeOffAdd.do?name=<bean:write id="resultset" property="CAPT_MAINTAINVIEW/MAINTAINRECORD" />&fid=<bean:write id="resultset" property="CAPT_MAINTAINVIEW/MAINTAINID" />&pid=<bean:write id="resultset" property="CAPT_MAINTAINVIEW/CAPTID"/>&pd=1">��������</a>
				</td>
				</tr>
				<%i++; %>
				
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
<input type="hidden" name="title" value="�ʲ�ά����Ϣ�б�">
<input type="hidden" name="xmlfcc">
</form>
</body>

<script>
function talentaddNew() {
	var frm = document.forms[0];
	frm.action = frm.elements["addaction"].value ;
   	frm.submit();

}
function getBackNew(id,pid,j) {
   var td1=document.getElementById("back"+j);
   
if(confirm("ȷ��ά����ɣ�"))
		{
			var sub1 = new HiddenSubmit("oa.bizAssetsManage.backAsset");
			sub1.add("fid",id);
		    sub1.add("pid", pid);
			if (sub1.submit()) {
				var ret = sub1.getValue("root/return/code");
				if (ret == null || ret == "-1") {
					alert("����ʧ�ܣ�����ϵ����Ա");
				} else {				     
					alert("�����ɹ���");	
					td1.style.display="none";							
				}
			}
		}
	
}
</script>
<script>
	loadOrderImg(document.forms[0],'CAPT_MAINTAINVIEW');
</script>