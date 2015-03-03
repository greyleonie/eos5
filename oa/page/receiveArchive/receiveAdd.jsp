<%@include file="/internet/common.jsp"%>
<%
String userName = base.util.TalentContext.getValue(pageContext,null,"SessionEntity/userName");
%>
<script>
var inputobj;
var tabbox1 = new TabComponent("tab1c")
tabbox1.add("basedata","基础数据",1,"document.getElementById('tail').style.display = 'inline'")
tabbox1.add("attachment","正 文",0,"document.getElementById('tail').style.display = 'none'")
//tabbox1.add("participant","流程流转",0,"document.getElementById('tail').style.display = 'inline'")
</script>

<script>
var i=0 

function insertFile(){
		i++;
		R = fjtable.insertRow();
		C1 = R.insertCell();
		C1.id="td"+i;
	    C1.innerHTML = "<input  type='file' name='file' class='input' size='30'>&nbsp;<img src='/internet/images/attachdelete.gif' alt='删除' align='absmiddle' style='cursor:hand' onclick='fjtable.deleteRow(td"+i+".parentElement.rowIndex)'>";
}

function Twain_OnPostTransfer() {
    var frm = document.forms[0];
    var imgId = "scanImage";
    var scanType = frm.elements["scanType"];
    var imgNo = document.getElementById("scanImgCount").value;
    
    createFolder();
    if (scanType[0].checked) {
       if (imgNo == 0) imgNo = 1;
       document.getElementById("scanImgCount").value = imgNo;
       var imgName = "temp" + imgNo + ".jpg";
       var imgPath = "c:\\ScanImage\\" + imgName;
       
       frm.Twain.CloseSource();
	   frm.Twain.SaveAsJPEG(imgPath);
	   frm.fullImage.src = imgPath;
	   imgId += imgNo;
	   if (document.getElementById(imgId) == undefined)
          addImg(imgNo,imgPath);
    } else {
       imgNo++;
       document.getElementById("scanImgCount").value = imgNo;
       var imgName = "temp" + imgNo + ".jpg";
       var imgPath = "c:\\ScanImage\\" + imgName;
       
       frm.Twain.CloseSource();
	   frm.Twain.SaveAsJPEG(imgPath);
	   frm.fullImage.src = imgPath;
       addImg(imgNo,imgPath);
    }
    setTimeout("exFullImgZoom();",1000);
    setTimeout("exImgZoom();",1000);
}

function btnAcquire_onclick() {
    var frm = document.forms[0];
	frm.Twain.AcquireImage();
}

function addImg(imgNo,imgPath) {
   var imgId = "scanImage" + imgNo;
   var imgTb = document.getElementById("scanImgTb");
   var imgTr = imgTb.insertRow();
   var imgTd = imgTr.insertCell();
   var imgHtml = "<img id='"+imgId+"' src='"+imgPath+"' border='1' align='absmiddle' style='cursor:hand' onClick='showFullImg(this.id)'><br>";
   var delTag = "<img src='/internet/images/attachdelete.gif' alt='删除' align='absmiddle' style='cursor:hand' onclick=delImg('"+imgNo+"')>";
   var name = "<input type=\"hidden\" name=\"list[@name='attachList']/attach[@hciTagIndex='"+imgNo+"']\" value=\"temp"+imgNo+".jpg\">";
   
   imgTd.className = "td1";
   imgTd.width = "100%";
   imgTd.height = "100%";
   imgTd.align = "center";
   imgTd.valign = "middle";
   imgTd.innerHTML = imgHtml+delTag+name;
}

function showFullImg(id) {
   var frm = document.forms[0];
   var imgNo = id.substr(id.length-1,1);
   var imgName = "temp" + imgNo + ".jpg";
   var imgPath = "c:\\ScanImage\\" + imgName;
   
   frm.fullImage.src = imgPath;
   exFullImgZoom();
}

function createFolder() {
   var fso; 
   fso = new ActiveXObject("Scripting.FileSystemObject");
   
   if (!fso.FolderExists("c:\\ScanImage"))
      fso.CreateFolder ("c:\\ScanImage");
}

function delImg(imgNo) {
   var fso;
   var frm = document.forms[0];
   var imgId = "scanImage" + imgNo;
   var imgName = "temp" + imgNo + ".jpg";
   var imgNo = document.getElementById("scanImgCount").value;
   
   fso = new ActiveXObject("Scripting.FileSystemObject");
   if (fso.FileExists("c:\\ScanImage\\"+imgName)) {
      document.getElementById("scanImgCount").value = imgNo - 1;
      fso.DeleteFile("c:\\ScanImage\\"+imgName);
      document.getElementById(imgId).parentNode.removeNode(true);
      frm.fullImage.src = "/internet/image/smy.gif";
   }
   else alert("文档不存在！");
}

//缩小原图
function exFullImgZoom() {
var fullimg = document.getElementById("fullImage");
var oWidth = fullimg.width;
var oHeight = fullimg.height;

//alert(oWidth + "," + oHeight);
if (oWidth<=500 && oHeight<=500) fullimg.style.zoom="100%";
else if ((oWidth>500 && oWidth<=1000) || (oHeight>500 && oHeight<=1000)) fullimg.style.zoom="70%";
else if ((oWidth>1000 && oWidth<=1500) || (oHeight>1000 && oHeight<=1500)) fullimg.style.zoom="50%";
else if ((oWidth>1500 && oWidth<=2000) || (oHeight>1500 && oHeight<=2000)) fullimg.style.zoom="35%";
else if ((oWidth>2000 && oWidth<=2500) || (oHeight>2000 && oHeight<=2500)) fullimg.style.zoom="26%";
}

//缩小预览图
function exImgZoom() {
var images = document.getElementsByTagName("img");

   for (var i=0;i<images.length;i++) {
      var image = images[i];

      if (image.id.indexOf("scanImage")>=0) {
         var oWidth = image.width;
         var oHeight = image.height;
         //alert(oWidth + "," + oHeight);

         if (oWidth<=200 && oHeight<=200) image.style.zoom="10%";
         else if ((oWidth>200 && oWidth<=400) || (oHeight>200 && oHeight<=400)) image.style.zoom="8%";
         else if ((oWidth>400 && oWidth<=600) || (oHeight>400 && oHeight<=600)) image.style.zoom="8%";
         else if ((oWidth>600 && oWidth<=800) || (oHeight>600 && oHeight<=800)) image.style.zoom="6%";
         else if ((oWidth>800 && oWidth<=1000) || (oHeight>800 && oHeight<=1000)) image.style.zoom="5%";
         else if ((oWidth>1000 && oWidth<=2000) || (oHeight>1000 && oHeight<=2000)) image.style.zoom="3%";
         else if ((oWidth>2000 && oWidth<=4000) || (oHeight>2000 && oHeight<=4000)) image.style.zoom="2%";

      } 
   }
}
</script> 

<SCRIPT LANGUAGE=javascript FOR=Twain EVENT=OnPostTransfer>
<!--
 Twain_OnPostTransfer()
//-->
</SCRIPT>

<body>
<form method="post" name="myform" action="oa.prReceiveArchive.receiveAddDo.do" enctype="multipart/form-data">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">办公系统—&gt;收文管理—&gt;新增收文</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td height="5">
		<html:hidden property="ReceiveArchive/_order/col1/field"/>
		<html:hidden property="ReceiveArchive/_order/col1/asc" />
		<html:hidden property="temptype" />
		<html:hidden property="PageCond/begin"/>
		<html:hidden property="PageCond/length" />
		
		<html:hidden property="WFWorkItem/submitType" />
		
		<html:hidden property="WFWorkItem/workItemID" />
		
		<html:hidden property="WFWorkItem/processInstID" />
		<html:hidden property="WFWorkItem/processDefID" />
		<html:hidden property="WFWorkItem/processDefName" />
		
		
		<html:hidden property="WFWorkItem/activityDefID" />
		<html:hidden property="WFWorkItem/activityInstID" />
		<html:hidden id="scanImgCount" property="scanImgCount" value="0"/>
		
		
	  </td>
    </tr>
  </table>
  <table width="98%" border="0" align="center" cellpadding="0" bordercolor="#808080" style="border-collapse: collapse" >
	<tr>
		<td>
			<script>
			 tabbox1.init()
			</script>
		</td>
	</tr>
	<tr>
		<td height="100%" valign="top" nowrap bgcolor="#FFFFFF" style="border:1px #000000 solid;border-top:none">
		
		
			<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
				<tr><td height="10"></td></tr>
			</table>
			<!------------------------------  文头  ----------------------------->
			<table width="96%" height="20"  border="0" align="center" cellpadding="0" cellspacing="1" id="spaceup">
				<tr><td height="40" align="center" style="font-size:18px;font-weight:bold;color:#ff0000;letter-spacing:5px">广州市党校收文呈批表</td></tr>
			</table>
			<!------------------------------  表单意见  ----------------------------->
			<table width="96%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="basedata">
			  <tr> 
				<td width="9%" height="25" align="center" nowrap class="td1">来文单位：</td>
				<td colspan="2" nowrap class="td1">&nbsp;<html:text property="ReceiveArchive/archiveUnit" styleClass="inputOA" maxlength="25" attributesText='style="width:96%;" ValidateType="notempty" Msg="来文单位不能为空"' onmousedown="menuControl('archiveUnits',1)" onmouseout="menuControl('archiveUnits',0)"/> 
				</td>
				<td width="6%" align="center" nowrap class="td1">份数： </td>
				<td width="11%" nowrap class="td1">&nbsp;<html:text property="ReceiveArchive/archiveNum" styleClass="inputOA" attributesText='style="width:86%;" ValidateType="notempty,int" Msg="份数为空;份数必须是整型"'/> 
				</td>
				<td width="6%" align="center" nowrap class="td1">密级：</td>
				<td width="12%" nowrap class="td1">&nbsp;<html:select property="ReceiveArchive/secretLevel"> 
				  <html:option value="0">公开</html:option> <html:option value="1">秘密</html:option> 
				  <html:option value="2">机密</html:option> <html:option value="3">绝密</html:option> 
				  </html:select> </td>
				<td width="9%" align="center" nowrap class="td1">缓急程度：</td>
				<td width="13%" nowrap class="td1">&nbsp;<html:select property="ReceiveArchive/timeLevel"> 
				  <html:option value="0">正常</html:option> <html:option value="1">稍急</html:option> 
				  <html:option value="2">紧急</html:option> <html:option value="3">特急</html:option> 
				  </html:select> </td>
			  </tr>
			  <tr> 
				<td height="25" align="center" nowrap class="td1">收件日期：</td>
				<td width="25%" nowrap class="td1">&nbsp;<html:text name="ReceiveArchive/archiveDate[@pattern='yyyy-MM-dd']" styleClass="inputOA" attributesText='style="width:95%;" readonly="true"' onclick="calendar(this,'yyyy-MM-dd')" property="currentDate"/> 
				</td>
				<td width="9%" align="center" nowrap class="td1">办文编号：</td>
				<td colspan="4" nowrap class="td1">&nbsp;<html:text property="ReceiveArchive/archiveCode" styleClass="inputOA" maxlength="25" attributesText='style="width:96%;" ValidateType="notempty" Msg="办文编号不能为空"' onmousedown="menuControl('prefixs',1)" onmouseout="menuControl('prefixs',0)"/> 
				</td>
				<td align="center" nowrap class="td1">呈 批 人：</td>
				<td nowrap class="td1">&nbsp;<html:text property="ReceiveArchive/chenPiMan" value="<%=userName%>" styleClass="inputOA" maxlength="25" attributesText='style="width:88%;" ValidateType="notempty" Msg="呈批人不能为空"'/> 
				</td>
			  </tr>
			  <tr> 
				<td height="25" align="center" nowrap class="td1">文件标题：</td>
				<td colspan="8" nowrap class="td1">&nbsp;<html:text property="ReceiveArchive/archiveTitle" styleClass="inputOA" maxlength="200" attributesText='style="width:98%;" ValidateType="notempty" Msg="文件标题不能为空"' /></td>
			  </tr>
			  
			   <tr valign="top"> 
				<td colspan="9" nowrap class="tdwf">
					<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
				      <tr>
				        <td width="80%" align="left" valign="top" class="divwf1">【办公室领导意见】</td> 
				        <td width="20%" align="center" valign="top"><a href="javascript:gotoText();" class="divwf1"><u><font color="red">【收文正文】</font></u></a></td>
				      </tr>
				    </table>
				</td>
			  </tr>
			  <tr valign="top"> 
				<td colspan="9" nowrap class="tdwf">
					<div class="divwf1">【校领导阅示意见】</div>
				</td>
			  </tr>
			  <tr valign="top"> 
				<td colspan="9" nowrap class="tdwf">
					<div class="divwf1">【相关人员办理意见】</div>
				</td>
			  </tr>
					  <!------------------------------  公文流转  开始 ----------------------------->
			  <tr valign="top"> 
				<td colspan="9" nowrap>
		   
      <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0" id="participant">
        <tr> 
          <td width="100%" align="right" nowrap colspan="2" bgcolor="#FFFFFF">
		  	<iframe src='oa.pr.showWFImage.do?Flow/processInstID=<bean:write property="WFWorkItem/processInstID"/>' frameborder="0" name="graphID" scrolling="auto" style=" height: 180"></iframe>	
		  </td>
          
        </tr>
		<tr> 
          <td width="19%" align="right" nowrap class="td2">下环节流转选择：</td>
          <td width="81%" class="td1">
		  <%
		  	int i = 0;
		  %>
		  <logic:iterate id="resultset" property="list[@type='nextnodes']">
		  	<input name="Flow/nextNode" type="radio" value='<bean:write id="resultset" property="Activity/actDefID"/>' nvalue='<bean:write id="resultset" property="Activity/actDefName"/>' <%if(i == 0){out.print(" checked");}%> ><bean:write id="resultset" property="Activity/actDefName"/>&nbsp;
			<%
				i++;
			%>
		  </logic:iterate>
          </td>
        </tr>
		<tr> 
          <td width="19%" align="right" nowrap class="td2">下环节人员选择：</td>
          <td class="td1">
		  <html:text property="ReceiveArchive/nextParticipantName" attributesText='style="width:80%;border:1 #efefef soild;" readonly="true"'/>
		  <html:hidden property="ReceiveArchive/nextParticipantId"/>
		  <input name="select" type="button" class="button_02" value="选 择" onClick="selectParticipant('<bean:write property="WFWorkItem/processInstID"/>','<bean:write property="WFWorkItem/processDefID"/>','10000','ReceiveArchive/nextParticipantName','ReceiveArchive/nextParticipantId')">
		  </td>
        </tr>
      </table>
				</td>
			  </tr>
                       <!------------------------------  公文流转  结束 ----------------------------->
			  <tr valign="top"> 
				<td colspan="9" nowrap> 
	            <table id="tail" width="100%" height="40"  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
				<tr>
				  <td align="center" valign="middle">
				  <input name="wfsend" type="button" class="button_02" value="发 送" onClick="send()">
				  <input name="wfsave" type="button" class="button_02" value="保 存" onClick="save()">
				  <input name="wfcancel" type="button" class="button_02" value="返 回" onClick="history.back()"></td>
				</tr>
                </table>
				</td>
			  </tr>
			</table>
				  
		  
		 
		   
      
			<!------------------------------  编辑正文  ----------------------------->
			  
			  
			  <table width="96%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" id="attachment">
				<tr> 
				  <td width="14%" height="30px" align="right" nowrap class="td2">
				  <img src='/internet/image/mail_atth.gif' height='16px' width='16px' align='absmiddle' style='cursor:hand' onclick="insertFile();">&nbsp;<a href="#" onClick="insertFile();">添加附件</a>&nbsp;
				  <input type="hidden" name="filepath" value="archivereceive"/>
				  <input type="hidden" name="FBFILE_T_FILE/GROUP_ID" value="archive">
				  <input type="hidden" name="FBFILE_T_FILE/FILE_SAVE" value="F">
				  </td>
				  <td colspan="3" class="td1">
				  	<table width="100%" id="fjtable">
					</table>
				  </td>
				</tr>
				<tr> 
				  <td width="14%" align="right" nowrap class="td2"><img src='/internet/image/smy.gif' height='15px' width='20px' align='absmiddle'>&nbsp;扫描正文&nbsp;</td>
				  <td colspan="3" width="100%" height="30px" align="left" valign="middle" class="td1">&nbsp;
				  <INPUT type="radio" name="scanType" value="0" checked="checked">单页文档&nbsp;
				  <INPUT type="radio" name="scanType" value="1">多页文档&nbsp;
				  <INPUT type="button" class="button_02" value="开始扫描" onClick="return btnAcquire_onclick();">&nbsp;
				  <A href="/internet/download/WebTWAIN3.0.3 setup.exe">请下载控件安装！</A>
				  </td>
				</tr>
				<tr id="textTr"><td width="100%" colspan="4" align="center" valign="middle" class="td1">
				<table width="100%" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" border="0">
				<tr><td width="90%" height="100%" align="center" valign="middle" class="td1">
				<img id="fullImage" src="/internet/image/smy.gif" border="0" style="cursor:hand" onclick="viewAllImg(this)">
				</td>
				<td align="center" width="10%" height="100%" class="td1">
				<table width="100%" height="100%" id="scanImgTb" align="center" cellpadding="0" cellspacing="1" bgcolor="#A2C4DC" border="0">
				</table>
				</td>
				</tr>
				</table>
				</td></tr>
				<tr valign="top"> 
				<td width="100%" colspan="4" height="40" align="center" valign="middle" class="td1">
				  <input name="wfcancel" type="button" class="button_02" value="返 回" onClick="document.getElementById('tab1c_tabcon1').click()">
				</td>
			    </tr>
        	  </table>
			
			
			
			<table width="96%" height="100"  border="0" align="center" cellpadding="0" cellspacing="1" id="spacedown">
				<tr><td></td></tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<script>
			tabbox1.inithidetab();
			</script>
		</td>
		</tr>
	</table>
     
     <object classid="clsid:D043D337-61FF-4BC4-807B-B3551BDD788B" id="Twain" width="0" height="0" codebase="">
      <param name="_cx" value="32">
      <param name="_cy" value="32">
      <param name="JpgQuality" value="80">
      <param name="Manufacturer" value="DynamSoft Corporation">
      <param name="ProductFamily" value="Dynamic Web TWAIN">
      <param name="ProductName" value="Dynamic Web TWAIN">
      <param name="VersionInfo" value="Dynamic Web TWAIN 2.0">
      <param name="TransferMode" value="0">
      <param name="BorderStyle" value="0">
      <param name="FTPUserName" value>
      <param name="FTPPassword" value>
      <param name="FTPPort" value="21">
      <param name="HTTPUserName" value>
      <param name="HTTPPassword" value>
      <param name="HTTPPort" value="80">
      <param name="ProxyServer" value>
    </object>
</form>
<div id="archiveUnits" style="position:absolute; top:301px; width:375px; height:85px; z-index:1; left: 385px; visibility: visible;display:none" onMouseOver="keepMenu(this)" onMouseOut="hideMenu(this)" class="div">
<table width ="98%" align="center" border="0" cellpadding="0" cellspacing="1"  bgcolor="#CAD6E8">
<logic:iterate id="archiveUnits" property="list[@type='archiveUnits']">
<tr class="td1">
<td><a href="javascript:setValue('<bean:write id='archiveUnits' property='archiveUnits/archiveUnit'/>');"><bean:write id='archiveUnits' property='archiveUnits/archiveUnit'/></a></td>
</tr>
</logic:iterate>
</table>
</div>
<div id="pubLemma" style="position:absolute; top:301px; width:185px; height:85px; z-index:1; left: 385px; visibility: visible;display:none" onMouseOver="keepMenu(this)" onMouseOut="hideMenu(this)" class="div">
<table width ="98%" align="center" border="0" cellpadding="0" cellspacing="1"  bgcolor="#CAD6E8">
<logic:iterate id="pubLemmas" property="list[@type='pubLemmas']">
<tr class="td1">
<td><a href="javascript:setValue('<bean:write id='pubLemmas' property='pubLemmas/DESCRIPTION'/>');"><bean:write id='pubLemmas' property='pubLemmas/DESCRIPTION'/></a></td>
</tr>
</logic:iterate>
</table>
</div>
<div id="prefixs" style="position:absolute; top:301px; width:185px; height:85px; z-index:1; left: 385px; visibility: visible;display:none" onMouseOver="keepMenu(this)" onMouseOut="hideMenu(this)" class="div">
<table width ="98%" align="center" border="0" cellpadding="0" cellspacing="1"  bgcolor="#CAD6E8">
<logic:iterate id="prefixs" property="list[@type='prefixs']">
<tr class="td1">
<td><a href="javascript:setValue('<bean:write id='prefixs' property='prefixs/DESCRIPTION'/>');"><bean:write id='prefixs' property='prefixs/DESCRIPTION'/></a></td>
</tr>
</logic:iterate>
</table>
</div>
</body>
<script>
	document.all["graphID"].width = document.all["graphID"].document.body.offsetWidth * .9;
	document.all["graphID"].height = document.all["graphID"].document.body.offsetHeight * .43;
</script>

<script>
function save() {
		var frm = document.forms[0];
		frm.elements["WFWorkItem/submitType"].value = "0";
		if(validater(frm)) {
			getWFData(frm);
			frm.submit();	
		}

}

function send() {
	var frm = document.forms[0];
	var attachs = document.getElementsByName("file");
	
	if (frm.elements["list[@name='attachList']/attach[@hciTagIndex='1']"] == undefined && frm.elements["file"] == undefined) {
	   alert("请扫描正文或导入附件后发送！");
	   return false;
	}
	
	if (frm.elements["file"] != undefined) {
	
	if (frm.elements["file"].value == '') {
	   alert("附件不能为空，请导入附件后发送！");
	   return false;
	} 
	
	for (var i=0;i<attachs.length;i++) {
	    var filepath = attachs[i].value
	    var ext = filepath.substring(filepath.indexOf(".")+1,filepath.length);
	    
	    if ("JPG,BMP,GIF,PNG,TIF,jpg,bmp,gif,png,tif".indexOf(ext)<0) {
	       alert("请上传格式为JPG，BMP，GIF，PNG，TIF的图片附件！");
	       return false;
	    }
	}
	
	}
	
		frm.elements["WFWorkItem/submitType"].value = "1";
		if(validater(frm)) {
			if(getRadioValue("Flow/nextNode")!="EndActivity"){
				if(frm.elements["ReceiveArchive/nextParticipantId"].value == ""){
					alert("请选择下环节人员");
					return false;
				}
			}		
			getWFData(frm);
			frm.submit();	
		}

}

function viewAllImg(img) {
   var windowObj = window.open("","viewImg","resizable=1,scrollbars=1,titlebar=1");
   var html = "<body><img id='fullImage' src='/internet/image/smy.gif' border='0'></body>";
   
   windowObj.document.writeln(html);
   windowObj.document.getElementById("fullImage").src = img.src;
}

function gotoText() {
   document.getElementById('tab1c_tabcon2').click();
   document.getElementById('tab1c_tabbar1').className = 'tbottom4';
}
</script>
<script language="javascript">
function menuControl(obj,show)
{
window.event.cancelBubble=true;
inputobj = event.srcElement;
var objID=event.srcElement.id;
var index=objID.indexOf("_");
var mainID=objID.substring(0,index);
var numID=objID.substring(index+1,objID.length);

if(show==1)
{
eval("showMenu("+obj+")");
}
else
{
eval("hideMenu("+obj+")");
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
 
function setValue(value) {
inputobj.value = inputobj.value + value;
}
</script>