<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/hci-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/hci-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/hci-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/hci-eos.tld" prefix="eos" %>
<%@ taglib uri="/WEB-INF/hci-dict.tld" prefix="dict" %>
<%@ taglib uri="/WEB-INF/hci-info.tld" prefix="info" %>
<%@ taglib uri="/WEB-INF/hci-pagecom.tld" prefix="pagecom" %>
<%@ taglib uri="/WEB-INF/workflow.tld" prefix="workflow" %>
<%@ taglib uri="/WEB-INF/hci-tree.tld" prefix="tree" %>
<%@ taglib uri="/WEB-INF/hci-richclient.tld" prefix="richclient" %>
<%@ taglib uri="/WEB-INF/hci-datacell.tld" prefix="datacell" %>
<%@ taglib uri="/WEB-INF/dxfcc.tld" prefix="fcc" %>
<%@ taglib uri="/WEB-INF/author.tld" prefix="qx" %>
<link href="/internet/css/INDEX.css" rel="stylesheet" type="text/css">
<link href="/internet/dtree/dtree.css" rel="stylesheet" type="text/css">
<script src="/internet/scripts/fcccalendar.js" language='javascript' type='text/javascript'></script>
<script src="/internet/scripts/fccnewtab.js" language='javascript' type='text/javascript'></script>
<script src="/internet/scripts/fcctab.js" language='javascript' type='text/javascript'></script>
<script src="/internet/scripts/fccpage.js" language='javascript' type='text/javascript'></script>
<script src="/internet/scripts/fccvalidator.js" language='javascript' type='text/javascript'></script>
<script src="/internet/scripts/fccsort.js" language='javascript' type='text/javascript'></script>
<script src="/internet/scripts/public.js" language='javascript' type='text/javascript'></script>
<script language='javascript' src='/internet/WFCOMMON/scripts/Graphic.js' type='text/javascript'></script>
<script src="/internet/dtree/dtree2.js" language='javascript' type='text/javascript'></script>
<table width="170"  border="0" cellspacing="0" cellpadding="0">

  <tr>
    
	<table width="80%" height="300"  border="0" align="center" cellpadding="0" cellspacing="0" onClick="menu3(this)">
      
	 
      <tr>
        
        
		<td class="menu31">
		<script type="text/javascript">
         
         folderTree = new dTree('folderTree');
		 
         folderTree.add(0,-2,'¹²ÏíÎÄ¼þ¼Ð','','','');
         
         <logic:iterate id="resultset" property="list[@type='shareFolder']" >
		 
           folderTree.add('<bean:write id="resultset" property="entity/FileID"/>','<bean:write id="resultset" property="entity/ParentFileID"/>','<bean:write id="resultset" property="entity/FileName"/>','oa.prFolder.folderList.do?ShareFolder/ParentFileID/criteria/value=<bean:write id="resultset" property="entity/FileID"/>&ShareFolder/ParentFileName/criteria/value=<bean:write id="resultset" property="entity/FileName"/>','','mainframe2');
		
         </logic:iterate>
         
         document.write(folderTree);

     </script>
		</td>
        
      </tr>
	  
     
	  
      
      <tr>
      <a href="javascript:void(0)" onClick="return false">
        <td height="260" colspan="2" > </td>
      </a>
      </tr>
    </table></td>
  </tr>

</table>