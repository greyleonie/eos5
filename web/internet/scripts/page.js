/*
-------------------------------------------------------------------------------
�ļ����ƣ�page.js
˵    ����JavaScript�ű���������ҳ�в�ѯ����ķ�ҳ
��    ����1.0
�޸ļ�¼:
---------------------------------------------------------------------------
ʱ��		�޸���		˵��
2002-8-30	libo		����
------------------------------------------------------------------------------- 	
*/

/*
��;��tab��ʽ�Ĳ˵���ѡ��ʱ����ʾ��ʽ�л�
���룺
���أ�
*/
function tabSeleted() {
	var srcElement = window.event.srcElement;
	var parentEle = srcElement.parentElement;
	for(i=0; i< parentEle.children.length; i++) {
		parentEle.children(i).className="tabCommon";
	}
	srcElement.className="tabSelected";
}



