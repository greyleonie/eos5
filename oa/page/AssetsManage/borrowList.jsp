<%@include file="/internet/common.jsp"%>
<script language="jscript" src="/internet/scripts/hiddensubmit.js"></script>
  <logic:present property="Msg">
	 <script>
	 	alert("<bean:write property="Msg"/>");
	 </script>
 </logic:present>
<body>
<form method="post" action="oa.prAssetsManage.borrowList.do" name="opeForm">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
 			<td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;�ʲ�����&gt;<span id="printTable">�ʲ�������Ϣ�б�</span></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prAssetsManage.borrowList.do">
		<input type="hidden" name="addaction" value="oa.prAssetsManage.borrowAdd.do">
		<input type="hidden" name="readdaction" value="oa.prAssetsManage.commit.do">
		<input type="hidden" name="modifyaction" value="oa.prAssetsManage.borrowModify.do">
		<input type="hidden" name="deleteaction" value="oa.prAssetsManage.borrowDelete.do">
		<input type="hidden" name="viewaction" value="oa.prAssetsManage.borrowView.do">
	   
		<html:hidden property="CAPT_BORROWVIEW/_order/col1/field"/>
		<html:hidden property="CAPT_BORROWVIEW/_order/col1/asc" />
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
				<a title="�ʲ�����,�ʲ�����,ʹ����,ʹ�ò��� ">�ؼ��֣�</a>
				<html:text property="CAPT_BORROWVIEW/searchText" attributesText='class="input" size="30"'/>
				<html:hidden property="CAPT_BORROWVIEW/searchField" value="BORROWRECORD,BORROWERNAME,DepNAME"/>
 				�������ڣ���
            	<html:text property="CAPT_BORROWVIEW/BORROWDATE/criteria/min" attributesText='class="input" size="10"' readonly="true"/>
             	<img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["CAPT_BORROWVIEW/BORROWDATE/criteria/min"],"yyyy-MM-dd")> 
           		��
           		<html:text property="CAPT_BORROWVIEW/BORROWDATE/criteria/max" attributesText='class="input" size="10"' readonly="true"/>
          	    <img src="/internet/image/date.gif" width="13" height="20" align="absmiddle" onClick=calendar(document.forms[0].elements["CAPT_BORROWVIEW/BORROWDATE/criteria/max"],"yyyy-MM-dd")>
			    <input type="hidden" name="CAPT_BORROWVIEW/BORROWDATE/criteria/criteriaPattern" value="yyyy-MM-dd"/>
			    <input type="hidden" name="CAPT_BORROWVIEW/BORROWDATE/criteria/operator" value="between"/>
			    <input name="query" type="button" class="button_02" value="�� ѯ" onClick="talentsearch()">
			    ���������<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""> 
			    <br/>
              	<qx:talentButton property="add" type="button" styleClass="button_02" value="�� ��" onclick="talentadd()" operation="DX_OASYS_ASSETSMANAGE_BORROW.DX_OASYS_ASSETSMANAGE_BORROW_ADD" />
				<qx:talentButton property="modify" type="button" styleClass="button_02" value="�� ��" onclick="talentmodify()" operation="DX_OASYS_ASSETSMANAGE_BORROW.DX_OASYS_ASSETSMANAGE_BORROW_MODIFY" />
				<!--<qx:talentButton property="delete" type="button" styleClass="button_02" value="ɾ ��" onclick="talentdelete()" operation="DX_OASYS_ASSETSMANAGE_BORROW.DX_OASYS_ASSETSMANAGE_BORROW_DEL" />
              	--><input name="delete" type="button" class="button_02" value="�� ��" onClick="talentview()">
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
                  <td width="42%" align="center" nowrap id="CAPT_BORROWVIEW.BORROWRECORD" onClick="talentsort()">�ʲ�����[����]</td>
                  <td width="10%" align="center" nowrap id="CAPT_BORROWVIEW.BORROWERNAME" onClick="talentsort()">ʹ����</td>
                  <td width="10%" align="center" nowrap id="CAPT_BORROWVIEW.DepNAME" onClick="talentsort()">��������</td>
                  <td width="10%" align="center" nowrap id="CAPT_BORROWVIEW.BORROWDATE" onClick="talentsort()">��������</td>
                  <td width="10%" align="center" nowrap id="CAPT_BORROWVIEW.RETURNDATE" onClick="talentsort()">�黹����</td>
                    <%if(column=="15"||column.equals("15")){ %>
                  <td width="15%" align="center" nowrap id="CAPT_BORROWVIEW.RETURNDATE" onClick="talentsort()">����</td>
                 <%} %>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
			        
		              
		  		%>
		  		 <%int i=1; %>
                <logic:iterate id="resultset" property="list[@type='CAPT_BORROWVIEW']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
			    
			  
              <tr class="<%=trClass%>" id="back<%=i %>" onClick="changeTRBgColor(this)"  onDblClick="talentviewf('<bean:write id="resultset" property="CAPT_BORROWVIEW/BORROWID"/>','true')">  
              
                <td align="center"  > 
					<logic:present  id="resultset" property="CAPT_BORROWVIEW/BORROWID"> 
                  		<html:checkbox id="resultset" name="list[@name='update']/CAPT_BORROWVIEW/BORROWID" property="CAPT_BORROWVIEW/BORROWID" indexed="true"/> 
                  	</logic:present> 
				</td>
                <td nowrap title="<bean:write id="resultset" property="CAPT_BORROWVIEW/BORROWRECORD" />">&nbsp;<bean:write id="resultset" property="CAPT_BORROWVIEW/BORROWRECORD" maxLength="60"/></td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="CAPT_BORROWVIEW/BORROWERNAME"/></td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="CAPT_BORROWVIEW/DepNAME"/></td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="CAPT_BORROWVIEW/BORROWDATE" formatType="yyyy-MM-dd"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" /></td>
                <td nowrap >&nbsp;<bean:write id="resultset" property="CAPT_BORROWVIEW/RETURNDATE" formatType="yyyy-MM-dd"  formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" /></td>
                 <%if(column=="15"||column.equals("15")){ %>	
                <td nowrap align="center">
                 <a href="#" onclick="getBackNew('<bean:write id="resultset" property="CAPT_BORROWVIEW/BORROWID"/>','<bean:write id="resultset" property="CAPT_BORROWVIEW/CAPTID"/>',<%=i %>)">�ʲ��黹</a>
                 <a href="#" onclick="readdNew('<bean:write id="resultset" property="CAPT_BORROWVIEW/BORROWID"/>','true')">�ʲ�����</a>	
			     <a href="#" onmousedown="getLog('<bean:write id="resultset" property="CAPT_BORROWVIEW/CAPTID"/>')">ʹ����־</a>
			     
			     </td>	
				<%} %>
				</tr>
				
				<%i=i+1; %>
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
      
    </table>    </td>
  </tr>
</table>
</form>
<form name="exportform" method="post" target="_blank">
<input type="hidden" name="title" value="�ʲ�������Ϣ�б�">
<input type="hidden" name="xmlfcc">
</form>
</body>

<script>
function talentaddNew() {
	var frm = document.forms[0];
	frm.action = frm.elements["addaction"].value ;
   	frm.submit();

}

function readdNew(id,authority) {
	if(authority == "true") {
		var frm =document.forms[0];	
	   	frm.action = frm.elements["readdaction"].value;
	   	frm.action += "?fid=" + id;
		frm.submit();		
    } 	
}

function getBackNew(id,cpId,j) {
   var td1=document.getElementById("back"+j);
if(confirm("ȷ��Ҫ�黹�ʲ���"))
		{
			var sub1 = new HiddenSubmit("oa.bizAssetsManage.getBackAsset");
			sub1.add("fid", id);
			sub1.add("cpId", cpId);
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

function getLog(id) {
	var url = "oa.prAssetsManage.borrowLog.do?fid=" + id;	
	var current = new Date();
	var refresh = current.getTime();
	url += "&refresh=" + refresh;
	var Obj = event.srcElement;
	var tdObj = Obj.parentElement;
	var parentObj = Obj.parentElement.parentElement;
	var tbObj = parentObj.parentElement;
	var rowIndex = parentObj.rowIndex;
	var width = parentObj.offsetWidth;
	var left = TR_GetX(parentObj);
	var top = TR_GetY(parentObj) + parentObj.offsetHeight;
	var height = 50;
	
	if (document.getElementById("tmpWLog")) {
	   document.getElementById("tmpWLog").removeNode(true);
	}
	//��ʱ����һ��
	if(newrowIndex>=rowIndex) newrowIndex = rowIndex;
	else newrowIndex = rowIndex-1;
	var tmpTr = tbObj.insertRow(newrowIndex+1);
	tmpTr.id = "tmpWLog";
	var tmpTd = tmpTr.insertCell();
	tmpTd.colSpan = getTdForTr(parentObj);
	tmpTd.style.width = width + "px";
	tmpTd.style.height = height + "px";
	tmpTd.innerHTML = '<iframe id="ifAddList" onfocus="divWfLogDisplay(1)" onblur="divWfLogDisplay(0)"  src="'+url+'" scrolling="auto" marginwidth="0" marginheight="0" frameborder="1" height="150px" width="100%" > </iframe>';
	document.getElementById("ifAddList").focus();
}

</script>
<script>
	loadOrderImg(document.forms[0],'CAPT_BORROWVIEW');
</script>