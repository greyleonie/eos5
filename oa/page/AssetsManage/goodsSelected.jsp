<%@include file="/internet/WFCOMMON/wfappbase.jsp"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk">
		<title>无标题文档</title>
	</head>
	<script language="javascript" type="text/javascript">

	

function Good(CAPTID,CAPTCODE,CAPTNAME,SPECIA,PRICE,TYPECODE,UNITCODE,REMARK,UNITNAME,TYPENAME) {  //物品对象
	this.CAPTID = CAPTID;
	this.CAPTCODE = CAPTCODE;
	this.CAPTNAME = CAPTNAME;
	this.SPECIA = SPECIA;
	this.PRICE = PRICE;
	this.TYPECODE = TYPECODE;
	this.UNITCODE = UNITCODE;
	this.REMARK = REMARK;
	this.UNITNAME = UNITNAME;
	this.TYPENAME = TYPENAME;
	this.GOODNAME = CAPTNAME + "["+CAPTCODE+"]";
	function compareByID(patternStr) {
		return this.CAPTID==patternStr;
	}
	this.isMatch = compareByID;
}
		
var goodsArray  = new Array();

<logic:iterate id="resultset" property="list[@type='CAPT_INFO']">
	goodsArray[goodsArray.length] = new Good('<bean:write id="resultset" property="CAPT_INFO/CAPTID"/>','<bean:write id="resultset" property="CAPT_INFO/CAPTCODE"/>','<bean:write id="resultset" property="CAPT_INFO/CAPTNAME"/>','<bean:write id="resultset" property="CAPT_INFO/SPECIA"/>','<bean:write id="resultset" property="CAPT_INFO/PRICE"/>','<bean:write id="resultset" property="CAPT_INFO/TYPECODE"/>','<bean:write id="resultset" property="CAPT_INFO/UNITCODE"/>','<bean:write id="resultset" property="CAPT_INFO/REMARK"/>','<bean:write id="resultset" property="CAPT_INFO/UNITNAME"/>','<bean:write id="resultset" property="CAPT_INFO/TYPENAME"/>');
</logic:iterate>	

function getGoodInfo(id) {  //根据ID返回物品数组
	for(goods in goodsArray) {
        if(goodsArray[goods].isMatch(id)) {
			return goodsArray[goods];
        }
    }
}

function add(){
	var ret = new Array();
	var retIndex = 0;
	var len = window.form2.selectedGood.length;
	for(var i=0;i<len;i++){
			ret[retIndex] = getGoodInfo(window.form2.selectedGood.options[i].value);
			retIndex++;
			continue;
		
	}
	parent.window.returnValue = ret;
	parent.window.close();
}

function remove(){
	var elm = document.form2.selectedGood;
	var Cnt = elm.options.length;
	var delCnt = 0;
	var j=0;
	var	unSelectedOptions=new Array(Cnt);
	for (var i = 0;i<Cnt;i++) {
		if (elm.options[i].selected) 
			delCnt++;
		else
			unSelectedOptions[j++]=new Option(elm.options[i].text,elm.options[i].value);

		}
		elm.options.length-=delCnt;
	for (var i=0;i<elm.options.length;i++) {
		elm.options[i]= new Option(unSelectedOptions[i].text,unSelectedOptions[i].value);
		}
}


function unload() {
         if(parent.window.returnValue != null) {
			 
         } else {
          doCancel();
         }
}
function doCancel(){
	 parent.window.returnValue = null;
	 parent.window.close();
     }

	</script>
	<body onunload="unload()">
		<form name="form2" method="POST">
			<table width="100%" border="0">
				<tr>
					<td><font style="font-size: 12">选中的物品</font></td>
				</tr>
				<tr>
					<td><select size="21" name="selectedGood" style="font-size:12px;width:100%" multiple="true">
						</select></td>
				</tr>
				<tr>
					<td width="50%" valign="bottom" align="center"><input type="button" value="确定" onClick="javascript:add();"><input
							type="button" value="移除" onClick="javascript:remove();"><input type="button" value="关闭"
							onClick="javascript:doCancel();">
							</td>
				</tr>
			</table>
		</form>
	</body>
</html>