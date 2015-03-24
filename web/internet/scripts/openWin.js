/*
-------------------------------------------------------------------------------
文件名称：openWin.js
说    明：JavaScript脚本，用于网页中弹出窗口的处理
版    本：1.0
修改纪录:
---------------------------------------------------------------------------
时间			修改人		说明
2002-8-29	libo		创建
2004-6-21	YuanYi		修改(多次点击只创建一个窗口、模式窗口的返回值)
2004-6-21	zhou ming		修改(模式窗口和父窗口的数据交换)
------------------------------------------------------------------------------- 	
*/

/*
用途：弹出模式窗口
	此功能只能在IE5.0以上浏览器使用。
	弹出窗口的风格为居中，没有状态栏，没有IE按钮，菜单,地址栏
输入：
	strUrl：  	弹出窗口内显示的网页的地址
	winWidth：	弹出窗口的宽度，单位为px
	winHeight:	弹出窗口的高度，单位为px
	middle:		弹出窗口是否要居中，默认不居中
返回：
	如果通过验证返回true,否则返回false	
*/
function showModal( strUrl,winWidth,winHeight,middle){
	if(middle==null)
	{
		showx = event.screenX - event.offsetX - 210 ; // + deltaX;
		showy = event.screenY - event.offsetY + 18; // + deltaY;
		return window.showModalDialog(	strUrl,
										window,
										"dialogWidth:"+ winWidth + "px;"
										+ "dialogHeight:"+winHeight + "px;"
										+ "dialogLeft:"+showx+"px;"
										+ "dialogTop:"+showy+"px;"
										+ "directories:yes;help:no;status:no;resizable:no;scrollbars:yes;");
	}
	else
	{
		return window.showModalDialog(	strUrl,
										window,
										"dialogWidth:"+ winWidth + "px;"
										+ "dialogHeight:"+winHeight + "px;"
										+ "directories:yes;help:no;status:no;resizable:no;scrollbars:yes;");	
	}
}

function openNewWindow( strUrl,winWidth,winHeight,type){

	var left = (screen.width - winWidth)/2;
	var top = (screen.height - winHeight)/2;
	if(type==null)
	{
	newwin = window.open(	strUrl,
							"popupnav",
							"left="+left+",top="+top+
							",width="+ winWidth + ","
							+ "height="+winHeight + ","
							+ "status=no,toolbar=no,menubar=no,location=no,scrollbars=yes");
	newwin.focus();
	}
	else
	{
	newwin = window.open(	strUrl,
							"popupnav",
							"left="+left+",top="+top+
							",width="+ winWidth + ","
							+ "height="+winHeight + ","
							+ "status=no,menubar=yes,scrollbars=yes");
	newwin.focus();
	}
}