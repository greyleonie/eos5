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
    
    // �����ļ�ϵͳ����ȡϵͳ��ʱ�ļ�Ŀ¼
    var objFs = new ActiveXObject('Scripting.FileSystemObject');
    //var strTempPath = objFs.GetSpecialFolder(2);
    
    // �����ʱ�ļ�Ŀ¼���ϴ��ļ����ƣ���ȡҪ�ϴ��ļ�������·������
    //var strTempFile = strTempPath + '\\' + upload_filename;
    
    // ����XML�������XML�ĵ�����
    var xml_dom = new ActiveXObject("msxml2.domdocument");
    xml_dom.loadXML("<?xml version=\"1.0\" ?> <root/>");
    
    // ����ADODB.Stream����
    var ado_stream = new ActiveXObject("adodb.stream");
    // ��������������Ϊ����������
    ado_stream.Type = 1; // adTypeBinary
    // ��ADODB.Stream����
    ado_stream.Open();
    // �������ļ�װ�ص�ADODB.Stream������
    ado_stream.LoadFromFile("c:\\ScanImage\\" + upload_filename);
    // ��ȡ�ļ���С�����ֽ�Ϊ��λ��
    var byte_size = ado_stream.Size;
    // �������ݴ��䵥Ԫ��СΪ1KB
    var byte_unit = 1024;
    // ��ȡ�ļ��ָ����ݵ�Ԫ������
    var read_count = parseInt((byte_size/byte_unit).toString())+parseInt(((byte_size%byte_unit)==0)?0:1);
    
    // ����XMLԪ�ؽڵ㣬��������ID
    var node = xml_dom.createElement("processInstID");
    node.text = '<%=processInstID%>';
    xml_dom.documentElement.appendChild(node);
    
    // ����XMLԪ�ؽڵ㣬��������ID
    var node = xml_dom.createElement("archiveID");
    node.text = '<%=archiveID%>';
    xml_dom.documentElement.appendChild(node);
    
    // ����XMLԪ�ؽڵ㣬�����ϴ��ļ�����
    var node = xml_dom.createElement("uploadfilename");
    node.text = upload_filename.toString();
    xml_dom.documentElement.appendChild(node);
    
    // ����XMLԪ�ؽڵ㣬�����ϴ��ļ�·��
    var node = xml_dom.createElement("uploadfilepath");
    node.text = upload_filepath.toString();
    xml_dom.documentElement.appendChild(node);
    
    // ����XMLԪ�ؽڵ㣬�����ϴ��ļ���С
    var node = xml_dom.createElement("uploadfilesize");
    node.text = byte_size.toString();
    xml_dom.documentElement.appendChild(node);
    
    // ����XMLԪ�ؽڵ㣬�����ϴ��ļ�����
    for(var i=0;i<read_count;i++)
    {
        var node = xml_dom.createElement("uploadcontent");
        // �ļ����ݱ��뷽ʽΪBase64
        node.dataType = "bin.base64";
        // �жϵ�ǰ��������ݽڵ��С�������������з������
        if((parseInt(byte_size%byte_unit)!=0)&&(i==parseInt(read_count-1)))
        {
            // �����ݰ���С�������ݵ�Ԫ��������ʱ����ȡ���ʣ���С�����ݵ�Ԫ����������
            node.nodeTypedValue = ado_stream.Read();
        }
        else
        {
            // ��ȡһ���������ݵ�Ԫ������
            node.nodeTypedValue = ado_stream.Read(byte_unit);
        }
        xml_dom.documentElement.appendChild(node);
    }
    
    // �ر�ADODB.Stream����
    ado_stream.Close();
    
    // ����Microsoft.XMLHTTP����
    var xmlhttp = new ActiveXObject("microsoft.xmlhttp");
    // ��Microsoft.XMLHTP����
    xmlhttp.open("post",upload_target_url,false);
    // ʹ��Microsoft.XMLHTP�����ϴ��ļ�
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