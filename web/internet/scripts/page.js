/*
-------------------------------------------------------------------------------
文件名称：page.js
说    明：JavaScript脚本，用于网页中查询结果的翻页
版    本：1.0
修改纪录:
---------------------------------------------------------------------------
时间		修改人		说明
2002-8-30	libo		创建
------------------------------------------------------------------------------- 	
*/

/*
用途：tab格式的菜单被选中时的显示格式切换
输入：
返回：
*/
function tabSeleted() {
	var srcElement = window.event.srcElement;
	var parentEle = srcElement.parentElement;
	for(i=0; i< parentEle.children.length; i++) {
		parentEle.children(i).className="tabCommon";
	}
	srcElement.className="tabSelected";
}



