<%@ include file="/internet/common.jsp" %>
<%@ page import="org.w3c.dom.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.Date"%>

<%
com.primeton.tp.core.prservice.context.RequestContext reqContext = (com.primeton.tp.core.prservice.context.RequestContext) request.getAttribute(com.primeton.tp.core.prservice.context.RequestContext.REQUEST_REQUEST_CONTEXT);
String totalnum = "";//��ʹ�õĿռ�
String unread = "";//û�����ʼ�
String mailnum = "";//�ʼ���
String capcity ="";//��������

Node mail = reqContext.getEntity("list[@type='TOOL_MAIL']");//�ܹ����ʼ���
if(mail!=null){mailnum = String.valueOf(mail.getChildNodes().getLength());}

Node total = (reqContext.getEntity("list[@type='totalnum']/entity")).getChildNodes().item(0);
totalnum = total.getFirstChild().getNodeValue();
if(totalnum==null||"".equals(totalnum)){
 	totalnum = "0MB";
}else{
    totalnum += "Byte";
}



Node unreadnode = (reqContext.getEntity("list[@type='mailunread']/entity")).getChildNodes().item(0);
unread = unreadnode.getFirstChild().getNodeValue();
if(unread==null||"".equals(unread)) totalnum = "0";

capcity = reqContext.getEntityValue("TOOL_MailDirectory/MAILCAPACITY");//��������
if("".equals(capcity)||capcity==null){
	 capcity = "60MB";
}else{
	capcity +="MB";
}
%>
<%
String folderName = "";
String fid = reqContext.getEntityValue("fid");


if(fid.equals("0")){
	folderName = "�ռ���";
}else if(fid.equals("1")){
	folderName = "������";
}else if(fid.equals("2")){
	folderName = "�ݸ���";
}else if(fid.equals("3")){
	folderName = "������";
}else{
	String fname = request.getParameter("fname");
	folderName = fname;
}
%>
<script language="javascript">
function menuControl(show)
{
window.event.cancelBubble=true;
var objID=event.srcElement.id;
var index=objID.indexOf("_");
var mainID=objID.substring(0,index);
var numID=objID.substring(index+1,objID.length);

if(show==1)
{
eval("showMenu("+"menu_"+numID+")");
}
else
{
eval("hideMenu("+"menu_"+numID+")");
}


}

var nbottom=0,speed=11;
function displayMenu(obj)
{
obj.style.clip="rect(0 100% "+nbottom+"% 0)";
nbottom+=speed;
if(nbottom<=100) 
{
timerID=setTimeout("displayMenu("+obj.id+"),70");
}
else clearTimeout(timerID);
}
function showMenu(obj)
{var parent = event.srcElement;
obj.style.display="block";
//obj.style.clip="rect(0 0 0 0)";
obj.style.top = ylib_getPageY(parent)+18;
obj.style.left = ylib_getPageX(parent);
//nbottom=5;
//displayMenu(obj);
}
function hideMenu(obj)
{
nbottom=0;
obj.style.display="none";
}
function keepMenu(obj)
{
obj.style.display="block";
}

function ylib_getPageX(o) { 
	var x=0;
	{ while(eval(o)) { 
		x+=o.offsetLeft; o=o.offsetParent; 
	} 
  } 
return x; 
}
function ylib_getPageY(o) {
 	var y=0; 
 	{ while(eval(o)) {
		 y+=o.offsetTop; o=o.offsetParent;
		  } 
	} 
	return y;
 }
</script>
<form name="queryForm" method="post" action="oa.prPersonOffice.mailreceive.do">
<html:hidden property="PageCond/begin" />
<html:hidden property="PageCond/length" />
<html:hidden property="PageCond/count" />
<html:hidden property="Order/col1"/>
<html:hidden property="Order/col1/@order"/>
<input type="hidden" name="mark" value="1">
<input type="hidden" name="fid" value="<%=fid%>">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="24" background="/internet/image/lz_bg.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="12"></td>
        <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;���˰칫��&gt;<%=folderName%></td>
      </tr>
    </table></td>
  </tr>
</table>
  <table width="96%" height="30"  border="0" align="center" cellpadding="0" cellspacing="0" class="text">
    <tr>
      <td align="left"> <%=folderName%>����<span class="text_red"><%=mailnum%></span>���ʼ�������δ���ʼ�<span class="text_red"><%=unread%></span>��</td>
    </tr>
  </table>
  <table width="98%" height="30"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td align="center"><input name="Submit2" type="button" class="button_02" value="�� ��" onClick="history.back()">
                    <input name="Submit_2" type="button" class="button_02" value="�� ��" id="Submit_2" onmousedown="menuControl(1)" onmouseout="menuControl(0)">
                    <%
						if(fid.equals("0")){
					%>
                    <input name="Submit_3" type="button" class="button_02" value="�ظ��ʼ�" id="Submit_3" onmousedown="menuControl(1)" onmouseout="menuControl(0)">
					<%
						}
					%>
                    <%
						if(!fid.equals("3")){
					%>
                    <input name="Submit42" type="button" class="button_02" value="ɾ ��" onClick="mailToDustbin()">
					<%
						}
					%>
					<%
						if(fid.equals("3")){
					%>
					<input name="Submit_4" type="button" class="button_02" value="���������" id="Submit_4" onmousedown="menuControl(1)" onmouseout="menuControl(0)">
					<%
						}
					%>
                    <input name="Submit5" type="button" class="button_02" value="����ɾ��" onClick="deleteRows()">
                    
                    <input name="Submit_1" type="button" class="button_02" value="ת���ʼ�" id="Submit_1" onmousedown="menuControl(1)" onmouseout="menuControl(0)" >
                   <!-- <select name="select2" onChange="jumpdo(this.value,this.options[selectedIndex].text)">
                      <option selected>��ѡ����ת�ʼ���</option>
					  <logic:iterate id="mailfolder" property="SessionEntity/list[@type='foldermanage']">
					    <logic:notEqual id="mailfolder" property="Folder/FolderId" value="<%=fid%>">
                          <option value='<bean:write id="mailfolder" property="Folder/FolderId"/>'><bean:write id="mailfolder" property="Folder/FolderName"/></option>
					    </logic:notEqual>
					  </logic:iterate>
                    </select>-->
      </td>
    </tr>
  </table>
  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="listdetail">
    <tr class="tdtitle">
      <td width="5%" align="center" class="td_title"><input type="checkbox" name="checkbox" onclick="eosCheckAll(document.forms[0],this)" /></td>
      <td width="3%" align="center" class="td_title">��</td>
      <td width="3%" align="center" class="td_title">��</td>
      <td width="3%" align="center" class="td_title">&nbsp;</td>
      <td id="TITLE" width="39%" align="center" class="td_title" onClick="talentsort()">�ʼ�����</td>
      <td id="POSTUSERNAME" width="18%" align="center" class="td_title" onClick="talentsort()">������</td>
      <td id="SENDDATE" width="21%" align="center" class="td_title" onClick="talentsort()">ʱ��</td>
      <td id="MAILSIZE" width="11%" align="center" class="td_title" onClick="talentsort()">��С(Byte)</td>
    </tr>
    <%
		             int count=0;
			         String trClass = "result_content"; 
		  
		  %>
		  <logic:iterate id="ResultSet" property="list[@type='TOOL_MAIL']">
		          <%
			       	if(count%2==0)
			       	    trClass = "td1";
			       	else
			       	    trClass = "td2";
			       	count++;
			       %>
          <tr class="<%=trClass%>" onclick="changeTRBgColor(this)" onDblClick="toViewMail('<bean:write id="ResultSet" property="TOOL_Mail/MAILID"/>')"> 
            <td align="center" class="text">
			<logic:present  id="ResultSet" property="TOOL_Mail/MAILID">
		                    	<html:checkbox name="list[@name='update']/TOOL_Mail/MAILID" id="ResultSet" property="TOOL_Mail/MAILID" indexed="true" attributesText="marked='fcc'"/>
		    </logic:present>
			</td>
            <td align="center" class="text">
			<logic:equal id="ResultSet" property="TOOL_Mail/PRIORITY" value="1">
			  <img src="/internet/images/mail_hight.gif" alt="��Ҫ�ʼ�" align="absmiddle">
			</logic:equal>
			</td>
            <td align="center" class="text">
			<logic:notEqual id="ResultSet" property="TOOL_Mail/ATTACH" value="0">
			  <img src="/internet/image/mail_atth.gif" alt='<bean:write id="ResultSet" property="TOOL_Mail/ATTACH"/>������' align="absmiddle">
			</logic:notEqual>
			</td>
			<td align="center" class="text">
			<logic:equal id="ResultSet" property="TOOL_Mail/READFLAG" value="0">
			  <img src="/internet/image/Email.gif" alt='δ��' align="absmiddle">
			</logic:equal>
			<logic:equal id="ResultSet" property="TOOL_Mail/READFLAG" value="1">
			  <img src="/internet/image/mailstateyes.gif" alt='�Ѷ�' align="absmiddle">
			</logic:equal>
			</td>
            <td align="left" nowrap class="text">&nbsp;
			<logic:notEqual property="fid" value="2">
				<logic:equal id="ResultSet" property="TOOL_Mail/READFLAG" value="0">
					<a href="javascript:toViewMail('<bean:write id="ResultSet" property="TOOL_Mail/MAILID"/>')" title='<bean:write id="ResultSet" property="TOOL_Mail/TITLE"/>' class="no"><bean:write id="ResultSet" property="TOOL_Mail/TITLE" maxLength="16"/></a>
				</logic:equal>
				<logic:equal id="ResultSet" property="TOOL_Mail/READFLAG" value="1">
					<a href="javascript:toViewMail('<bean:write id="ResultSet" property="TOOL_Mail/MAILID"/>')" title='<bean:write id="ResultSet" property="TOOL_Mail/TITLE"/>' class="yes"><bean:write id="ResultSet" property="TOOL_Mail/TITLE" maxLength="16"/></a>
				</logic:equal>
			</logic:notEqual>
			
			<logic:equal property="fid" value="2">
				<logic:equal id="ResultSet" property="TOOL_Mail/READFLAG" value="0">
					<a href='tools.pr.mailfromdraft.do?TOOL_Mail/MAILID=<bean:write id="ResultSet" property="TOOL_Mail/MAILID"/>' class="no">
						<bean:write id="ResultSet" property="TOOL_Mail/TITLE" maxLength="16"/>
					</a>
				</logic:equal>
				
				<logic:equal id="ResultSet" property="TOOL_Mail/READFLAG" value="1">
					<a href='oa.prPersonOffice.mailfromdraft.do?TOOL_Mail/MAILID=<bean:write id="ResultSet" property="TOOL_Mail/MAILID"/>' class="yes">
						<bean:write id="ResultSet" property="TOOL_Mail/TITLE" maxLength="16"/>
					</a>
				</logic:equal>
				
				
			</logic:equal>
			</td>
            <td align="left" nowrap class="text">&nbsp;
			<logic:equal id="ResultSet" property="TOOL_Mail/READFLAG" value="0">
			<span style="font-weight:bold">
			<bean:write id="ResultSet" property="TOOL_Mail/POSTUSERNAME" formatClass="username" formatType="userid"/>
			</span>
			</logic:equal>
			
			<logic:equal id="ResultSet" property="TOOL_Mail/READFLAG" value="1">
			<span>
			<bean:write id="ResultSet" property="TOOL_Mail/POSTUSERNAME" formatClass="username" formatType="userid"/>
			</span>
			</logic:equal>
			
			</td>
            <td align="left" nowrap class="text">
			<logic:equal id="ResultSet" property="TOOL_Mail/READFLAG" value="0">
			<span style="font-weight:bold">
			<bean:write id="ResultSet" property="TOOL_Mail/SENDDATETEMP"/>
			</span>
			</logic:equal>
			
			<logic:equal id="ResultSet" property="TOOL_Mail/READFLAG" value="1">
			<span>
			<bean:write id="ResultSet" property="TOOL_Mail/SENDDATETEMP"/>
			</span>
			</logic:equal>
			</td>
            <td align="right" nowrap>
			<logic:equal id="ResultSet" property="TOOL_Mail/READFLAG" value="0">
			<span style="font-weight:bold">
			<bean:write id="ResultSet" property="TOOL_Mail/MAILSIZE"/>
			</span>
			</logic:equal>
			<logic:equal id="ResultSet" property="TOOL_Mail/READFLAG" value="1">
			<span>
			<bean:write id="ResultSet" property="TOOL_Mail/MAILSIZE"/>
			</span>
			</logic:equal>
			</td>
          </tr>
		  </logic:iterate>
  </table>
  <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="30" class="text"><script>
				PageCond(document.forms[0]);
		     </script>
      </td>
    </tr>
  </table>
  <table width="98%" height="30"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td align="center"><input name="Submit2" type="button" class="button_02" value="�� ��" onClick="history.back()">
                    <input name="Submit_2" type="button" class="button_02" value="�� ��" id="Submit_2" onmousedown="menuControl(1)" onmouseout="menuControl(0)">
                    <%
						if(fid.equals("0")){
					%>
                    <input name="Submit_3" type="button" class="button_02" value="�ظ��ʼ�" id="Submit_3" onmousedown="menuControl(1)" onmouseout="menuControl(0)">
					<%
						}
					%>
                    <%
						if(!fid.equals("3")){
					%>
                    <input name="Submit42" type="button" class="button_02" value="ɾ ��" onClick="mailToDustbin()">
					<%
						}
					%>
					<%
						if(fid.equals("3")){
					%>
					<input name="Submit_4" type="button" class="button_02" value="���������" id="Submit_4" onmousedown="menuControl(1)" onmouseout="menuControl(0)">
					<%
						}
					%>
                    <input name="Submit5" type="button" class="button_02" value="����ɾ��" onClick="deleteRows()">
                    
                    <input name="Submit_1" type="button" class="button_02" value="ת���ʼ�" id="Submit_1" onmousedown="menuControl(1)" onmouseout="menuControl(0)" >
                   <!-- <select name="select2" onChange="jumpdo(this.value,this.options[selectedIndex].text)">
                      <option selected>��ѡ����ת�ʼ���</option>
					  <logic:iterate id="mailfolder" property="SessionEntity/list[@type='foldermanage']">
					    <logic:notEqual id="mailfolder" property="Folder/FolderId" value="<%=fid%>">
                          <option value='<bean:write id="mailfolder" property="Folder/FolderId"/>'><bean:write id="mailfolder" property="Folder/FolderName"/></option>
					    </logic:notEqual>
					  </logic:iterate>
                    </select>-->
      </td>
    </tr>
  </table>
  <div id="menu_2" style="position:absolute; top:263px; width:306px; height:175px; z-index:1; left: 41px; visibility: visible; display: none;" onMouseOver="keepMenu(this)" onMouseOut="hideMenu(this)" class="div">
					<%
						SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd");
						String now = sdf.format(new Date());
					%>
                      <table width="104%" height="174"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="Menu_OutTable">
                        <tr>
                          <td><table width="96%" height="163"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
                              <tr>
                                <td width="27%" align="right" class="text">�����ˣ�</td>
                                <td width="73%" align="left" class="text">
								<input name="sendman" type="text" size="24" class="input">
								<html:hidden property="TOOL_Mail/POSTUSERNAME[@criteria='like']"/>
								</td>
                              </tr>
                              <tr>
                                <td align="right" class="text">�ʼ����⣺</td>
                                <td align="left" class="text">
								<input name="mailtitle" type="text" size="24" class="input">
								<html:hidden property="TOOL_Mail/TITLE[@criteria='like']"/>
								</td>
                              </tr>
                              <tr>
                                <td align="right" class="text"> &nbsp;�������ڣ�</td>
                                <td align="left" class="text">
								<input name="senddate" type="text" size="24" class="input">
								<html:hidden property="TOOL_Mail/SENDDATE[@criteria='like']"/>
								</td>
                              </tr>
                              <tr>
                                <td colspan="2" align="left" class="text">&nbsp;
                                    <input type="checkbox" name="tmailnow" id="tmailnow" value="<%=now%>">
                          �����ʼ�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         
						  <html:checkbox property="TOOL_Mail/READFLAG" value="0"/>
						  
                          δ���ʼ�</td>
                              </tr>
                              <tr>
                                <td colspan="2" align="left" class="text">&nbsp;
                                   
									<html:checkbox property="TOOL_Mail/PRIORITY" value="1"/>
									
                          �����ʼ�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         
						  <html:checkbox property="TOOL_Mail/MAILTYPE" value="0"/>
						  
                          �ⲿ�ʼ�</td>
                              </tr>
                              <tr align="center">
                                <td colspan="2" class="text"><input name="Submit22" type="button" class="button_02" value="ȷ ��" onClick="query()">
                                    <input name="Submit222" type="reset" class="button_02" value="�� ��">
            </td>
                              </tr>
                            </table>
                              <span class="text"> </span>
                              <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
                            </table></td>
                          <td width="4" bgcolor="#DBDBDB"> </td>
                          <td width="1"> </td>
                        </tr>
                        <tr bgcolor="#A9A9A9">
                          <td height="4" colspan="3"> </td>
                        </tr>
                        <tr>
                          <td height="1" colspan="3"> </td>
                        </tr>
                      </table>
 </div>
 <div id="menu_3" style="position:absolute; top:267px; width:190px; height:117px; z-index:1; left: 392px; visibility: visible;display:none" onMouseOver="keepMenu(this)" onMouseOut="hideMenu(this)" class="div">
                      <table width="104%" height="118"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="Menu_OutTable">
                        <tr>
                          <td><table width="96%" height="105"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
                              <tr>
                                
              <td width="27%" align="left" class="text"> &nbsp;<a href="javascript:reAnswer(0,0)">����</a> 
              </td>
                              </tr>
                              <tr>
                                
              <td align="left" class="text"> &nbsp;<a href="javascript:reAnswer(0,1)">���ţ�����ԭ�ģ�</a></td>
                              </tr>
                              <tr>
                                
              <td align="left" class="text">&nbsp;<a href="javascript:reAnswer(1,0)">�������˻���</a> 
              </td>
                              </tr>
                              <tr>
                                
              <td align="left" class="text">&nbsp;<a href="javascript:reAnswer(1,1)">�������˻��ţ�����ԭ�ģ�</a></td>
                              </tr>
                            </table>
                              <span class="text"> </span>
                              <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
                            </table></td>
                          <td width="4" bgcolor="#DBDBDB"> </td>
                          <td width="1"> </td>
                        </tr>
                        <tr bgcolor="#A9A9A9">
                          <td height="4" colspan="3"> </td>
                        </tr>
                        <tr>
                          <td height="1" colspan="3"> </td>
                        </tr>
                      </table>
</div>
<div id="menu_1" style="position:absolute; top:267px; width:74px; height:85px; z-index:1; left: 619px; visibility: visible;display:none" onMouseOver="keepMenu(this)" onMouseOut="hideMenu(this)" class="div">
                      <table width="104%" height="92"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="Menu_OutTable">
                        <tr>
                          <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
                              <logic:iterate id="mailfolders" property="SessionEntity/list[@type='foldermanage']">
							     <logic:notEqual id="mailfolders" property="Folder/FolderId" value="<%=fid%>">
							        <tr>
                                       <td align="left" class="text">&nbsp;<a href="#" onClick='moveMail("<bean:write id="mailfolders" property="Folder/FolderId"/>","<%=folderName%>")'><bean:write id="mailfolders" property="Folder/FolderName"/></a></td>
                                   </tr>
							  </logic:notEqual>
                              </logic:iterate>
                          </table></td>
                          <td width="4" bgcolor="#DBDBDB"> </td>
                          <td width="1"> </td>
                        </tr>
                        <tr bgcolor="#A9A9A9">
                          <td height="4" colspan="3"> </td>
                        </tr>
                        <tr>
                          <td height="1" colspan="3"> </td>
                        </tr>
                      </table>
</div>
<div id="menu_4" style="position:absolute; top:267px; width:119px; height:117px; z-index:1; left: 742px; visibility: visible;display:none" onMouseOver="keepMenu(this)" onMouseOut="hideMenu(this)" class="div">
                      <table width="104%" height="118"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="Menu_OutTable">
                        <tr>
                          <td><table width="96%" height="93"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
            <tr> 
              <td width="27%" align="left" class="text"> &nbsp;<a href="#" onClick="reputone()">��ԭѡ���ʼ�</a></td>
            </tr>
            <tr> 
              <td align="left" class="text"> &nbsp;<a href="#" onClick="reputall()">��ԭ�����ʼ�</a></td>
            </tr>
            <tr> 
              <td align="left" class="text">&nbsp;<a href="#" onClick="clearall()">��������ʼ�</a></td>
            </tr>
          </table>
                              <span class="text"> </span>
                              <table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
                            </table></td>
                          <td width="4" bgcolor="#DBDBDB"> </td>
                          <td width="1"> </td>
                        </tr>
                        <tr bgcolor="#A9A9A9">
                          <td height="4" colspan="3"> </td>
                        </tr>
                        <tr>
                          <td height="1" colspan="3"> </td>
                        </tr>
                      </table>
</div>
</form>



<script language="JavaScript">
    function mailToDustbin(){
	  	var frm =document.forms[0];
   		if(chechedCount(frm)<1){
    		alert("���ٱ���ѡ��һ�н���ɾ����");
    		return ;
    	}
    	if(confirm("�Ƿ�ȷ��ɾ��ָ����¼��")==false){
			return ;
		}    	
    	 
    
    	frm.action="oa.prPersonOffice.mailToDustbin.do";
    	frm.submit();
	
	}
    function chechedCount(form){
		var length =0;
	    var i=0;
	    var count =0;
		eles = form.elements;
		while(i<eles.length){
			obj= eles[i];
			if(obj.type == "checkbox"&&obj.name.indexOf("MAILID")>=0){
				
				if(obj.checked){
				  count++;
				  
			     }
			}
			i++;
		}
		
		return count;
	}

	function deleteRows(){
    	var frm =document.forms[0];
   		if(chechedCount(frm)<1){
    		alert("���ٱ���ѡ��һ�н���ɾ����");
    		return ;
    	}
    	if(confirm("�Ƿ�ȷ��ɾ��ָ����¼��")==false){
			return ;
		}    	
    	 
    
    	frm.action="oa.prPersonOffice.mailDelete.do";
    	frm.submit();
    }
    
</script>
<script language="JavaScript">
  function query(){
    //var marked= true;
	
  	var frm = document.queryForm;
	//var action =frm.action;
	var tsendman = frm.elements["TOOL_Mail/POSTUSERNAME[@criteria='like']"];//������
	var tmailtitle = frm.elements["TOOL_Mail/TITLE[@criteria='like']"];//�ʼ�����
	var tsenddate = frm.elements["TOOL_Mail/SENDDATE[@criteria='like']"];//��������
	
	var tmailnow = frm.elements["tmailnow"];//�����ʼ�
	
	var psendman = frm.elements["sendman"];
	var pmailtitle = frm.elements["mailtitle"];
	var psenddate = frm.elements["senddate"];
	
	tsendman.value = "";//���
	tmailtitle.value = "";//���
	tsenddate.value = "";//���
	if(psendman.value!=null&&psendman.value!="") {tsendman.value="%"+psendman.value+"%";}
	if(pmailtitle.value!=null&&pmailtitle.value!="") {tmailtitle.value="%"+pmailtitle.value+"%";}
	if(psenddate.value!=null&&psenddate.value!="") {tsenddate.value="%"+psenddate.value+"%";}
	
	
	
	if(tmailnow.checked) {
		tsenddate.value = tmailnow.value;
		if(tsenddate.value!=null&&tsenddate.value!="") {tsenddate.value="%"+tsenddate.value+"%";}
	}
	
	
	
	
	frm.elements["PageCond/begin"].value=0;
	frm.elements["PageCond/count"].value=-1;
	
	frm.submit();
  
  }
  
  function jumpdo(fid,fname){
    
  	var frm = document.forms[0];
	var action = frm.action;
	var ele = frm.elements;
	for(i=0;i<ele.length;i++){
		if(ele[i].type =="text") ele[i].value = "";
		if(ele[i].type =="hidden") ele[i].value = "";
		if(ele[i].type =="checkbox") ele[i].checked = false;
	}
	action += "?fid=" + fid + "&fname="+fname;
	frm.action = action;
	frm.submit();
  
  }
  
  function moveMail(tofid,fname){
  	var frm = document.forms[0];
	if(chechedCount(frm)<1){
    		alert("���ٱ���ѡ��һ�н���ת�ƣ�");
    		return ;
    	}
    	if(confirm("�Ƿ�ȷ��ת��ָ����¼��")==false){
			return ;
		}    
	var action = "oa.prPersonOffice.mailMove.do?tofid="+tofid+"&fname="+fname;
	frm.action = action;
	frm.submit();
	
  
  }
  
  function clearall(){
  		var frm = document.forms[0];
		if(confirm("�Ƿ����Ҫ�����������")==false){
			return ;
		}
		frm.action = "oa.prPersonOffice.mailClearAll.do";
		frm.submit();
			
  
  }
  
  function reputall(){
    var frm = document.forms[0];
	if(confirm("�Ƿ����Ҫ��ԭ�������������ʼ���")==false){
			return ;
		}   	
    frm.action = "oa.prPersonOffice.mailPutAll.do";
	frm.submit();
  }
  
  function reputone(){
  	var frm =document.forms[0];
   	if(chechedCount(frm)<1){
    		alert("���ٱ���ѡ��һ�н��л�ԭ��");
    		return ;
    }
    if(confirm("�Ƿ�ȷ����ԭָ����¼��")==false){
			return ;
	}
	frm.action = "oa.prPersonOffice.mailPutOne.do";
    frm.submit();
  }
  
  function toViewMail(mailid){
  	var frm = document.forms[0];
	var where =frm.elements["fid"].value;
	var url = "?";
	var frmaction = "oa.prPersonOffice.mailView.do";
	url+="TOOL_Mail/MAILID="+mailid;
	frmaction+=url;
	frm.action = frmaction;
	if(where=="2") frm.action = "oa.prPersonOffice.mailfromdraft.do"+url;
	frm.submit();
  
  }
  
  function reAnswer(mailpersonflag,mailcontentflag){
	var frm = document.forms[0];
	var valueid = "";
	if(chechedCount(frm)<1){
    	alert("���ٱ���ѡ��һ�У�");
    	return ;
    }
	
	if(chechedCount(frm)>1){
    	alert("ֻ��ѡ��һ�У�");
    	return ;
    }
	
	if(chechedCount(frm)==1){
		valueid = chechedCountValue(form);
	}
	if(valueid==""||valueid==null) return;
	var action = "oa.prPersonOffice.mailtoexpand.do";
	var url="?mailpersonflag=" + mailpersonflag + "&mailcontentflag=" + mailcontentflag + "&TOOL_Mail/MAILID=" + valueid;
	action += url;
	frm.action = action;
	frm.submit();

}

function chechedCountValue(form){
		var length =0;
	    var i=0;
	    var count =0;
		eles = form.elements;
		while(i<eles.length){
			obj= eles[i];
			if(obj.type == "checkbox"&&obj.getAttribute("marked")=="fcc"){
				
				if(obj.checked){
				  count = obj.value;
				  break;
				  
			     }
			}
			i++;
		}
		
		return count;
	}
  
</script>