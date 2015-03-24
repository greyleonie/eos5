/**
 * 分页javascript控件，使用类方式建立分页程序
 * 在分页的页面中需要一个分页的FORM，在定义FORM后面增加下面HTML代码：

<form name="testPage" method="POST" action="BNLOG.BNLOG_testPage.do" onsubmit="return false;">
<html:hidden property="PageCond/begin" />
<html:hidden property="PageCond/length" />
<html:hidden property="PageCond/count" />
<script>
var myPage = new page();
myPage.init("testPage", "PageCond/begin", "PageCond/length", "PageCond/count");
</script>

其中：
    PageCond/begin 是开始记录，如果送到分页的BL方法中 begin 不存在默认值为 0
    PageCond/length 是每页记录数，如果送到分页的BL方法中 length 不存在默认值为 10，
                    也可以用<html:input property="PageCond/length" />作为输入栏输入每页的记录数
    PageCond/count 是查询结果的总记录数，如果总记录数不存在或者小于1，分页的BL方法会自动计算查询结果
                   的总记录数，如果 count 是 'noCount' 或者大于 1，分页的BL方法不会计算结果总记录数
                   对于复杂查询，并且结果数非常大的时候，建议采用'noCount'，不计算总记录数来提高速度
对上述三个变量初始化后，就可以创建分页的对象了，
分页对象创建后需要调用 init 函数进行初始化，
初始化参数就是分页的FORM对象的名称和begin,length,count三个TEXT对象的名称
注意：初始化分页对象需要在三个变量(begin,length,count)初始化后

初始化成功后就可以使用分页对象了

<a href="javascript:myPage.firstPage();" >首页</a>&nbsp;
－－ myPage.firstPage() 跳转到第一页

<a href="javascript:myPage.previousPage();" >上页</a>&nbsp;
－－ myPage.firstPage() 跳转到上一页

<a href="javascript:myPage.nextPage();" >下页</a>&nbsp;
－－ myPage.firstPage() 跳转到下一页

<a href="javascript:myPage.lastPage();" >尾页</a>
－－ myPage.firstPage() 跳转到最后一页

<script>if (!myPage.noCount) document.write('总共' + myPage.count + '条');</script>
－－使用script语句显示查询结果的总条数

第<input type="text" name="pageno" size=2 value=<script>document.write(myPage.current)</script> >页 if (!myPage.noCount)<script>document.write('/共'+myPage.total+'页')</script>
－－ myPage.current 当前页号
－－ myPage.total   总页数 （如果没有计算出总记录数，就没有总页数）


<input type="text" name="pageno" size=2 > <input type="button" onclick="myPage.goPage('pageno');" value="go!" name="gopage">
－－ myPage.goPage('pageno') 跳转到指定的页号，pageno是输入页号的TEXT对象名称

 *
 */
function page() 
{
    this.frm;           //分页查询FORM的对象
    this.beginTxt;      //分页查询FORM中的begin TEXT对象（可以使隐藏的对象）
    this.lengthTxt;     //分页查询FORM中的length TEXT对象（可以使隐藏的对象）
    this.countTxt;      //分页查询FORM中的count TEXT对象（可以使隐藏的对象）

    this.begin;         //分页查询开始记录位置
    this.length;        //每页显示记录数
    this.count;         //查询结果总记录数
    this.current;   	//当前页码
    this.total;     	//总共页数
    this.noCount;       //分页程序没有总记录数
    
    this.init = initPage;
    this.nextPage = nextPage;
    this.previousPage = previousPage;
    this.firstPage = firstPage;
    this.lastPage = lastPage;
    this.goPage = goPage;
    this.go = go;
    this.printPageCode = printPageCode;

    /*
     * 分页查询的构造函数
     * @param frmName 分页查询的FORM的名称
     * @param beginText FORM中begin TEXT对象名称
     * @param lengthText FORM中length TEXT对象名称
     * @param countText FORM中count TEXT对象名称
     */
    function initPage(frmName, beginText, lengthText, countText)
    {
        this.noCount = false;
        this.frm = document.forms[frmName];
        this.beginTxt = this.frm.elements[beginText];
        this.lengthTxt = this.frm.elements[lengthText];
        this.countTxt = this.frm.elements[countText];
        
        if(this.beginTxt.value==null ||this.beginTxt.value==""){
        	this.begin = 0;
        }else{
        	this.begin = parseInt(this.beginTxt.value);
    	}
        if(this.lengthTxt.value==null ||this.lengthTxt.value==""){
        	this.length=10;
        }else{
        	this.length = parseInt(this.lengthTxt.value);
    	}
        	
        if(this.countTxt.value==null ||this.countTxt.value==""){
        	this.count = 0;
        }else{
        	this.count = parseInt(this.countTxt.value);
    	}

        if (this.countTxt.value == "noCount") {
            this.noCount = true;
            this.total = "";
            this.count = -2;
        }
        if (this.count < 1) {
            this.noCount = true;
            this.total = 1;
            this.count = -2;
        }
        if (!this.noCount) {
            this.total = Math.floor(this.count/this.length);
            if (this.count%this.length != 0) {
                this.total++;
            }
        }
        this.current = Math.floor(this.begin/this.length) + 1;
    }

    function nextPage()
    {
        this.go(this.current + 1);
    }
    
    function previousPage()
    {
        this.go(this.current - 1);
    }

    function firstPage()
    {
        this.go(1);
    }

    function lastPage()
    {
        this.go(this.total);
    }

    function goPage(pageNo) /* 跳到输入的页号，pageNo是输入页码的输入框的名称 */
    {
        if (!isNumber(this.frm.elements[pageNo].value)){
        	alert("请正确输入跳转的页码！")
        	this.frm.elements[pageNo].select();
        	return;
        }
        var page = parseInt(this.frm.elements[pageNo].value);
        if(page==NaN || page==undefined)
        	this.count=0;
        this.go(page);
    }

    function go(page)
    {
    	if (!isNumber(this.lengthTxt.value)) {
    		alert("每页条数错误！请重新输入大于0的数字")
        	this.lengthTxt.select();
    		return;
    	}
        var inputLen = parseInt(this.lengthTxt.value);
        
        if (inputLen < 1) {
            alert("每页记录数错误！请重新输入大于0的数字")
            return;
        }
    
        if (inputLen != this.length) {
            this.length = inputLen;
            if (this.noCount) { //如果改变了每页显示记录数，且没有统计出总记录数，记录从0开始查询
                this.beginTxt.value = 0;
                this.frm.submit();
                return;
            }
            this.total = Math.floor(this.count/this.length);
            if (this.count%this.length != 0) {
                this.total++;
            }
        }
    
        var gono = page;
        if (gono<1)
            gono=1;
        if (!this.noCount) {
            if (gono>this.total)
                gono=this.total;
        }
            
        this.beginTxt.value = (gono - 1) * this.length;
        this.frm.submit();
    }
	
	function printPageCode(currRowCount)
    {
        var htmltxt="";
        var currCount=currRowCount;
        if(currCount==NaN || currCount==undefined || currCount == null){
        	return;	
        }

        if(this.current>1){
        	htmltxt += "<input type='button' onClick='javascript:myPage.firstPage();' value='首页'>";
        	htmltxt += "<input type='button' onClick='javascript:myPage.previousPage();' value='上页'>";
        }
        
        if (!this.noCount){
	        if (this.current<this.total ) {
	            htmltxt += "<input type='button' onClick='javascript:myPage.nextPage();' value='下页'>";
        		htmltxt += "<input type='button' onClick='javascript:myPage.lastPage();' value='尾页'>&nbsp;";
	        }
    	}else{
    		if (this.length<=currCount){
    			htmltxt += "<input type='button' onClick='javascript:myPage.nextPage();' value='下页'>&nbsp;";
    		}
    	}		
    	
        
        if (!this.noCount){
	        htmltxt += "共"+myPage.count + "条&nbsp;";
        	htmltxt += "第"+this.current;
        	htmltxt += "/"+this.total+"页";
        }else{
        	htmltxt += "第"+this.current+"页";       
        }
        	
        document.write( htmltxt);
    }
}

function isNumber( s ){   
	var regu = "^[0-9]+$";
	var re = new RegExp(regu);
	if (s.search(re) != -1) {
	   return true;
	} else {
	   return false;
	}
}
