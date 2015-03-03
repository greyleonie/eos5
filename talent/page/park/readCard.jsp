<%@include file="/internet/common.jsp"%>
<body>
<div>
		<object classid=CLSID:B3E2AF55-E5F7-4CE7-8EC3-4CC379BFEBB9 codebase=/talent/page/park/EntDev.ocx id="CardControl" name="control" width=0 height=0>
        </object>
</div>

<form name="parkForm" action="/parkDispatcher" method="post" target="parkdata">
	 <input name="devCardID" type="hidden">
	 <input name="ConnectCode" type="hidden">
	 <input name="deviceID" type="hidden">
	 
</form>
</body>
<script>
 var oldId = 0;
 var newId = 0;
 var conCode = 0;
 var deviceID = 0;
function start(){
	
	if(control.ConfigPOS(1,1,4,"A28E",0,"")){               //串口号为1，设备号为1
		conCode = 1;
		deviceID = 1;
	}else if(control.ConfigPOS(1,2,4,"A28E",0,"")){                //串口号为1，设备号为2
		conCode = 1;
		deviceID = 2;
	}else if(control.ConfigPOS(2,1,4,"A28E",0,"")){                //串口号为2，设备号为2
		conCode = 2;
		deviceID = 1;
	}else if(control.ConfigPOS(2,2,4,"A28E",0,"")){                //串口号为2，设备号为2
		conCode = 2;
		deviceID = 2;
	}
	getDevCard();
}
 
function getDevCard(){
	setTimeout("getDevCard();",1000);
		var devCardID = control.RepeatedPoll(conCode,deviceID,4,0);
		if(devCardID.length > 0){
		  	if(devCardID.substring(2,4)!='A7'){
				if(oldId!=devCardID){
					oldId = devCardID;
					document.parkForm.devCardID.value = devCardID;
					document.parkForm.ConnectCode.value = conCode;
					document.parkForm.deviceID.value = deviceID;
					paizhao();
					parkForm.submit();
				}
			}
		}else{
			parent.parkdata.document.location.href= "/parkDispatcher";
		}


}
start();
setruntime();    //延时30秒刷新

function setruntime(){
	setTimeout("setruntime();",1000*30);
	oldId = 0;
}

function paizhao(){

   // var count = parent.parkindex.photocontrol.DriverCount();
    //if(count!=2){
    //	alert("摄像设备安装不完备！");
    //}
    //var driverName = photocontrol.DriverName();
    if(conCode==1){
    	parent.parkindex.photocontrol.ViewableWidth = 160;
		parent.parkindex.photocontrol.ViewableHeight = 120;

		parent.parkindex.photocontrol.SaveJPEG("D:/park.jpg","100");
	}else if(conCode==2){
		parent.parkindex.photocontrol2.ViewableWidth = 160;
		parent.parkindex.photocontrol2.ViewableHeight = 120;

		parent.parkindex.photocontrol2.SaveJPEG("D:/park.jpg","100");
	}	


}
</script>