 var form,frm ;
function PageCond(theform){
	var begin=theform("PageCond/begin").value;
	var count=theform("PageCond/count").value;
	var length=theform("PageCond/length").value;
	var totalpage=parseInt((count-1)/length);
	var currpage=0;
	form=theform;
	frm=theform;
	if(totalpage*length<count)
	totalpage=totalpage+1;
	if(count!=0){
		currpage = parseInt((begin)/length) + 1;
	}

	if(currpage==0) currpage=1;
	if(totalpage==0) totalpage=1;

	writeTopArea(currpage,count,totalpage,length,theform);

	if(currpage>=totalpage) {
		document.all.nextbt.disabled = true;
		document.all.lastbt.disabled = true;
	}else{
		document.all.nextbt.disabled = false;
		document.all.lastbt.disabled = false;
	}

	if(currpage <= 1){
		document.all.fristbt.disabled = true;
		document.all.backbt.disabled = true;
	}else{
		document.all.fristbt.disabled = false;
		document.all.backbt.disabled = false;
	}

}


function doCheck(obj){

	selectAll("customer",obj.checked);

}


function Querybar(){
    this.writeTopArea = writeTopArea;
    this.writeBottomArea = writeBottomArea;
}


function writeTopArea(gotoPage,totalLines,totalPages,linePerPage){ 
	document.writeln("<table id='fcctalentpageobject'>")
    document.writeln("<tr>");
    document.writeln("<td nowrap style='font-size: 12px;color: #000000;line-height: 30px;'>��");
    document.writeln("<input type='button' name='fristbt' class='fStandard-FirstPageButtonStyle' onclick=\"gotoPageCode('FirstPage')\">");
    document.writeln("<input type='button' name='backbt' class='fStandard-PreviousPageButtonStyle' onclick=\"gotoPageCode('BackPage')\">");
    document.writeln("<font color='#0861BD'><strong>"+parseInt(gotoPage)+"</strong></font>");
    document.writeln("<input type='button' name='nextbt'  class='fStandard-NextPageButtonStyle' onclick=\"gotoPageCode('NextPage')\">");
    document.writeln("<input type='button' name='lastbt' class='fStandard-LastPageButtonStyle' onclick=\"gotoPageCode('LastPage')\">");
    document.writeln("��</td>");
 
    document.writeln("<td nowrap style='font-size: 12px;color: #000000;line-height: 30px;'>�� <font color='#BF0404'>"+totalLines+"</font> ����Ϣ&nbsp;&nbsp;��ǰ��");
    document.writeln("<font color='#BF0404'>"+parseInt(gotoPage)+"/"+parseInt(totalPages)+"</font><strong> </strong>ҳ");
    
	document.writeln("<td valign='baseline' style='font-size: 12px;color: #000000;line-height: 30px;'>ÿҳ"+"<input type='text' onfocus='checkTextBoxInput()' onlytype='int' name='PageCond/talentlength' style='width:24px;height:18px;font-size:12px;align:center;' value='"+linePerPage+"'>��");
	document.writeln("&nbsp;<a href=\"javascript:gotoPageCode('numPage')\" style='cursor: hand;font-size:12px;color:#BF0404'>��ת</a>��<input type='text' onfocus='checkTextBoxInput()' onlytype='int' name=cond_GotoPage style='width:24px;height:18px;font-size:12px;align:center' value='"+parseInt(gotoPage)+"'>ҳ </td>");
    
	document.writeln("</tr>");
	document.writeln("</table>")

   // document.writeln("<tr class='text_red'>");
   // document.writeln("<td colspan='6'>");
   // document.writeln("<div id='conditions' style='display:none;'>");
}

function writeTopAreaTrue(conditions,show)//LB--11.28--�ۺϲ�ѯ
{
    temp=show?"block":"none";
    document.writeln("<tr>");
    document.writeln("<td width='16%' class='fStandard-ListTableTipSideStyle'></td>");
    document.writeln("<td width='42%' class='fStandard-ListTableTipSideStyle'></td>");
    document.writeln("<td width='8%' class='fStandard-ListTableTipSideStyle'></td>");
    document.writeln("<td width='11%' class='fStandard-ListTableTipSideStyle'></td>");
    document.writeln("<td width=''8%' class='fStandard-ListTableTipSideStyle'></td>");
    document.writeln("<td width='15%' class='fStandard-ListTableTipSideStyle'></td>");
    document.writeln("</tr>");
    document.writeln("<tr>");
    document.writeln("<td colspan='6'>");
    document.writeln("<div id='"+conditions+"' style='display:"+temp+";'>");
}

function writeBottomArea()
{
    document.writeln("</td>");
    document.writeln("</tr>");
    document.writeln("<tr>");
    document.writeln("<td  class='fStandard-ListTableTipSideStyle'></td>");
    document.writeln("<td  class='fStandard-ListTableTipSideStyle'></td>");
    document.writeln("<td  class='fStandard-ListTableTipSideStyle'></td>");
    document.writeln("<td  class='fStandard-ListTableTipSideStyle'></td>");
    document.writeln("<td  class='fStandard-ListTableTipSideStyle'></td>");
    document.writeln("<td  class='fStandard-ListTableTipSideStyle'></td>");
    document.writeln("</tr>");
    document.writeln("</div>");
}

function setCondition(){
    if(conditions.style.display=="none")
        conditions.style.display="block";
    else
        conditions.style.display="none";
}

function gotoPageCode(num){
   
	var totalPages=parseInt((count-1)/length)+1;
	var count=form("PageCond/count").value;
    if(count == 0){
        window.alert("ϵͳ��ǰû���κ���Ϣ��");
        return;
    }
    if(num=="FirstPage")
        firstPage();
    else if(num=="LastPage")
	lastPage();
    else if(num=="BackPage")
	frontPage();
    else if(num=="NextPage")
       nextPage();
    else if(num=="numPage"){
        // �������ĺϷ���
       if(form.cond_GotoPage.value=="")
          {window.alert("ҳ�����ÿ��������밢�������֣�");
		return;
	}
        var temp1=parseInt(form.cond_GotoPage.value);
        if(isNaN(temp1)){
            window.alert("ҳ�����ÿ��������밢�������֣�");
            return;
        }
        // ����û������룬ʹ��ֵ��[1,totalPages]֮��
        if(temp1<1)
            goPage(1);
        else if(temp1>totalPages){
                        goPage(totalPages);
						}
        else
            goPage(temp1);
    }
    form.submit();
}
function goPage(num){
	//var frm=document.form_query;
	var begins=parseInt(frm("PageCond/begin").value);
	var count=parseInt(frm("PageCond/count").value);
	if(frm.elements["PageCond/talentlength"]) {
		var templength = frm.elements["PageCond/talentlength"].value;
		if(!isNaN(templength)) {
			frm("PageCond/length").value = templength
		}
	}
	var length=parseInt(frm("PageCond/length").value);
	var totalpage=parseInt((count-1)/length)+1;
	if((totalpage*length) < count){
		totalpage = totalpage+1;
	}
	if(num > totalpage){
		num = totalpage;
	}

	frm("PageCond/begin").value = (num-1)*length;
	frm.submit();
}


function nextPage(){
	//var frm=document.form_query;
	var begins=parseInt(frm("PageCond/begin").value);
	var count=parseInt(frm("PageCond/count").value);
	if(frm.elements["PageCond/talentlength"]) {
		var templength = frm.elements["PageCond/talentlength"].value;
		if(!isNaN(templength)) {
			frm("PageCond/length").value = templength
		}
	}
	var length=parseInt(frm("PageCond/length").value);
	var totalpage=parseInt(count/length);
	var temp=0;
	if(totalpage*length < count){
		totalpage = totalpage + 1;
	}
	if((begins+length) > count){
		return;
	}

	if((begins+length) >= count){
		return;
	}

	frm("PageCond/begin").value = begins + length;
	if(frm("PageCond/begin").value <= frm("PageCond/count").value) frm.submit();

}

function lastPage(){
	//var frm = document.form_query;
	var begin = parseInt(frm("PageCond/begin").value);
	var count = parseInt(frm("PageCond/count").value);
	if(frm.elements["PageCond/talentlength"]) {
		var templength = frm.elements["PageCond/talentlength"].value;
		if(!isNaN(templength)) {
			frm("PageCond/length").value = templength
		}
	}
	var length = parseInt(frm("PageCond/length").value);
	var totalpage = parseInt((count-1)/length) + 1;
	if((totalpage*length)<count) totalpage = totalpage+1;

	if(begin>=count) return false;
	frm("PageCond/begin").value = (totalpage-1)*length;
	frm.submit();

}

function firstPage(){
	//var frm=document.form_query;
	var begin = frm("PageCond/begin").value;
	var count = frm("PageCond/count").value;
	if(frm.elements["PageCond/talentlength"]) {
		var templength = frm.elements["PageCond/talentlength"].value;
		if(!isNaN(templength)) {
			frm("PageCond/length").value = templength
		}
	}
	var length = frm("PageCond/length").value;
	var totalpage = count/length;
	if(totalpage*length < count) totalpage = totalpage + 1;

	frm("PageCond/begin").value = 0;
	frm.submit();
}


function frontPage(){	
	//var frm=document.form_query;
	var begin=parseInt(frm("PageCond/begin").value);
	var count=parseInt(frm("PageCond/count").value);
	if(frm.elements["PageCond/talentlength"]) {
		var templength = frm.elements["PageCond/talentlength"].value;
		if(!isNaN(templength)) {
			frm("PageCond/length").value = templength
		}
	}
	var length=parseInt(frm("PageCond/length").value);
	var totalpage=parseInt(count/length);
	if(totalpage*length<count) totalpage=totalpage+1;
	if(begin<=0) return false;
	if(begin>count) return false;

	frm("PageCond/begin").value=begin-length;
	frm.submit();
}

function setRowsPage(){
    // �������ĺϷ���
    var temp1=parseInt(trim(cond_RowsPage.value));
    if(isNaN(temp1)){
        window.alert("ÿҳ��Ϣ���������ÿ��������밢�������֣�");
        return;
    }
    //var form = document.form_query;
    // ����û������룬ʹ��ֵ��[1,totalLines]֮��
    if(temp1<1)
        form.qc_LinePerPage.value="20";
    else
        form.qc_LinePerPage.value=""+temp1+"";
    form.qc_GotoPage.value="1";
    form.submit();
}

