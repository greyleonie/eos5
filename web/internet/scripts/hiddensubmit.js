
var ua      = navigator.userAgent;
var opera   = /opera [56789]|opera\/[56789]/i.test(ua);
var ie      = !opera && /msie [56789]/i.test(ua);       // preventing opera to be identified as ie
var mozilla = !opera && /mozilla\/[56789]/i.test(ua);   // preventing opera to be identified as mz

if(mozilla) {
	XMLDocument.prototype.selectSingleNode = function(tagname) {
		var result = this.evaluate(tagname, this, null, 0, null);
		return result.iterateNext();
	}
	XMLDocument.prototype.selectNodes = function(tagname) {
		var result = this.evaluate(tagname, this, null, 0, null);
		var xns = new XMLNodes(result);
		return xns;
	}
	//定义一个新的类以兼容 IE 中 selectNodes() 的返回类型。
	function XMLNodes(result) {
		this.length = 0;
		this.pointer = 0;
		this.array = new Array();
		var i = 0;
		while((this.array[i]=result.iterateNext())!=null)
			i++;
		this.length = this.array.length;
	}
	XMLNodes.prototype.nextNode = function() {
		this.pointer++;
		return this.array[pointer-1];
	}
	XMLNodes.prototype.reset = function() {
		this.pointer = 0; 
	}
	var element = Element.prototype;
    element.__proto__ = {__proto__: element.__proto__};
    element = element.__proto__;

	var attribute = Attr.prototype;
    attribute.__proto__ = {__proto__: attribute.__proto__};
    attribute = attribute.__proto__;

	var txt = Text.prototype;
    txt.__proto__ = {__proto__: txt.__proto__};
    txt = txt.__proto__;

	element.__defineGetter__("text", function(){
		var i, a=[], nodes = this.childNodes, length = nodes.length;
		for (i=0; i<length; i++){a[i] = nodes[i].text}
		return a.join("");
	});

	attribute.__defineGetter__("text", function(){return this.nodeValue});
	txt.__defineGetter__("text", function(){return this.nodeValue});
}

function HiddenSubmit(bizAction)
{
	this.action;
	this.dom = null;

	this.submit = _hidden_submit;
	this.submitForm = _hidden_submit_form;
	this.submitXML = _hidden_submit_xml;
	this.getProperty = _get_property;
	this.getValue = _get_xpath_value;
	this.getValues = _get_xpath_values;
	this.setForm = _dom_set_form;
	this.setObjectValue = _dom_set_object;
	this.add = _add_submit_param;
	this.clear = _clear_param;

	this.param = new Array;


	this.action = bizAction;
	if (bizAction == null || bizAction == "")
		alert("请求业务逻辑名称错误！");

	function _add_submit_param(name, value)
	{
		var i = this.param.length;
		this.param[i] = new Array(name, value);
	}

	function _clear_param()
	{
		this.param = new Array;
	}

	function _hidden_submit()
	{
		var param = "";
		for (i=0; i<this.param.length; i++) {
			var name = escape(this.param[i][0]);
			var value = encodeURIComponent(this.param[i][1]);
			if ( i==0 )
				param = name + "=" + value;
			else
				param += "&" + name + "=" + value;
		}
		this.dom = _hidden_submit_param(this.action, param);
		if (this.dom == null) return false;
		return true;
	}

	function _hidden_submit_form(frm)
	{
		var param = "";
		for (i=0; i<frm.elements.length; i++) {
			var ele = frm.elements[i];
			if (ele.type == "radio" || ele.type == "checkbox") {
				if (!ele.checked)
					continue;
			}
			if (!(frm.elements[i].name) || frm.elements[i].name == "")
				continue;
			var name = escape(frm.elements[i].name);
			var value = encodeURIComponent(frm.elements[i].value);
			if ( i==0 )
				param = name + "=" + value;
			else
				param += "&" + name + "=" + value;
		}
		this.dom = _hidden_submit_param(this.action, param);
		if (this.dom == null) return false;
		return true;
	}

	function _hidden_submit_xml(xml)
	{
		var xmlString = "<root><data>" + xml + "</data></root>";
		var param = "bizActionInputDataType=xml&bizActionInputData=" + encodeURIComponent(xmlString);
		this.dom = _hidden_submit_param(this.action, param);
		if (this.dom == null) return false;
		return true;
	}

	function _get_property(property)
	{
		if (this.dom == null) return null;
		if (property == null || property == "") return null;
		var field = this.dom.selectSingleNode("root/data/" + property);
		if (field != null)
			return field.text;
		else
			return null;
	}

	function _get_xpath_value(xpath)
	{
		if (this.dom == null) return null;
		if (xpath == null || xpath == "") return null;
		var field = this.dom.selectSingleNode(xpath);
		if (field != null)
			return field.text;
		else
			return null;
	}
	
	function _get_xpath_values(xpath)
	{
		var values = new Array();
		if (this.dom == null) return values;
		if (xpath == null || xpath == "") return values;
		var fields = this.dom.selectNodes(xpath);
		for (var i=0; i<fields.length; i++) {
			values[i] = fields[i].text;
		}
		return values;
	}
	
	function _dom_set_form(frm)
	{
		for (var i=0; i<frm.elements.length; i++) {
			var ele = frm.elements[i];
			this.setObjectValue(ele);
		}
	}
	
	function _dom_set_object(obj, property) {
		if (!(obj) || obj == null) return;

		var valuePath = property;
		if (!(obj.type)) {
			if (valuePath == null) {
				if (obj.name && obj.name && obj.name != "")
					valuePath = obj.name;
				else if (obj.id && obj.id != "") 
					valuePath = obj.id;
			}
			if (valuePath != null) {
				var v = this.getProperty(valuePath);
				if (v != null)
					obj.innerText = v;
			}
			return;
		}
		if (valuePath == null) {
			if (obj.name && obj.name != null && obj.name != "")
				valuePath = obj.name;
		}
		if (valuePath != null) {
			if (obj.type == "text" || obj.type == "hidden" || obj.type == "textarea") {
				var v = this.getProperty(valuePath);
				if (v != null)
					obj.value = v;
				return;
			}
			if (obj.type == "radio" || obj.type == "checkbox") {
				var fields = this.dom.selectNodes("root/data/" + valuePath);
				for (var j=0; j<fields.length; j++) {
					if (obj.value == fields[j].text)
						obj.checked = true;
					else
						obj.checked = false;
				}
				return;
			}
			if (obj.type == "select-one") {
				var v = this.getProperty(valuePath);
				for (var j=0; j<obj.options.length; j++) {
					if (v == obj.options[j].value)
						obj.options[j].selected = true;
				}
				return;
			}
			if (obj.type == "select-multiple") {
				var values = this.getXValues("root/data/" + valuePath);
				if (values.length > 0) {
					for (var j=0; j<obj.options.length; j++) {
						obj.options[j].selected = false;
						for (var k=0; k<values.length; k++) {
							if (values[k] == obj.options[j].value)
								obj.options[j].selected = true;
						}
					}
				}
				return;
			}
		}
	}
}

function _hidden_submit_param(bizAction, param)
{
//	var submitURL = getLocationUrlPath() + "forward.do";
//	var requestData = "nextPage=fbtools/page/hiddensubmit.jsp&bizAction=" + bizAction;
	var submitURL = window.location.protocol+"//"+window.location.host + "/internet/scripts/hiddensubmit.jsp";
	var requestData = "bizAction=" + bizAction;
	if (param != null && param != "")
		requestData += "&" + param;
	var oGet = null;
	var oReq = null;
	if (mozilla) {
		oReq = new XMLHttpRequest(); 
	} else {
		try { oReq=new ActiveXObject('MSXML2.XMLHTTP'); } catch(e) {
			try{ oReq=new ActiveXObject('Microsoft.XMLHTTP'); } catch(oc) { oReq=null }
		}
	}
	try {
		oReq.open("POST", submitURL, false);
		oReq.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		oReq.send(requestData);
	} catch (e) {
		alert("隐含请求调用失败！");
		return oGet;
	}
	if (mozilla) {
		oGet = oReq.responseXML;
	} else {
		oGet = new ActiveXObject("MSXML2.DOMDocument");
		oGet.async=false;
		oGet.loadXML(oReq.responseText);
	}
	// 处理返回值
	var retCodeNode = oGet.selectSingleNode( "root/data/return/code" );
	if( !retCodeNode ) return oGet;
	var retCode = retCodeNode.text;
	if( !retCode ) return oGet;
	//如果返回值小于0，说明业务逻辑处理发生错误，提示出错信息
	if( retCode < 0 )
	{
		if( retCode == -99001 )	//超时，到登陆页?
		{
			var timeoutPage = oGet.selectSingleNode("root/data/timeoutPage").text;
			var url = window.location.protocol+"//"+window.location.host+"/"+ timeoutPage;
			window.open( url, "_top");
		}
		if (oGet.selectSingleNode("root/data/return/message") != null) {
			var msg = oGet.selectSingleNode("root/data/return/message").text
			if (msg != "") alert( msg );
		}
		return null;
	}
	if (retCode == 0)
	{
		if (oGet.selectSingleNode("root/data/return/message") != null) {
			var msg = oGet.selectSingleNode("root/data/return/message").text
			if(msg != "") alert( msg );
		}
	}
	return oGet;
}

function valueEncoder(value)
{
	if (value == null) return "";
	var s = value.replace(/\%/g, "%25");
	s = s.replace(/&/g, escape("&"));
	s = s.replace(/\+/g, "%2B");
	s = s.replace(/\n/g, escape("\n"));
	s = s.replace(/\t/g, escape("\t"));
	return s;
}

function xmlStringEncoder(value)
{
	if (value == null) return "";
	var s = value.replace(/\%/g, "%25");
	s = s.replace(/&/g, escape("&"));
	s = s.replace(/\+/g, "%2B");
	s = s.replace(/\n/g, escape("\n"));
	s = s.replace(/\t/g, escape("\t"));
	return s;
}

function getLocationUrlPath()
{
	var path = "/";
	var index = window.location.pathname.indexOf("/");
	if(index != -1) {
		window.location.pathname.substring(index+1);
	}

	return window.location.protocol+"//"+window.location.host + path;
}
