<display:tabHead topSpace="20" contentWidth="90%"/>
<display:detailHead lineClass=""/>
<table width="100%" border="0" cellpadding="2"  cellspacing="0" bgcolor="#F7F6F6" bordercolor="#B6B5B5"  class="gridtable">

<tr>
<tr>
<td width="100%" colspan="4">
<html:hidden property="id" />
<html:hidden property="name" />
<html:hidden property="type" />
<input type="hidden" name="tab" value="2">
</td>
</tr>

  
  <tr class="add_title" >
     <td colspan="4">�����������Ϣ�� </td>
  </tr>  

  <tr>
     <td class="detailLabelTD" colspan="1" width="15%">
     	����������
     </td>
     <td class="detailFieldTD" colspan="1" width="12%">
     	<dict:write businTypeId="WFDICT_ParticipantType" property="WFProcessDefine/Activity/participantType" />
     </td>


  <logic:equal  property="WFProcessDefine/Activity/participantType" value="organization">
<td class="detailFieldTD" colspan="2" width="73%">
<script>
var isAppoint='<bean:write property="WFProcessDefine/Activity/isAllowAppointParticipants"/>';
if(isAppoint=='true'){
document.write("<input name=\"isAppoint\" type=\"checkbox\" checked disabled>");
}else{
document.write("<input name=\"isAppoint\" type=\"checkbox\" disabled>");
}
</script>
�Ƿ�����ǰ����������²������б�ָ�ɸû�Ĳ�����
</td>
</tr>
  <tr class="add_content" >
      <td align="center" class="detailLabelTD" colspan="1" width="15%">
      	�������б�
      </td>
      
      <td class="" colspan="3" width="100%">
      
      	    <table width="100%" border="1" cellpadding="2"  cellspacing="0" bgcolor="#F7F6F6" bordercolor="#B6B5B5" >
		      <tr>
		        <td align="center" width="30%" height="16">����</td>
		        <td align="center" width="40%" height="16">����</td>
		        <td align="center" width="30%" height="16">ID</td>
		      </tr>
		      
		      <logic:iterate id="listResult" property="WFProcessDefine/Activity/participantList">
	
		      <tr nowrap="true">
		        <logic:equal id="listResult" property="row/type" value="person">
		        	<td align="center">����</td>
		        </logic:equal>
		      <logic:equal id="listResult" property="row/type" value="role">
		        	<td align="center">��ɫ</td>
		      </logic:equal>
		      <logic:equal id="listResult" property="row/type" value="organization">
		        	<td align="center">����</td>
		      </logic:equal>
		      <logic:equal id="listResult" property="row/type" value="position_list">
		        	<td align="center">��λ�б�</td>
		      </logic:equal>
		        <td align="center" nowrap="true">
		      		<bean:write id="listResult" property="row/name"/>
		      	</td> 
		        <td align="center" nowrap="true">
		        <%
//		        	Document doc = EOSWebUtil.findRequestDom(request);
//					String participantType = null;
//					String roleID = null;
//					String orgID = null;
//					String type = null;
//					String id = null;
//					Document dom = null;
//					String result = null;
//					try {
//					    type = XML.getNodeValue(doc.getDocumentElement(),"data/WFProcessDefine/Activity/participantList/row/type");
//						id = XML.getNodeValue(doc.getDocumentElement(),"data/WFProcessDefine/Activity/participantList/row/id");
//					} catch (XMLException e) {
//						e.printStackTrace();
//					}
//					//http://lz.campus.sohu.com/lianzai/lzr-22242-300928-1141800799.html
//					if(type!=null&&"position_list".equals(type)){
//						try {
//						System.out.println(id);
//							dom = XML.parseString(id);
//						} catch (XMLException e) {
//							e.printStackTrace();
//						}
//						Element elm = dom.getDocumentElement();
//						participantType = elm.getAttribute("type");
//						NodeList list = elm.getChildNodes();
//						for(int i = 0;i<list.getLength();i++){
//							Node tmp = list.item(i);
//							String tmpName = tmp.getNodeName();
//							String tmpValue = XML.getNodeValue(tmp);
//							if(tmpName.equals("roleID")) roleID = tmpValue;
//							if(tmpName.equals("orgID")) orgID = tmpValue;
//						}
//						result = participantType +"{org="+orgID+",role="+roleID+"}";
//						out.println(result);
//					}else out.println(id);
		         %>
		         <script language="JavaScript">
		            /**
					  *��xml���ҵ���<���͡�>�����滻Ϊ��&gt����&lt��
					  */
						function transformSymbol(str){
							var	ret = str.replace(/\>/g,"&gt;").replace(/\</g,"&lt;");
							//		alert("ret: "+ret);
							return ret;
						}
					
					/**
					  *��xml���ҵ���&gt����&lt�����滻Ϊ��<���͡�>��
					  */
						function transformToSymbol(str){
							var ret = str.replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&quot;/g,"'");
							return ret;
						}
						var type = '<bean:write id="listResult" property="row/type"/>';
						var id = '<bean:write id="listResult" property="row/id"/>';
						if(type=="position_list"){
						var ret ="";
						  var xmlDoc = new ActiveXObject("Microsoft.XMLDOM") ;
							// xsl�ĵ�������ʾxml����
						  xmlDoc.async = false ;
						  xmlDoc.loadXML(transformToSymbol(id)) ;
						  if (xmlDoc.parseError.errorCode != 0) {
							 var myErr = xmlDoc.parseError;
							 alert("You have error " + myErr.reason);
						  } else{
						  	 var roleID = xmlDoc.getElementsByTagName("roleID").item(0).text;
						  	 var orgID = xmlDoc.getElementsByTagName("orgID").item(0).text;
						  	 ret = "OR{orgID=" + orgID +",roleID="+ roleID + "}";
							}
							
						document.write(ret);
						}else document.write(id);

		         </script>
		         </td>
		      </tr>
			</logic:iterate>
	    </table> 		      

     </td>
    </tr>
    </logic:equal>
  
    <logic:equal  property="WFProcessDefine/Activity/participantType" value="act-executer">
    <tr>
     <td class="detailLabelTD" colspan="1" width="25%">
     	�ӻ�ж�ȡ
     </td>
     <td class="detailFieldTD" colspan="3" width="75%">
     	<bean:write property="WFProcessDefine/Activity/specialActivityID"/>
     </td>
    </tr>  
    </logic:equal>
  
    <logic:equal  property="WFProcessDefine/Activity/participantType" value="relevantdata">  
    <tr>
     <td class="detailLabelTD" colspan="1" width="25%">
     	�ӻ�������ݻ�ȡ
     </td>
     <td class="detailFieldTD" colspan="3" width="75%">
     	<bean:write property="WFProcessDefine/Activity/specialPath"/>
     </td>
    </tr>  
    </logic:equal>
  
    <logic:equal  property="WFProcessDefine/Activity/participantType" value="rulelogic">  
    <tr id="part_4">
     <td class="detailLabelTD" colspan="1" width="25%">
     	�ӹ����߼���ȡ
     </td>
     <td class="detailFieldTD" colspan="3" width="75%">
     	<bean:write property="WFProcessDefine/Activity/regularApp"/>
     </td>
  </tr>
  </logic:equal>
  
</table>

<table width="100%" height="40">
  <tr >
    <td align="right">
        <input type="button" class="button" value = "�޸Ļ����" onclick="javascript:goURL('WFDEFMGR.pr_automata.WFDEFMGR_P_ModifyActyDef.do?processDefID=<bean:write property="processDefID"/>&activityDefID=<bean:write property="activityDefID"/>&activityType=<bean:write property="activityType"/>&tab=2');">         
    </td>    
  </tr>   
</table> 

<display:detailTail/>
<display:tabTail buttomSpace="20"/>