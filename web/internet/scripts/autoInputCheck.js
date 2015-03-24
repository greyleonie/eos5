// this file should inclued as scripts at the head of html
var autoCheckFuncArray = new Array;
var autoCheckIsDebug = false;

String.prototype.trim = function()
{
    return this.replace( /^\s*/, '').replace( /\s*$/, '' );
}

function addAutoCheckFunc(func)
{
	autoCheckFuncArray[autoCheckFuncArray.length] = func;
}

function RegExpCheck(input, regexp)
{
	var re = new RegExp(regexp);
	return re.test(input);
}

function showMessage(name, msg)
{
	if (msg == null)
		return;
	if (name != null)
		alert(name + " : " + msg);
		else
			alert(msg);

}

function autoEosCheck(id, regexp, errmsg, length, isnull, userErrMsg, DisplayName, userRegExp, userJavaScript)
{
	var value = document.getElementById(id).value.trim();
	if (value.length == 0)
		if (!isnull){
			showMessage(DisplayName, "字段必须输入");
			document.getElementById(id).focus();
			return false;
			}else
				return true;
			
	if ((length != 0) && (getStringLength(value) > length)){
		// 'coz we have set maxlength of this field, user should never input more then maxlength
		// so this message should never popup :D
		showMessage(DisplayName, "输入太长");
		document.getElementById(id).focus();
		return false;
		}

	if (!RegExpCheck(value,regexp)){
		showMessage(DisplayName, errmsg);
		document.getElementById(id).focus();
		return false;
		}

	if ((userRegExp != null) && (!RegExpCheck(value,userRegExp))){
			showMessage(DisplayName, userErrMsg);
			document.getElementById(id).focus();
			return false;
			}

	if ((userJavaScript != null) && (!userJavaScript(value, DisplayName, isnull, userRegExp))){
			showMessage(DisplayName, userErrMsg);
			document.getElementById(id).focus();
			return false;
			}
	if (autoCheckIsDebug)
		alert("autoEosCheck return true");
	return true;
}

function autoInputCheck()
{
	for (var i = 0; i < autoCheckFuncArray.length; i++)
		if (!autoCheckFuncArray[i]())
			return false;
	return true;
}

/*
  InputString:	String
  DisplayName:	String
  IsNull:	boolean(true, false)
  RegExp:	String
*/
function test(InputString, DisplayName, IsNull, RegExp)
{
//	alert(InputString);
	return false;
}

function getStringLength(varField) {	
	var totalCount = 0;
	for (i = 0; i< varField.length; i++) {
		if (varField.charCodeAt(i) > 127) 
			totalCount += 2;
		else
			totalCount++ ;
	}
	return totalCount;
}