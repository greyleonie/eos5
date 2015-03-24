/*
文件说明：这是一个JavaScript脚本文件
功能说明：本脚本程序用来动态创建多级菜单
创建时间：20030605
创建人：ajun
*/

//定义一级菜单的背景色
var menu_1_bg_color = "#002A6B";
//定义各种状态下菜单子项的背景颜色
var bgBarNormal="#87B5E6";
var bgBarSelect="#BDDBFA";
//定义滚动文字的颜色
var MarqueeTextColor="#666666";
//定义菜单中的图片
var SelectImage="/internet/theme/style0/arrow2.gif";
var NormalImage="/internet/theme/style0/arrow1.gif";
var corner_left="/internet/scripts/img/corner_left.gif";
var corner_bg="/internet/scripts/img/corner_bg.gif";
var corner_right="/internet/scripts/img/corner_right.gif";
//定义滚动速度(1-10),越大越快
var scrollspeed=8
//定义二级菜单每次点击的偏移距离
var two_offset=115
//定义三级菜单每次点击的偏移距离
var three_offset=130

//二级菜单显示窗口宽度
var two_windowwidth=''
//二级菜单滚动内容宽度
var two_memowidth=''
//保存二级菜单内容的变量
var SecondMenu='';

//二级菜单显示窗口宽度
var three_windowwidth=''
//二级菜单滚动内容宽度
var three_memowidth=''
//保存三级菜单内容的变量
var ThridMenu='';

//取得系统分辨率的函数
function getSystemMatric() {
if ((screen.width == 640) && (screen.height == 480)) 
	return 1;
else if ((screen.width == 800) && (screen.height == 600))
	return 2;
else if ((screen.width == 1024) && (screen.height == 768))
	return 3;
else
	return 2;
}

//初始化二级菜单滚动内容的函数
function initTWO(){
	two_span.style.display="";
	two_span.style.pixelLeft=0;
	two_memowidth = two_span.offsetWidth;
	two_windowwidth = two_div.offsetWidth;
	//判断是否需要显示左右拉动按钮
	if(two_memowidth>two_windowwidth){
		two_right_object=eval(two_right_button);
		two_right_object.style.visibility="visible";
		two_left_object=eval(two_left_button);
		two_left_object.style.visibility="hidden";
	}
	else{
		two_left_object=eval(two_left_button);
		two_left_object.style.visibility="hidden";
		two_right_object=eval(two_right_button);
		two_right_object.style.visibility="hidden";
	}
}

//初始化三级菜单滚动内容的函数
function initTHREE(){
	three_span.style.display="";
	three_span.style.pixelLeft=0;
	three_memowidth = three_span.offsetWidth;
	three_windowwidth = three_div.offsetWidth;
	//判断是否需要显示左右拉动按钮
	if(three_memowidth>three_windowwidth){
		three_right_object=eval(three_right_button);
		three_right_object.style.visibility="visible";
		three_left_object=eval(three_left_button);
		three_left_object.style.visibility="hidden";
	}
	else{
		three_left_object=eval(three_left_button);
		three_left_object.style.visibility="hidden";
		three_right_object=eval(three_right_button);
		three_right_object.style.visibility="hidden";
	}
}


//二级菜单向右边滚动的函数
function two_right()
{
	//判断是否已经到了滚动文字边界
	if((-two_span.style.pixelLeft+two_windowwidth)>=two_memowidth)
		two_span.style.pixelLeft-=0
	else
		two_span.style.pixelLeft-=two_offset*(getSystemMatric()>2?7:5);
		
	//判断是否隐藏滚动按钮
	if((-two_span.style.pixelLeft+two_windowwidth)>=two_memowidth)
	{
		two_right_object=eval(two_right_button);
		two_right_object.style.visibility="hidden";
	}
	two_left_object=eval(two_left_button);
	two_left_object.style.visibility="visible";
}

//二级菜单向左边滚动的函数
function two_left()
{
	//判断是否已经到了滚动文字边界
	if(two_span.style.pixelLeft==0)
		two_span.style.pixelLeft=0
	else
		two_span.style.pixelLeft+=two_offset*(getSystemMatric()>2?7:5);
		
	//判断是否隐藏滚动按钮
	if(two_span.style.pixelLeft==0)
	{
		two_left_object=eval(two_left_button);
		two_left_object.style.visibility="hidden";
	}
	two_right_object=eval(two_right_button);
	two_right_object.style.visibility="visible";
}

//三级菜单向右边滚动的函数
function three_right()
{
	//判断是否已经到了滚动文字边界
	if((-three_span.style.pixelLeft+three_windowwidth)>=three_memowidth)
		three_span.style.pixelLeft-=0
	else
		three_span.style.pixelLeft-=three_offset*(getSystemMatric()>2?6:4);

	//判断是否隐藏滚动按钮		
	if((-three_span.style.pixelLeft+three_windowwidth)>=three_memowidth)
	{
		three_right_object=eval(three_right_button);
		three_right_object.style.visibility="hidden";
	}
	three_left_object=eval(three_left_button);
	three_left_object.style.visibility="visible";
}

//三级菜单向左边滚动的函数
function three_left()
{
	//判断是否已经到了滚动文字边界
	if(three_span.style.pixelLeft==0)
		three_span.style.pixelLeft=0
	else
		three_span.style.pixelLeft+=three_offset*(getSystemMatric()>2?6:4);
		
	//判断是否隐藏滚动按钮
	if(three_span.style.pixelLeft==0)
	{
		three_left_object=eval(three_left_button);
		three_left_object.style.visibility="hidden";
	}
	three_right_object=eval(three_right_button);
	three_right_object.style.visibility="visible";
}

/*
功能说明：菜单转换的函数（运用于第一级菜单）
参数说明：
a:要显示的第一级菜单;
b:要显示的第二级菜单;
*/
function OverOneMenu(a,b)
{
	divELA=eval(a);
	CurColor=divELA.style.backgroundColor;
	//判断一级菜单是否改变，如果没有改变，则返回
	if(CurColor.toLowerCase()==bgBarNormal.toLowerCase())
		return;	
	//初始化二级菜单滚动窗口的内容
	two_span.innerHTML=SecondMenu;
	//初始化三级菜单滚动窗口的内容
	three_span.innerHTML=ThridMenu;
	//先隐藏所有的一级菜单和二级菜单、三级菜单
	for(i=1;i<FirstMenuCount+1;i++)
	{
		//隐藏第一级菜单
		ONEMenu=eval("OneMenu"+i);
		CurColor=ONEMenu.style.backgroundColor;
		//判断该一级菜单是否处于未选中状态，如果是，则返回
		if(CurColor.toLowerCase()==menu_1_bg_color)
			continue;
		
		var strTableB = "<table width='100%' height='5' border='0' cellpadding='0' cellspacing='0'><tr>";
	    strTableB +=" <td width='4' height='5'><img src='' width='4' height='5'></td>";
	    strTableB +=" <td width='99%' height='5' ><spacer></td>";
	    strTableB +=" <td width='4' height='5'><img src='' width='4' height='5'></td>";
	    strTableB +="  </tr></table>";
		
		ONEMenu.innerHTML = strTableB + "<font color=#ffffff ><b>" + ONEMenu.innerText + "<b></font>";
		ONEMenu.style.backgroundColor=menu_1_bg_color;
		//隐藏第二级菜单
		TWOMenu=eval("TwoMenu"+i);
		TWOMenu.style.visibility="hidden";
		//隐藏第三级菜单	
		MenuTWO=eval("Menu"+i);
		for(j=1;j<MenuTWO[3]+1;j++)
		{
			//使第二级菜单中的所有项都变成未被选中状态
			MenuTwoString="TwoMenu"+i+"_"+j;					
			MenuTwo=eval(MenuTwoString);
			MenuTwo.style.backgroundColor=bgBarNormal;
			MenuTwo.innerHTML = "<font color=#000000 ><img src="+NormalImage+" width=11 height=11> " + MenuTwo.innerText + "</font>";
			//隐藏第三级菜单
			MenuThreeString="DIVMenu"+i+"_"+j;					
			MenuThree=eval(MenuThreeString);
			MenuThree.style.visibility="hidden";
		}			
	}
	//显示选中的一级菜单和二级菜单
	divELB=eval(b);
	//增加圆弧形状给选中菜单
	var strTable = "<table width='100%' height='5' border='0' cellpadding='0' cellspacing='0'><tr>";
    strTable +=" <td width='4' height='5'><img src="+corner_left+" width='4' height='5'></td>";
    strTable +=" <td width='99%' height='5' background="+corner_bg+"><spacer></td>";
    strTable +=" <td width='4' height='5'><img src="+corner_right+" width='4' height='5'></td>";
    strTable +="  </tr></table>";	
	divELA.innerHTML = strTable + "<font color=#000000 ><b>" + divELA.innerText + "<b></font>";
	divELA.style.backgroundColor=bgBarNormal;
	divELB.style.visibility="visible";
	//重新设定二级菜单滚动窗口的内容
	two_span.innerHTML=divELB.innerHTML;
	initTWO();
	initTHREE();
	//改变主窗口的标题
	setWindowTitle(divELA.innerText);
}

/*
功能说明：菜单转换的函数（运用于第二级菜单）
参数说明：
a:要显示的第二级菜单;
b:要显示的第二级菜单中被选中的子项;
c:要显示的第三级菜单;
*/
function OverTwoMenu(a,b,c)
{	
	divELB=eval(b);
	CurColor=divELB.style.backgroundColor;
	//判断该子项是否已经处于被选中状态，如果是，则返回
	if(CurColor.toLowerCase()==bgBarSelect.toLowerCase())
		return;	
	//初始化三级菜单滚动窗口的内容
	three_span.innerHTML=ThridMenu;
	//先取得当前显示的二级菜单编号
	MenuNum = a.substring(a.length-1);
	//使第二级菜单中的所有子项处于未被选中状态	
	MenuTWO=eval("Menu"+MenuNum);
	for(j=1;j<MenuTWO[3]+1;j++)
	{
		//使第二级菜单中的所有项都变成未被选中状态
		MenuTwoString="TwoMenu"+MenuNum+"_"+j;					
		MenuTwo=eval(MenuTwoString);
		MenuTwo.style.backgroundColor=bgBarNormal;
		MenuTwo.innerHTML = "<font color=#000000 ><img src="+NormalImage+" width=11 height=11>" + MenuTwo.innerText + "</font>";
		//隐藏第三级菜单
		MenuThreeString="DIVMenu"+MenuNum+"_"+j;					
		MenuThree=eval(MenuThreeString);
		MenuThree.style.visibility="hidden";
	}
	
	
	divELB.innerHTML = "<font color=#000000 ><img src="+SelectImage+" width=11 height=11>" + divELB.innerText + "</font>";
	divELB.style.backgroundColor=bgBarSelect;
	divELC=eval(c);
	divELC.style.visibility="visible";
	//重新设定三级菜单滚动窗口的内容
	three_span.innerHTML=divELC.innerHTML;
	initTHREE();
}


//链接制定的URL的函数
function LinkURL(URLstr,Targetstr)
{
	if(URLstr=="")
		return;
	Targetstr=(Targetstr==""?"top.mainFrame.location":"top."+Targetstr+".location");
	eval(Targetstr).href=URLstr;
}


//主窗口标题改变函数（运用于第三级菜单）
function changeTitle(Textstr,URLstr,Targetstr)
{
	setWindowTitle(divELA.innerText+" -- "+divELB.innerText+" -- "+Textstr);
	LinkURL(URLstr,Targetstr);
}

//改变背景颜色（运用于第三级菜单）
function changeBgColor(tdobject,type)
{
	obj = eval(tdobject);
	obj.style.backgroundColor=(type=="over"?"#FFFFFF":"");
	obj.style.cursor = "hand";
}

/*
功能说明：菜单转换、链接指定URL的函数（运用于第一级菜单）
参数说明：
OneMenu:要显示的第一级菜单;
TwoMenu:要显示的第二级菜单;
URLstr:URL链接;
Targetstr:链接的目标窗口;
*/
function OneMenuLink(OneMenu,TwoMenu,URLstr,Targetstr)
{
	OverOneMenu(OneMenu,TwoMenu);
	if(URLstr=="")
		return;
	Targetstr=(Targetstr==""?"top.mainFrame.location":"top."+Targetstr+".location");
	eval(Targetstr).href=URLstr;
}


//显示1级菜单项目
function showFirstMenu()
{
	htmlString="";
	htmlString+="<table width='100%' height='24' border='0' cellpadding='0' cellspacing='0' bgcolor='" + menu_1_bg_color + "'>";
	htmlString+="<tr align='center'>";
	for(i=1;i<FirstMenuCount+1;i++)			
	{
		htmlString+="<td width='1'><font color='#FFFFFF'><font color='#000000'>|</font></font></td>";
		MenuString="Menu"+i;
		MenuOne=eval(MenuString);
		htmlString+="<td valign='top' id='One"+MenuString+"' style='background-color:" + menu_1_bg_color + ";cursor:hand;' ";
		htmlString+="onClick=OneMenuLink('One"+MenuString+"','Two"+MenuString+"','"+MenuOne[1]+"','"+MenuOne[2]+"')>";
	
		var strTable = "<table width='100%' height='5' border='0' cellpadding='0' cellspacing='0'><tr>";
	    strTable +=" <td width='4' height='5'><img src='' width='4' height='5'></td>";
	    strTable +=" <td width='99%' height='5' ><spacer></td>";
	    strTable +=" <td width='4' height='5'><img src='' width='4' height='5'></td>";
	    strTable +="  </tr></table>";
		htmlString+= strTable;
		htmlString+="<font color=#FFFFFF ><b>"+MenuOne[0]+"</b></font></td>";
	}
    htmlString+="<td width='1'><font color='#FFFFFF'><font color='#000000'>|</font></font></td>";
	htmlString+="</tr></table>";
	document.write(htmlString);	
}



//显示2级菜单项目
function showSecondMenu()
{
	document.write('<div style="width:100%;background:'+bgBarNormal+';" >')
	document.write('<table width="100%" height="24" border="0" cellpadding="0" cellspacing="0"><tr>')
	document.write('<td id="two_left_button" style="cursor:hand;" onClick="two_left()" ><<</td><td>');
	document.write('<div id="two_div" style="width:'+two_offset*(getSystemMatric()>2?8:6)+';height:24;background:'+bgBarNormal+';overflow:hidden;">');
	document.write('<div id="two_span" style="position:relative;left:0;display:none">');
	document.write('<nobr>');
	htmlString="";
	for(i=1;i<FirstMenuCount+1;i++)			
	{   
		MenuString="Menu"+i;
		MenuTwo=eval(MenuString);
		htmlString+="<table id='Two"+MenuString+"' style='POSITION: absolute; VISIBILITY:hidden;' width='100%' border='0' cellspacing='0' cellpadding='0'>";
		htmlString+="<tr>";
		htmlString+="<td bgcolor='"+bgBarNormal+"'><table height='24' border='0' cellpadding='0' cellspacing='0' bgcolor='"+bgBarNormal+"'>";
		htmlString+="<tbody><tr>";
		for(j=1;j<MenuTwo[3]+1;j++)
		{
			MenuTwoString="Menu"+i+"_"+j;
			subMenuArray=eval(MenuTwoString);
	          	htmlString+="<td valign='bottom'>";
	          	htmlString+="<table width='"+two_offset+"' height='20' border=0 cellpadding=0 cellspacing=0>"; 
	                htmlString+="<tr> "; 
	                htmlString+="<td id='Two"+MenuTwoString+"' align=center onMouseOver=OverTwoMenu('Two"+MenuString+"','Two"+MenuTwoString+"','DIV"+MenuTwoString+"') "; 
	                htmlString+="width='100%' style='cursor:hand' ";
	                htmlString+="onMouseUp=LinkURL('"+subMenuArray[1]+"','"+subMenuArray[2]+"')><font color='#000000' >"; 
	                htmlString+="<img src='"+NormalImage+"' width='11' height='11'> "+subMenuArray[0]+"</font></td>"; 
	                htmlString+="</tr>";  
	                htmlString+="</table></td> ";  
        	} 
		htmlString+="</tr></tbody></table></td></tr></table>";
	}
	SecondMenu=htmlString;
	document.write(htmlString);
	document.write('</nobr></div></div>');
	document.write('</td><td id="two_right_button" style="cursor:hand;" align="left" onClick="two_right()" >>></td></tr></table></div>');
}



//显示3级菜单项目
function showThirdMenu()
{
	document.write('<div style="width:100%;background:'+bgBarSelect+';" >')
	document.write('<table width="100%" height="24" border="0" cellpadding="0" cellspacing="0">')
	document.write('<tr><td id="three_left_button" style="cursor:hand;" onClick="three_left()" ><<</td><td>');
	document.write('<div id="three_div" style="width:'+three_offset*(getSystemMatric()>2?7:5)+';height:24;background:'+bgBarSelect+';overflow:hidden;">');
	document.write('<div id="three_span" style="position:relative;left:0;display:none">');	
	document.write('<nobr>');
	htmlString="";
	for(i=1;i<FirstMenuCount+1;i++)			
	{   
		MenuTwo=eval("Menu"+i);
		for(j=1;j<MenuTwo[3]+1;j++)
		{
			MenuThree="Menu"+i+"_"+j;;
			MenuThreeArray=eval(MenuThree);
			htmlString+="<table id='DIV"+MenuThree+"' style='POSITION: absolute; VISIBILITY:hidden;' width='100%' cellspacing='0' cellpadding='0'>";
			htmlString+="<tr>";
			htmlString+="<td><table height='24' border='0' cellpadding='0' cellspacing='0' bgcolor='"+bgBarSelect+"'>";
			htmlString+="<tbody><tr>";
			for(k=1;k<MenuThreeArray[3]+1;k++)
			{
				SubMenu=eval("Menu"+i+"_"+j+"_"+k);
	          	htmlString+="<td>";
	          	htmlString+="<table width='"+three_offset+"' border=0 cellpadding=0 cellspacing=0>"; 
                htmlString+="<tr> "; 
                htmlString+="<td align=center onMouseOver=changeBgColor(this,'over'); onMouseOut=changeBgColor(this,'out'); onMouseUp=changeTitle(this.innerText,'"+SubMenu[1]+"','"+SubMenu[2]+"');>";
				htmlString+=SubMenu[0];
                htmlString+="</td>"; 
                htmlString+="</tr>";  
                htmlString+="</table></td> ";  
	        }
			htmlString+="</tr></tbody></table></td></tr></table>";
		}
	}
	ThridMenu=htmlString;
	document.write(htmlString);	
	document.write('</nobr></div></div>');
	document.write('</td><td id="three_right_button" style="cursor:hand;" align="right" onClick="three_right()" >>></td></tr></table></div>');
}


//显示滚动文字
function showScrollText()
{
	htmlString="";
	htmlString+="<table bgcolor='"+bgBarSelect+"' width='100%' height='20' border='0' cellpadding='0' cellspacing='0'>";
	htmlString+="<tr><td align='right'>";
	htmlString+="<marquee direction='left' scrollamount='5' width='100%'><font color='"+MarqueeTextColor+"'>欢迎使用招商证券CRM系统！</font></marquee>";
	htmlString+="</td></tr></table>";
	document.write(htmlString);
}


//改变主窗口的标题
function setWindowTitle(titlestr)
{
	parent.document.title="CRM "+titlestr;
}


//执行显示菜单的函数
showFirstMenu();
showSecondMenu();
showThirdMenu();
//showScrollText();
//显示默认选中的菜单
OverOneMenu("OneMenu1","TwoMenu1");
//执行初始化二级菜单滚动内容的函数
initTWO();
//执行初始化三级菜单滚动内容的函数
initTHREE();