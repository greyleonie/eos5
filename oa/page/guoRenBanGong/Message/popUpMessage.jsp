<%@include file="/internet/common.jsp"%>
<%@page import="java.util.*,org.w3c.dom.*,com.primeton.tp.common.xml.*"%>

<%
com.primeton.tp.core.prservice.context.RequestContext reqContext = (com.primeton.tp.core.prservice.context.RequestContext) request.getAttribute(com.primeton.tp.core.prservice.context.RequestContext.REQUEST_REQUEST_CONTEXT);
String winstr="<table width='256' border='0' align='center' cellpadding='0' cellspacing='0'>";
winstr+="<tr><td colspan='3' height='20' background='/internet/images/xx_1.jpg'>";
winstr+="<table width='98%' height='20' border='0' align='center' cellpadding='0' cellspacing='0'>";
winstr+="<tr><td width='15%'></td><td width='80%' valign='middle'><font size='2' color='#FFFFFF'>¼´Ê±¶ÌÏûÏ¢</font></td><td width='7%'><img id='close' src='/internet/images/xx_4.jpg' width='16' height='16' style='cursor:hand' onClick='parent.hidePopup();'/>";
winstr+="</td></tr></table></td></tr><tr><td width='98%' height='125' align='center' valign='top' background='images/xx_2.jpg'>";
winstr+="<MARQUEE behavior='scroll' direction='up' height='125' width='100%' scrolldelay='300' truespeed='truespeed'>";
winstr+="<table width='90%' height='98%' border='0' align='center' cellpadding='0' cellspacing='0'>";
NodeList InnerNotes = (NodeList)reqContext.getDocument().getChildNodes().item(0).getChildNodes().item(0).getChildNodes().item(10);

if (InnerNotes != null) {
for (int i=0;i<InnerNotes.getLength();i++) {
   Node InnerNote = InnerNotes.item(i);
   NodeList noteFields = InnerNote.getChildNodes();
   String[] values = new String[noteFields.getLength()];
   for (int j=0;j<noteFields.getLength();j++) {
      values[j] = XmlUtil.getNodeValue(noteFields.item(j));
   }
   String date = "";
   if (values[3] != null && !"".equals(values[3])) {
       date = values[3].substring(0,4) + "-" + values[3].substring(4,6) + "-" + values[3].substring(6,8) + " " + values[3].substring(8,10) + ":" + values[3].substring(10,12) + ":" + values[3].substring(12,14);
   }
   winstr+="<tr style='background-color: #FFFFFF;font-size:12px; line-height:24px;color: #000000;'><td width='100%' class='text' valign='top'><div align='left'>";
   winstr+=(i+1) + "¡¢" + values[8]+"</div><div align='right'>("+values[5]+ " " + date + ")</div></td></tr>";
}
}
winstr += "</table></MARQUEE></td></tr>";
winstr += "<tr><td align='center' background='/internet/images/xx_2.jpg'><input type='image' src='/internet/images/yyd.jpg' onClick=window.parent.document.getElementById('tmpwindow').src='oa.prPersonOffice.readNotes.do';parent.hidePopup();></td></tr>";
winstr += "<tr><td colspan='3' height='5' valign='bottom'><img src='/internet/images/xx_3.jpg'/></td></tr></table></td></tr></table>";
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META http-equiv="REFRESH" content="300">
<SCRIPT type="text/javascript" language="javascript">
var oPopup = window.createPopup();
var popTop=50;

function hidePopup() {
      oPopup.hide();
}

function popmsg(){
oPopup.document.body.innerHTML = "<%=winstr%>";
popshow();
}
function popshow(){
//window.status=popTop;
if(popTop>1730){
clearTimeout(mytime);
oPopup.hide();
return;
}else if(popTop>1520&&popTop<1730){
oPopup.show(screen.width-256,screen.height,256,1720-popTop);
}else if(popTop>1500&&popTop<1520){
oPopup.show(screen.width-256,screen.height+(popTop-1720),256,170);
}else if(popTop<180){
oPopup.show(screen.width-256,screen.height,256,popTop);
}else if(popTop<220){
oPopup.show(screen.width-256,screen.height-popTop,256,170);
}
popTop+=10;
var mytime=setTimeout("popshow();",100);
}
<%if (InnerNotes != null && InnerNotes.getLength()>0) {%>
popmsg();
<%}%>
</SCRIPT>
</head>

<body>
<IFRAME id="tmpwindow" src="" style="display: none"></IFRAME>
</body>