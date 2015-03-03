<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.io.*,java.text.*,java.util.*,java.sql.*,java.text.SimpleDateFormat,java.text.DateFormat,java.util.Date,javax.servlet.*,javax.servlet.http.*,DBstep.iDBManager2000.*" %>
<%!
  /**
   * 功能或作用：格式化日期时间
   * @param DateValue 输入日期或时间
   * @param DateType 格式化 EEEE是星期, yyyy是年, MM是月, dd是日, HH是小时, mm是分钟,  ss是秒
   * @return 输出字符串
   */
  public String FormatDate(String DateValue,String DateType)
  {
    String Result;
    SimpleDateFormat formatter = new SimpleDateFormat(DateType);
    try{
      Date mDateTime = formatter.parse(DateValue);
      Result = formatter.format(mDateTime);
    }catch(Exception ex){
      Result = ex.getMessage();
    }
    if (Result.equalsIgnoreCase("1900-01-01")){
      Result = "";
    }
    return Result;
  }
%>
<%
  ResultSet result=null;
  String mSubject=null;
  String mStatus=null;
  String mAuthor=null;
  String mFileName=null;
  String mFileDate=null;
  String mHTMLPath="";

  String mDisabled="";
  String mDisabledSave="";
  String mWord="";
  String mExcel="";

  //自动获取OfficeServer和OCX文件完整URL路径
  String mHttpUrlName=request.getRequestURI();
  String mScriptName=request.getServletPath();
  String mServerName="OfficeServer.jsp";

  String mServerUrl="http://"+request.getServerName()+":"+request.getServerPort()+mHttpUrlName.substring(0,mHttpUrlName.lastIndexOf(mScriptName))+"/"+mServerName;//取得OfficeServer文件的完整URL
  String mHttpUrl="http://"+request.getServerName()+":"+request.getServerPort()+mHttpUrlName.substring(0,mHttpUrlName.lastIndexOf(mScriptName))+"/";

  String mRecordID=request.getParameter("RecordID");
  String mTemplate=request.getParameter("Template");
  String mFileType=request.getParameter("FileType");
  String mEditType=request.getParameter("EditType");
  String mShowType=request.getParameter("ShowType");
  String mUserName=new String(request.getParameter("UserName").getBytes("8859_1"));

  //取得编号
  if (mRecordID==null)
  {
     mRecordID="";	//编号为空
  }
  //取得模式
  if (mEditType==null)
  {
    mEditType="1,1";	//文档编辑类型  第一位可以为0,1,2,3 其中:0不可编辑;1可以编辑,无痕迹;2可以编辑,有痕迹,不能修订;3可以编辑,有痕迹,能修订；
                        //第二位可以为0,1 其中:0不可批注,1可以批注。可以参考iWebOffice2006的EditType属性，详细参考技术白皮书
  }
  //取得显示模式
  if (mShowType==null)
  {
    mShowType="1";	//文档显示方式  1:表示文字批注  2:表示手写批注  0:表示文档核稿
  }
  //取得类型
  if (mFileType==null)
  {
    mFileType=".doc";	// 默认为.doc文档
  }
  //取得用户名
  if (mUserName==null)
  {
    mUserName="金格科技";
  }

  //取得模板
  if (mTemplate==null)
  {
    mTemplate="";	// 默认没有模板
  }

  //打开数据库
  DBstep.iDBManager2000 DbaObj=new DBstep.iDBManager2000();
  if (DbaObj.OpenConnection())
  {
    String mSql="Select * From Document Where RecordID='"+ mRecordID + "'";
    try
    {
      result=DbaObj.ExecuteQuery(mSql);
      if (result.next())
      {
        mRecordID=result.getString("RecordID");
        mTemplate=result.getString("Template");
        mSubject=result.getString("Subject");
        mAuthor=result.getString("Author");
        mFileDate=result.getString("FileDate");
        mStatus=result.getString("Status");
        mFileType=result.getString("FileType");
        mHTMLPath=result.getString("HTMLPath");
      }
      else
      {
	//取得唯一值(mRecordID)
        java.util.Date dt=new java.util.Date();
        long lg=dt.getTime();
        Long ld=new Long(lg);
	//初始化值
        mRecordID=ld.toString();//保存的是文档的编号，通过该编号，可以在里找到所有属于这条纪录的文档
        mTemplate=mTemplate;
        mSubject="请输入主题";
        mAuthor=mUserName;
        mFileDate=DbaObj.GetDateTime();
        mStatus="DERF";
        mFileType=mFileType;
        mHTMLPath="";
      }
      result.close();
    }
    catch(SQLException e)
    {
      System.out.println(e.toString());
    }
    DbaObj.CloseConnection() ;
  }

  if (mEditType.compareTo("0,0")==0)
  {
     mDisabled="disabled";
     mDisabledSave="disabled";
  }
  else
  {
     mDisabled="";
  }

  mFileName=mRecordID + mFileType;  //取得完整的文档名称
  if (mFileType.equalsIgnoreCase(".doc") || mFileType.equalsIgnoreCase(".wps")){
     mWord="";
     mExcel="disabled";
  }
  else if (mFileType.compareTo(".xls")==0)
  {
     mWord="disabled";
     mExcel="";
  }
  else{
    mDisabled="disabled";
  }
%>
<html>
<head>
<title>金格科技-iWebOffice2006全文批注实例</title>
<link rel='stylesheet' type='text/css' href='test.css'>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="javascript" for=WebOffice event="OnMenuClick(vIndex,vCaption)">

   if (vIndex==1){  //打开本地文件
      WebOpenLocal();
   }
   if (vIndex==2){  //保存本地文件
      WebSaveLocal();
   }
   if (vIndex==3){  //保存到服务器上
      SaveDocument();    //保存正文
   }
   if (vIndex==5){  //签名印章
      WebOpenSignature();
   }
   if (vIndex==6){  //验证签章
      WebShowSignature();
   }
   if (vIndex==8){  //保存版本
      WebSaveVersion();
   }
   if (vIndex==9){  //打开版本
      WebOpenVersion();
   }
   if (vIndex==11){  //测试菜单一
     alert('菜单编号:'+vIndex+'\n\r'+'菜单条目:'+vCaption+'\n\r'+'请根据这些信息编写菜单具体功能');
   }
   if (vIndex==12){  //测试菜单二
     alert('菜单编号:'+vIndex+'\n\r'+'菜单条目:'+vCaption+'\n\r'+'请根据这些信息编写菜单具体功能');
   }
   if (vIndex==14){  //保存并退出
     SaveDocument();    //保存正文
     webform.submit();
   }
   if (vIndex==16){  //打印文档
      WebOpenPrint();
   }
   if (vIndex==17){  //隐藏手写批注
      webform.WebOffice.VisibleTools('手写批注',false);   //隐藏或显示iWebOffice工具栏 true显示  false隐藏
   }
   if (vIndex==18){  //显示手写批注
      webform.WebOffice.VisibleTools('手写批注',true);   //隐藏或显示iWebOffice工具栏 true显示  false隐藏
   }

</script>

<SCRIPT language=javascript for=WebOffice event=OnToolsClick(vIndex,vCaption)>
    //响应工具栏事件
    if (vIndex==11){WebOpenSignature();}
    if (vIndex==12){webform.WebOffice.Alert('自定义工具栏测试');}
    //if (vIndex==-1){webform.WebOffice.Alert(vCaption);}             //在完成相应操作后响应iWebOffice标准工具栏操作铵钮事件，如"手写批注",vCaption="手写批注"
</SCRIPT>

<script language=javascript>
/*
form表单名称:webform
iWebOffice名称:WebOffice
WebObject文档对象接口，相当于：
如果是Word  文件，WebObject 是Word  VBA的ActiveDocument对象
如果是Excel 文件，WebObject 是Excel VBA的ActiveSheet对象

如：webform.WebOffice.WebObject
*/


//作用：显示操作状态
function StatusMsg(mString){
  StatusBar.innerText=mString;
}

//作用：载入iWebOffice
function Load(){

  try{
  //以下属性必须设置，实始化iWebOffice
  webform.WebOffice.WebUrl="<%=mServerUrl%>";    //WebUrl:系统服务器路径，与服务器文件交互操作，如保存、打开文档，重要文件
  webform.WebOffice.RecordID="<%=mRecordID%>";   //RecordID:本文档记录编号
  webform.WebOffice.Template="<%=mTemplate%>";   //Template:模板编号
  webform.WebOffice.FileName="<%=mFileName%>";   //FileName:文档名称
  webform.WebOffice.FileType="<%=mFileType%>";   //FileType:文档类型  .doc  .xls  .wps
  webform.WebOffice.UserName="<%=mUserName%>";   //UserName:操作用户名，痕迹保留需要
  webform.WebOffice.EditType="<%=mEditType%>";   //EditType:编辑类型  方式一、方式二  <参考技术文档>
                                                 //第一位可以为0,1,2,3 其中:0不可编辑;1可以编辑,无痕迹;2可以编辑,有痕迹,不能修订;3可以编辑,有痕迹,能修订；
                                                 //第二位可以为0,1 其中:0不可批注,1可以批注。可以参考iWebOffice2006的EditType属性，详细参考技术白皮书

  //Start  iWebOffice2006属性  以下属性可以不要
  webform.WebOffice.Language="CH";               //Language:多语言支持显示选择   CH 简体 TW繁体 EN英文
  webform.WebOffice.PenColor="#FF0000";          //PenColor:默认批注颜色
  webform.WebOffice.PenWidth="1";                //PenWidth:默认批注笔宽
  webform.WebOffice.Print="1";                   //Print:默认是否可以打印:1可以打印批注,0不可以打印批注
  webform.WebOffice.ShowToolBar="1";             //ShowToolBar:是否显示工具栏:1显示,0不显示

  //参数一:Index按钮编号,参数二:Caption按钮显示内容,参数三:Icon图标名称
  webform.WebOffice.AppendTools("8","签名印章",8); //在OnToolsClick中的 vIndex=11 ,vCaption="工具栏11";
  webform.WebOffice.AppendTools("9","工具栏12",9); //在OnToolsClick中的 vIndex=12 ,vCaption="工具栏12";
  webform.WebOffice.AppendTools("10","-",0);

  webform.WebOffice.ShowMenu="1";
  webform.WebOffice.AppendMenu("1","打开本地文件(&L)");
  webform.WebOffice.AppendMenu("2","保存本地文件(&S)");
  webform.WebOffice.AppendMenu("3","保存远程文件(&U)");
  webform.WebOffice.AppendMenu("4","-");
  webform.WebOffice.AppendMenu("5","签名印章(&Q)");
  webform.WebOffice.AppendMenu("6","验证签章(&Y)");
  webform.WebOffice.AppendMenu("7","-");
  webform.WebOffice.AppendMenu("8","保存版本(&B)");
  webform.WebOffice.AppendMenu("9","打开版本(&D)");
  webform.WebOffice.AppendMenu("10","-");
  webform.WebOffice.AppendMenu("11","测试菜单一(&X)");
  webform.WebOffice.AppendMenu("12","测试菜单二(&Z)");
  webform.WebOffice.AppendMenu("13","-");
  webform.WebOffice.AppendMenu("14","保存并退出(&E)");
  webform.WebOffice.AppendMenu("15","-");
  webform.WebOffice.AppendMenu("16","打印文档(&P)");
  webform.WebOffice.AppendMenu("主菜单","-");
  webform.WebOffice.AppendMenu("17","隐藏手写批注(&C)");
  webform.WebOffice.AppendMenu("18","显示手写批注(&O)");
  webform.WebOffice.DisableMenu("宏(&M);选项(&O)...");      //禁止菜单
  //End

  webform.WebOffice.WebOpen();  	 //打开该文档    交互OfficeServer  调出文档OPTION="LOADFILE"    调出模板OPTION="LOADTEMPLATE"     <参考技术文档>
  webform.WebOffice.ShowType=<%=mShowType%>;          //文档显示方式  1:表示文字批注  2:表示手写批注  0:表示文档核稿

  StatusMsg(webform.WebOffice.Status);                //状态信息
  }catch(e){}
}

//作用：退出iWebOffice
function UnLoad(){
  try{
  if (!webform.WebOffice.WebClose()){
     StatusMsg(webform.WebOffice.Status);
  }else{
     StatusMsg("关闭文档...");
  }
  }catch(e){}
}

//作用：打开文档
function LoadDocument(){
  StatusMsg("正在打开文档...");
  if (!webform.WebOffice.WebOpen()){  	//打开该文档    交互OfficeServer的OPTION="LOADFILE"
     StatusMsg(webform.WebOffice.Status);
  }else{
     StatusMsg(webform.WebOffice.Status);
  }
}

//作用：保存文档
function SaveDocument(){
  //webform.WebOffice.WebSetMsgByName("MyDefine1","自定义变量值1");  //设置变量MyDefine1="自定义变量值1"，变量可以设置多个  在WebSave()时，一起提交到OfficeServer中
  if (!webform.WebOffice.WebSave()){    //交互OfficeServer的OPTION="SAVEFILE"  注：WebSave()是保存复合格式文件，包括OFFICE内容和手写批注文档；如只保存成OFFICE文档格式，那么就设WebSave(true)
     StatusMsg(webform.WebOffice.Status);
     return false;
  }else{
     StatusMsg(webform.WebOffice.Status);
     return true;
  }
}


//作用：显示或隐藏痕迹[隐藏痕迹时修改文档没有痕迹保留]  true表示隐藏痕迹  false表示显示痕迹
function ShowRevision(mValue){
  if (mValue){
     webform.WebOffice.WebShow(true);
     StatusMsg("显示痕迹...");
  }else{
     webform.WebOffice.WebShow(false);
     StatusMsg("隐藏痕迹...");
  }
}


//作用：显示或隐藏痕迹[隐藏痕迹时修改文档有痕迹保留]  true表示隐藏痕迹  false表示显示痕迹
function ShowRevision2(mValue){
  if (mValue){
     webform.WebOffice.WebObject.ShowRevisions=true;   //显示痕迹
  }else{
     webform.WebOffice.WebObject.ShowRevisions=false;  //隐藏痕迹
  }
}


//作用：获取痕迹
function WebGetRevisions(){
  var i;
  var Text="";
  for (i = 1;i <= webform.WebOffice.WebObject.Revisions.Count;i++){
    Text=Text + webform.WebOffice.WebObject.Revisions.Item(i).Author;
    if (webform.WebOffice.WebObject.Revisions.Item(i).Type=="1"){
      Text=Text + '插入:'+webform.WebOffice.WebObject.Revisions.Item(i).Range.Text+"\r\n";
    }else{
      Text=Text + '删除:'+webform.WebOffice.WebObject.Revisions.Item(i).Range.Text+"\r\n";
    }
  }
  alert("痕迹内容：\r\n"+Text);
}

//作用：刷新文档
function WebReFresh(){
  webform.WebOffice.WebReFresh();
  StatusMsg("文档已刷新...");
}


//作用：打开版本
function WebOpenVersion(){
  webform.WebOffice.WebOpenVersion();  	//交互OfficeServer  列出版本OPTION="LISTVERSION"     调出版本OPTION="LOADVERSION"   <参考技术文档>
  StatusMsg(webform.WebOffice.Status);
}

//作用：保存版本
function WebSaveVersion(){
  webform.WebOffice.WebSaveVersion();  	//交互OfficeServer的OPTION="SAVEVERSION"
  StatusMsg(webform.WebOffice.Status);

}

//作用：保存当前版本
function WebSaveVersionByFileID(){
  var mText=window.prompt("请输入版本说明:","版本号:V");
  if (mText==null){
     mText="已修改版本.";
  }
  webform.WebOffice.WebSaveVersionByFileID(mText);  	//交互OfficeServer的OPTION="SAVEVERSION"  同时带FileID值   <参考技术文档>
  StatusMsg(webform.WebOffice.Status);
}


//作用：填充模板
function LoadBookmarks(){
  StatusMsg("正在填充模扳...");
  if (!webform.WebOffice.WebLoadBookmarks()){  	//交互OfficeServer的OPTION="LOADBOOKMARKS"
     StatusMsg(webform.WebOffice.Status);
  }else{
     StatusMsg(webform.WebOffice.Status);
  }
}

//作用：标签管理
function WebOpenBookMarks(){
  try{
    webform.WebOffice.WebOpenBookmarks();  	//交互OfficeServer的OPTION="LISTBOOKMARKS"
    StatusMsg(webform.WebOffice.Status);
  }catch(e){}
}

//作用：设置书签值  vbmName:标签名称，vbmValue:标签值   标签名称注意大小写
function SetBookmarks(vbmName,vbmValue){
  if (!webform.WebOffice.WebSetBookmarks(vbmName,vbmValue)){
     StatusMsg(webform.WebOffice.Status);
  }else{
     StatusMsg(webform.WebOffice.Status);
  }
}

//作用：根据标签名称获取标签值  vbmName:标签名称
function GetBookmarks(vbmName){
  var vbmValue;
  vbmValue=webform.WebOffice.WebGetBookmarks(vbmName);
  return vbmValue;
}

//作用：打印文档
function WebOpenPrint(){
  try{
    webform.WebOffice.WebOpenPrint();
    StatusMsg(webform.WebOffice.Status);
  }catch(e){}
}


//作用：页面设置
function WebOpenPageSetup(){
   try{
	if (webform.WebOffice.FileType==".doc"){
	  webform.WebOffice.WebObject.Application.Dialogs(178).Show();
	}
	if(webform.WebOffice.FileType==".xls"){
	  webform.WebOffice.WebObject.Application.Dialogs(7).Show();
	}
   }catch(e){}
}

//作用：插入图片
function WebOpenPicture(){
  try{
    webform.WebOffice.WebOpenPicture();
    StatusMsg(webform.WebOffice.Status);
  }catch(e){}
}

//作用：签名印章
function WebOpenSignature(){
  alert("如果你要更安全签章,建议采用金格iSignature电子签章软件进行签章:\r\n下载地址http://www.goldgrid.cn/iSignature/Download.asp\r\n\r\n该软件是支持文档完整性保护、CA证书和数字签名技术的,\r\n是通过了<国家公安部和国家保密局>双重认证的安全电子签章产品!");
  try{
    webform.WebOffice.WebOpenSignature();  	//交互OfficeServer的 A签章列表OPTION="LOADMARKLIST"    B签章调出OPTION="LOADMARKIMAGE"    C确定签章OPTION="SAVESIGNATURE"    <参考技术文档>
    StatusMsg(webform.WebOffice.Status);
  }catch(e){}
}

//作用：验证印章A
function WebShowSignature(){
  try{
    webform.WebOffice.WebShowSignature();  	//交互OfficeServer的OPTION="LOADSIGNATURE"
    StatusMsg(webform.WebOffice.Status);
  }catch(e){}
}

//作用：验证印章B
function WebCheckSignature(){
  try{
    var i=webform.WebOffice.WebCheckSignature();  	//交互OfficeServer的OPTION="LOADSIGNATURE"
    alert("检测结果："+i+"\r\n 注释: (=-1 有非法印章) (=0 没有任何印章) (>=1 有多个合法印章)");
    StatusMsg(i);
  }catch(e){}
}

//作用：存为本地文件
function WebSaveLocal(){
  try{
    webform.WebOffice.WebSaveLocal();
    StatusMsg(webform.WebOffice.Status);
  }catch(e){}
}

//作用：打开本地文件
function WebOpenLocal(){
  try{
    webform.WebOffice.WebOpenLocal();
    StatusMsg(webform.WebOffice.Status);
  }catch(e){}
}

//作用：保存为HTML文档
function WebSaveAsHtml(){
  try{
    if (webform.WebOffice.WebSaveAsHtml())  	//交互OfficeServer的OPTION="SAVEASHTML"
    {
      webform.HTMLPath.value="HTML/<%=mRecordID%>.htm";
      window.open("<%=mHttpUrl%>"+ webform.HTMLPath.value);
    }
    StatusMsg(webform.WebOffice.Status);
  }catch(e){}
}


//作用：保存为文档图片
function WebSaveAsPage(){
  try{
    if (webform.WebOffice.WebSaveImage())  	//交互OfficeServer的OPTION="SAVEIMAGE"
    {
      webform.HTMLPath.value="HTMLIMAGE/<%=mRecordID%>.htm";
      window.open("<%=mHttpUrl%>"+ webform.HTMLPath.value);
    }
    StatusMsg(webform.WebOffice.Status);
  }catch(e){}
}


//作用：关闭或显示工具 参数1表示工具条名称  参数2为false时，表示关闭  （名称均可查找VBA帮助）
//参数2为true时，表示显示
function WebToolsVisible(ToolName,Visible){
  try{
    webform.WebOffice.WebToolsVisible(ToolName,Visible);
    StatusMsg(webform.WebOffice.Status);
  }catch(e){}
}


//作用：禁止或启用工具 参数1表示工具条名称  参数2表示工具条铵钮的编号  （名称和编号均可查找VBA帮助）
//参数3为false时，表示禁止  参数3为true时，表示启用
function WebToolsEnable(ToolName,ToolIndex,Enable){
  try{
    webform.WebOffice.WebToolsEnable(ToolName,ToolIndex,Enable);
    StatusMsg(webform.WebOffice.Status);
  }catch(e){}
}

//作用：保护与解除  参数1为true表示保护文档  false表示解除保护
function WebProtect(value){
  try{
    webform.WebOffice.WebSetProtect(value,"");  //""表示密码为空
  }catch(e){}
}

//作用：允许与禁止拷贝功能  参数1为true表示允许拷贝  false表示禁止拷贝
function WebEnableCopy(value){
  try{
    webform.WebOffice.CopyType=value;
  }catch(e){}
}


//作用：插入远程服务器图片
function WebInsertImage(){
  try{
    webform.WebOffice.WebInsertImage('Image','GoldgridLogo.jpg',true,4);   //交互OfficeServer的OPTION="INSERTIMAGE"  参数1表示标签名称  参数2表示图片文件名  参数3为true透明  false表示不透明  参数4为4表示浮于文字上方  5表示衬于文字下方
    StatusMsg(webform.WebOffice.Status);
  }catch(e){}
}


//作用：下载服务器文件到本地
function WebGetFile(){
  if (webform.WebOffice.WebGetFile("c:\\WebGetFile.doc","DownLoad.doc")){   //交互OfficeServer的OPTION="GETFILE"  参数1表示本地路径  参数2表示服务器文件名称
    StatusMsg(webform.WebOffice.Status);
  }else{
    StatusMsg(webform.WebOffice.Status);
  }
  alert(webform.WebOffice.Status+"\r\n"+"文件放在c:\\WebGetFile.doc");
}


//作用：上传本地文件到服务器
function WebPutFile(){
  var mLocalFile=webform.WebOffice.WebOpenLocalDialog();
  if (mLocalFile!=""){
    alert(mLocalFile);
    if (webform.WebOffice.WebPutFile(mLocalFile,"Test.doc")){   //交互OfficeServer的OPTION="PUTFILE"  参数1表示本地路径，可以任何格式文件  参数2表示服务器文件名称
      StatusMsg(webform.WebOffice.Status);
    }else{
      StatusMsg(webform.WebOffice.Status);
    }
    alert(webform.WebOffice.Status);
  }
}


//作用：打开远程文件
function WebDownLoadFile(){
  mResult=webform.WebOffice.WebDownLoadFile("http://www.goldgrid.com/Images/abc.doc","c:\\abc.doc");
  if (mResult){
    webform.WebOffice.WebOpenLocalFile("c:\\abc.doc");
    alert("成功");
  }else{
    alert("失败");
  }
}

//作用：取得服务器端时间，设置本地时间  [V6.0.1.5以上支持]
function WebDateTime(){
  mResult=webform.WebOffice.WebDateTime(true);   //交互OfficeServer的OPTION="DATETIME"   true表示返回并设置本地时间为服务器时间；false表示仅返回服务器时间
  alert("提示：已经设置本地时间为 "+mResult);    //该功能主要用于在痕迹保留时读取服务器时间
}


//作用：表格生成及填充
function WebSetWordTable(){
  var mText="",mName="",iColumns,iCells,iTable;
  //设置COMMAND为WORDTABLE
  webform.WebOffice.WebSetMsgByName("COMMAND","WORDTABLE");   //设置变量COMMAND="WORDTABLE"，在WebSendMessage()时，一起提交到OfficeServer中
  //发送到服务器上
  //如果没有错误
  if (webform.WebOffice.WebSendMessage()){                //交互OfficeServer的OPTION="SENDMESSAGE"
	iColumns = webform.WebOffice.WebGetMsgByName("COLUMNS");  //取得列
	iCells = webform.WebOffice.WebGetMsgByName("CELLS");      //取得行
	iTable=webform.WebOffice.WebObject.Tables.Add(webform.WebOffice.WebObject.Application.Selection.Range,iCells,iColumns);   //生成表格
	for (var i=1; i<=iColumns; i++)
	{
   	  for (var j=1; j<=iCells; j++)
	  {
		mName=i.toString()+j.toString();
		mText=webform.WebOffice.WebGetMsgByName(mName);	 //取得OfficeServer中的表格内容
		iTable.Columns(i).Cells(j).Range.Text=mText;   	//填充单元值
	   }
	}
   }
   StatusMsg(webform.WebOffice.Status);
}


//作用：获取文档Txt正文
function WebGetWordContent(){
  try{
    alert(webform.WebOffice.WebObject.Content.Text);
  }catch(e){}
}

//作用：写Word内容
function WebSetWordContent(){
  var mText=window.prompt("请输入内容:","测试内容");
  if (mText==null){
     return (false);
  }
  else
  {
     //下面为显示选中的文本
     //alert(webform.WebOffice.WebObject.Application.Selection.Range.Text);
     //下面为在当前光标出插入文本
     webform.WebOffice.WebObject.Application.Selection.Range.Text= mText+"\n";
     //下面为在第一段后插入文本
     //webform.WebOffice.WebObject.Application.ActiveDocument.Range(1).Text=(mText);
  }
}


//作用：打印黑白文档
function WebWordPrintBlackAndWhile(){
   var i,n;

   //图片变黑白
   i=0;
   n=webform.WebOffice.WebObject.Shapes.Count;
   for (var i=1; i<=n; i++)
   {
      webform.WebOffice.WebObject.Shapes.Item(i).PictureFormat.ColorType=3;
   }
   i=0;
   n=webform.WebOffice.WebObject.InlineShapes.Count;
   for (var i=1; i<=n; i++)
   {
      webform.WebOffice.WebObject.InlineShapes.Item(i).PictureFormat.ColorType=3;
   }

   //文字变黑白
   webform.WebOffice.WebObject.Application.Selection.WholeStory();
   webform.WebOffice.WebObject.Application.Selection.Range.Font.Color = 0;
}

//作用：用Excel求和
function WebGetExcelContent(){
    webform.WebOffice.WebObject.Application.Sheets(1).Select;
    webform.WebOffice.WebObject.Application.Range("C5").Select;
    webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "126";
    webform.WebOffice.WebObject.Application.Range("C6").Select;
    webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "446";
    webform.WebOffice.WebObject.Application.Range("C7").Select;
    webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "556";
    webform.WebOffice.WebObject.Application.Range("C5:C8").Select;
    webform.WebOffice.WebObject.Application.Range("C8").Activate;
    webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "=SUM(R[-3]C:R[-1]C)";
    webform.WebOffice.WebObject.Application.Range("D8").Select;
    alert(webform.WebOffice.WebObject.Application.Range("C8").Text);
}


//作用：保护工作表单元
function WebSheetsLock(){
    webform.WebOffice.WebObject.Application.Sheets(1).Select;

    webform.WebOffice.WebObject.Application.Range("A1").Select;
    webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "产品";
    webform.WebOffice.WebObject.Application.Range("B1").Select;
    webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "价格";
    webform.WebOffice.WebObject.Application.Range("C1").Select;
    webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "详细说明";
    webform.WebOffice.WebObject.Application.Range("D1").Select;
    webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "库存";
    webform.WebOffice.WebObject.Application.Range("A2").Select;
    webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "书签";
    webform.WebOffice.WebObject.Application.Range("A3").Select;
    webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "毛笔";
    webform.WebOffice.WebObject.Application.Range("A4").Select;
    webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "钢笔";
    webform.WebOffice.WebObject.Application.Range("A5").Select;
    webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "尺子";

    webform.WebOffice.WebObject.Application.Range("B2").Select;
    webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "0.5";
    webform.WebOffice.WebObject.Application.Range("C2").Select;
    webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "樱花";
    webform.WebOffice.WebObject.Application.Range("D2").Select;
    webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "300";

    webform.WebOffice.WebObject.Application.Range("B3").Select;
    webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "2";
    webform.WebOffice.WebObject.Application.Range("C3").Select;
    webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "狼毫";
    webform.WebOffice.WebObject.Application.Range("D3").Select;
    webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "50";

    webform.WebOffice.WebObject.Application.Range("B4").Select;
    webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "3";
    webform.WebOffice.WebObject.Application.Range("C4").Select;
    webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "蓝色";
    webform.WebOffice.WebObject.Application.Range("D4").Select;
    webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "90";

    webform.WebOffice.WebObject.Application.Range("B5").Select;
    webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "1";
    webform.WebOffice.WebObject.Application.Range("C5").Select;
    webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "20cm";
    webform.WebOffice.WebObject.Application.Range("D5").Select;
    webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "40";

    //保护工作表
    webform.WebOffice.WebObject.Application.Range("B2:D5").Select;
    webform.WebOffice.WebObject.Application.Selection.Locked = false;
    webform.WebOffice.WebObject.Application.Selection.FormulaHidden = false;
    webform.WebOffice.WebObject.Application.ActiveSheet.Protect(true,true,true);

    alert("已经保护工作表，只有B2-D5单元格可以修改。");
}

//作用：VBA套红
function WebInsertVBA(){

	//画线
	var object=webform.WebOffice.WebObject;
	var myl=object.Shapes.AddLine(100,60,305,60)
	myl.Line.ForeColor=255;
	myl.Line.Weight=2;
	var myl1=object.Shapes.AddLine(326,60,520,60)
	myl1.Line.ForeColor=255;
	myl1.Line.Weight=2;

	//object.Shapes.AddLine(200,200,450,200).Line.ForeColor=6;
   	var myRange=webform.WebOffice.WebObject.Range(0,0);
	myRange.Select();

	var mtext="★";
	webform.WebOffice.WebObject.Application.Selection.Range.InsertAfter (mtext+"\n");
   	var myRange=webform.WebOffice.WebObject.Paragraphs(1).Range;
   	myRange.ParagraphFormat.LineSpacingRule =1.5;
   	myRange.font.ColorIndex=6;
   	myRange.ParagraphFormat.Alignment=1;
   	myRange=webform.WebOffice.WebObject.Range(0,0);
	myRange.Select();
	mtext="金格发[２００３]１５４号";
	webform.WebOffice.WebObject.Application.Selection.Range.InsertAfter (mtext+"\n");
	myRange=webform.WebOffice.WebObject.Paragraphs(1).Range;
	myRange.ParagraphFormat.LineSpacingRule =1.5;
	myRange.ParagraphFormat.Alignment=1;
	myRange.font.ColorIndex=1;

	mtext="金格电子政务文件";
	webform.WebOffice.WebObject.Application.Selection.Range.InsertAfter (mtext+"\n");
	myRange=webform.WebOffice.WebObject.Paragraphs(1).Range;
	myRange.ParagraphFormat.LineSpacingRule =1.5;

	//myRange.Select();
	myRange.Font.ColorIndex=6;
	myRange.Font.Name="仿宋_GB2312";
	myRange.font.Bold=true;
	myRange.Font.Size=50;
	myRange.ParagraphFormat.Alignment=1;

	//myRange=myRange=webform.WebOffice.WebObject.Paragraphs(1).Range;
	webform.WebOffice.WebObject.PageSetup.LeftMargin=70;
	webform.WebOffice.WebObject.PageSetup.RightMargin=70;
	webform.WebOffice.WebObject.PageSetup.TopMargin=70;
	webform.WebOffice.WebObject.PageSetup.BottomMargin=70;
}

//作用：套用模版定稿
function WebInsertFile(){
  var mDialogUrl = "Template/TemplateForm.jsp";
  var mObject = new Object();
      mObject.Template = "";
      window.showModalDialog(mDialogUrl, mObject, "dialogHeight:200px; dialogWidth:360px;center:yes;scroll:no;status:no;");

  //判断用户是否选择模板
  if (mObject.Template==""){
    StatusMsg("取消套用模");
    return false;
  }else{
    SaveDocument();    //保存当前编辑的文档
    webform.WebOffice.WebSetMsgByName("COMMAND","INSERTFILE");   //设置变量COMMAND="INSERTFILE"，在WebLoadTemplate()时，一起提交到OfficeServer中     <参考技术文档>
    webform.WebOffice.Template=mObject.Template;                 //全局变量Template赋值，此示例读取服务器目录中模板，如读取数据库中模板，Template值为数据库中的模板编号，则上句代码不需要，如Template="1050560363767"，模板名称为“Word公文模板”，注：模板中有要标签Content，区分大小写，可以自行修改
    if (webform.WebOffice.WebLoadTemplate()){                    //交互OfficeServer的OPTION="LOADTEMPLATE"
       //SetBookmarks("Title","关于中间件研发工作会议通知");     //填充模板其它基本信息，如标题，主题词，文号，主送机关等
       if (webform.WebOffice.WebInsertFile()){                   //填充公文正文   交互OfficeServer的OPTION="INSERTFILE"
         StatusMsg(webform.WebOffice.Status);
       }else{
         StatusMsg(webform.WebOffice.Status);
       }
    }else{
       StatusMsg(webform.WebOffice.Status);
    }
  }
}

//作用：保存定稿文件
function WebUpdateFile(){
  if (webform.WebOffice.WebUpdateFile()){                //交互OfficeServer的OPTION="UPDATEFILE"，类似WebSave()或WebSaveVersion()方法
     StatusMsg(webform.WebOffice.Status);
  }else{
     StatusMsg(webform.WebOffice.Status);
  }
}



//打印份数控制
function WebCopysCtrlPrint(){
  var mCopies,objPrint;
  objPrint = webform.WebOffice.WebObject.Application.Dialogs(88);     //打印设置对话框
  if (objPrint.Display==-1){
    mCopies=objPrint.NumCopies;    //取得需要打印份数
    webform.WebOffice.WebSetMsgByName("COMMAND","COPIES");
    webform.WebOffice.WebSetMsgByName("OFFICEPRINTS",mCopies.toString());   //设置变量OFFICEPRINTS的值，在WebSendMessage()时，一起提交到OfficeServer中
    webform.WebOffice.WebSendMessage();                               //交互OfficeServer的OPTION="SENDMESSAGE"
    if (webform.WebOffice.Status=="1") {
      alert("可以允许打印，注：该实例设置总文档打印份数2份");
      objPrint.Execute;
    }else{
      alert("已超出允许的打印份数");
      return false;
    }
  }
}


//作用：导入Text
function WebInportText(){
    var mText;
    webform.WebOffice.WebSetMsgByName("COMMAND","INPORTTEXT");  //设置变量COMMAND="INPORTTEXT"，在WebSendMessage()时，一起提交到OfficeServer中
    if (webform.WebOffice.WebSendMessage()){                    //交互OfficeServer的OPTION="SENDMESSAGE"
      mText=webform.WebOffice.WebGetMsgByName("CONTENT");       //取得OfficeServer传递的变量CONTENT值
      webform.WebOffice.WebObject.Application.Selection.Range.Text=mText;
      alert("导入文本成功");
    }
    StatusMsg(webform.WebOffice.Status);
}


//作用：导出Text
function WebExportText(){
    var mText=webform.WebOffice.WebObject.Content.Text;
    webform.WebOffice.WebSetMsgByName("COMMAND","EXPORTTEXT");  //设置变量COMMAND="EXPORTTEXT"，在WebSendMessage()时，一起提交到OfficeServer中
    webform.WebOffice.WebSetMsgByName("CONTENT",mText);         //设置变量CONTENT="mText"，在WebSendMessage()时，一起提交到OfficeServer中，可用于实现全文检索功能，对WORD的TEXT内容进行检索
    if (webform.WebOffice.WebSendMessage()){                    //交互OfficeServer的OPTION="SENDMESSAGE"
      alert("导出文本成功");
    }
    StatusMsg(webform.WebOffice.Status);
}


//作用：获取文档页数
function WebDocumentPageCount(){
    if (webform.WebOffice.FileType==".doc"){
	var intPageTotal = webform.WebOffice.WebObject.Application.ActiveDocument.BuiltInDocumentProperties(14);
	alert("文档页总数："+intPageTotal);
    }
    if (webform.WebOffice.FileType==".wps"){
	var intPageTotal = webform.WebOffice.WebObject.PagesCount();
	alert("文档页总数："+intPageTotal);
    }
}

//作用：签章锁定文件功能
function WebSignatureAtReadonly(){
  webform.WebOffice.WebSetProtect(false,"");                  //解除文档保护
  webform.WebOffice.WebSetRevision(false,false,false,false);  //设置文档痕迹保留的状态  参数1:不显示痕迹  参数2:不保留痕迹  参数3:不打印时有痕迹  参数4:不显痕迹处理工具
  try{
    webform.WebOffice.WebOpenSignature();                     //交互OfficeServer的 A签章列表OPTION="LOADMARKLIST"    B签章调出OPTION="LOADMARKIMAGE"    C确定签章OPTION="SAVESIGNATURE"    <参考技术文档>    文档中要定义标签Manager，可以自行修改标签名称
    StatusMsg(webform.WebOffice.Status);
  }catch(e){}
  webform.WebOffice.WebSetProtect(true,"");                   //锁定文档
}

</script>
</head>
<body bgcolor="#ffffff" onload="Load()" onunload="UnLoad()">  <!--引导和退出iWebOffice-->
  <form name="webform" method="post" action="DocumentSave.jsp" onsubmit="return SaveDocument();">  <!--保存iWebOffice后提交表单信息-->
    <input type="hidden" name="RecordID" value="<%=mRecordID%>">
    <input type="hidden" name="Template" value="<%=mTemplate%>">
    <input type="hidden" name="FileType" value="<%=mFileType%>">
    <input type="hidden" name="EditType" value="<%=mEditType%>">
    <input type="hidden" name="HTMLPath" value="<%=mHTMLPath%>">
    <table border=0  cellspacing='0' cellpadding='0' width=100% height=100% align=center class="TBStyle">
      <tr>
        <td align="right" class="TDTitleStyle" width=64>主题</td>
        <td class="TDStyle"><input type="text" name="Subject" value="<%=mSubject%>" class="IptStyle" onblur="SetBookmarks('Caption',this.value);" style="WIDTH:50%"><span color="blue">|选择"Word公文模板"，输入"主题"内容，光标移开，WORD内容自动修改</span></td>
      </tr>
      <tr>
        <td align=right class="TDTitleStyle" width=64>作者</td>
        <td class="TDStyle"><input type="text" name="Author" value="<%=mAuthor%>" class="IptStyle" ></td>
      </tr>
      <tr>
        <td align=right class="TDTitleStyle" width=64>时间</td>
        <td class="TDStyle"><input type="text" name="FileDate" value="<%=FormatDate(mFileDate,"yyyy-MM-dd")%>" readonly class="IptStyle" ></td>
      </tr>
      <tr>
        <!--td align=right valign=top  class="TDTitleStyle" width=64>内容</td-->
        <td align=right valign=top  class="TDTitleStyle" width=79 hegith=90% >
	   <b>HTML按钮</b><br><font color="red"><b>功能列表</b></font>
           <input type=button class=button value="文字批注" onclick='webform.WebOffice.ShowType=1;'>
           <input type=button class=button value="手写批注" onclick='webform.WebOffice.ShowType=2;'>
           <input type=button class=button value="文档核稿" onclick='webform.WebOffice.ShowType=0;'>
           <input type=button class=button value="新建文件" onclick='webform.WebOffice.CreateFile();'>
           <input type=button class=button value="重新批注" onclick='webform.WebOffice.ReWrite();'>
           <input type=button class=button value="全屏显示" onclick='webform.WebOffice.FullSize();'>
           <input type=button class=button value="关闭工具栏" onclick="webform.WebOffice.ShowToolBar=0">
           <input type=button class=button value="打开工具栏" onclick="webform.WebOffice.ShowToolBar=1">
           <input type=button class=button value="禁止打开文件" onclick="webform.WebOffice.DisableTools('打开文件',true)">  <!--true禁止,false启用-->
           <input type=button class=button value="隐藏新建文件" onclick="webform.WebOffice.VisibleTools('新建文件',false)"> <!--true显示,false隐藏-->
           <input type=button class=button value="隐藏全屏" onclick="webform.WebOffice.VisibleTools('全屏',false)"> <!--true显示,false隐藏-->
           <input type=button class=button value="显示全屏" onclick="webform.WebOffice.VisibleTools('全屏',true)"> <!--true显示,false隐藏-->
           <input type=button class=button value="显示版本" onclick="alert('当前控件版本为：'+webform.WebOffice.VersionEx()+webform.WebOffice.Version());">
		<font color="red"><b>普通功能</b></font>
           <input type=button class=button value="显示痕迹" <%=mDisabled%> <%=mWord%> onclick="ShowRevision(true)">
           <input type=button class=button value="隐藏痕迹" <%=mDisabled%> <%=mWord%> onclick="ShowRevision(false)">
           <input type=button class=button value="获取痕迹" <%=mDisabled%> <%=mWord%> onclick="WebGetRevisions()">
           <input type=button class=button value="清除痕迹" <%=mDisabled%> <%=mWord%> onclick="webform.WebOffice.WebObject.Application.ActiveDocument.AcceptAllRevisions();">
           <input type=button class=button value="保护文档" <%=mDisabled%> onclick="WebProtect(true)">
           <input type=button class=button value="解除保护" <%=mDisabled%> onclick="WebProtect(false)">
           <input type=button class=button value="允许拷贝" <%=mDisabled%> onclick="WebEnableCopy(true)">
           <input type=button class=button value="禁止拷贝" <%=mDisabled%> onclick="WebEnableCopy(false)">
           <input type=button class=button value="页面设置" <%=mDisabled%> <%=mWord%> onclick="WebOpenPageSetup()">
           <input type=button class=button value="打印文档" <%=mDisabled%> <%=mWord%> onclick="WebOpenPrint()">
           <input type=button class=button value="插入图片" <%=mDisabled%> <%=mWord%> onclick="WebOpenPicture()">
           <input type=button class=button value="重调文档" <%=mDisabled%> <%=mWord%> onclick="LoadDocument()">
           <input type=button class=button value="刷新文档" <%=mDisabled%> <%=mWord%> onclick="WebReFresh()">
           <input type=button class=button value="打开本地文件" <%=mDisabled%> onclick="WebOpenLocal()">
           <input type=button class=button value="存为本地文件" <%=mDisabled%> onclick="WebSaveLocal()">

		<font color="red"><b>与服务器交互</b></font>
           <input type=button class=button value="签名印章" <%=mDisabled%> onclick="WebOpenSignature()">
           <input type=button class=button value="验证签章[A]" <%=mDisabled%>  onclick="WebShowSignature()">
           <input type=button class=button value="验证签章[B]" <%=mDisabled%>  onclick="WebCheckSignature()">
           <input type=button class=button value="打开标签" <%=mDisabled%>  <%=mWord%>  onclick="WebOpenBookMarks()">
           <input type=button class=button value="填充模版" <%=mDisabled%>  <%=mWord%>  onclick="LoadBookmarks()">
           <input type=button class=button value="保存版本" <%=mDisabled%>  onclick="WebSaveVersion()">
           <input type=button class=button value="打开版本" <%=mDisabled%>  onclick="WebOpenVersion()">
           <input type=button class=button value="保存当前版本" <%=mDisabled%>  onclick="WebSaveVersionByFileID()">
           <input type=button class=button value="保存定稿版本" <%=mDisabled%>  onclick="WebUpdateFile()">
           <input type=button class=button value="存为HTML" <%=mDisabled%>  onclick="WebSaveAsHtml()">
           <input type=button class=button value="存为HTML图片" <%=mDisabled%>  <%=mWord%>  onclick="WebSaveAsPage()">
           <input type=button class=button value="套用模版定稿" <%=mDisabled%>  <%=mWord%> onclick="WebInsertFile()">
           <input type=button class=button value="VBA套红定稿" <%=mDisabled%>  <%=mWord%>  onclick="WebInsertVBA();">
           <input type=button class=button value="打印控制管理" <%=mDisabled%> <%=mWord%>  onClick="WebCopysCtrlPrint()">
           <input type=button class=button value="导入数据内容" <%=mDisabled%>  <%=mWord%>  onclick="WebInportText();">
           <input type=button class=button value="导出文档内容" <%=mDisabled%>  <%=mWord%>  onclick="WebExportText();">
           <input type=button class=button value="插入远程表格" <%=mDisabled%>  <%=mWord%>  onclick="WebSetWordTable()">
           <input type=button class=button value="插入远程图片" <%=mDisabled%>  <%=mWord%>  onclick="WebInsertImage()">
           <input type=button class=button value="下载服务器文件" <%=mDisabled%> <%=mWord%> onclick="WebGetFile()">
           <input type=button class=button value="上传文件到服务器" <%=mDisabled%> <%=mWord%> onclick="WebPutFile()">
           <input type=button class=button value="打开远程文件"  <%=mDisabled%> <%=mWord%>  onclick="WebDownLoadFile()">
           <input type=button class=button value="设置本地时间"  <%=mDisabled%>  onclick="WebDateTime()">

                <font color="red"><b>VBA调用</b></font>
           <input type=button class=button value="取Word内容" <%=mDisabled%>  <%=mWord%>  onclick="WebGetWordContent()">
           <input type=button class=button value="写Word内容" <%=mDisabled%>  <%=mWord%>  onclick="WebSetWordContent()">
           <input type=button class=button value="WORD禁止拖动" <%=mDisabled%> <%=mWord%> onclick="webform.WebOffice.WebObject.Application.Options.AllowDragAndDrop=false;">  <!--false禁止拖动  true允许拖动-->
           <input type=button class=button value="打印黑白" <%=mDisabled%> <%=mWord%> onclick="WebWordPrintBlackAndWhile();">
           <input type=button class=button value="插入页眉" <%=mDisabled%> <%=mWord%> onclick="webform.WebOffice.WebObject.ActiveWindow.ActivePane.View.SeekView=9;">
           <input type=button class=button value="插入页码" <%=mDisabled%> <%=mWord%> onclick="webform.WebOffice.WebObject.Application.Dialogs(294).Show();">
           <input type=button class=button value="用Excel求和" <%=mDisabled%>  <%=mExcel%> onclick="WebGetExcelContent()">
           <input type=button class=button value="锁定工作表" <%=mDisabled%>   <%=mExcel%> onclick="WebSheetsLock()">
           <input type=button class=button value="EXCEL禁止拖动" <%=mDisabled%> <%=mExcel%> onclick="webform.WebOffice.WebObject.Application.CellDragAndDrop=false;">  <!--false禁止拖动  true允许拖动-->
           <input type=button class=button value="文档页数" <%=mDisabled%>  <%=mWord%>  onclick="WebDocumentPageCount()">

		<font color="red"><b>工具栏</b></font>
           <input type=button class=button value="关闭常用工具" <%=mDisabled%>  onclick="WebToolsVisible('Standard',false)">
           <input type=button class=button value="打开常用工具" <%=mDisabled%>  onclick="WebToolsVisible('Standard',true)">
           <input type=button class=button value="关闭格式工具" <%=mDisabled%>  onclick="WebToolsVisible('Formatting',false)">
           <input type=button class=button value="打开格式工具" <%=mDisabled%>  onclick="WebToolsVisible('Formatting',true)">
           <input type=button class=button value="关闭打印按钮" <%=mDisabled%>  onclick="WebToolsEnable('Standard',2521,false);">
           <input type=button class=button value="打开打印按钮" <%=mDisabled%>  onclick="WebToolsEnable('Standard',2521,true);">
           <input type=button class=button value="关闭文档" <%=mDisabled%>  onclick="webform.WebOffice.WebClose();">

                <font color="red"><b>其他调用</b></font>
           <input type=button class=button value="签章锁定文件" <%=mDisabled%>  onclick="WebSignatureAtReadonly();">
        </td>
        <td class="TDStyle" height=90%>
           <table border=0 cellspacing='0' cellpadding='0' width='100%' height='100%' >
             <tr>
                <td bgcolor=menu>
                  <!--调用iWebOffice，注意版本号，可用于升级-->
                  <script src="iWebOffice2006.js"></script>
                </td>
             </tr>
             <tr>
                <td bgcolor=menu height='20'><div id=StatusBar>状态栏</div></td>
             </tr>
           </table>
        </td>
      </tr>
    </table>
    <input type=submit value="  保存  " <%=mDisabledSave%> >
    <input type=button value="  返回  " onclick="history.back()"> 注意：只有选择《保存》后，所做的操作才有效！
  </form>
</body>
</html>
