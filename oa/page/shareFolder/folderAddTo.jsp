<%@include file="/internet/common.jsp"%>
<script>

//window.parent.opener.parent.leftframe2.location.href = window.parent.opener.parent.leftframe2.location.href;
//window.parent.opener.location.href = window.parent.opener.location.href;

//window.parent.opener.location.reload();
var id = '<bean:write property="ShareFolder/FileID"/>';
var pname = '<bean:write property="ShareFolder/FileName"/>';
window.parent.opener.location.href = 'oa.prFolder.folderList.do?ShareFolder/ParentFileID/criteria/value='+ id + '&ShareFolder/ParentFileName/criteria/value=' + pname;             
window.parent.opener.parent.leftframe2.location.reload();
window.parent.close();
</script>