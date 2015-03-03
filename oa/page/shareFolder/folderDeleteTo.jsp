<%@include file="/internet/common.jsp"%>
<script>
var id = '<bean:write property="ShareFolder/FileID"/>';
var pname = '<bean:write property="ShareFolder/FileName"/>';
//location.replace('oa.prFolder.folderList.do?ShareFolder/ParentFileID/criteria/value='+id);
//window.location.href = window.location.href;
window.location.href = 'oa.prFolder.folderList.do?ShareFolder/ParentFileID/criteria/value='+ id + '&ShareFolder/ParentFileName/criteria/value=' + pname;             
window.parent.leftframe2.location.reload();

</script>