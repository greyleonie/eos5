/*
�ļ�˵��������һ��JavaScript�ű��ļ�
����˵�������ű����������ڱ����ж�ָ�����н���ҳ�漶�������򡢽���
��    ����1.0
�޸ļ�¼:
---------------------------------------------------------------------------
ʱ��		    �޸���		˵��
2006-10-30	�볤��		����
2006-10-31  �볤��       ���������ַ�����ƴ�����߱ʻ�����
--------------------------------------------------------------------------- 
ʹ�÷�����
<table id="sortTable" >
<tr>
 <td onClick="talentsort()" title="�������" id="entity.tablefield">��1��</td>
 <td onClick="talentsort()" title="�������" id="entity.tablefield">��2��</td>
 <td onClick="talentsort()" title="�������" id="entity.tablefield">��3��</td>
 <td onClick="talentsort()" title="�������" id="entity.tablefield">��4��</td>
 <td onClick="talentsort()" title="�������" id="entity.tablefield">��5��</td>
</tr>
<tr>
......
</tr>
</table>
*/




webcontext = null;
var serverorder = false;
var isSorting = false;
var charMode  = true;  //ָ���ǰ�ƴ�����ǰ��ʻ�����,trueΪƴ��,falseΪ�ʻ�

var dom = (document.getElementsByTagName) ? true : false;
var ie5 = (document.getElementsByTagName && document.all) ? true : false;
var arrowUp, arrowDown;

//if (ie5 || dom)
	//CreateArrow();
	
/*
����˵�������������������ʾ��ͷ
*/
function CreateArrow()
{
	//alert(document.location.href)
	//alert(webcontext)
	if(webcontext==null) webcontext =  "";
	arrowUp = document.createElement("image");
	arrowUp.style.display = "";
	arrowUp.style.width="9px";
	arrowUp.style.height ="8px";
	arrowUp.src= webcontext + "/internet/image/datacell_asc.gif";

	arrowDown = document.createElement("image");
	arrowDown.style.display = "";
	arrowDown.style.width="9px";
	arrowDown.style.height ="8px";
	arrowDown.src= webcontext + "/internet/image/datacell_desc.gif";
}
CreateArrow();



/*
talentsort(tablename,colIndex)
����˵��������,���Ա�ҳ����������Ҳ���������ݿ������������

����˵����
tablename: Ҫ�����table��ID
colIndex:	ָ��Ҫ�������

*/
function talentsort(tablename,colIndex) {
	//CreateArrow();
	if(serverorder) {
		parentTD = event.srcElement;
		if(!parentTD.getAttribute("id")) {
			alert("û��ָ������������У�");
			return;
		}
		dataEntityAndCol = parentTD.getAttribute("id");
		if(dataEntityAndCol.indexOf(".") < 0) {
			alert("ָ������������и�ʽ����ȷ��\n��ȷ��ʽΪ��entity.tablefield");
			return;
		}
		var entity = dataEntityAndCol.split(".")[0];
		var tablefield = dataEntityAndCol.split(".")[1];
		var frm = document.forms[0];
		if(frm.elements[entity + "/_order/col1/field"]) {
			frm.elements[entity + "/_order/col1/field"].value = tablefield;
		}else{
		
		}
		if(frm.elements[entity + "/_order/col1/asc"]) {
			var ordertype = frm.elements[entity + "/_order/col1/asc"].value;
			if(ordertype == null || ordertype == "") {
				frm.elements[entity + "/_order/col1/asc"].value = "ASC";
			}else if(ordertype == "ASC") {
				frm.elements[entity + "/_order/col1/asc"].value = "DESC";
			}else if(ordertype == "DESC") {
				frm.elements[entity + "/_order/col1/asc"].value = "ASC";
			}
		}else{
		
		}
		frm.method = "post";
		frm.submit();


	
	}else{
		sort(tablename,colIndex)
	}


}




/*
����˵������ָ��������н��н�������
ʹ��˵�����������򽻴�ִ�У���һ�ε��Ϊ����
����˵����tablename  Ҫ����ı������ƣ�Ĭ��ΪsortTable
		  colIndex	 ��ǰҪ�������
*/


function sort(tablename,colIndex)
{
	var tobject;
	if(event.srcElement.parentElement.parentElement.parentElement.tagName!="TABLE") {
		alert("��ָ��Ҫ����ı���");
		return;
	}

	if(tablename==null)
		tobject=event.srcElement.parentElement.parentElement.parentElement;
	else
		tobject=getobj(tablename);


		
	if(tobject==null)
	{
		alert("��ָ��Ҫ����ı���");
		return;
	}

	

	//Ϊ�˷�ֹ�ظ�������������ң��趨һ����־������һ������û�����ǰ�����ٴν�������
	if (isSorting) return;	
		isSorting = true;
	
	//��ȡ<td>������
	parentTD = event.srcElement;
   	while ( parentTD )
   	{
      	if ( parentTD.tagName=="TD" )
        	break;
      	parentTD=parentTD.parentElement;
   	}

	if(colIndex == null) {
		colIndex = parentTD.cellIndex;
	}

	var value = parentTD.getAttribute("SORT");
	if(value==null || value=="DESC")
	{
		sortColumn(false,colIndex==null?parentTD:'null',tobject,colIndex);
		parentTD.setAttribute("SORT","ASC");
		HiddenArrow(parentTD.parentElement);
		parentTD.parentElement.arrow = arrowDown.cloneNode(true);
		parentTD.appendChild(parentTD.parentElement.arrow);
	}
	else
	{
		sortColumn(true,colIndex==null?parentTD:'null',tobject,colIndex);	
		parentTD.setAttribute("SORT","DESC");
		HiddenArrow(parentTD.parentElement);
		parentTD.parentElement.arrow = arrowUp.cloneNode(true);
		parentTD.appendChild(parentTD.parentElement.arrow);
	}
	isSorting = false;
}


function HiddenArrow(TRobject)
{
	if (TRobject.arrow != null) {
		TRobject.arrow.parentNode.removeChild(TRobject.arrow);
	}
}

/*
function sortColumn(type,Eobject,tobject,colindex)
����˵������ָ�����н���ָ��������

����˵����
bASC:	����Ĺ���true ���� false ����
Eobject:��ǰ������Ķ���(���Ϊnull����ʾָ����������)
tobject:Ҫ����ı������
colindex:��ǰҪ�������
*/
function sortColumn(bASC,Eobject,tobject,colindex)
{
	//ȡ�ñ�����Ķ���
	var tBody = tobject.tBodies[0];
	//ȡ��ָ����������
	colindex=colindex==null?0:colindex;
	//ȡ�õ�ǰҪ�������
	var column = Eobject=="null"?colindex:Eobject.cellIndex;
	
	//ȡ�ñ����������
	var rows = tobject.rows;
    var absRowsLength = rows.length;
	//������˱���ײ�������
    if(tobject.tFoot) 
	{
		absRowsLength -= tobject.tFoot.rows.length;
	}
	//������˱���ͷ��������(Ĭ��Ϊ1,���������Ƿ�ֹ����ͷ�ж��е����)
	var row_start = 1;
	if(tobject.tHead) 
	{
		row_start = tobject.tHead.rows.length;
	}
	
	var a = new Array();
	for (var i=0; i<absRowsLength-row_start; i++) 
	{
		a[i] = rows[i+row_start];
		if(rows[i+row_start].cells[0].innerHTML==" " )
			a[i].cells[column].innerHTML="";

		
	}
	
	a.sort(compareByColumn(column,bASC));
	for (var i = 0; i < a.length; i++)
	{
		a[i].className=(i%2==0?"td1":"td2");
		a[i].cells[column].innerHTML=a[i].cells[column].innerHTML==""?"&nbsp;":a[i].cells[column].innerHTML;
		tBody.appendChild(a[i]);
	}
	
	
}

/*
function compareByColumn(nCol, bAscending)
����˵��������ȷ��Ԫ��˳��ĺ���

����˵����
nCol:		�����������
bAscending:	�Ƿ���
*/
function compareByColumn(nCol, bAscending) {
	var c = nCol;
	var d = bAscending;

	function _compare(n1, n2) {
		var v;
		try {
			var s1 = n1.cells[c].innerText || n1.cells[c].firstChild.eibValue || n1.cells[c].firstChild.value || n1.cells[c].firstChild.innerText;
			var s2 = n2.cells[c].innerText || n2.cells[c].firstChild.eibValue || n2.cells[c].firstChild.value || n2.cells[c].firstChild.innerText;
			s1 = s1.replace(/[,\:\-\ ]/g,"");
			s2 = s2.replace(/[,\:\-\ ]/g,"");
			var f1 = parseFloat(s1);
			var f2 = parseFloat(s2);
			s1 = s1.toLowerCase();
			s2 = s2.toLowerCase();
			if (!isNaN(f1) && !isNaN(f2))
			{
				// sorting numbers
				if (f1 < f2) v = (d) ? -1 : +1;
				else if (f1 > f2) v = (d) ? +1 : -1;
				else v = 0;
			}
			else
			{
				// sorting strings
				/*
				if (s1 < s2) v = (d) ? -1 : +1;
				else if (s1 > s2) v = (d) ? +1 : -1;
				else v = 0;
				*/
				s1=s1.toString();
				s2=s2.toString();
				if(s1.charCodeAt(0)>=19968 && s2.charCodeAt(0)>=19968){
					v = judge_CN(s1,s2,d);
				}else{
					v = d?(s1>s2?1:(s1<s2?-1:0)):(s1<s2?1:(s1>s2?-1:0));
				}
			}
		} catch(e) { v = 0; }

		return v;
	}
	
	return _compare;
}

function getobj(mtxt)  /* Get object by object name */
{
  if (document.getElementById) {
      m=document.getElementById(mtxt);
  } else if (document.all) {
      m=document.all[mtxt];
  } else if (document.layers) {
      m=document.layers[mtxt];
  }
  return m;
}

var charPYStr = "�������������������������������������������������������������������°ðİŰưǰȰɰʰ˰̰ͰΰϰаѰҰӰ԰հְװذٰڰ۰ܰݰް߰�������������������������������������������������������������������������������������������������������������±ñıűƱǱȱɱʱ˱̱ͱαϱбѱұӱԱձֱױرٱڱ۱ܱݱޱ߱�������������������������������������������������������������������������������������������������������������²òĲŲƲǲȲɲʲ˲̲ͲβϲвѲҲӲԲղֲײزٲڲ۲ܲݲ޲߲�������������������������������������������������������������������������������������������������������������³óĳųƳǳȳɳʳ˳̳ͳγϳгѳҳӳԳճֳ׳سٳڳ۳ܳݳ޳߳�������������������������������������������������������������������������������������������������������������´ôĴŴƴǴȴɴʴ˴̴ʹδϴдѴҴӴԴմִ״شٴڴ۴ܴݴ޴ߴ�������������������������������������������������������������������������������������������������������������µõĵŵƵǵȵɵʵ˵̵͵εϵеѵҵӵԵյֵ׵صٵڵ۵ܵݵ޵ߵ�������������������������������������������������������������������������������������������������������������¶öĶŶƶǶȶɶʶ˶̶Ͷζ϶жѶҶӶԶնֶ׶ضٶڶ۶ܶݶ޶߶�������������������������������������������������������������������������������������������������������������·÷ķŷƷǷȷɷʷ˷̷ͷηϷзѷҷӷԷշַ׷طٷڷ۷ܷݷ޷߷�������������������������������������������������������������������������������������������������������������¸øĸŸƸǸȸɸʸ˸̸͸θϸиѸҸӸԸոָ׸ظٸڸ۸ܸݸ޸߸�������������������������������������������������������������������������������������������������������������¹ùĹŹƹǹȹɹʹ˹̹͹ιϹйѹҹӹԹչֹ׹عٹڹ۹ܹݹ޹߹�������������������������������������������������������������������������������������������������������������ºúĺźƺǺȺɺʺ˺̺ͺκϺкѺҺӺԺպֺ׺غٺںۺܺݺ޺ߺ�������������������������������������������������������������������������������������������������������������»ûĻŻƻǻȻɻʻ˻̻ͻλϻлѻһӻԻջֻ׻ػٻڻۻܻݻ޻߻�������������������������������������������������������������������������������������������������������������¼üļżƼǼȼɼʼ˼̼ͼμϼмѼҼӼԼռּ׼ؼټڼۼܼݼ޼߼�������������������������������������������������������������������������������������������������������������½ýĽŽƽǽȽɽʽ˽̽ͽνϽнѽҽӽԽսֽ׽ؽٽھ����������������������������������������������������������¾þľžƾǾȾɾʾ˾̾;ξϾоѾҾӾԾվ־׾ؾپھ۾ܾݾ޾߾�����������������������۽ܽݽ޽߽�����������������������������������������������������������������������������������������������������������������������������������������¿ÿĿſƿǿȿɿʿ˿̿ͿοϿпѿҿӿԿտֿ׿ؿٿڿۿܿݿ޿߿����������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·¸¹º»¼½¾¿������������������������������������������������������������������������������������������������������������������������������áâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþÿ������������������������������������������������������������������������������������������������������������������������������ġĢģĤĥĦħĨĩĪīĬĭĮįİıĲĳĴĵĶķĸĹĺĻļĽľĿ������������������������������������������������������������������������������������������������������������������������������šŢţŤťŦŧŨũŪūŬŭŮůŰűŲųŴŵŶŷŸŹźŻżŽžſ������������������������������������������������������������������������������������������������������������������������������ơƢƣƤƥƦƧƨƩƪƫƬƭƮƯưƱƲƳƴƵƶƷƸƹƺƻƼƽƾƿ������������������������������������������������������������������������������������������������������������������������������ǢǣǤǥǦǧǨǩǪǫǬǭǮǯǰǱǲǳǴǵǶǷǸǹǺǻǼǽǾǿ������������������������������������������������������������������������������������������������������������������������������ȡȢȣȤȥȦȧȨȩȪȫȬȭȮȯȰȱȲȳȴȵȶȷȸȹȺȻȼȽȾȿ������������������������������������������������������������������������������������������������������������������������������ɡɢɣɤɥɦɧɨɩɪɫɬɭɮɯɰɱɲɳɴɵɶɷɸɹɺɻɼɽɾɿ������������������������������������������������������������������������������������������������������������������������������ʡʢʣʤʥʦʧʨʩʪʫʬʭʮʯʰʱʲʳʴʵʶʷʸʹʺʻʼʽʾʿ������������������������������������������������������������������������������������������������������������������������������ˡˢˣˤ˥˦˧˨˩˪˫ˬ˭ˮ˯˰˱˲˳˴˵˶˷˸˹˺˻˼˽˾˿������������������������������������������������������������������������������������������������������������������������������̴̵̶̷̸̡̢̧̨̣̤̥̦̩̪̫̬̭̮̯̰̱̲̳̹̺̻̼̽̾̿������������������������������������������������������������������������������������������������������������������������������ͣͤͥͦͧͨͩͪͫͬͭͮͯ͢͡ͰͱͲͳʹ͵Ͷͷ͸͹ͺͻͼͽ;Ϳ������������������������������������������������������������������������������������������������������������������������������Ρ΢ΣΤΥΦΧΨΩΪΫάέήίΰαβγδεζηθικλμνξο������������������������������������������������������������������������������������������������������������������������������ϡϢϣϤϥϦϧϨϩϪϫϬϭϮϯϰϱϲϳϴϵ϶ϷϸϹϺϻϼϽϾϿ������������������������������������������������������������������������������������������������������������������������������СТУФХЦЧШЩЪЫЬЭЮЯабвгдежзийклмноп������������������������������������������������������������������������������������������������������������������������������ѡѢѣѤѥѦѧѨѩѪѫѬѭѮѯѰѱѲѳѴѵѶѷѸѹѺѻѼѽѾѿ������������������������������������������������������������������������������������������������������������������������������ҡҢңҤҥҦҧҨҩҪҫҬҭҮүҰұҲҳҴҵҶҷҸҹҺһҼҽҾҿ������������������������������������������������������������������������������������������������������������������������������ӡӢӣӤӥӦӧӨөӪӫӬӭӮӯӰӱӲӳӴӵӶӷӸӹӺӻӼӽӾӿ������������������������������������������������������������������������������������������������������������������������������ԡԢԣԤԥԦԧԨԩԪԫԬԭԮԯ԰ԱԲԳԴԵԶԷԸԹԺԻԼԽԾԿ������������������������������������������������������������������������������������������������������������������������������աբգդեզէըթժիլխծկհձղճմյնշոչպջռսվտ������������������������������������������������������������������������������������������������������������������������������ְֱֲֳִֵֶַָֹֺֻּֽ֢֣֤֥֦֧֪֭֮֡֨֩֫֬֯־ֿ������������������������������������������������������������������������������������������������������������������������������סעףפץצקרשת׫׬׭׮ׯװױײ׳״׵׶׷׸׹׺׻׼׽׾׿��������������������������������������������������������������������������������������������������������������������";
var charBHStr = "һ�Ҷ����˾��˶��˶���˼�������ʮ���������������¸�Ѿ���ô����Ҳϰ���ڿ����ڷ�����ǧ�������ʿϦ��Ů�Ӵ�Сʬɽ���������Ƚ��ɹ㹭���ŷ��������ר�зᵤΪ֮�������ƻ��微��ʲ�ʽ��ͳ����Դ��ز���Ԫ�����ڸ��߷��׷���Ȱ�카���Ȼ�ƥ����������������˫������̫������������Ͱͱһÿ�������껧����֧�Ķ��﷽����Ի��ľǷֹ�����ë����ˮ��צ��Ƭ��ţȮ�����ռ��ƶ����ϼ������˳���Τ���������ҵ�Զ�˿��է�������������̸���Ǫ��������������Ƚ��д����͹����������������ұ��ѻܰ�ռ��¬î��ȥ���ž���ֻ���ٰȶ���̨ʷ��Ҷ��˾̾������ʥ�����뺻ʧͷū���������Զ������ɾ��в�˧ƽ�׸��������˰Ǵ��ӳ⵩��δĩ��������ĸ����֭͡�㺺������ϸ�����˦���ɼ�����Ƥ��Ŀìʸʯʾ���Ѩ��������������ѵ��Ѷ������������Ԧ������ƹ���������ǽ���������ټ����ηݷ������鼿���������Ż��ɡΰ������α�����ȹ�ȫ�������پ�ũ������̻�������մ��Ӷ��ٽ��ﻪЭӡΣѹ�����Ը��ϼ���ͬ����������������������ڹ�س���׳���Ŀ�ж����������ױ�����ִ���լ���ذ���Ѱ���⳾Ң������������Ѳ����ʦ�겢ׯ����͢��ʽ�ڵ�æ������Ϸ���п���Ǥִ��ɨ����ּ��Ѯ����ҷ�����Ӷ����ɱ��Ȩ�λ���������ϫ�Ǻ�Ѵ�꽭���������ƻ�үĲ�������׺���Լ�������������Ͽ��������߼�������������ɫ����â֥��Ѫ�������۽������������Ϸ���þ��긺���Ǩ����Ѹ�������ǰ�а���ʴ�����������ҳ��ѱ�������ϴ����Һ�Ķ�������������Ƶ赫λ��ס��������������Ӷ����ұ���ұ�䶳��ɾ����������Ŭ��������ϻҽ±��ȴ���ؾ��������ͷ�ɶַԺ�����˱��֨�ⳳ�����Ǻ���ѽ���ʸ���ŻԱǺ�ض�԰����Χַ����̮�������ӿ��̳�����׹�����Ѷʼ������׷���Т�������β���ƨ����ڵ�ϣ�ʱӴ���®��Ӧ��Ū������ͮ�۳�����־���ǿ���û��ҽ�Ť�糶�Ű�������Ҽ����������ץͶ�����۸��׿�������������Ĺ���ʱ������ɼ���ӲĴ��ȶ��������������ÿ����̭�����������������ɳ�湵ûŽ���ٲ׻�����������ֲ�ĵ��״�̿�ұ����긦�е�������������˽ͺ����ϵγ��ɴ�������ڷ�ֽ�Ʒ�Ŧ��ǼФ��Ǹظγ����߽�«�Ұ�о������ѿέ���ղ�����֤����ʶթ�����ߴ���ȶ����Ƴ�������������ӭ�˽��������ԶΥ�������ʺ��������������붤���м����谢�Ӹ���½¤���ͷ�������¿�����ɥ������Щ����������ۼ�ʹֶ�����̶��������½�����ȿ�����ߵ侻ƾ�����ε���ˢȯɲ�̹̿�����Ʊ���׿�����Ծ���������ȡ����ζ�������������զ�;�ӽ���乾�������̹�ͼ����̹ƺ��������¢��ҹ�����η�ܱ�������ķʼ�����ί�ϼ���ѧ�ڹ��涨���˱�ʵ�����о�������������������������㲯���ҵ׵��������ӷϽ����һ�¼���������������̬�����²����Թ��ӻ���������̧����ĨѺ�����������Ĵ������������ذ��Ͼ�׾��£��ӵ��š����Ÿ�ն��������������������������ɰ幹��������ö��֦����ǹ�����ŷ����Źå��ĭ�ںӷ������ӹ�մ��й�����ڷ�Ţ�ݲ�����ע��Ӿк����ǳ¯���׳�Ȳ���˾����ְ��������������õ�����ͻ�������ű�����äֱ֪�����������ѱ�����������ϸ֯�հ����ﾭ����Ү���֫���ʼ緾��������������в���Է̦�����������ɻ��Ӣƻ��ï����é����²ʭ�����Ĺ�������ʫ���ﻰ����ѯ���������Ͱ��˻��ʷ�̰ƶ�Ṻ����ת�����������ȵ���������֣�ɽ�ǥ����բ�ָ�ªİ������������Ƕ��꽤�α���ʻ��פ�ռ��������پ�ͤ��������ֱ�ٶ��������׷�����������������ð������ǰ�н�������ѫ��ж����ܱ�������ҧ���ۿ����ʰ�Ʒ����۹������ƻ�Ӵ�����ݶ⹸ԫ�ѵ��Ǹ���������Ҧ��������������¦���Ⱥ��Ͽ����һ��ܹ��⽫����ʺ����Ͽ�Ͳ���۴�֡���Ķ�ͥ�������ܻ�����ŭ˼����Թ���ѻк�����޶�����ս�����������˩��ƴקʰ�ֹ�ָ����������̢Ю�ӵ�������Ųͦ����ʩ����ӳ�������������Կݼܼϱ���ĳ����Ⱦ�����������������դ��ջ������������жζ�����ձ����Ȫ�ý�����ϴ�嶴�����޻���Ǣ�ɽ��ǲ�û�Ũ��̿�ھ���ը������˸������ǣ�ݽƶ���ʨ�����Უɺ�䷩���½�η�̽��ߴ����Ի�����ӯ���ζ�ʡü��գ��ɰ��������ש����ף�������ֿ��봩ͻ���������Ѱ��޽��ƻ��Ѥ�����ͳ�׷���ˣ��θ����̥����ʤ���������ã��������㾣�ݼ�����Ե��ٻ�ӫ��ҩŰ����Ϻʴ�������ܰ�Ҫ�������������ջ�˵�з��������ó�Ѻظ���ſ�����Աż�׷����������ѡѷ�¿������ظƶ۳����Ʊ���Կ�վ��ٹ�ť����������ұݶ�Ժ��������������˳��ʳ���Ľȱ�������溧�ǹ�Ÿѻ�˸��㰳�������Ⱥ��н賫����ծֵ�㽡����ԩ��׼���������ʰ��������ԭ��Ŷ���������ܲ������������ƻ�����Բ�������Һ����׼������������׺��������ݿ�����мչ�����ͷ��ϯ������ͽ����ˡ����Ϣ�Ҷ��ĺ�����������ȭ��ֿ�ΰ���������ͱ��׽�ƺ�����貶����񻻵�Ч�а�ի�����ûν���ɹ������˷�ʲ�˨����У�����˸����Թ���Φ����ͩɣ���۵��Ž�׮��������ѳ����к�����̩�����㿣�ֺ��˸�ԡ����Ϳ������ӿ���������л�������ɬ�Һ������̿����ջ��̽��Ȱ��������������ƿ��������ƣ���۾Ҽ���֢Ӹ�������氻յ�μ�����ѣ������������������������������Ȼ���խ��վ������Ц�ʷ����������������м�ȱ�ո����̳�����Ű��ʳܵ��������ȸ콺�ذ���֬�༹������ŧ����Ҩ���㽢���޺�����ɯĪ������Өç���ð�����˥��Ԭ��̻���౻����ŵ���̿�˭����׻̸�걪�����ֻ���¸���ʸ����ؽν���͸���;��ͨ���ų�����겿������������Ƹ�Ǯǯ�������������Ǧí��������������˶ٰ���Ԥ���ٳ��鿥��Ѽ��ԧ��Ǭ��ƫ��ͣż͵������������ջ˼����տ�����ǻ���Ψ���ٿ����̷�ơɶ��ž��ХȦ������ö�ǵ��¹���Ȣ�������Ӥ�����޼ż����ܿ�ξ��������±�ո��������ӹ�ȵ��ʱ������Ϥ�ƻ������µ��龪����ϧΩ���Ҳѵ��������ݴ������Ƶ���ڵ�������Ҵ����̽�ӿ����ڴ�°���������Ƚ����ָ�б��������޳�������Ͱ��÷��������е�����������Һ���Ե��������������Ե������㻴���������Ԩ�ս�������ϩ������ɺ���ˬ���Բ��Ͳ���è�������������������Ȭ���̺۰��п��ǵ���ʢ�п������������ù���˶Ʊ���������ƻ�Ҥ�Ͼ��µѷ����ڼ������ɴ�ճ�ۼ���������ά�����������׺��������ְ���Ÿ������沰�ϴ����վ��ʲ˲����������Ƽή��өӪ�������������߹Ƶ����δ�Ϯ��ı����гν������������ֺԾ�������������߶������̪Ұͭ��աϳ������ҿ�������ֲ���¡������ȸѩ­���ľ��ڹ�����¹��ƹ���������������ʣ��ļ���ó��俦ι����������ϲ�������������̿�����Ҽ�����ý��ɩ���º�Ԣ�������Ƕñ�ݷ�ǿ����ѭ����ݳͱ��������������ſ��Ƴ����������Ҿ�մ�������Ԯ�����§����ɦ�Ѵ�볨ɢ�ؾ����˹�վ����羧�����������������������ؼ�����ɭ��ù���ֲ׵����Ҭ���ۿ�ֳ̺���������������μ�ۿ��������ĺ���տ��ʪ�����ȳ��̻��ͱ��ٽ���Ȼ����Ϭ���ɺﻫ�������������������趻ʹƦ�������������Ӳȷ��»��ϡ����˰�Ѵ������ѿ�ͯ�Ƚ����Ͳ���ɸ����������������¼��л����Ʊ�Ե��������Ƣ����Ҹ��ǻ����˴ͧ����϶�����п��ٽ�������������ѽֲ���װԣȹ��лҥ��ǫ�������ʹ���ó�Խ���ϵ��ܼ����Թ������������������ź��������������������������п������������϶�����ż��ͺ�������ƭɧ³�����ڶ���ɵ����ڵ���ɤ����������������Ĺϱ�޼�����į��Ļ����΢��������޸д����岫�����°�Я���ҡ��̯��������Ͼů������Ш���㿬¥���ܻ�Ъ����Դ����Ϫ����������Ϲ��������б�̲��Į�ͼ�ɷú����Գ����ɪ�����̵�ձԴ��˾�˯�����޲Ƕ��鰫���µ���鱮������������ɳ��߿����ǩ���������������������ȺƸ�������������������Ⱦ������������������������Ӽ�������������ӽⴥղ���ܽ�á�������������·����������Ǳ�ǲң���ҳ�ͪ�������ê���സ׶���Ƕ���������Ӻ�����ױ�������ѥ������Ƶ��ӱ����걫ȵ����������ɮ�۾����Լθ����ﾳ����ǽ���۷������կ�α���ԸĽ������ˤժ��ġ��Ʋ�������ե��ȶ��ģǸ��Ư��©����������ΫɿϨ��Ѭ���������������ݴ����̼�̼��Ŵ��Ƚ߶˹����������⾫ӧ���Դ���ظ��򲲸�Ĥ������������ε����Ǿ������֩����Ӭ�������������̷���׺�ò׸׬����ӻ��ԯϽշ�����ڽ�ø�������¶Ͷ�þ�����農�ؿ��������ʱǽ�Ƨ��������˻����ҭ������ī���Ĵ�Ӱ�»�ο��������¾Ħ�����˺ײ�����˲���׫���ܷ�ĺ���۷�����ӣ������Ǳ��̶���γ�������������̱Ϲ��������Ϳĵ��ڻ������׭ƪ¨���ɴϱ���ϥ���߽�����Ы�Ⱥ�������Ǵ��ԥ��Ȥ̤���߲������������������������ù��Ь�����ն�Ʈ��������弽���������ɱں�и���������ò����������ȳ�º�輤��ȼ����̡ư��ȳƳĥ�������ݴ���������ǲڽɺ������������ٱ�Ѧн���������������ޱ���������ȩ��������ص��ʵ߲;�ǭĬ�ܺ��纾���ų������̴ϭ�������������˲ͫ�׽���ػ����㿷�����α�ӷ�ܽ�����������Ӯ��̣����˪ϼ����κ��ȣ���ʹ���հ��ź�ٷ��󸲱ĳ���������ӥ�������ر��꽮Ѣ������Ģз���Ų�״��Ҳ���´�½���Ρ���༮Ŵ��ҫ��Ʃ��ħ�۴���¶��������ȿպ����ȧ��";
function judge_CN(char1,char2,mode){
	var charSet=charMode?charPYStr:charBHStr;
	for(var n=0;n<(char1.length>char2.length?char1.length:char2.length);n++){
		if(char1.charAt(n)!=char2.charAt(n)){
			if(mode) return(charSet.indexOf(char1.charAt(n))>charSet.indexOf(char2.charAt(n))?1:-1);
			else	 return(charSet.indexOf(char1.charAt(n))<charSet.indexOf(char2.charAt(n))?1:-1);
			break;
		}
	}
	return(0);
}





/*
loadOrderImg(theform,entity)
����˵������������ͼ��

����˵����
theform: ����
entity:	ҳ���ѯ�õ�����ʵ��
*/
function loadOrderImg(theform,entity) {
	var tablefield = theform.elements[entity + "/_order/col1/field"];
	var ordertype = theform.elements[entity + "/_order/col1/asc"];
	if(tablefield && ordertype) {
		if(tablefield.value!=null && tablefield.value!="" && ordertype.value!=null && ordertype.value!="") {
			parentTdId = entity + "." + tablefield.value;
			parentTDf = document.getElementById(parentTdId);
			if(parentTDf) {
				orderValue = ordertype.value;
				if(orderValue=="ASC"){
					parentTDf.setAttribute("SORT","ASC");
					HiddenArrow(parentTDf.parentElement);
					parentTDf.parentElement.arrow = arrowUp.cloneNode(true);
					parentTDf.appendChild(parentTDf.parentElement.arrow);
				}else{
					parentTDf.setAttribute("SORT","DESC");
					HiddenArrow(parentTDf.parentElement);
					parentTDf.parentElement.arrow = arrowDown.cloneNode(true);
					parentTDf.appendChild(parentTDf.parentElement.arrow);
				}
				isSorting = false;
			}
		}
	}

}


/*
*changeBgColorOnClick(obj)
*����˵���������ʱ���ı���ɫ
*����˵����obj�ж���һ����this
*/
function changeBgColorOnClick(obj) {
	
	tobject = obj.parentElement.parentElement;
	var tBody = tobject.tBodies[0];
	
	
	//ȡ�ñ����������
	var rows = tobject.rows;
    var absRowsLength = rows.length;
	//������˱���ײ�������
    if(tobject.tFoot) 
	{
		absRowsLength -= tobject.tFoot.rows.length;
	}
	//������˱���ͷ��������(Ĭ��Ϊ1,���������Ƿ�ֹ����ͷ�ж��е����)
	var row_start = 1;
	if(tobject.tHead) 
	{
		row_start = tobject.tHead.rows.length;
	}
	
	
	for (var i=0; i<absRowsLength-row_start; i++) 
	{
		rows[i+row_start].style.backgroundColor = '';
		
		
	}
	obj.style.backgroundColor='#FFCF00';
}