/*
�ļ�˵��������һ��JavaScript�ű��ļ�
����˵�������ű�����������̬�����༶�˵�
����ʱ�䣺20030605
�����ˣ�ajun
*/

//����һ���˵��ı���ɫ
var menu_1_bg_color = "#002A6B";
//�������״̬�²˵�����ı�����ɫ
var bgBarNormal="#87B5E6";
var bgBarSelect="#BDDBFA";
//����������ֵ���ɫ
var MarqueeTextColor="#666666";
//����˵��е�ͼƬ
var SelectImage="/internet/theme/style0/arrow2.gif";
var NormalImage="/internet/theme/style0/arrow1.gif";
var corner_left="/internet/scripts/img/corner_left.gif";
var corner_bg="/internet/scripts/img/corner_bg.gif";
var corner_right="/internet/scripts/img/corner_right.gif";
//��������ٶ�(1-10),Խ��Խ��
var scrollspeed=8
//��������˵�ÿ�ε����ƫ�ƾ���
var two_offset=115
//���������˵�ÿ�ε����ƫ�ƾ���
var three_offset=130

//�����˵���ʾ���ڿ��
var two_windowwidth=''
//�����˵��������ݿ��
var two_memowidth=''
//��������˵����ݵı���
var SecondMenu='';

//�����˵���ʾ���ڿ��
var three_windowwidth=''
//�����˵��������ݿ��
var three_memowidth=''
//���������˵����ݵı���
var ThridMenu='';

//ȡ��ϵͳ�ֱ��ʵĺ���
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

//��ʼ�������˵��������ݵĺ���
function initTWO(){
	two_span.style.display="";
	two_span.style.pixelLeft=0;
	two_memowidth = two_span.offsetWidth;
	two_windowwidth = two_div.offsetWidth;
	//�ж��Ƿ���Ҫ��ʾ����������ť
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

//��ʼ�������˵��������ݵĺ���
function initTHREE(){
	three_span.style.display="";
	three_span.style.pixelLeft=0;
	three_memowidth = three_span.offsetWidth;
	three_windowwidth = three_div.offsetWidth;
	//�ж��Ƿ���Ҫ��ʾ����������ť
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


//�����˵����ұ߹����ĺ���
function two_right()
{
	//�ж��Ƿ��Ѿ����˹������ֱ߽�
	if((-two_span.style.pixelLeft+two_windowwidth)>=two_memowidth)
		two_span.style.pixelLeft-=0
	else
		two_span.style.pixelLeft-=two_offset*(getSystemMatric()>2?7:5);
		
	//�ж��Ƿ����ع�����ť
	if((-two_span.style.pixelLeft+two_windowwidth)>=two_memowidth)
	{
		two_right_object=eval(two_right_button);
		two_right_object.style.visibility="hidden";
	}
	two_left_object=eval(two_left_button);
	two_left_object.style.visibility="visible";
}

//�����˵�����߹����ĺ���
function two_left()
{
	//�ж��Ƿ��Ѿ����˹������ֱ߽�
	if(two_span.style.pixelLeft==0)
		two_span.style.pixelLeft=0
	else
		two_span.style.pixelLeft+=two_offset*(getSystemMatric()>2?7:5);
		
	//�ж��Ƿ����ع�����ť
	if(two_span.style.pixelLeft==0)
	{
		two_left_object=eval(two_left_button);
		two_left_object.style.visibility="hidden";
	}
	two_right_object=eval(two_right_button);
	two_right_object.style.visibility="visible";
}

//�����˵����ұ߹����ĺ���
function three_right()
{
	//�ж��Ƿ��Ѿ����˹������ֱ߽�
	if((-three_span.style.pixelLeft+three_windowwidth)>=three_memowidth)
		three_span.style.pixelLeft-=0
	else
		three_span.style.pixelLeft-=three_offset*(getSystemMatric()>2?6:4);

	//�ж��Ƿ����ع�����ť		
	if((-three_span.style.pixelLeft+three_windowwidth)>=three_memowidth)
	{
		three_right_object=eval(three_right_button);
		three_right_object.style.visibility="hidden";
	}
	three_left_object=eval(three_left_button);
	three_left_object.style.visibility="visible";
}

//�����˵�����߹����ĺ���
function three_left()
{
	//�ж��Ƿ��Ѿ����˹������ֱ߽�
	if(three_span.style.pixelLeft==0)
		three_span.style.pixelLeft=0
	else
		three_span.style.pixelLeft+=three_offset*(getSystemMatric()>2?6:4);
		
	//�ж��Ƿ����ع�����ť
	if(three_span.style.pixelLeft==0)
	{
		three_left_object=eval(three_left_button);
		three_left_object.style.visibility="hidden";
	}
	three_right_object=eval(three_right_button);
	three_right_object.style.visibility="visible";
}

/*
����˵�����˵�ת���ĺ����������ڵ�һ���˵���
����˵����
a:Ҫ��ʾ�ĵ�һ���˵�;
b:Ҫ��ʾ�ĵڶ����˵�;
*/
function OverOneMenu(a,b)
{
	divELA=eval(a);
	CurColor=divELA.style.backgroundColor;
	//�ж�һ���˵��Ƿ�ı䣬���û�иı䣬�򷵻�
	if(CurColor.toLowerCase()==bgBarNormal.toLowerCase())
		return;	
	//��ʼ�������˵��������ڵ�����
	two_span.innerHTML=SecondMenu;
	//��ʼ�������˵��������ڵ�����
	three_span.innerHTML=ThridMenu;
	//���������е�һ���˵��Ͷ����˵��������˵�
	for(i=1;i<FirstMenuCount+1;i++)
	{
		//���ص�һ���˵�
		ONEMenu=eval("OneMenu"+i);
		CurColor=ONEMenu.style.backgroundColor;
		//�жϸ�һ���˵��Ƿ���δѡ��״̬������ǣ��򷵻�
		if(CurColor.toLowerCase()==menu_1_bg_color)
			continue;
		
		var strTableB = "<table width='100%' height='5' border='0' cellpadding='0' cellspacing='0'><tr>";
	    strTableB +=" <td width='4' height='5'><img src='' width='4' height='5'></td>";
	    strTableB +=" <td width='99%' height='5' ><spacer></td>";
	    strTableB +=" <td width='4' height='5'><img src='' width='4' height='5'></td>";
	    strTableB +="  </tr></table>";
		
		ONEMenu.innerHTML = strTableB + "<font color=#ffffff ><b>" + ONEMenu.innerText + "<b></font>";
		ONEMenu.style.backgroundColor=menu_1_bg_color;
		//���صڶ����˵�
		TWOMenu=eval("TwoMenu"+i);
		TWOMenu.style.visibility="hidden";
		//���ص������˵�	
		MenuTWO=eval("Menu"+i);
		for(j=1;j<MenuTWO[3]+1;j++)
		{
			//ʹ�ڶ����˵��е���������δ��ѡ��״̬
			MenuTwoString="TwoMenu"+i+"_"+j;					
			MenuTwo=eval(MenuTwoString);
			MenuTwo.style.backgroundColor=bgBarNormal;
			MenuTwo.innerHTML = "<font color=#000000 ><img src="+NormalImage+" width=11 height=11> " + MenuTwo.innerText + "</font>";
			//���ص������˵�
			MenuThreeString="DIVMenu"+i+"_"+j;					
			MenuThree=eval(MenuThreeString);
			MenuThree.style.visibility="hidden";
		}			
	}
	//��ʾѡ�е�һ���˵��Ͷ����˵�
	divELB=eval(b);
	//����Բ����״��ѡ�в˵�
	var strTable = "<table width='100%' height='5' border='0' cellpadding='0' cellspacing='0'><tr>";
    strTable +=" <td width='4' height='5'><img src="+corner_left+" width='4' height='5'></td>";
    strTable +=" <td width='99%' height='5' background="+corner_bg+"><spacer></td>";
    strTable +=" <td width='4' height='5'><img src="+corner_right+" width='4' height='5'></td>";
    strTable +="  </tr></table>";	
	divELA.innerHTML = strTable + "<font color=#000000 ><b>" + divELA.innerText + "<b></font>";
	divELA.style.backgroundColor=bgBarNormal;
	divELB.style.visibility="visible";
	//�����趨�����˵��������ڵ�����
	two_span.innerHTML=divELB.innerHTML;
	initTWO();
	initTHREE();
	//�ı������ڵı���
	setWindowTitle(divELA.innerText);
}

/*
����˵�����˵�ת���ĺ����������ڵڶ����˵���
����˵����
a:Ҫ��ʾ�ĵڶ����˵�;
b:Ҫ��ʾ�ĵڶ����˵��б�ѡ�е�����;
c:Ҫ��ʾ�ĵ������˵�;
*/
function OverTwoMenu(a,b,c)
{	
	divELB=eval(b);
	CurColor=divELB.style.backgroundColor;
	//�жϸ������Ƿ��Ѿ����ڱ�ѡ��״̬������ǣ��򷵻�
	if(CurColor.toLowerCase()==bgBarSelect.toLowerCase())
		return;	
	//��ʼ�������˵��������ڵ�����
	three_span.innerHTML=ThridMenu;
	//��ȡ�õ�ǰ��ʾ�Ķ����˵����
	MenuNum = a.substring(a.length-1);
	//ʹ�ڶ����˵��е����������δ��ѡ��״̬	
	MenuTWO=eval("Menu"+MenuNum);
	for(j=1;j<MenuTWO[3]+1;j++)
	{
		//ʹ�ڶ����˵��е���������δ��ѡ��״̬
		MenuTwoString="TwoMenu"+MenuNum+"_"+j;					
		MenuTwo=eval(MenuTwoString);
		MenuTwo.style.backgroundColor=bgBarNormal;
		MenuTwo.innerHTML = "<font color=#000000 ><img src="+NormalImage+" width=11 height=11>" + MenuTwo.innerText + "</font>";
		//���ص������˵�
		MenuThreeString="DIVMenu"+MenuNum+"_"+j;					
		MenuThree=eval(MenuThreeString);
		MenuThree.style.visibility="hidden";
	}
	
	
	divELB.innerHTML = "<font color=#000000 ><img src="+SelectImage+" width=11 height=11>" + divELB.innerText + "</font>";
	divELB.style.backgroundColor=bgBarSelect;
	divELC=eval(c);
	divELC.style.visibility="visible";
	//�����趨�����˵��������ڵ�����
	three_span.innerHTML=divELC.innerHTML;
	initTHREE();
}


//�����ƶ���URL�ĺ���
function LinkURL(URLstr,Targetstr)
{
	if(URLstr=="")
		return;
	Targetstr=(Targetstr==""?"top.mainFrame.location":"top."+Targetstr+".location");
	eval(Targetstr).href=URLstr;
}


//�����ڱ���ı亯���������ڵ������˵���
function changeTitle(Textstr,URLstr,Targetstr)
{
	setWindowTitle(divELA.innerText+" -- "+divELB.innerText+" -- "+Textstr);
	LinkURL(URLstr,Targetstr);
}

//�ı䱳����ɫ�������ڵ������˵���
function changeBgColor(tdobject,type)
{
	obj = eval(tdobject);
	obj.style.backgroundColor=(type=="over"?"#FFFFFF":"");
	obj.style.cursor = "hand";
}

/*
����˵�����˵�ת��������ָ��URL�ĺ����������ڵ�һ���˵���
����˵����
OneMenu:Ҫ��ʾ�ĵ�һ���˵�;
TwoMenu:Ҫ��ʾ�ĵڶ����˵�;
URLstr:URL����;
Targetstr:���ӵ�Ŀ�괰��;
*/
function OneMenuLink(OneMenu,TwoMenu,URLstr,Targetstr)
{
	OverOneMenu(OneMenu,TwoMenu);
	if(URLstr=="")
		return;
	Targetstr=(Targetstr==""?"top.mainFrame.location":"top."+Targetstr+".location");
	eval(Targetstr).href=URLstr;
}


//��ʾ1���˵���Ŀ
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



//��ʾ2���˵���Ŀ
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



//��ʾ3���˵���Ŀ
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


//��ʾ��������
function showScrollText()
{
	htmlString="";
	htmlString+="<table bgcolor='"+bgBarSelect+"' width='100%' height='20' border='0' cellpadding='0' cellspacing='0'>";
	htmlString+="<tr><td align='right'>";
	htmlString+="<marquee direction='left' scrollamount='5' width='100%'><font color='"+MarqueeTextColor+"'>��ӭʹ������֤ȯCRMϵͳ��</font></marquee>";
	htmlString+="</td></tr></table>";
	document.write(htmlString);
}


//�ı������ڵı���
function setWindowTitle(titlestr)
{
	parent.document.title="CRM "+titlestr;
}


//ִ����ʾ�˵��ĺ���
showFirstMenu();
showSecondMenu();
showThirdMenu();
//showScrollText();
//��ʾĬ��ѡ�еĲ˵�
OverOneMenu("OneMenu1","TwoMenu1");
//ִ�г�ʼ�������˵��������ݵĺ���
initTWO();
//ִ�г�ʼ�������˵��������ݵĺ���
initTHREE();