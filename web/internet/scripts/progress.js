/*
-------------------------------------------------------------------------------
文件名称：progress.js
说    明：JavaScript脚本，进度条
版    本：1.0
修改纪录:
---------------------------------------------------------------------------
时间        修改人      说明
2005-5-8   zhouming        增加了简单的进度条
-------------------------------------------------------------------------------     
*/

/*
用途：显示进度条
*/
	function showWaiting() {
//		if(parent.parent.parent.canShowWaiting == true){
    waiting.style.visibility="visible";
    cover.style.visibility="visible";
	progress.style.visibility="visible";
	word.style.visibility="visible";
     timedIterations(); 
//			 parent.parent.parent.canShowWaiting = false;		
//		}
	}

function timedIterations()
{
   if (i<=100)
   {
        progress.style.width=i*3.5;
        if (i>80) time=time+20;
        if (i>90) time=time*1.3;
        if (i>95) time=time*1.7;
      setTimeout("timedIterations();", time);
      i++;   
   }
}

	function hideWaiting() {
		waiting.style.visibility="hidden";
		cover.style.visibility="hidden";
		progress.style.visibility="hidden";
		word.style.visibility="hidden";
	 }

	function initProgress() {
		document.write("<div id=\"progress\" style=\"position:absolute; top:251; left:276;z-index:17;height=44;background-color:yellow\"></div>");
		document.write("<div id=\"waiting\" style=\"position:absolute; top:250; left:275;width:352;height=46; z-index:12;background-color:#eeeeee;visibility:hidden;border:solid black 1px\">&nbsp;");
		document.write("</div><div id=word style=\"position:absolute; top:260; left:370;width:150; z-index:20;visibility:hidden\"><TABLE WIDTH=100% height=30 BORDER=0  CELLPADDING=0><TR><td  align=center >处理中，请稍候...</td></tr></TABLE></div>");
		document.write("<div id=\"cover\" style=\"position:absolute; top:0; left:0; z-index:9; visibility:hidden;\">");
		document.write("<TABLE WIDTH=100% height=600 BORDER=0 CELLSPACING=0 CELLPADDING=0><TR><TD align=center><br></td></tr></table></div>");
	}

	initProgress();
var i=0 , time=120;	