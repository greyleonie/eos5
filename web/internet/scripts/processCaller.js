/*
 *�û���Ҫ�����ύ����ʱ����javascript�нӵ���callBizAction( bizAction, bizParam )����
 *�˺���ͨ��XMLHttp��Server�˵�/internet/scripts/pageComponent/proxy.jsp��������proxy.jsp��ɶ�ҵ���Զ����ĵ���
 *����˵����
 *bizAction�����õ�ҵ���Զ���������
 *bizParam������ҵ���Զ���ʱ���ݵĲ�����XML��ʽ��
 *����ֵ�������������returnCode<0������false���ɹ������ص���ҵ���Զ���ִ�к�ķ���ֵ��XML��ʽ��
 *
 *ע���˺�������/internet/scripts/pageComponent/string.js�е�trim()����
 *
 *
 *����callBizAction( "ROLE.biz.ROLE_B_addRoleOperator", "<root><data><EOSOperator><operatorID>12</operatorID></EOSOperator></data></root>");
*/

function callBizAction( bizAction, bizParam )
{
	function processReturnError( oReq )
	{	
		var retDom = new ActiveXObject("MSXML2.DOMDocument");
		retDom.async=false;
		retDom.loadXML( trim( oReq.responseText ) );
		
		var retCodeNode = retDom.selectSingleNode( "root/data/return/code" );
		if( !retCodeNode ) return true;
		
		var retCode = retCodeNode.text;
		
		if( !retCode ) return true;
		retCode = parseInt( retCode );
		
		//�������ֵС��0��˵��ҵ���߼�������������ʾ������Ϣ
		if( retCode < 0 )
		{
			var msg = retDom.selectSingleNode( "root/data/return/message" ).text;
			if( msg ) alert( msg );
			
			if( retCode == -99001 )	//��ʱ������½ҳ��
			{
				var timeoutPage = retDom.selectSingleNode( "root/data/timeoutPage" ).text;
				var url = window.location.protocol+"//"+window.location.host+"//"+ timeoutPage;
				window.open( url, "_top");
			}
			return false;
		}
		//�������ֵ����0��˵��ҵ���߼�����ɹ�����ʾ��Ϣ
		if(retCode==0)
		{
			var msg = retDom.selectSingleNode( "root/data/return/message" ).text;
			if( msg ) alert( msg );
		}
		
		return true;
	}
	//У������Ƿ�����ȷ��xml�ṹ���������ȷ��Ĭ�ϲ���Ϊ<root><data></data></root>
	var paramDom = new ActiveXObject("MSXML2.DOMDocument");
	try
	{
		paramDom.async=false;
		paramDom.loadXML( trim(bizParam) );
	}catch( e )
	{
		bizParam = "<root><data></data></root>";
	}
	//------------
	
	var proxyURL = window.location.protocol+"//"+window.location.host+"/bizService.call";
	proxyURL += "?bizAction=" + bizAction;
	
	var oReq  = new ActiveXObject("Microsoft.XMLHTTP");
	try{
		oReq.open("POST", proxyURL, false);

		// ԭ������ oReq.send(escape(bizParam));
		oReq.send(bizParam);
		
		//��鴦��ҵ���߼��Ƿ�ɹ�����ʧ�ܣ���ʾ������Ϣ
		if( !processReturnError( oReq ) ) return false;
	}catch( e )
	{
		return false;
		return "<root><data><return><code>-9900</code></return></data></root>";
	}	
	
	return trim( oReq.responseText );
}
