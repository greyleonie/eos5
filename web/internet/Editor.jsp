<%@include file="/internet/common.jsp"%>
<%
String ID=request.getParameter("ID");
String webiD=request.getParameter("webID");
String lb=request.getParameter("lb");

 
String dataname="../data1.asp";


%>

<html>
<head>
<title>�༭�ı�����</title>
<link rel="STYLESHEET" type="text/css" href="edit.css">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" type="text/css" href="../index1.CSS">
</head>
<body bgcolor="menu"  STYLE="margin:0pt;padding:0pt" background="IMG/GAMEBG7.GIF" topmargin="0" leftmargin="0" >
<table width="100%" cellspacing="0" cellpadding="0" border="0"><tr><td  >
<div class="yToolbar" ID="ExtToolbar">
   <div class="Btn" TITLE="ȫѡ" LANGUAGE="javascript" onclick="format1('SelectAll');">
    <img class="Ico" src="images\selectAll.gif" WIDTH="22" HEIGHT="22">
  </div>

   <div class="Btn" TITLE="ɾ��" LANGUAGE="javascript" onclick="format1('delete');">
    <img class="Ico" src="images\delete.gif" WIDTH="16" HEIGHT="16">
  </div>
  <div class="Btn" TITLE="����" LANGUAGE="javascript" onclick="format1('cut');">
    <img class="Ico" src="images\cut.gif" WIDTH="16" HEIGHT="16">
  </div>
  <div class="Btn" TITLE="����" LANGUAGE="javascript" onclick="format1('copy');">
    <img class="Ico" src="images\copy.gif" WIDTH="16" HEIGHT="16">
  </div>
  <div class="Btn" TITLE="ճ��" LANGUAGE="javascript" onclick="format1('paste');">
    <img class="Ico" src="images\paste.gif" WIDTH="16" HEIGHT="16">
  </div>
    <div class="Btn" TITLE="���ı�ճ��" LANGUAGE="javascript" onclick="PasteText();">
    <img class="Ico" src="images\pastetext.gif" WIDTH="22" HEIGHT="22">
  </div>

  <div class="Btn" TITLE="ɾ���ı���ʽ" LANGUAGE="javascript" onclick="format('RemoveFormat');">
    <img class="Ico" src="images\RemoveFormat.gif" WIDTH="22" HEIGHT="22">
  </div>


  <div class="Btn" TITLE="����" LANGUAGE="javascript" onclick="format1('undo');">
    <img class="Ico" src="images\undo.gif" WIDTH="17" HEIGHT="16">
  </div>
  <div class="Btn" TITLE="�ָ�" LANGUAGE="javascript" onclick="format1('redo');">
    <img class="Ico" src="images\redo.gif" WIDTH="16" HEIGHT="16">
  </div>
<div class="Btn" TITLE="�����ҳ��" LANGUAGE="javascript" onclick="myformat()">
    <img class="Ico" src="images/page.gif" WIDTH="22" HEIGHT="22">
</div>
  <div class="TBSep"></div>
  <div class="Btn" TITLE="������" LANGUAGE="javascript" onclick="Insertlr('table.asp',350,225,545)">
    <img class="Ico" src="images\table.gif" WIDTH="18" HEIGHT="18">
  </div>
  <div class="Btn" TITLE="���볬������" LANGUAGE="javascript" onclick="UserDialog('CreateLink')">
    <img class="Ico" src="images\wlink.gif" WIDTH="22" HEIGHT="22">
</div>
<div class="Btn" TITLE="����ͼƬ�򸽼�" LANGUAGE="javascript" onclick="Insertlr('insertimg.asp>',270,238,545);">
    <img class="Ico" src="images\img.gif" WIDTH="22" HEIGHT="22">
  </div>
<div class="Btn" TITLE="��վͼ��" LANGUAGE="javascript" onclick="Insertlr('selectimg.asp>',470,338,541);">
    <img class="Ico" src="images\selimg.gif" WIDTH="22" HEIGHT="22">
  </div>
  <div class="Btn" TITLE="�����ý���ļ�" LANGUAGE="javascript" onclick="Inserflash()">
    <img class="Ico" src="images\flash.gif" WIDTH="22" HEIGHT="22">
  </div>
  <div class="Btn" TITLE="�����������" LANGUAGE="javascript" onclick="Insertlr('tsfh.htm',300,200,445)">
    <img class="Ico" src="images\fh.gif" WIDTH="22" HEIGHT="22">
  </div>

  <div class="Btn" TITLE="���������˵�" LANGUAGE="javascript" onclick="Insermenu('44')">
    <img class="Ico" src="images\menu.gif" WIDTH="18" HEIGHT="18">
  </div>
 <div class="Btn" TITLE="������ɫ" LANGUAGE="javascript" onclick="foreColor();">               
    <img class="Ico" src="images\fgcolor.gif" WIDTH="23" HEIGHT="22">               
  </div>               
               
               
  <div class="Btn" TITLE="�Ӵ�" LANGUAGE="javascript" onclick="format('bold');">               
    <img class="Ico" src="images\bold.gif" WIDTH="16" HEIGHT="16">               
  </div>               
  <div class="Btn" TITLE="б��" LANGUAGE="javascript" onclick="format('italic');">               
    <img class="Ico" src="images\italic.gif" WIDTH="16" HEIGHT="16">               
  </div>               
  <div class="Btn" TITLE="�»���" LANGUAGE="javascript" onclick="format('underline');">               
    <img class="Ico" src="images\underline.gif" WIDTH="16" HEIGHT="16">               
  </div>               
               
  <div class="TBSep"></div>               
               
  <div class="Btn" TITLE="�����" NAME="Justify" LANGUAGE="javascript" onclick="format('justifyleft');">               
    <img class="Ico" src="images\aleft.gif" WIDTH="17" HEIGHT="16">               
  </div>               
  <div class="Btn" TITLE="����" NAME="Justify" LANGUAGE="javascript" onclick="format('justifycenter');">               
    <img class="Ico" src="images\center.gif" WIDTH="17" HEIGHT="16">               
  </div>               
  <div class="Btn" TITLE="�Ҷ���" NAME="Justify" LANGUAGE="javascript" onclick="format('justifyright');">               
    <img class="Ico" src="images\aright.gif" WIDTH="16" HEIGHT="16">               
  </div>               
 
</div>
</td></tr><tr><td >                 
<div class="yToolbar">  
<select ID="formatSelect" class="TBGen"  title="�����ʽ" onchange="doSelectClick('FormatBlock',this)" style="font: icon; width: 80px;">  
			<option>�����ʽ</option>
			<option VALUE="&lt;P&gt;">��ͨ
			<option VALUE="&lt;PRE&gt;">�ѱ��Ÿ�ʽ
			<option VALUE="&lt;H1&gt;">����һ
			<option VALUE="&lt;H2&gt;">�����
			<option VALUE="&lt;H3&gt;">������
			<option VALUE="&lt;H4&gt;">������
			<option VALUE="&lt;H5&gt;">������
			<option VALUE="&lt;H6&gt;">������
            <option VALUE="&lt;H7&gt;">������
		</select>
<select id="specialtype" class="TBGen"  onchange="doSelectClick('FormatBlock',this)" style="font: icon; width: 100px;">                       
			<option>���������ʽ</option>               
			<option VALUE="SUP">�ϱ�               
			<option VALUE="SUB">�±�               
			<option VALUE="DEL">ɾ����               
			<option VALUE="BLINK">��˸               
			<option VALUE="BIG">��������               
			<option VALUE="SMALL">��С����               
		</select>               
  
  
  <select language="javascript" class="TBGen" id="FontName" title="������" onchange="format('fontname',this[this.selectedIndex].value);">                
  <option class="heading" selected>����<option value="����">����<option value="����">����<option value="����_GB2312">����<option value="����_GB2312">����<option value="����">����<option value="��Բ">��Բ<option value="������">������<option value="ϸ����">ϸ����<option value="Arial">Arial<option value="Arial Black">Arial 
  Black<option value="Arial Narrow">Arial Narrow<option value="Bradley Hand	ITC">Bradley 
  Hand ITC<option value="Brush Script	MT">Brush Script MT<option value="Century Gothic">Century 
  Gothic<option value="Comic Sans MS">Comic Sans MS<option value="Courier">Courier<option value="Courier New">Courier 
  New<option value="MS Sans Serif">MS Sans Serif<option value="Script">Script<option value="System">System<option value="Times New Roman">Times 
  New Roman<option value="Viner Hand ITC">Viner Hand ITC<option value="Verdana">Verdana<option value="Wide	Latin">Wide 
  Latin<option value="Wingdings">Wingdings</option></select> <select language="javascript" class="TBGen" id="FontSize" title="�ֺŴ�С" onchange="format('fontsize',this[this.selectedIndex].value);"> <option class="heading" selected>�ֺ�<option value="7">һ��<option value="6">����<option value="5">����<option value="4">�ĺ�<option value="3">���<option value="2">����<option value="1">�ߺ�</option></select> 
              
  <div class="TBSep"></div>               
               
  <div class="Btn" TITLE="���" LANGUAGE="javascript" onclick="format('insertorderedlist');">               
    <img class="Ico" src="images\numlist.gif" WIDTH="18" HEIGHT="18">               
  </div>               
  <div class="Btn" TITLE="��Ŀ����" LANGUAGE="javascript" onclick="format('insertunorderedlist');">               
    <img class="Ico" src="images\bullist.gif" WIDTH="18" HEIGHT="18">               
  </div>               
  <div class="Btn" TITLE="����������" LANGUAGE="javascript" onclick="format('outdent');">               
    <img class="Ico" src="images\outdent.gif" WIDTH="16" HEIGHT="16">               
  </div>               
  <div class="Btn" TITLE="����������" LANGUAGE="javascript" onclick="format('indent');">               
    <img class="Ico" src="images\indent.gif" WIDTH="16" HEIGHT="16">               
  </div> 
<div class="TBGen" id="EditMode" title="ʹ�� HTML">
  <input onclick="setMode(this.checked);" type="checkbox" value="ON">HTML��ʽ </div>
 </div>
 </td></tr><tr><td>
</table>
 

             
<!--<iframe class="Composition" ID="Composition" MARGINHEIGHT="1" MARGINWIDTH="1" width="100%" height="320" src="<%=dataname%>?webid=<%=webid%>&id=<%=id%>&dateid=<%=(now()-date())*24*60*60*1000%>">             
</iframe>             
             
--><script src="editdata.js" type="text/javascript"></script>             
             
</body>             
</html>