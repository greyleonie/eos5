function date2string(dateObject)
{
	var str = (dateObject.getFullYear() + 10000).toString().substring(1, 5);
	str += "." + (dateObject.getMonth() + 1 + 100).toString().substring(1, 3);
	str += "." + (dateObject.getDate() + 100).toString().substring(1, 3);
	return str;
}
