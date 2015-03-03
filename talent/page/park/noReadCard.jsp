<%@include file="/internet/common.jsp"%>
<body bgcolor="#CAE2F0">
<div id="data" >
<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="1024" height="500" align="top">
	<param name=movie value="/talent/page/kqclient/23.swf">
	<param name=quality value=high>
	<embed src="/talent/page/kqclient/23.swf" quality=high pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="1024" height="500">
	</embed> 
</object>
</div>
<script language="javascript">
                       function init()
			{
                         
                        setTimeout("forward();",2*60*1000);
			}
                        function forward()
			{
                        location.replace("/parkDispatcher"); 
             } 
             init();
</script>
</body>