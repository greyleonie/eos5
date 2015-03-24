/*
-------------------------------------------------------------------------------
�ļ����ƣ�dynamicSelect.js
���·����/pageComponent/resources/scripts/dynamicSelect.js
˵    ����JavaScript�ű������ڶ�̬���ɼ���Select��
��    ����1.0
��    ����
<SCRIPT language="jscript" src="/pageComponent/resources/scripts/processCaller.js"></SCRIPT>
<SCRIPT language="jscript" src="/pageComponent/resources/scripts/string.js"></SCRIPT>
�޸ļ�¼:
---------------------------------------------------------------------------
ʱ��		   �޸���		    ˵��
2005-6-29	 yangyaoli		����
2005-8-11  yangyaoli    �����޸�
2005-12-28 wangkq       ��������°�IE�в�����ȷ���е�BUG
------------------------------------------------------------------------------- 	
*/

//ˢ����Select�е�����
function refreshChild_DS(parentSelect) {
	if (parentSelect.childID == null || parentSelect.childID == '') {
		return;
	}
	var child = document.getElementById(parentSelect.childID);
	var allParament = "";//������������
	if (parentSelect.mainSelectID == null || parentSelect.mainSelectID =="") {//��Selectˢ��ʱ
		allParament = "<root><data><"+parentSelect.entityName+" number=\"0\">"
									+"<"+parentSelect.textField+">"
									+conversion(parentSelect.options[parentSelect.selectedIndex].text)
									+"</"+parentSelect.textField+">"
									+"<"+parentSelect.valueField+">"
									+conversion(parentSelect.value)
									+"</"+parentSelect.valueField+">"
									+"</"+parentSelect.entityName+">"
									+parentSelect.paramXML+"</data></root>";//�����û��Զ���Ĳ���
	} else {//���д�Selectˢ��ʱ
		var tempSel = document.getElementById(parentSelect.mainSelectID);
		var j = 0
		allParament = "<root><data>";
		while (tempSel != parentSelect) {//ֱ����ǰ��Select���˳�
			allParament = allParament + "<"+tempSel.entityName+" number=\""+j+"\">"
										+"<"+tempSel.textField+">"
										+conversion(tempSel.options[tempSel.selectedIndex].text)
										+"</"+tempSel.textField+">"
										+"<"+tempSel.valueField+">"
										+conversion(tempSel.value)
										+"</"+tempSel.valueField+">"
										+"</"+tempSel.entityName+">"
										+tempSel.paramXML;//�����û��Զ���Ĳ���
			j++;
			tempSel = document.getElementById(tempSel.childID);
		}
		allParament = allParament + "<"+ parentSelect.entityName+" number=\""+j+"\">"
									+"<"+parentSelect.textField+">"
									+conversion(parentSelect.options[parentSelect.selectedIndex].text)
									+"</"+parentSelect.textField+">"
									+"<"+parentSelect.valueField+">"
									+conversion(parentSelect.value)
									+"</"+parentSelect.valueField+">"
									+"</"+parentSelect.entityName+">"
									+parentSelect.paramXML+"</data></root>";//�����û��Զ���Ĳ���
	}
	//alert(allParament);
	var strResponse = callBizAction(child.bizAction,allParament);
	if (strResponse == false) {//���ô���ֱ�ӷ���
		return;
	}
	var xmlDom = new ActiveXObject("Msxml2.DOMDocument");
	xmlDom.async = false;
	xmlDom.resolveExternals = false;
	xmlDom.loadXML(strResponse);
	var xmlList = xmlDom.selectSingleNode("/root/data/"+child.listXpath);
	if (xmlList == null) {
		alert("��ҵ���߼����ص������У�û���ҵ�listXpath�����������õ�·����������롣");
		return;
	}
	
	removeAllSelectOption(child);
//	child.length = null;
	//����Default Option
	if (child.nullLable != null && child.nullLable == "true") {
        var vv = "";
        var tt = "";
        if (child.nullLableText != null) {
            tt = child.nullLableText;
        }
        if (child.nullLableValue != null) {
            vv = child.nullLableValue;
        }
        var loption = new Option(tt, vv);
        child.options.add(loption);
	}
	
	var entityList = xmlList.selectNodes(child.entityName);
	if ((entityList == null)||(entityList.length < 1)) {
		if (child.options.length > 0)
			refreshChild_DS(child);
		return;
	}
	
	for (var i=0;i<entityList.length;i++) {
		var vv = "";
		var tt = "";
		var optionText = null;
		var optionValue = null;
  		optionValue = entityList.item(i).selectSingleNode(child.valueField);
  		if (optionValue != null) {//ȡ��valueField�е�ֵ
  			vv = optionValue.text;
  		}
  		optionText = entityList.item(i).selectSingleNode(child.textField);
  		if (optionText != null) {//ȡ��textField�е�ֵ
  			tt = optionText.text;
	  	}
  		var toption = new Option(tt, vv);
  		
  		child.options.add(toption);
  		
	}
	refreshChild_DS(child);
}

//�����ݽ��г�ʼ����ѯ����
function initSel_DS(aSelect) {
	var strResponse = callBizAction(aSelect.bizAction,"<root><data>"+aSelect.paramXML+"</data></root>");
	if (strResponse == false) {//���ô���ֱ�ӷ���
		return;
	}
	var xmlDom = new ActiveXObject("Msxml2.DOMDocument");
	xmlDom.async = false;
	xmlDom.resolveExternals = false;
	xmlDom.loadXML(strResponse);
	var xmlList = xmlDom.selectSingleNode("/root/data/"+aSelect.listXpath);
	if (xmlList == null) {
		alert("��ҵ���߼����ص������У�û���ҵ�listXpath�����������õ�·����������롣");
		return;
	}
	//����Default Option
	if (aSelect.nullLable != null && aSelect.nullLable == "true") {
    	var vv = "";
    	var tt = "";
        if (aSelect.nullLableText != null) {
            tt = aSelect.nullLableText;
        }
        if (aSelect.nullLableValue != null) {
            vv = aSelect.nullLableValue;
        }
        var loption = new Option(tt, vv);
        aSelect.options.add(loption);
	}
	
	var entityList = xmlList.selectNodes(aSelect.entityName);
	if ((entityList == null) || (entityList.length < 1)) {
		if (aSelect.options.length > 0)
			refreshChild_DS(aSelect);
		return;
	}
	
	for (var i=0;i<entityList.length;i++) {
		var vv = "";
		var tt = "";
		var optionText = null;
		var optionValue = null;
  		optionValue = entityList.item(i).selectSingleNode(aSelect.valueField);
  		if (optionValue != null) {//ȡ��valueField�е�ֵ
  			vv = optionValue.text;
  		}
  		optionText = entityList.item(i).selectSingleNode(aSelect.textField);
  		if (optionText != null) {//ȡ��textField�е�ֵ
  			tt = optionText.text;
	  	}
  		var toption = new Option(tt, vv);
  		aSelect.options.add(toption);
	}
	refreshChild_DS(aSelect);
}

function removeAllSelectOption(obj)
{
    for (var j = obj.options.length - 1; j >= 0; j--)
    {
        obj.remove(j);
    }
}
