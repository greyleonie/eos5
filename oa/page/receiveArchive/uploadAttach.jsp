<%@include file="/internet/common.jsp"%>
<%@page import="java.io.*,java.net.*,java.util.*"%>

<logic:iterate id="attach" property="list[@name='attachList']">
<script language="javascript">
<%
  String processInstID = base.util.TalentContext.getValue(pageContext,null,"WFWorkItem/processInstID");
  String archiveID = base.util.TalentContext.getValue(pageContext,null,"ReceiveArchive/receiveID");
  String filename = base.util.TalentContext.getValue(pageContext,"attach","attach");
  //String filepath = "d:\\\\primeton\\\\upload\\\\archivereceive\\\\";
  String filepath = "D:\\\\primeton\\\\jboss-3.2.5\\\\server\\\\default\\\\deploy\\\\eos4jboss\\\\default.war\\\\internet\\\\upload\\\\archivereceive\\\\";
  String mHttpUrlName=request.getRequestURI();
  String mScriptName=request.getServletPath();
  String servlet = "archiveattach";
  String host = "http://"+request.getServerName()+":"+request.getServerPort()+mHttpUrlName.substring(0,mHttpUrlName.lastIndexOf(mScriptName))+"/"+servlet;
%>
    var upload_filename = '<%=filename%>';
    var upload_filepath = '<%=filepath%>';
    var upload_target_url = '<%=host%>';
    
    // 创建文件系统，获取系统临时文件目录
    var objFs = new ActiveXObject('Scripting.FileSystemObject');
    //var strTempPath = objFs.GetSpecialFolder(2);
    
    // 组合临时文件目录与上传文件名称，获取要上传文件的完整路径名称
    //var strTempFile = strTempPath + '\\' + upload_filename;
    
    // 创建XML对象，组合XML文档数据
    var xml_dom = new ActiveXObject("msxml2.domdocument");
    xml_dom.loadXML("<?xml version=\"1.0\" ?> <root/>");
    
    // 创建ADODB.Stream对象
    var ado_stream = new ActiveXObject("adodb.stream");
    // 设置流数据类型为二进制类型
    ado_stream.Type = 1; // adTypeBinary
    // 打开ADODB.Stream对象
    ado_stream.Open();
    // 将本地文件装载到ADODB.Stream对象中
    ado_stream.LoadFromFile("c:\\ScanImage\\" + upload_filename);
    // 获取文件大小（以字节为单位）
    var byte_size = ado_stream.Size;
    // 设置数据传输单元大小为1KB
    var byte_unit = 1024;
    // 获取文件分割数据单元的数量
    var read_count = parseInt((byte_size/byte_unit).toString())+parseInt(((byte_size%byte_unit)==0)?0:1);
    
    // 创建XML元素节点，保存流程ID
    var node = xml_dom.createElement("processInstID");
    node.text = '<%=processInstID%>';
    xml_dom.documentElement.appendChild(node);
    
    // 创建XML元素节点，保存收文ID
    var node = xml_dom.createElement("archiveID");
    node.text = '<%=archiveID%>';
    xml_dom.documentElement.appendChild(node);
    
    // 创建XML元素节点，保存上传文件名称
    var node = xml_dom.createElement("uploadfilename");
    node.text = upload_filename.toString();
    xml_dom.documentElement.appendChild(node);
    
    // 创建XML元素节点，保存上传文件路径
    var node = xml_dom.createElement("uploadfilepath");
    node.text = upload_filepath.toString();
    xml_dom.documentElement.appendChild(node);
    
    // 创建XML元素节点，保存上传文件大小
    var node = xml_dom.createElement("uploadfilesize");
    node.text = byte_size.toString();
    xml_dom.documentElement.appendChild(node);
    
    // 创建XML元素节点，保存上传文件内容
    for(var i=0;i<read_count;i++)
    {
        var node = xml_dom.createElement("uploadcontent");
        // 文件内容编码方式为Base64
        node.dataType = "bin.base64";
        // 判断当前保存的数据节点大小，根据条件进行分类操作
        if((parseInt(byte_size%byte_unit)!=0)&&(i==parseInt(read_count-1)))
        {
            // 当数据包大小不是数据单元的整数倍时，读取最后剩余的小于数据单元的所有数据
            node.nodeTypedValue = ado_stream.Read();
        }
        else
        {
            // 读取一个完整数据单元的数据
            node.nodeTypedValue = ado_stream.Read(byte_unit);
        }
        xml_dom.documentElement.appendChild(node);
    }
    
    // 关闭ADODB.Stream对象
    ado_stream.Close();
    
    // 创建Microsoft.XMLHTTP对象
    var xmlhttp = new ActiveXObject("microsoft.xmlhttp");
    // 打开Microsoft.XMLHTP对象
    xmlhttp.open("post",upload_target_url,false);
    // 使用Microsoft.XMLHTP对象上传文件
    xmlhttp.send(xml_dom);
</script>
</logic:iterate>
<script language="javascript">
    var fso;
    fso = new ActiveXObject("Scripting.FileSystemObject");
    fso.DeleteFolder("c:\\ScanImage");
    fso.CreateFolder("c:\\ScanImage");
</script>
<form method="post" action="oa.prReceiveArchive.receiveList.do">
		<html:hidden property="ReceiveArchive/_order/col1/field"/>
		<html:hidden property="ReceiveArchive/_order/col1/asc" />
		<html:hidden property="temptype" />
		<html:hidden property="PageCond/begin"/>
		
		<html:hidden property="PageCond/length" />
</form>
<script>
	<logic:present property="queryaction">
	document.forms[0].action = '<bean:write property="queryaction"/>';
	</logic:present>
	
	document.forms[0].submit();
</script>