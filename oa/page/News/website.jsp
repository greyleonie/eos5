<%@include file="/internet/common.jsp"%>
<link rel="stylesheet" href="/pageComponent/resources/theme/style.css" type="text/css">
<script type="text/javascript" language="JavaScript">



function SetWinHeight(obj)
{
    var win=obj;//自动适应iframe的高度适用IE FF
    if (document.getElementById)
    {
        if (win && !window.opera)
        {
           if (win.contentDocument && win.contentDocument.body.offsetHeight) 
            win.height = win.contentDocument.body.offsetHeight; 
            else if(win.Document && win.Document.body.scrollHeight)
            win.height = win.Document.body.scrollHeight;
        }
    }
}
</script>
<%String id=request.getParameter("id");

String url="";
if(id.equals("1")){
url="http://192.168.0.254/mishu/秘书工作站/秘书处/专题库/学习实践科学发展观活动专题";
}else if(id.equals("2")){
url="http://192.168.0.254/mishu/秘书工作站/秘书处/专题库/科学发展观研究中心";
} 

%>

<iframe  name="frmCenter" id="frmCenter" src="<%=url %>"   style="vertical-align:top" onload="JAVAscript:SetWinHeight(this)" frameborder="0" border="0" scrolling="auto"  width="100%"   id="Center"  height="100%"></iframe>

<br><br><br>