<%@include file="/internet/common.jsp"%>
<%@ page import="java.util.*;"%>
<%
        java.text.SimpleDateFormat df = new java.text.SimpleDateFormat(
                "yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        String currentDate = df.format(date);
        %>
<body>
	<form name="messageForm" method="post"><input type="hidden" name="SendMsg/MsgFormat" value=""> <input type="hidden"
			name="SendMsg/SendMsgID" value=""> <input type="hidden" name="SendMsg/DestAddrIsdnNum" value=""> <input type="hidden"
			name="SendMsg/AuthorID" value='<bean:write property="SessionEntity/operatorID"/>'> <input type="hidden"
			name="splitContent" value=""> <input type="hidden" name="SendMsg/DoneTime" value="<%=currentDate%>">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="24" background="image/lz_bg.gif">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="15"></td>
							<td class="text_wirte">��ҳ��&gt;һ��ͨ��&gt;���Ͷ���</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td height="8"></td>
			</tr>
			<tr>
				<td class="text">
					<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
						<tr>
							<td align="right" class="td2">�б������</td>
							<td class="td1"><input name="B3" type="button" class="button_02" title="����ϵͳ��û��¼�ĺ���" value="�ֶ�����"
									onclick="setMobile()"> <input name="btn" type="button" class="button_02" title="��ϵͳ��ѡ�����" value="����ѡ��"
									onclick="selectNamelist()"> <input name="B3" type="button" class="button_02" title="������к���" value="��պ���"
									onclick="clearList()"></td>
						</tr>
						<tr>
							<td width="12%" align="right" class="td2">�����б�
								<div id="mobileCount" align="right" style="color:#B51018" align="center"></div>
							</td>
							<td width="88%" class="td1"><font color="#B51018">��ʾ:˫�������б��е�ѡ�����ɾ���ú���</font><br>
								<select size="10" style="width:150" name="mobilenums" ondblclick="deleteOption(this)"></select></td>
						</tr>
						<tr>
							<td width="12%" align="right" class="td2">�Ƿ�������</td>
							<td width="88%" class="td1">
								<input type="radio" name="prefix" value="1" checked="checked" />��
								<input type="radio" name="prefix" value="0" />��
								<%
									com.primeton.tp.core.prservice.context.RequestContext reqContext = (com.primeton.tp.core.prservice.context.RequestContext) request.getAttribute(com.primeton.tp.web.driver.webdriver.WebDriver.REQUEST_REQUEST_CONTEXT);
									String userName=(String)reqContext.getProperty("SessionEntity/userName");
								%>
								<input type="hidden" name="prefixString" value=" ������:<%=userName %>��" />
							</td>
						</tr>
						<tr>
							<td align="right" class="td2">����ģʽ��</td>
							<td class="td1"><SELECT name="sendMode" style="width:150" onchange="setSendMode()">
									<OPTION value="1" selected>��ʱ����</OPTION>
									<OPTION value="2">��ʱ����</OPTION>
								</SELECT></td>
						</tr>
						<TR id="sendTimeTr" style="display:none">
							<TD width="8%" class="td2" nowrap align="right">����ʱ�䣺</TD>
							<TD class="td1"><input type="text" name="startDoneTime" size="20" value="2007-04-09 15:36:09" readonly="readonly"
									class="Standard-InputStyle"> <input type="button" value="..." onclick="PopUpCalendarDlg(startDoneTime)"
									title="���ѡ������ʱ��"></TD>
						</TR>
						<tr>
							<td align="right" class="td2">�������ݣ�
								<div id="contentCount" style="color:#B51018" align="right"></div>
							</td>
							<td class="td1"><textarea rows="8" name="SendMsg/MsgContent" onkeyup="countText(this)" cols="60"></textarea></td>
						</tr>


					</table>
					<table width="100%" height="30" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td align="center"><input name="Submit" type="button" onclick="save()" class="button_02" value="�� ��"> <input
									name="ret" type="button" onClick="history.go(-1)" class="button_02" value="�� ��">
							<td align="center"></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td class="text">&nbsp;</td>
			</tr>
		</table>
	</form>
</body>
<script language="JavaScript">
var frm=document.forms[0];
 
function save(){
  var msgFormat="";
  
  if(frm.elements["mobilenums"].options.length==0){
     			alert("�������ֻ����룡");
	   			frm.elements["mobilenums"].focus();
	   			return;
  }else{
   joinMobile();
  }
  
  if(frm.elements["SendMsg/MsgContent"].value.length==0){
	   			alert("������������ݣ�");
	   			frm.elements["SendMsg/MsgContent"].focus();
	   			return;
	   		}else{
	   		frm.elements["SendMsg/MsgFormat"].value=is_chinese(frm.elements["SendMsg/MsgContent"].value);	   			
	   		}
 	if(frm.elements["sendMode"].value==1){
	   			frm.elements["startDoneTime"].value="";
	   		}
	frm.elements["SendMsg/MsgFormat"].value=is_chinese(document.forms[0].elements["SendMsg/MsgContent"].value);
	   splitContent();
	   frm.action="ICCard.prMsg.saveMsg.do";
	   frm.submit();
}
 
function joinMobile(){
  var obj=frm.elements["mobilenums"];
  var mobiles="";
  var len=obj.options.length;
  if(len>0){
     for(var i=0;i<len;i++){
         var theValue=obj.options[i].value;
         if(mobiles==""){
           mobiles=theValue;
         }else{
           mobiles+="|"+theValue;
         }
     }//for
  }//end if  
  frm.elements["SendMsg/DestAddrIsdnNum"].value=mobiles;
}
function clearList(){
			if(window.confirm("ȷ�������������б���")){
				var len = messageForm.mobilenums.options.length;				
				for(i=0;i<=len;i++){				
					messageForm.mobilenums.remove(0);
				}
				countMobile(messageForm.mobilenums);
			}
		}
 
function countMobile(ctrlobj){
			document.all.mobileCount.innerText="["+ctrlobj.options.length+"����]";//"��ǰ����������"+ctrlobj.options.length;
		}
//-------------------------------------------------------------------------------------------------------------		
function setSendMode(){
var mode=frm.elements["sendMode"].value;
 if(mode=="1"){
    sendTimeTr.style.display="none";
 }else{
  sendTimeTr.style.display="";
 }
 
}
//-------------------------------------------------------------------------------------------------------------
function setMobile(){
  var remark=new Date().getTime();
  var loc="ICCard.prMsg.setMobile.do?remark="+remark;
  retval =window.showModalDialog(loc,"","dialogWidth:300px;DialogHeight=150px;status:yes;scroll:yes"); 
  if( retval!= null ){				
	addOption(retval,retval);
			}
}
 
	function addOption(textval,val){
			var oOption = document.createElement("OPTION");
			oOption.text=textval;
			oOption.value=val;
			messageForm.mobilenums.add(oOption);
			countMobile(messageForm.mobilenums);
		}
//--------------------------------------------------------------------------------------------------------------		
	function countMobile(ctrlobj){
			document.all.mobileCount.innerText="["+ctrlobj.options.length+"������]";//"��ǰ����������"+ctrlobj.options.length;
		}
		
		function deleteOption(ctrlobj){
			if(ctrlobj.value=="" && ctrlobj.innerText=="")
				return;
			if(window.confirm("ȷ��ɾ���ú�����")){							
				messageForm.mobilenums.remove(ctrlobj.selectedIndex);
				countMobile(messageForm.mobilenums);
			}
		}
//----------------------------------------------------------------------------------------------------------		
 function selectNamelist(){
        var remark=new Date().getTime();
		var loc="ICCard.prMsg.selectMobile.do?remark="+remark;
		var obj=frm.elements["mobilenums"];
	    frm.elements["btn"].style.disabled="none";
	    window.open(loc,"","width=500px,height=380,status=yes,top=180,left=180,scroll=yes");
	    }	
//------------------------------------------------------------------------------------------------------------
 function init(){
    document.all.mobileCount.innerText="[0������]";
    document.all.contentCount.innerText="[0����]";
 }
 //--------------------------------------------------------------------------------------------
 function countText(ctrlobj){
			document.all.contentCount.innerText="["+ctrlobj.value.length+"��]";//��ǰ����ͳ�ƣ�"+ctrlobj.value.length;
		}
 
 
 
//-----------------------------------------------------------------------------------------------------------
function splitContent(){//�������
      var content=document.forms[0].elements["SendMsg/MsgContent"].value;
	  var len=content.length;
	  var canD0=true;
      var count=0;
	  var from=document.getElementById('prefixString').value;//10
	  var theEnd="(����)";
	  var append="(����)";
      var array=new Array();
      var splitContent="";
      var lenLimit=61;
      var contentLimit=50;
	  while(canD0){
	      if(count==0){
	      	if(document.getElementsByName('prefix')[1].checked==false)
				 array[array.length]=content+from;
			else
				 array[array.length]=content;
			canD0=false;
		  }
	  }//end while
 
	  for(var i=0;i<array.length;i++){
	 //   alert(i+"::"+array[i]);
	    if(splitContent==""){
	       splitContent=array[i];
	    }else{
	       splitContent+="@@@"+array[i];
	    }
	  }
	  document.forms[0].elements["splitContent"].value=splitContent;
	//alert(splitContent);
}
//----------------------------------------------------------------------------------------
function is_chinese(elem){
	var pattern=/[^\x00-\xff]/g;
	if(pattern.test(elem)){
	  //��������	
		return 1;
	}else{	  //����������
	 
	  return 0;
	}
}
 
 init();
</script>