
var syssetuppath="/internet";

function Toolbar()
{
    this.setSysPath=setSysPath;
    this.writeToolButton=writeOutToolButton;
}

function setSysPath(path)
{
    if(path!=null)   syssetuppath=path;
}

function writeOutToolButton(value,index,func,title,name)
{
    var str="<input type=button value='  "+value+"'";
    str=str+" style='"+getStandardStyle(index)+"'";
    if(func!=null&&func!="")
        str=str+" onclick='"+func+"'";
    if(name!=null&&name!=""){
    	str = str+" name='"+name+"'";
    }
    str=str+" title='"+title+"'>";
    document.writeln(str);
}

function getStandardStyle(index)
{
    var str="cursor:hand;height:20px;width:75px;border-top-width:0px;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border:#ffff1 0px #ffff1;";
    str=str+"background-image:url("+syssetuppath+"/images/functionframe/button/bn"+index+".gif);";
    return str;
}

function gotoHP(page)
{
    window.open(page,"_blank","menubar=0,toolbar=1,location=0,directories=0,status=0,scrollbars=1,resizable=1,height=500,width=500,top=20,left=50");
}
