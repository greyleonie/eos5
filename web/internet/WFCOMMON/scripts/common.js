function goURL(URL)
{
	window.location=URL;
}
function LTrim(s)
{
	for(var i = 0; i < s.length; i++)
		if(s.charAt(i) != ' ')
			return s.substring(i, s.length);
	return "";
}
function RTrim(s)
{
	for(var i = s.length - 1; i >= 0; i--)
		if(s.charAt(i) != ' ')
			return s.substring(0, i + 1);
	return "";
}
function Trim(s)
{
	return RTrim(LTrim(s));
}
function getFirstChar(str){
	if(str != null && Trim(str).length >0){
		return str.substring(0,1);
	}
	return "";
}