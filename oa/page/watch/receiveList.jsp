<%@include file="/internet/common.jsp"%>
<body>
<form method="post" action="oa.prWatch.receiveArchiveList.do">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">�칫ϵͳ��&gt;���̼�ء�&gt;���Ĺ���</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<input type="hidden" name="queryaction" value="oa.prWatch.receiveArchiveList.do">
		<input type="hidden" name="addaction" value="oa.prReceiveArchive.receiveAdd.do">
		<input type="hidden" name="modifyaction" value="">
		<input type="hidden" name="deleteaction" value="oa.prReceiveArchive.receiveDelete.do">
		<input type="hidden" name="viewaction" value="oa.prReceiveArchive.receiveView.do">
		<html:hidden property="ReceiveArchive/_order/col1/field"/>
		<html:hidden property="ReceiveArchive/_order/col1/asc" />
		
		
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/count"/>
		<html:hidden property="PageCond/length" />
		<html:hidden property="temptype" />
		
		<html:hidden property="SessionEntity/operatorID" />
		
		<INPUT value="like" type="hidden" name="ReceiveArchive/archiveTitle/criteria/operator">
		<INPUT value="center" type="hidden" name="ReceiveArchive/archiveTitle/criteria/likeRule">
		<INPUT value="like" type="hidden" name="ReceiveArchive/archiveUnit/criteria/operator">
		<INPUT value="center" type="hidden" name="ReceiveArchive/archiveUnit/criteria/likeRule">
		<INPUT value="like" type="hidden" name="ReceiveArchive/archiveCode/criteria/operator">
		<INPUT value="center" type="hidden" name="ReceiveArchive/archiveCode/criteria/likeRule">
	  </td>
    </tr>
  </table>


<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0" class="table">
  <tr>
    <td><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="10"> </td>
      </tr>
      
	  <tr>
            <td height="30" class="text">
				<a title='�ؼ��ֿ�����"���ı���"' id="keytitle">����</a>�� 
			    <html:text property="ReceiveArchive/archiveTitle/criteria/value" attributesText='class="input"'/>
				&nbsp;
				���ĵ�λ��
				<html:text property="ReceiveArchive/archiveUnit/criteria/value" attributesText='class="input"'/>
				&nbsp;
				�ĺţ�
				<html:text property="ReceiveArchive/archiveCode/criteria/value" attributesText='class="input"'/>
				
			    <input name="query" type="button" class="button_02" value="�� ѯ" onClick="talentquery()">
				
				���������<input type="checkbox" name="checkbox" onClick="servertoorder()" marked=""> 
			</td>
      </tr>
	  <tr>
	  	<td class="text">
              	<input name="delete" type="button" class="button_02" value="ɾ ��" onClick="talentdelete()">
				<input name="view" type="button" class="button_02" value="�� ��" onClick="talentview()">
				<input name="ieprint" type="button" class="button_02" value="�� ӡ" onClick="iePrint()">
				<input name="export" type="button" class="button_02" value="�� ��" onClick="exporttoexcel()">
		</td>
	  </tr>
      <tr>
        <td height="10"> </td>
      </tr>
      <tr>
        <td valign="top" class="text">
		<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
                <tr class="td_title"> 
                  <td width="4%" align="center" nowrap> <input type="checkbox" name="checkbox" value="checkbox" onClick="eosCheckAll(document.forms[0],this)" marked=""> 
                  </td>
                  <td width="11%" align="center" nowrap id="ReceiveArchive.userID" onClick="talentsort()">�ĺ�</td>
                  <td width="18%" align="center" nowrap id="ReceiveArchive.operatorName" onClick="talentsort()">����</td>
                  <td width="13%" align="center" nowrap id="ReceiveArchive.status" onClick="talentsort()">���ĵ�λ</td>
                  <td width="12%" align="center" nowrap id="ReceiveArchive.cardID" onClick="talentsort()">��������</td>
                  <td width="15%" align="center" >������Ա</td>
                  <td width="13%" align="center" >��ǰ����</td>
                  <td width="18%" align="center" >����</td>
                </tr>
                <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  		%>
                <logic:iterate id="resultset" property="list[@type='receivelist']"> 
                <%
				     
						if(count%2==0)
							trClass = "td1";
						else
							trClass = "td2";
						count++;
			       %>
              <tr class="<%=trClass%>" onClick="changeTRBgColor(this)" onDblClick="talentviewf('<bean:write id="resultset" property="ReceiveArchive/receiveID"/>','true')">  
                <td align="center"> 
					<logic:present  id="resultset" property="ReceiveArchive/receiveID"> 
                  		<html:checkbox id="resultset" name="list[@name='update']/ReceiveArchive/receiveID" property="ReceiveArchive/receiveID" indexed="true"/> 
                  	</logic:present> 
				</td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="ReceiveArchive/archiveCode"/></td>
                <td nowrap title=<bean:write id="resultset" property="ReceiveArchive/archiveTitle"/>>&nbsp;<bean:write id="resultset" property="ReceiveArchive/archiveTitle" maxLength="20" maxLengthString="..."/></td>
                <td nowrap>&nbsp;
					<bean:write id="resultset" property="ReceiveArchive/archiveUnit"/>
				</td>
                <td nowrap>&nbsp;<bean:write id="resultset" property="ReceiveArchive/archiveDate" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl" formatType="yyyy-MM-dd"/></td>
                <td nowrap>&nbsp;
				<fcc:toname dom="resultset" path="ReceiveArchive/participant"/>
				</td>
				<td nowrap align="center"><bean:write id="resultset" property="ReceiveArchive/workItemName"/></td>
                <td nowrap>&nbsp;
                <logic:present id="resultset"  property="ReceiveArchive/currentState">
                <logic:notEqual id="resultset"  property="ReceiveArchive/currentState" value="">
                <a href="javascript:toWfSupervise('<bean:write id="resultset" property="ReceiveArchive/workItemID"/>','<bean:write id="resultset" property="ReceiveArchive/participant"/>')">����</a>
				</logic:notEqual>
                </logic:present>
                <a href="#" onmousedown="getWfLog('<bean:write id="resultset" property="ReceiveArchive/processInstID"/>','<bean:write id="resultset" property="ReceiveArchive/archiveTitle"/>')">������־</a>
				
				<logic:present id="resultset"  property="ReceiveArchive/activityDefID">
				  <logic:equal id="resultset"  property="ReceiveArchive/activityDefID" value="EndActivity">
				   <%
				   try{
				     String isEnd= base.util.TalentContext.getValue(pageContext,"resultset","ReceiveArchive/isEnd");				   
				 if(isEnd==null)isEnd="";
				 if(!isEnd.equals("1")){
				    %>
				      <a href="javascript:guiDang('<bean:write id="resultset" property="ReceiveArchive/receiveID"/>')">�鵵</a>
				   <%
				   }else if(isEnd.equals("1")){
				   %>
				    �ѹ鵵
				   <% 
				   }
				   }catch(Exception e){
				     System.out.println(e);
				   } %>
				  </logic:equal>
				</logic:present>
				</td>
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
	loadOrderImg(document.forms[0],'ReceiveArchive');
	
	//����ͼ�鿴
function getWfImageR(processInstID,title,tableName) {
	var url = "oa.prReceiveArchive.receiveWfImageForRollback.do?WFWorkItem/processInstID=" + processInstID;
	url += "&title=" + title;
	url += "&tableName=" + tableName;
	var current = new Date();
	var refresh = current.getTime();
	url += "&refresh=" + refresh;
	createWindow(url,50,50,800,400);

}

var userID = "<bean:write property="SessionEntity/userID"/>";
	function doProcess(url,RequestID,workItemID,processInstID,currentState,WFparticipant ,WFparticipantName){
		if(currentState == 4){
			if(confirm("��ȷ��Ҫ��������������")==false){
				return ;
			} 
		}
		var stUrl = url+"?ReceiveArchive/receiveID="+RequestID+"&WFWorkItem/workItemID="+workItemID+"&WFWorkItem/processInstID="+processInstID;
		if(currentState == 10 &&WFparticipant != null && WFparticipant != "" && userID != WFparticipant ){
			if(confirm("�ù��������ѱ�"+WFparticipantName+"��ȡ�ˣ��Ƿ�Ҫ��ȡ���Լ�������")==false){
				return ;
			} 
			stUrl = stUrl + "&WFWorkItem/reProcess=1";
		} 
		location.href = stUrl ; 
		//var frm = document.forms[0];
		//frm.action = stUrl;
		//frm.submit();
		
	}
	
function guiDang(archiveId){
	if(confirm("ȷʵҪ�鵵��")==true){
	 var loc="oa.prWatch.gd.do?archiveId="+archiveId+"&userId="+document.forms[0].elements["SessionEntity/operatorID"].value+"&EmpowerIDs=&gdType=0";
	   document.forms[0].action=loc;
	   document.forms[0].submit();
	}	  
	}
</script>