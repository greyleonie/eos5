//------------Description:����Ȩ�޷��亯��---------
//------------Vesion:1.0-------------------------
//------------Author:�볤��-----------------------
//------------NickName:fcc-----------------------
//------------Mail:fcclzydouble@163.com----------
//------------Company:�Ϸ�����----------


//��Դ����
function resourceObj(id, pid, name,remark) {
	this.id = id;
	this.pid = pid;
	this.name = name;
	this.remark = remark;
}

//��������
function operatorObj(id,rid,name) {
	this.id = id;
	this.rid = rid;
	this.name = name;

}



//-----һ����Դ��Ӧ�����������------
function resourcetoOperators(rid) {
	this.rid = rid;
	this.operators = [];
}


//Ȩ�޷������
function FccResources(objName,secondright) {
	this.objName = objName;
	this.secondright = secondright;//����Ȩ�ޱ�־
	this.resourceObjs = [];//������Դ��������
	this.allOperator = [];//������Դ��Ӧ�Ĳ���
	this.existResourceIds = [];//�û�ԭ�е���ԴID
	this.existOperatorIds = [];//�û�ԭ�еĲ���ID
	this.result = "";//������
	this.root = "-2";
	this.position = 0;

}

//���ӽڵ�
FccResources.prototype.add = function(id, pid, name,remark) {
	this.resourceObjs[this.resourceObjs.length] = new resourceObj(id, pid, name,remark);
}

//������Դ
FccResources.prototype.hasChild = function(tempRid) {
	var exist = false;
	for(var n = 0; n < this.resourceObjs.length; n++) {
		if(this.resourceObjs[n].pid == tempRid) {
			exist = true;
			break;
		}
	}
	return exist;
}


//��ӡ��
FccResources.prototype.echoLine = function(count) {
	var str = "";
	for(var n = 0; n < count; n++) {
		str += "<span style=\"font-size:6px;color:#005984\">.....</span>";
	}
	return str;
}

//��ӡ�ո�
FccResources.prototype.echoSpace = function(count) {
	var str = "";
	for(var n = 0; n < count; n++) {
		str += "&nbsp;&nbsp;";
	}
	return str;
}

//����ԴȨ��
FccResources.prototype.hasResourceRight = function(rid) {
	var exist = false;
	for(var n = 0; n < this.existResourceIds.length; n++) {
		if(this.existResourceIds[n] == rid) {
			exist = true;
			break;
		}
	}
	return exist;
}


//�в���Ȩ��
FccResources.prototype.hasOperationRight = function(oid) {
	var exist = false;
	for(var n = 0; n < this.existOperatorIds.length; n++) {
		var temp = this.existOperatorIds[n].split(",");
		for(var m = 0; m < temp.length; m++) {
			if(temp[m] == oid) {
				return true;
			}
		}
	}
	return exist;
}

//�õ�ĳ��Դ��Ӧ�Ĳ���
FccResources.prototype.getResourceOperators = function(tempRid) {
	var tempOperators = [];
	for(var n = 0; n < this.allOperator.length; n++) {
		var tempObj = this.allOperator[n];
		if(tempObj.rid == tempRid){
			tempOperators = tempObj.operators;
		}
	}
	return tempOperators;
}

//Ȩ�����
FccResources.prototype.recurResource = function(tempRid) {
	if(tempRid == null) tempRid = this.root;
	for(var i = 0; i < this.resourceObjs.length; i++) {
		var fccObj = this.resourceObjs[i];
		if(fccObj.pid == tempRid) {
			this.result += "<tr class=\"text_red\"><td nowrap>";
			this.result += this.echoSpace(this.position + 2);
			if(this.hasChild(fccObj.id)) {
				this.result += "<span><img src=\"/internet/image/minus.gif\" align=\"absmiddle\" style=\"cursor:hand\" onClick=\"javascript:change('" + "t" + fccObj.id + "',this);\"/></span>";
			}else{
				this.result += "<span><img src=\"/internet/image/minus.gif\" align=\"absmiddle\"/></span>";
			}

			this.result += "<input type=\"checkbox\" name=\"list/moduAndOper\"";
			if(this.hasResourceRight(fccObj.id)){
				this.result += " checked";
			}

			var fccObjOperators = this.getResourceOperators(fccObj.id);
			if(fccObjOperators.length > 0) {
				this.result += " id=\"r" + fccObj.pid + "\" cid=\"r" + fccObj.id + "\" value=\"" + fccObj.id + ",#\" onClick=\"javascript:check(this);\">" + "<b>" + fccObj.name + "</b>";
				//this.result += " id=\"r" + fccObj.pid + "\" cid=\"r" + fccObj.id + "\" onClick=\"javascript:check(this);\">" + "<b>" + fccObj.name + "</b>";
			}else{
				this.result += " id=\"r" + fccObj.pid + "\" cid=\"r" + fccObj.id + "\" value=\"" + fccObj.id + ",#\" onClick=\"javascript:check(this);\">" + "<b>" + fccObj.name + "</b>";
			}

			if(fccObjOperators.length > 0) {
				this.result += "&nbsp;";
				this.result += this.echoLine(5);
				this.result += "&nbsp;";
				for(var j = 0; j < fccObjOperators.length; j++) {
					var lzyOperator = fccObjOperators[j];
					this.result += "<input type=\"checkbox\" name=\"list/moduAndOper\"";
					if(this.hasOperationRight(lzyOperator.id)) {
						this.result += " checked";
					}
					var id = "r" + fccObj.id;
					var cid = "o" + fccObj.id;
					this.result += " value=\"" + fccObj.id + "," + lzyOperator.id + "\" id=\"" + id + "\" cid=\"" + cid + "\" onClick=\"javascript:checkUp(this);\">";
					this.result += "" + lzyOperator.name + "";
					this.result += "&nbsp;";

					
				}//�ڲ�for
			}

			if(this.hasChild(fccObj.id)) {
				var className = "f13";
				/*
				if(this.position >= 2){
					className = "f12";
				}
				*/
				this.result += "<table class=\"" + className + "\" id=\"t" + fccObj.id + "\">";
				this.position++;
				this.recurResource(fccObj.id);//�ݹ�
				this.position--;
				this.result += "</table>";
			}else{
				this.result += "</td></tr>";
			}

		}
	}//��һ��for

}


FccResources.prototype.recurResourceOther = function(tempRid) {
	if(tempRid == null) tempRid = this.root;
	for(var i = 0; i < this.resourceObjs.length; i++) {
		var fccObj = this.resourceObjs[i];
		if(fccObj.pid == tempRid && this.secondright == fccObj.remark) {
			this.result += "<tr class=\"text_red\"><td nowrap>";
			this.result += this.echoSpace(this.position + 2);
			if(this.hasChild(fccObj.id)) {
				this.result += "<span><img src=\"/internet/image/minus.gif\" align=\"absmiddle\" style=\"cursor:hand\" onClick=\"javascript:change('" + "t" + fccObj.id + "',this);\"/></span>";
			}else{
				this.result += "<span><img src=\"/internet/image/minus.gif\" align=\"absmiddle\"/></span>";
			}

			this.result += "<input type=\"checkbox\" name=\"list/moduAndOper\"";
			if(this.hasResourceRight(fccObj.id)){
				this.result += " checked";
			}

			var fccObjOperators = this.getResourceOperators(fccObj.id);
			if(fccObjOperators.length > 0) {
				this.result += " id=\"r" + fccObj.pid + "\" cid=\"r" + fccObj.id + "\" value=\"" + fccObj.id + ",#\" onClick=\"javascript:check(this);\">" + "<b>" + fccObj.name + "</b>";
				//this.result += " id=\"r" + fccObj.pid + "\" cid=\"r" + fccObj.id + "\" onClick=\"javascript:check(this);\">" + "<b>" + fccObj.name + "</b>";
			}else{
				this.result += " id=\"r" + fccObj.pid + "\" cid=\"r" + fccObj.id + "\" value=\"" + fccObj.id + ",#\" onClick=\"javascript:check(this);\">" + "<b>" + fccObj.name + "</b>";
			}

			if(fccObjOperators.length > 0) {
				this.result += "&nbsp;";
				this.result += this.echoLine(5);
				this.result += "&nbsp;";
				for(var j = 0; j < fccObjOperators.length; j++) {
					var lzyOperator = fccObjOperators[j];
					this.result += "<input type=\"checkbox\" name=\"list/moduAndOper\"";
					if(this.hasOperationRight(lzyOperator.id)) {
						this.result += " checked";
					}
					var id = "r" + fccObj.id;
					var cid = "o" + fccObj.id;
					this.result += " value=\"" + fccObj.id + "," + lzyOperator.id + "\" id=\"" + id + "\" cid=\"" + cid + "\" onClick=\"javascript:checkUp(this);\">";
					this.result += "" + lzyOperator.name + "";
					this.result += "&nbsp;";

					
				}//�ڲ�for
			}

			if(this.hasChild(fccObj.id)) {
				var className = "f13";
				/*
				if(this.position >= 1){
					className = "f12";
				}
				*/
				this.result += "<table class=\"" + className + "\" id=\"t" + fccObj.id + "\">";
				this.position++;
				this.recurResourceOther(fccObj.id);//�ݹ�
				this.position--;
				this.result += "</table>";
			}else{
				this.result += "</td></tr>";
			}

		}
	}//��һ��for


}



FccResources.prototype.toString = function() {
	if(this.secondright == "0") {
		this.recurResource();
	}else{
		this.recurResourceOther();
	}
	var str = "<table width=\"70%\" height=\"30\"  border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" class=\"text_red\">";
	str += this.result;
	str += "</table>";
	return str;
}


FccResources.prototype.toManager = function(tempRid) {
	if(tempRid == null) tempRid = this.root;
	for(var i = 0; i < this.resourceObjs.length; i++) {
		var fccObj = this.resourceObjs[i];
		if(fccObj.pid == tempRid) {
			this.result += "<tr class=\"text_red\"><td nowrap>";
			this.result += this.echoSpace(this.position + 2);
			if(this.hasChild(fccObj.id)) {
				this.result += "<span><img src=\"/internet/images/minus.gif\" align=\"absmiddle\" style=\"cursor:hand\" onClick=\"javascript:change('" + "t" + fccObj.id + "',this);\"/></span>";
			}else{
				this.result += "<span><img src=\"/internet/images/minus.gif\" align=\"absmiddle\"/></span>";
			}
			this.result += "<input type=\"checkbox\" name=\"list/moduAndOper\"";
			if(fccObj.remark == "1"){
				this.result += " checked";
			}

			this.result += " id=\"r" + fccObj.pid + "\" cid=\"r" + fccObj.id + "\" value=\"" + fccObj.id + "\" onClick=\"javascript:check(this);\">" + "<b>" + fccObj.name + "</b>";
			if(this.hasChild(fccObj.id)) {
				this.result += "<table class=\"f12\" id=\"t" + fccObj.id + "\">";
				this.position++;
				this.toManager(fccObj.id);//�ݹ�
				this.position--;
				this.result += "</table>";
			}else{
				this.result += "</td></tr>";
			}
		}//if
	}//for
}//function


FccResources.prototype.toManagerString = function() {
	this.toManager();
	var str = "<table width=\"70%\" height=\"30\"  border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" class=\"text_red\">";
	str += this.result;
	str += "</table>";
	document.write(str);
}


