<%@include file="/internet/common.jsp"%>
<body>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="24" background="/internet/image/lz_bg.gif"> 
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" id="printTable">
          <tr> 
            <td width="15"> </td>
            <td class="text_wirte">��ҳ��&gt;�칫ϵͳ��&gt;��������&gt;�����ļ���<span id="subtitle"></span></td>
          </tr>
        </table></td>
    </tr>
</table>
<table width="100%" height="95%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td width="22%" height="100%">
<iframe src="oa.prFolder.folderTree.do" name="leftframe2" frameborder="0" width="100%" height="100%"></iframe>
</td>
<td width="78%" height="100%">
<iframe src="oa.prFolder.folderList.do?ShareFolder/ParentFileID/criteria/value=1&ShareFolder/ParentFileName/criteria/value=У�ڹ������Ϲ���" name="mainframe2" frameborder="0" width="100%" height="100%"></iframe>
</td>
</tr>
</table>

</body>