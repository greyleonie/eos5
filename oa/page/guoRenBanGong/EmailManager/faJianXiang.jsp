<head>














<title>������ί��У��Ϣһ�廯ƽ̨</title>
<script language="JavaScript" src="../../script/public.js"></script>
<script language="JavaScript" src="../../script/fccsort.js"></script>
<script language="JavaScript" src="../../script/fcccalendar.js"></script>
<script language="JavaScript" src="../../script/fccpage.js"></script>
<script language="JavaScript" src="../../script/fccvalidator.js"></script>
<script>
webcontext = "../../";
</script>

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

<script language="JavaScript" src="../../script/public.js"></script>
<script language="JavaScript" src="../../script/fccsort.js"></script>
<script language="JavaScript" src="../../script/fcccalendar.js"></script>
<script language="JavaScript" src="../../script/fccpage.js"></script>
<script language="JavaScript" src="../../script/fccvalidator.js"></script>
<script>
webcontext = "../../";
</script>
<!-- Insert your jsp/html code here -->
<link href="../../INDEX.css" rel="stylesheet" type="text/css" />
<form name="queryForm" method="post" action="tools.pr.mailreceive.do">
<input type="hidden" name="dataEntity/_order/col1/field" value="me">
<input type="hidden" name="dataEntity/_order/col1/asc" value="ASC">
<input type="hidden" name="PageCond/begin" value="0">
<input type="hidden" name="PageCond/count" value="65">
<input type="hidden" name="PageCond/length" value="20">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="24" background="../../image/lz_bg.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="12"></td>
        <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;���˰칫��&gt;�ݸ���</td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td> </td>
  </tr>
</table>
<table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" class="text">
          <tr>
            <td align="left"> �ļ�������<span class="text_red">0</span>���ʼ�������δ���ʼ�<span class="text_red">0</span>��</td>
          </tr>
      </table></td>
  </tr>
</table>
<table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td></td>
  </tr>
</table>
<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="0" class="text">
  <tr>
    <td align="right"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="9">&nbsp;</td>
        <td align="center"><input name="Submit2" type="button" class="button_02" value="�� ��" onclick="history.back()" />
              <input name="Submit_2" type="button" class="button_02" value="�� ��" id="Submit_2" onmousedown="menuControl(1)" onmouseout="menuControl(0)" />
              <input name="Submit42" type="button" class="button_02" value="ɾ ��" onclick="mailToDustbin()" />
              <input name="Submit5" type="button" class="button_02" value="����ɾ��" onclick="deleteRows()" />
              <input name="Submit_1" type="button" class="button_02" value="ת���ʼ�" id="Submit_1" onmousedown="menuControl(1)" onmouseout="menuControl(0)">
              <select name="select2" onchange="jumpdo(this.value,this.options[selectedIndex].text)">
                <option selected="selected">��ѡ����ת�ʼ���</option>
                <option value='0'>�ռ���</option>
                <option value='2'>�ݸ��</option>
                <option value='3'>������</option>
                <option value='5'>admin</option>
              </select>
        </td>
        <td width="9">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td></td>
  </tr>
</table>
<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CBCBCB">
  <tr class="td_title">
    <td align="center"><input type="checkbox" name="checkbox" fccmarked="fcc" onclick="eosCheckAll(document.queryForm,this)" /></td>
    <td align="center">��</td>
    <td align="center">��</td>
    <td align="center">&nbsp;</td>
    <td align="center" ondblclick="eosOrderBy('TITLE')">�ʼ�����</td>
    <td align="center" ondblclick="eosOrderBy('POSTUSERNAME')">������</td>
    <td align="center" ondblclick="eosOrderBy('SENDDATE')">ʱ��</td>
    <td align="center" ondblclick="eosOrderBy('MAILSIZE')">��С(Byte)</td>
  </tr>
  <tr class="td1">
    <td width="4%" align="center">&nbsp;</td>
    <td width="3%" align="center">&nbsp;</td>
    <td width="3%" align="center">&nbsp;</td>
    <td width="3%" align="center"><img src="../images/yd.gif" width="14" height="12" /></td>
    <td width="34%" align="center" ondblclick="eosOrderBy('TITLE')">&nbsp;</td>
    <td width="17%" align="center" ondblclick="eosOrderBy('POSTUSERNAME')">&nbsp;</td>
    <td width="20%" align="center" ondblclick="eosOrderBy('SENDDATE')">&nbsp;</td>
    <td width="16%" align="center" ondblclick="eosOrderBy('MAILSIZE')">&nbsp;</td>
  </tr>
</table>
<table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td></td>
  </tr>
</table>
<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="0" class="text">
  <tr>
    <td align="right"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="9">&nbsp;</td>
        <td align="center"><input name="Submit23" type="button" class="button_02" value="�� ��" onclick="history.back()" />
              <input name="Submit_22" type="button" class="button_02" value="�� ��" id="Submit_22" onmousedown="menuControl(1)" onmouseout="menuControl(0)" />
              <input name="Submit422" type="button" class="button_02" value="ɾ ��" onclick="mailToDustbin()" />
              <input name="Submit52" type="button" class="button_02" value="����ɾ��" onclick="deleteRows()" />
              <input name="Submit_12" type="button" class="button_02" value="ת���ʼ�" id="Submit_12" onmousedown="menuControl(1)" onmouseout="menuControl(0)" />
              <select name="select" onchange="jumpdo(this.value,this.options[selectedIndex].text)">
                <option selected="selected">��ѡ����ת�ʼ���</option>
                <option value='0'>�ռ���</option>
                <option value='2'>�ݸ��</option>
                <option value='3'>������</option>
                <option value='5'>admin</option>
              </select>
        </td>
        <td width="9">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
<div id="menu_2" style="position:absolute; top:263px; width:306px; height:175px; z-index:1; left: 41px; visibility: visible;" onMouseOver="keepMenu(this)" onMouseOut="hideMenu(this)" class="div">
					
                      <table width="104%" height="174"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="Menu_OutTable">
                        <tr>
                          <td><table width="96%" height="163"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
                              <tr>
                                <td width="27%" align="right" class="Menu_OutTd">�����ˣ�</td>
                                <td width="73%" align="left" class="Menu_OutTd">
								<input name="sendman" type="text" size="24" class="input">
								<input type="hidden" name="TOOL_Mail/POSTUSERNAME[@criteria=&#39;like&#39;]" value="" class="null" />
								</td>
                              </tr>
                              <tr>
                                <td align="right" class="Menu_OutTd">�ʼ����⣺</td>
                                <td align="left" class="Menu_OutTd">
								<input name="mailtitle" type="text" size="24" class="input">
								<input type="hidden" name="TOOL_Mail/TITLE[@criteria=&#39;like&#39;]" value="" class="null" />
								</td>
                              </tr>
                              <tr>
                                <td align="right" class="Menu_OutTd"> &nbsp;�������ڣ�</td>
                                <td align="left" class="Menu_OutTd">
								<input name="senddate" type="text" size="24" class="input">
								<input type="hidden" name="TOOL_Mail/SENDDATE[@criteria=&#39;like&#39;]" value="" class="null" />
								</td>
                              </tr>
                              <tr>
                                <td colspan="2" align="left" class="Menu_OutTd">&nbsp; 
                                    <input type="checkbox" name="tmailnow" id="tmailnow" value="2007-02-05">
                          �����ʼ�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                         
						  <input type="checkbox" name="TOOL_Mail/READFLAG" value="0" class="mycheckbox" />
						  
                          δ���ʼ�</td> 
                              </tr>
                              <tr>
                                <td colspan="2" align="left" class="Menu_OutTd">&nbsp; 
                                   
									<input type="checkbox" name="TOOL_Mail/PRIORITY" value="1" class="mycheckbox" />
									
                          �����ʼ�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                         
						  <input type="checkbox" name="TOOL_Mail/MAILTYPE" value="0" class="mycheckbox" />
						  
                          �ⲿ�ʼ�</td> 
                              </tr>
                              <tr align="center">
                                <td colspan="2" class="Menu_OutTd"><input name="Submit22" type="button" class="button_new" value="ȷ ��" onClick="query()">
                                    <input name="Submit222" type="reset" class="button_new" value="�� ��">
            </td>
                              </tr>
                            </table>
                              <span class="Menu_OutTd"> </span>
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
 <div id="menu_3" style="position:absolute; top:267px; width:190px; height:117px; z-index:1; left: 392px; visibility: visible;" onMouseOver="keepMenu(this)" onMouseOut="hideMenu(this)" class="div">
                      <table width="104%" height="118"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="Menu_OutTable">
                        <tr>
                          <td><table width="96%" height="105"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
                              <tr>
                                
              <td width="27%" align="left" class="Menu_OutTd"> &nbsp;<a href="javascript:reAnswer(0,0)">����</a> 
              </td>
                              </tr>
                              <tr>
                                
              <td align="left" class="Menu_OutTd"> &nbsp;<a href="javascript:reAnswer(0,1)">���ţ�����ԭ�ģ�</a></td>
                              </tr>
                              <tr>
                                
              <td align="left" class="Menu_OutTd">&nbsp;<a href="javascript:reAnswer(1,0)">�������˻���</a> 
              </td>
                              </tr>
                              <tr>
                                
              <td align="left" class="Menu_OutTd">&nbsp;<a href="javascript:reAnswer(1,1)">�������˻��ţ�����ԭ�ģ�</a></td>
                              </tr>
                            </table>
                              <span class="Menu_OutTd"> </span>
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
<div id="menu_1" style="position:absolute; top:267px; width:74px; height:85px; z-index:1; left: 619px; visibility: visible;" onMouseOver="keepMenu(this)" onMouseOut="hideMenu(this)" class="div">
                      <table width="104%" height="92"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="Menu_OutTable">
                        <tr>
                          <td><table width="96%"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
                              
							     
							        <tr>
                                       <td align="left" class="Menu_OutTd">&nbsp;<a href="#" onClick='moveMail("0","")'>�ռ���</a></td>
                                   </tr>
							  
                              
							     
                              
							     
							        <tr>
                                       <td align="left" class="Menu_OutTd">&nbsp;<a href="#" onClick='moveMail("2","")'>�ݸ��</a></td>
                                   </tr>
							  
                              
							     
							        <tr>
                                       <td align="left" class="Menu_OutTd">&nbsp;<a href="#" onClick='moveMail("3","")'>������</a></td>
                                   </tr>
							  
                              
							     
							        <tr>
                                       <td align="left" class="Menu_OutTd">&nbsp;<a href="#" onClick='moveMail("5","")'>admin</a></td>
                                   </tr>
							  
                              
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
<div id="menu_4" style="position:absolute; top:267px; width:119px; height:117px; z-index:1; left: 742px; visibility: visible;" onMouseOver="keepMenu(this)" onMouseOut="hideMenu(this)" class="div">
                      <table width="104%" height="118"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="Menu_OutTable">
                        <tr>
                          <td><table width="96%" height="93"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
            <tr> 
              <td width="27%" align="left" class="Menu_OutTd"> &nbsp;<a href="#" onClick="reputone()">��ԭѡ���ʼ�</a></td>
            </tr>
            <tr> 
              <td align="left" class="Menu_OutTd"> &nbsp;<a href="#" onClick="reputall()">��ԭ�����ʼ�</a></td>
            </tr>
            <tr> 
              <td align="left" class="Menu_OutTd">&nbsp;<a href="#" onClick="clearall()">��������ʼ�</a></td>
            </tr>
          </table>
                              <span class="Menu_OutTd"> </span>
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
    	 
    
    	frm.action="tools.pr.mailToDustbin.do";
    	frm.submit();
	
	}
    function chechedCount(form){
		var length =0;
	    var i=0;
	    var count =0;
		eles = form.elements;
		while(i<eles.length){
			obj= eles[i];
			if(obj.type == "checkbox"&&obj.getAttribute("marked")=="fcc"){
				
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
    	 
    
    	frm.action="tools.pr.mailDelete.do";
    	frm.submit();
    }

	function loadOrderPic(theform,dowpic,uppic){
		var myForm = theform;
		 if(myForm.elements["Order/col1"].value==null||myForm.elements["Order/col1"].value=="") myForm.elements["Order/col1"].value = "TITLE";
		 if(myForm.elements["Order/col1/@order"].value==null||myForm.elements["Order/col1/@order"].value=="") myForm.elements["Order/col1/@order"].value="ASC";
		 var curObj = eval(myForm.elements["Order/col1"].value);
		 var orderType = myForm.elements["Order/col1/@order"].value;
		
		if(document.all){
		  
		   
			if(orderType=="ASC"||orderType=="asc"){
				curObj.innerHTML+= "<img src='"+dowpic+"'>";
			}else{
				curObj.innerHTML+= "<img src='"+uppic+"'>";
			}
		
		}
	
	
	
	}
    
	loadOrderPic(queryForm,"/internet/images/orderup.gif","/internet/images/orderdown.gif");
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
	var action = "tools.pr.mailMove.do?tofid="+tofid+"&fname="+fname;
	frm.action = action;
	frm.submit();
	
  
  }
  
  function clearall(){
  		var frm = document.forms[0];
		if(confirm("�Ƿ����Ҫ�����������")==false){
			return ;
		}
		frm.action = "tools.pr.mailClearAll.do";
		frm.submit();
			
  
  }
  
  function reputall(){
    var frm = document.forms[0];
	if(confirm("�Ƿ����Ҫ��ԭ�������������ʼ���")==false){
			return ;
		}   	
    frm.action = "tools.pr.mailPutAll.do";
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
	frm.action = "tools.pr.mailPutOne.do";
    frm.submit();
  }
  
  function toViewMail(mailid){
  	var frm = document.forms[0];
	var where =frm.elements["fid"].value;
	var url = "?";
	var frmaction = "tools.pr.mailView.do";
	url+="TOOL_Mail/MAILID="+mailid;
	frmaction+=url;
	frm.action = frmaction;
	if(where=="2") frm.action = "tools.pr.mailfromdraft.do"+url;
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
	var action = "tools.pr.mailtoexpand.do";
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