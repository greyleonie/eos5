<head>
<title>广州市委党校信息一体化平台</title>
<link href="../../INDEX.css" rel="stylesheet" type="text/css" />
</head>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="24" background="../../image/lz_bg.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="12"></td>
        <td class="text_wirte">首页—&gt;办公系统—&gt;个人办公—&gt;草稿箱</td>
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
            <td align="left"> 草稿箱中有<span class="text_red">4</span>个邮件，其中未读邮件<span class="text_red">0</span>个</td>
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
        <td align="center"><input name="Submit2" type="button" class="button_02" value="后 退" onclick="history.back()" /> 
              <input name="Submit_2" type="button" class="button_02" value="搜 索" id="Submit_2" onmousedown="menuControl(1)" onmouseout="menuControl(0)" />
              <input name="Submit42" type="button" class="button_02" value="删 除" onclick="mailToDustbin()" />
              <input name="Submit5" type="button" class="button_02" value="永久删除" onclick="deleteRows()" />
              <input name="Submit_1" type="button" class="button_02" value="转移邮件" id="Submit_1" onmousedown="menuControl(1)" onmouseout="menuControl(0)">
              <select name="select2" onchange="jumpdo(this.value,this.options[selectedIndex].text)">
                <option selected="selected">请选择跳转邮件夹</option>
                <option value='0'>收件夹</option>
                <option value='1'>寄件夹</option>
                <option value='3'>垃圾箱</option>
                <option value='5'>admin</option>
              </select>        </td>
        </tr>
    </table></td>
  </tr>
</table>
<table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td></td>
  </tr>
</table>
<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC">
  <tr class="td_title">
    <td width="5%" align="center" ><input type="checkbox" name="checkbox" fccmarked="fcc" onclick="eosCheckAll(document.queryForm,this)" /></td>
    <td width="3%" align="center">！</td>
    <td width="3%" align="center">＠</td>
    <td width="39%" align="center"  ondblclick="eosOrderBy('TITLE')">邮件主题</td>
    <td width="18%" align="center" ondblclick="eosOrderBy('POSTUSERNAME')">发件人</td>
    <td width="21%" align="center"ondblclick="eosOrderBy('SENDDATE')">时间</td>
    <td width="11%" align="center" ondblclick="eosOrderBy('MAILSIZE')">大小(Byte)</td>
  </tr>
  <tr class="result_content" onmouseover="javascript:changeBgColorOnMouseOver(this);" onmouseout="javascript:changeBgColorOnMouseOut(this);" ondblclick="toViewMail('117')">
    <td align="center" class="td2"><input type="checkbox" name="list[@name='update']/TOOL_MAIL[@hciTagIndex=&quot;0&quot;]/MAILID" value="117" class="mycheckbox" marked="fcc" />    </td>
    <td align="center" class="td2" ></td>
    <td align="center" class="td2">&nbsp;</td>
    <td align="left" nowrap="nowrap" class="td2">&nbsp; <a href='tools.pr.mailfromdraft.do?TOOL_Mail/MAILID=117' class="yes"> doc文档 </a> </td>
    <td align="left" nowrap="nowrap" class="td2">&nbsp; <span> 外商系统管理员 </span> </td>
    <td align="left" nowrap="nowrap" class="td2"><span> yyyy-MM-dd HH:mm:ss </span> </td>
    <td align="right" nowrap="nowrap" class="td2"><span> 0 </span> </td>
  </tr>
  <tr class="result_content_" onmouseover="javascript:changeBgColorOnMouseOver(this);" onmouseout="javascript:changeBgColorOnMouseOut(this);" ondblclick="toViewMail('118')">
    <td align="center" class="td1"><input type="checkbox" name="list[@name='update']/TOOL_Mail[@hciTagIndex=&quot;1&quot;]/MAILID" value="118" class="mycheckbox" marked="fcc" />    </td>
    <td align="center" class="td1" ></td>
    <td align="center" class="td1">&nbsp;</td>
    <td align="left" nowrap="nowrap" class="td1">&nbsp; <a href='tools.pr.mailfromdraft.do?TOOL_Mail/MAILID=118' class="yes"> ff </a> </td>
    <td align="left" nowrap="nowrap" class="td1">&nbsp; <span> 外商系统管理员 </span> </td>
    <td align="left" nowrap="nowrap" class="td1"><span> 2006-09-05 03:29:21 </span> </td>
    <td align="right" nowrap="nowrap" class="td1"><span> 15 </span> </td>
  </tr>
  <tr class="result_content" onmouseover="javascript:changeBgColorOnMouseOver(this);" onmouseout="javascript:changeBgColorOnMouseOut(this);" ondblclick="toViewMail('115')">
    <td align="center" class="td2"><input type="checkbox" name="list[@name='update']/TOOL_Mail[@hciTagIndex=&quot;2&quot;]/MAILID" value="115" class="mycheckbox" marked="fcc" />    </td>
    <td align="center" class="td2" ></td>
    <td align="center" class="td2">&nbsp;</td>
    <td align="left" nowrap="nowrap" class="td2">&nbsp; <a href='tools.pr.mailfromdraft.do?TOOL_Mail/MAILID=115' class="yes"> 图片测试 </a> </td>
    <td align="left" nowrap="nowrap" class="td2">&nbsp; <span> 外商系统管理员 </span> </td>
    <td align="left" nowrap="nowrap" class="td2"><span> yyyy-MM-dd HH:mm:ss </span> </td>
    <td align="right" nowrap="nowrap" class="td2"><span> 0 </span> </td>
  </tr>
  <tr class="result_content_" onmouseover="javascript:changeBgColorOnMouseOver(this);" onmouseout="javascript:changeBgColorOnMouseOut(this);" ondblclick="toViewMail('122')">
    <td align="center" class="td1"><input type="checkbox" name="list[@name='update']/TOOL_Mail[@hciTagIndex=&quot;3&quot;]/MAILID" value="122" class="mycheckbox" marked="fcc" />    </td>
    <td align="center" class="td1" ></td>
    <td align="center" class="td1"></td>
    <td align="left" nowrap="nowrap" class="td1">&nbsp; <a href='tools.pr.mailfromdraft.do?TOOL_Mail/MAILID=122' class="yes"> RE: </a> </td>
    <td align="left" nowrap="nowrap" class="td1">&nbsp; <span> 外商系统管理员 </span> </td>
    <td align="left" nowrap="nowrap" class="td1"><span> 2006-12-28 11:37:04 </span> </td>
    <td align="right" nowrap="nowrap" class="td1"><span> 11 </span> </td>
  </tr>
</table>
<table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td></td>
  </tr>
</table>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center"><input name="Submit23" type="button" class="button_02" value="后 退" onclick="history.back()" />
              <input name="Submit_22" type="button" class="button_02" value="搜 索" id="Submit_22" onmousedown="menuControl(1)" onmouseout="menuControl(0)" />
              <input name="Submit422" type="button" class="button_02" value="删 除" onclick="mailToDustbin()" />
              <input name="Submit52" type="button" class="button_02" value="永久删除" onclick="deleteRows()" />
              <input name="Submit_12" type="button" class="button_02" value="转移邮件" id="Submit_12" onmousedown="menuControl(1)" onmouseout="menuControl(0)" />
              <select name="select" onchange="jumpdo(this.value,this.options[selectedIndex].text)">
                <option selected="selected">请选择跳转邮件夹</option>
                <option value='0'>收件夹</option>
                <option value='1'>寄件夹</option>
                <option value='3'>垃圾箱</option>
                <option value='5'>admin</option>
              </select>
        </td>
      </tr>
    </table>
<div id="menu_2" style="position:absolute; top:263px; width:306px; height:175px; z-index:1; left: 41px; visibility: visible;" onMouseOver="keepMenu(this)" onMouseOut="hideMenu(this)" class="div">
					
                      <table width="104%" height="174"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="Menu_OutTable">
                        <tr>
                          <td><table width="96%" height="163"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
                              <tr>
                                <td width="27%" align="right" class="Menu_OutTd">发件人：</td>
                                <td width="73%" align="left" class="Menu_OutTd">
								<input name="sendman" type="text" size="24" class="input">
								<input type="hidden" name="TOOL_Mail/POSTUSERNAME[@criteria=&#39;like&#39;]" value="" class="null" />
								</td>
                              </tr>
                              <tr>
                                <td align="right" class="Menu_OutTd">邮件主题：</td>
                                <td align="left" class="Menu_OutTd">
								<input name="mailtitle" type="text" size="24" class="input">
								<input type="hidden" name="TOOL_Mail/TITLE[@criteria=&#39;like&#39;]" value="" class="null" />
								</td>
                              </tr>
                              <tr>
                                <td align="right" class="Menu_OutTd"> &nbsp;发送日期：</td>
                                <td align="left" class="Menu_OutTd">
								<input name="senddate" type="text" size="24" class="input">
								<input type="hidden" name="TOOL_Mail/SENDDATE[@criteria=&#39;like&#39;]" value="" class="null" />
								</td>
                              </tr>
                              <tr>
                                <td colspan="2" align="left" class="Menu_OutTd">&nbsp; 
                                    <input type="checkbox" name="tmailnow" id="tmailnow" value="2007-02-05">
                          今日邮件&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                         
						  <input type="checkbox" name="TOOL_Mail/READFLAG" value="0" class="mycheckbox" />
						  
                          未读邮件</td> 
                              </tr>
                              <tr>
                                <td colspan="2" align="left" class="Menu_OutTd">&nbsp; 
                                   
									<input type="checkbox" name="TOOL_Mail/PRIORITY" value="1" class="mycheckbox" />
									
                          紧急邮件&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                         
						  <input type="checkbox" name="TOOL_Mail/MAILTYPE" value="0" class="mycheckbox" />
						  
                          外部邮件</td> 
                              </tr>
                              <tr align="center">
                                <td colspan="2" class="Menu_OutTd"><input name="Submit22" type="button" class="button_new" value="确 定" onClick="query()">
                                    <input name="Submit222" type="reset" class="button_new" value="重 置">
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
                                
              <td width="27%" align="left" class="Menu_OutTd"> &nbsp;<a href="#" onClick="reAnswer(0,0)">回信</a> 
              </td>
                              </tr>
                              <tr>
                                
              <td align="left" class="Menu_OutTd"> &nbsp;<a href="#" onClick="reAnswer(0,1)">回信（附带原文）</a></td>
                              </tr>
                              <tr>
                                
              <td align="left" class="Menu_OutTd">&nbsp;<a href="#" onClick="reAnswer(1,0)">给所有人回信</a> 
              </td>
                              </tr>
                              <tr>
                                
              <td align="left" class="Menu_OutTd">&nbsp;<a href="#" onClick="reAnswer(1,1)">给所有人回信（附带原文）</a></td>
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
                                       <td align="left" class="Menu_OutTd">&nbsp;<a href="#" onClick='moveMail("0","")'>收件夹</a></td>
                                   </tr>
							  
                              
							     
							        <tr>
                                       <td align="left" class="Menu_OutTd">&nbsp;<a href="#" onClick='moveMail("1","")'>寄件夹</a></td>
                                   </tr>
							  
                              
							     
                              
							     
							        <tr>
                                       <td align="left" class="Menu_OutTd">&nbsp;<a href="#" onClick='moveMail("3","")'>垃圾箱</a></td>
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
              <td width="27%" align="left" class="Menu_OutTd"> &nbsp;<a href="#" onClick="reputone()">还原选择邮件</a></td>
            </tr>
            <tr> 
              <td align="left" class="Menu_OutTd"> &nbsp;<a href="#" onClick="reputall()">还原所有邮件</a></td>
            </tr>
            <tr> 
              <td align="left" class="Menu_OutTd">&nbsp;<a href="#" onClick="clearall()">清空所有邮件</a></td>
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
    		alert("至少必须选择一行进行删除！");
    		return ;
    	}
    	if(confirm("是否确定删除指定记录？")==false){
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
    		alert("至少必须选择一行进行删除！");
    		return ;
    	}
    	if(confirm("是否确定删除指定记录？")==false){
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
	var tsendman = frm.elements["TOOL_Mail/POSTUSERNAME[@criteria='like']"];//发件人
	var tmailtitle = frm.elements["TOOL_Mail/TITLE[@criteria='like']"];//邮件主题
	var tsenddate = frm.elements["TOOL_Mail/SENDDATE[@criteria='like']"];//发送日期
	
	var tmailnow = frm.elements["tmailnow"];//今日邮件
	
	var psendman = frm.elements["sendman"];
	var pmailtitle = frm.elements["mailtitle"];
	var psenddate = frm.elements["senddate"];
	
	tsendman.value = "";//清空
	tmailtitle.value = "";//清空
	tsenddate.value = "";//清空
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
    		alert("至少必须选择一行进行转移！");
    		return ;
    	}
    	if(confirm("是否确定转移指定记录？")==false){
			return ;
		}    
	var action = "oa.prPersonOffice.mailMove.do?tofid="+tofid+"&fname="+fname;
	frm.action = action;
	frm.submit();
	
  
  }
  
  function clearall(){
  		var frm = document.forms[0];
		if(confirm("是否真得要清空垃圾箱吗？")==false){
			return ;
		}
		frm.action = "oa.prPersonOffice.mailClearAll.do";
		frm.submit();
			
  
  }
  
  function reputall(){
    var frm = document.forms[0];
	if(confirm("是否真得要还原垃圾箱中所有邮件？")==false){
			return ;
		}   	
    frm.action = "oa.prPersonOffice.mailPutAll.do";
	frm.submit();
  }
  
  function reputone(){
  	var frm =document.forms[0];
   	if(chechedCount(frm)<1){
    		alert("至少必须选择一行进行还原！");
    		return ;
    }
    if(confirm("是否确定还原指定记录？")==false){
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
    	alert("至少必须选择一行！");
    	return ;
    }
	
	if(chechedCount(frm)>1){
    	alert("只能选择一行！");
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