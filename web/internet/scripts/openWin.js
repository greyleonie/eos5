/*
-------------------------------------------------------------------------------
�ļ����ƣ�openWin.js
˵    ����JavaScript�ű���������ҳ�е������ڵĴ���
��    ����1.0
�޸ļ�¼:
---------------------------------------------------------------------------
ʱ��			�޸���		˵��
2002-8-29	libo		����
2004-6-21	YuanYi		�޸�(��ε��ֻ����һ�����ڡ�ģʽ���ڵķ���ֵ)
2004-6-21	zhou ming		�޸�(ģʽ���ں͸����ڵ����ݽ���)
------------------------------------------------------------------------------- 	
*/

/*
��;������ģʽ����
	�˹���ֻ����IE5.0���������ʹ�á�
	�������ڵķ��Ϊ���У�û��״̬����û��IE��ť���˵�,��ַ��
���룺
	strUrl��  	������������ʾ����ҳ�ĵ�ַ
	winWidth��	�������ڵĿ�ȣ���λΪpx
	winHeight:	�������ڵĸ߶ȣ���λΪpx
	middle:		���������Ƿ�Ҫ���У�Ĭ�ϲ�����
���أ�
	���ͨ����֤����true,���򷵻�false	
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