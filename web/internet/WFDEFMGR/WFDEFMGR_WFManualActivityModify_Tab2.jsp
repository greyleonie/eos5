<%@include file="/internet/common.jsp"%>
<style type="text/css">
<!--
.style5 {font-size: 12px}
-->
</style>
<display:tabHead topSpace="20" contentWidth="90%"/>
<table width="100%"  cellpadding="0"  cellspacing="0"  class="gridtable">  

<tr>
<td width="100%" colspan="5">
<html:hidden property="id" />
<html:hidden property="name" />
<html:hidden property="type" />
<input type="hidden" name="tab" value="2" class="null">
<td>
<tr>

  
  <tr> 
     <td colspan="5" width="100%">【活动参与者信息】 </td>
  </tr>  

  <tr>
     <td class="queryLabelTD" colspan="1" width="15%">
     	参与者类型
     </td>
     
     <td  colspan="1" width="20%">
     	<dict:select businTypeId="WFDICT_ParticipantType" property="WFProcessDefine/Activity/participantType" 
     	onchange="handleType(this.options[this.options.selectedIndex].value)"
     	/>
     </td>
	
<td id="part_appoint" colspan="3" width="65%" class="detailFieldTD">
<html:checkbox name="t1" property="WFProcessDefine/Activity/isAllowAppointParticipants" value="true" onclick="doCheck12(this);"/>
<html:hidden property="WFProcessDefine/Activity/isAllowAppointParticipants"/>
是否允许前驱活动根据如下参与者列表指派该活动的参与者
</span></td>
  </tr>
 

   
  <tr id="part_execute" style="display:none">
     <td class="queryLabelTD" colspan="1" width="20%">
     	从活动中读取
     </td>
     
     <td colspan="4" width="80%">
     	<html:text size="40" property="WFProcessDefine/Activity/specialActivityID"/>
     </td>

  </tr>      
  
  <tr id="part_relevant" style="display:none">
     <td class="queryLabelTD" colspan="1" width="20%">
     	从活相关数据获取
     </td>

     <td colspan="4" width="80%">
     	<html:text size="40" property="WFProcessDefine/Activity/specialPath"/>
     </td>
  </tr>     

  <tr id="part_logic" style="display:none">
     <td class="queryLabelTD" colspan="1" width="20%">
     	从规则逻辑获取
     </td>
     
     <td colspan="4" width="80%">
     	<html:text  size="40" property="WFProcessDefine/Activity/regularApp"/>
     </td>
  </tr>     


   <tr id="part_org">

   <td width="100%" colspan="5">
    <table width="100%" border="0" cellpadding="2"  cellspacing="0" bgcolor="#F7F6F6" bordercolor="#B6B5B5" class="gridtable">

		  <tr>
		      <td class="queryLabelTD" colspan="1" width="15%">
		      	参与者列表
		      </td>
	
		      <td colspan="1" width="85%">
		      	    <table width="100%" border="1" cellpadding="2"  cellspacing="0" bgcolor="#F7F6F6" bordercolor="#B6B5B5" class="gridtable">
		
				      <tr > 
				        <td align="center" width="30%" height="16">类型</td>
				        <td align="center" width="30%" height="16">名称</td>
				        <td align="center" width="30%" height="16">ID</td>
				        <td align="center" width="10%" height="16">操作</td>
				      </tr>
				      
				      <logic:iterate id="listResult" property="WFProcessDefine/Activity/participantList">
			
					  		<lgoic:notEqual  id="listResult" property="row/type" value="position_list">
					  		
				      <tr>
					        <logic:equal id="listResult" property="row/type" value="person">
					        	<td align="center" width="30%">个人</td>
					        </logic:equal>
					        <logic:equal id="listResult" property="row/type" value="role">
					        	<td align="center" width="30%">角色</td>
					        </logic:equal>
					        <logic:equal id="listResult" property="row/type" value="organization">
					        	<td align="center" width="30%">机构</td>
					        </logic:equal>
					        <logic:equal id="listResult" property="row/type" value="position_list">
					        	<td align="center">岗位列表</td>
					        </logic:equal>
					        <td align="center" width="30%">
					          <bean:write id="listResult" property="row/name"/>
					        </td> 
					        <td align="center" width="30%" nowrap="true">
					        <%
//					        	Document doc = EOSWebUtil.findRequestDom(request);
//								String participantType = null;
//								String roleID = null;
//								String orgID = null;
//								String type = null;
//								String id = null;
//								Document dom = null;
//								String result = null;
//								try {
//								    type = XML.getNodeValue(doc.getDocumentElement(),"data/WFProcessDefine/Activity/participantList/row/type");
//									id = XML.getNodeValue(doc.getDocumentElement(),"data/WFProcessDefine/Activity/participantList/row/id");
//								} catch (XMLException e) {
//									e.printStackTrace();
//								}
//								if(type!=null&&"position_list".equals(type)){
//									try {
//										dom = XML.parseString(id);
//									} catch (XMLException e) {
//										e.printStackTrace();
//									}
//									Element elm = dom.getDocumentElement();
//									participantType = elm.getAttribute("type");
//									NodeList list = elm.getChildNodes();
//									for(int i = 0;i<list.getLength();i++){
//										Node tmp = list.item(i);
//										String tmpName = tmp.getNodeName();
//										String tmpValue = XML.getNodeValue(tmp);
//										if(tmpName.equals("roleID")) roleID = tmpValue;
//										if(tmpName.equals("orgID")) orgID = tmpValue;
//									}
//									result = participantType +"{org="+orgID+",role="+roleID+"}";
//									out.println(result);
//								}else out.println(id);
					         %>
		         <script language="JavaScript">
		            /**
					  *从xml中找到“<”和“>”，替换为“&gt”“&lt”
					  */
						function transformSymbol(str){
							var	ret = str.replace(/\>/g,"&gt;").replace(/\</g,"&lt;");
							//		alert("ret: "+ret);
							return ret;
						}
					
					/**
					  *从xml中找到“&gt”“&lt”，替换为“<”和“>”
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
							// xsl文档对象，显示xml数据
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
					        <td align="center" width="10%">
					          <a href="javascript:doDeleteAction('<bean:write id="listResult" property="row/num"/>')">
					            <img border="0" src="/internet/WFCOMMON/images/button/delete-icon.jpg"  width="13" height="19" >
					          </a>
					        </td>
				      </tr>
					  </lgoic:notEqual>
					  		
					  		
					        
				     <logic:equal id="listResult" property="row/type" value="position_list">
				       	<script language="JavaScript">
					       	var id = <bean:write id="listResult" property="row/id"/>;
					       	document.write("need change");
			        	</script>
			        </logic:equal>
					  		
					  		
				      </logic:iterate>
			    </table>
	      
		      </td>
		  </tr>
		  
	
	  <tr>
		  <td width="100%" colspan="5">
		  
		  	  <table width="100%" height="40" border="0">
		   <tr> 
		    <td align="right" width="100%">
				<input type="button" class="button" value = "增加活动参与者" onclick="javascript:showParticipant();">
				<input type="button" class="button" value = "增加岗位列表" onclick="javascript:showPositionParticipant();" style="display:none">
		    </td>
		    </tr>
			<tr id="saveAppoint" sytle="display:none" align="right">
					      <td width="80%">
			      </td>
			      <td width="10%">
				<input type="button" class="button" value = "保存" onclick="javascript:save();">
			      </td>
			      <td width="10%">
				<input type="button" class="button" value = "取消" onclick="javascript:goURL('WFDEFMGR.pr_automata.WFDEFMGR_P_ShowActyDef.do?processDefID=<bean:write property="processDefID"/>&activityDefID=<bean:write property="activityDefID"/>&activityType=<bean:write property="activityType"/>');">
			      </td>    
			</tr>
		  </table>  
		  </td>
		  </tr>  
	
	
		   <tr id="row_participant" style="display:none">
		    <td align="left" colspan="5" width="100%">
	        <input type="text" name="nameText">
	        <input type="text" name="hiddenText" style="display:none">
			<input type="button" class="button" value = "选择" onclick="javascript:SelectOMParticipant();">
			<input type="button" class="button" value = "保存" onclick="javascript:participantsave();">
			<input type="button" class="button" value = "取消" onclick="javascript:participantcancel();">
		    </td>
		  </tr>
		
		   <tr id="row_positionparticipant" style="display:none">
		    <td align="left" colspan="5" width="100%">
		    机构变量路径<input type="text" name="nameOrgID"> +
	        <input type="text" name="nameText1" disabled value="请选择！"><input type="button" class="button" value = "选择角色" onclick="javascript:SelectOMParticipant1();">
	        <input type="text" name="hiddenText1" style="display:none">
			<input type="button" class="button" value = "保存" onclick="javascript:participantsave1();">
			<input type="button" class="button" value = "取消" onclick="javascript:participantcancel1();">
		    </td>
		  </tr>
    </table>
    </td>  
   </tr> 
      
  <tr id="row_save" style="display:none">
  <td colspan="5" width="100%">
  <table width="100%" height="40">
    <tr align="right">
      <td width="80%">
      </td>
    
      <td width="10%">
	<input type="button" class="button" value = "保存" onclick="javascript:save();">
      </td>
    
      <td width="10%">
	<input type="button" class="button" value = "取消" onclick="javascript:goURL('WFDEFMGR.pr_automata.WFDEFMGR_P_ShowActyDef.do?processDefID=<bean:write property="processDefID"/>&activityDefID=<bean:write property="activityDefID"/>&activityType=<bean:write property="activityType"/>');">
      </td>    
    </tr>
  </table> 
  </td>   
  </tr>          
</table>



<display:tabTail buttomSpace="20"/>

<script language="JavaScript">
<!--

function showPositionParticipant(){
	row_positionparticipant.style.display="";
	row_participant.style.display = "none";
	row_save.style.display="none";
	saveAppoint.style.display="none";
}

function SelectOMParticipant1(){
	openUrl = "<workflow:SelectOrgParticipant   rootType="ROLE"  rootID="" formName="ActyInfo" inputName="nameText1" hiddenName="hiddenText1" isSelPerson="false"  hiddenType="ID_TYPE_NAME"   buttonName="SelectOrgParticipant" genUrl="true" maxPatiNum="1"/>";
		//form name set directly
	window.showModalDialog(openUrl,ActyInfo,"dialogHeight:480px;dialogWidth:650px;center:yes");
}

function participantcancel1(){
	var frm = document.ActyInfo;
	frm.id.value='';
	frm.name.value='';
	frm.type.value='';
	frm.nameText.value='';
	frm.hiddenText.value='';
	saveAppoint.style.display="";
	row_participant.style.display = "none";
	row_positionparticipant.style.display = "none";
	row_save.style.display="none";
}

function participantsave1(){
	var frm = document.ActyInfo;
	var hiddenText = frm.hiddenText1.value;
	if (frm.hiddenText1.value!="")
	{
	  var xmlDoc = new ActiveXObject("Microsoft.XMLDOM") ;
		// xsl文档对象，显示xml数据
	  var str = transformToSymbol(hiddenText);
	  
	  xmlDoc.async = false ;
	  xmlDoc.loadXML(str) ;
	  if (xmlDoc.parseError.errorCode != 0) {
		 var myErr = xmlDoc.parseError;
		 alert("You have error " + myErr.reason);
	  } else{
	  	 var idNodeList = xmlDoc.getElementsByTagName("id");
	  	 var typeNodeList = xmlDoc.getElementsByTagName("type");
		 var nameNodeList = xmlDoc.getElementsByTagName("name");
		
		var orgID = frm.nameOrgID.value;
		var idXmlStr = '<Condition type="OR"><roleID>'+idNodeList.item(0).text+'</roleID><orgID>$'+orgID+'</orgID></Condition>';
		 frm.id.value=idXmlStr;
	  	 frm.type.value="position_list";
	  	 frm.name.value=" 机构$"+orgID+nameNodeList.item(0).text;
	  	 frm.action='WFDEFMGR.pr_automata.WFDEFMGR_P_SaveActyDef_Participant.do?command=insert&num=0';
	     frm.submit();
   	  }
	}
	else
	{
	  alert('请选择参与者');
	}
}

function SelectOMParticipant(){
	openUrl = "WFWEBCOMP.prExSelPerson.SelectOMParticipant.do?"+
		"rootType=ALL_PARTICIPANT"+
		"&rootID="+
		"&maxPartiNum=1"+
		"&isSelOrg=true"+
		"&isSelRole=true"+
		"&isSelPerson=true"+
		"&isSelPosition=true"+
		"&formName=ActyInfo"+
		"&inputName=nameText"+
		"&hiddenName=hiddenText"+
		"&hiddenType=ID_TYPE_NAME";
		//form name set directly
		window.showModalDialog(openUrl,ActyInfo,"dialogHeight:480px;dialogWidth:650px;center:yes");
}

function showParticipant()
{
	row_participant.style.display = "";
	row_positionparticipant.style.display="none";
	row_save.style.display="none";
	saveAppoint.style.display="none";
}

function participantsave()
{   var frm = document.ActyInfo;
	var hiddenText = frm.hiddenText.value;
	if (frm.hiddenText.value!="")
	{ 
	  var xmlDoc = new ActiveXObject("Microsoft.XMLDOM") ;
		// xsl文档对象，显示xml数据
	  var str = transformToSymbol(hiddenText);
	  
	  xmlDoc.async = false ;
	  xmlDoc.loadXML(str) ;
	  if (xmlDoc.parseError.errorCode != 0) {
		 var myErr = xmlDoc.parseError;
		 alert("You have error " + myErr.reason);
	  } else{
	  	 var idNodeList = xmlDoc.getElementsByTagName("id");
	  	 var typeNodeList = xmlDoc.getElementsByTagName("type");
		 var nameNodeList = xmlDoc.getElementsByTagName("name");
		
		 frm.id.value=idNodeList.item(0).text;
	  	 frm.type.value=typeNodeList.item(0).text;
	  	 frm.name.value=nameNodeList.item(0).text;
	  	 frm.action='WFDEFMGR.pr_automata.WFDEFMGR_P_SaveActyDef_Participant.do?command=insert&num=0';
	     frm.submit();
   	  }
	}
	else
	{
	  alert('请选择参与者');
	}
}

/**
  *从xml中找到“&gt”“&lt”，替换为“<”和“>”
  */
function transformToSymbol(str){
	var ret = str.replace(/&lt;/g,"<").replace(/&gt;/g,">").replace(/&quot;/g,"'");
	return ret;
}

function participantcancel()
{
	var frm = document.ActyInfo;
	frm.id.value='';
	frm.name.value='';
	frm.type.value='';
	frm.nameText.value='';
	frm.hiddenText.value='';
	saveAppoint.style.display="";
	row_participant.style.display = "none";
	row_positionparticipant.style.display = "none";
	row_save.style.display="none";
}

function doCheck12(checkObj){
saveAppoint.style.display="none";
//alert(row_participant.style.display);
	saveAppoint.style.display="none";
	if(row_participant.style.display=="none"){
		saveAppoint.style.display="";
	}else{
		saveAppoint.style.display="none";
	}
	if(checkObj.checked){
		document.ActyInfo.elements['WFProcessDefine/Activity/isAllowAppointParticipants'].value=true;
	}else{
		document.ActyInfo.elements['WFProcessDefine/Activity/isAllowAppointParticipants'].value=false;
	}
}


function doDeleteAction(num){
	if(confirm('确定要删除吗？')){
		if(document.ActyInfo.t1.checked){
			 window.location='WFDEFMGR.pr_automata.WFDEFMGR_P_SaveActyDef_Participant.do?WFProcessDefine/Activity/isAllowAppointParticipants=true&WFProcessDefine/Activity/participantType=organization&num='+num+'&command=delete&id=0&name=0&type=0&processDefID=<bean:write property="processDefID"/>&activityDefID=<bean:write property="activityDefID"/>&activityType=<bean:write property="activityType"/>&tab=2';
		}else{
			 window.location='WFDEFMGR.pr_automata.WFDEFMGR_P_SaveActyDef_Participant.do?WFProcessDefine/Activity/isAllowAppointParticipants=false&WFProcessDefine/Activity/participantType=organization&num='+num+'&command=delete&id=0&name=0&type=0&processDefID=<bean:write property="processDefID"/>&activityDefID=<bean:write property="activityDefID"/>&activityType=<bean:write property="activityType"/>&tab=2';
		}
	}
}
function MM_openBrWindow(theURL,winName,features) 
{ 
  window.open(theURL,winName,features);
}

	
function showPerson()
{
	row_person.style.display = "";
	row_role.style.display = "none";
	row_org.style.display = "none";
	row_save.style.display="none";
	saveAppoint.style.display="none";
}
function showRole()
{
	row_person.style.display = "none";
	row_role.style.display = "";
	row_org.style.display = "none";
	row_save.style.display="none";
saveAppoint.style.display="none";
}

function showOrg()
{
	row_person.style.display = "none";
	row_role.style.display = "none";
	row_org.style.display = "";
	row_save.style.display="none";
saveAppoint.style.display="none";
}

function personsave()
{
	var frm = document.ActyInfo;
	if (frm.selPerson.options.length>0)
	{
	  frm.id.value=frm.selPerson.options[0].value;
	  frm.name.value=frm.selPerson.options[0].text;
	  frm.type.value='person';
	  frm.action='WFDEFMGR.pr_automata.WFDEFMGR_P_SaveActyDef_Participant.do?command=insert&num=0';
	  frm.submit();
	}
	else
	{
	  alert('请选择参与者');
	}
}

function personcancel()
{
	var frm = document.ActyInfo;
	frm.id.value='';
	frm.name.value='';
	frm.type.value='';
	row_person.style.display = "none";
	row_role.style.display = "none";
	row_org.style.display = "none";
	row_save.style.display="";
}

function rolesave()
{
	var frm = document.ActyInfo;
	if (frm.selRole.options.length>0)
	{
	  frm.id.value=frm.selRole.options[0].value;
	  frm.name.value=frm.selRole.options[0].text;
	  frm.type.value='role';
	  frm.action='WFDEFMGR.pr_automata.WFDEFMGR_P_SaveActyDef_Participant.do?command=insert&num=0';
	  frm.submit();
	}
	else
	{
	  alert('请选择参与者');
	}
}

function rolecancel()
{
	var frm = document.ActyInfo;
	frm.id.value='';
	frm.name.value='';
	frm.type.value='';
	row_person.style.display = "none";
	row_role.style.display = "none";
	row_org.style.display = "none";
	row_save.style.display="";
}

function orgsave()
{
	var frm = document.ActyInfo;
	if (frm.selOrg.options.length>0)
	{
	  frm.id.value=frm.selOrg.options[0].value;
	  frm.name.value=frm.selOrg.options[0].text;
	  frm.type.value='organization';
	  frm.action='WFDEFMGR.pr_automata.WFDEFMGR_P_SaveActyDef_Participant.do?command=insert&num=0';
	  frm.submit();
	}
	else
	{
	  alert('请选择参与者');
	}
}

function orgcancel()
{
	var frm = document.ActyInfo;
	frm.id.value='';
	frm.name.value='';
	frm.type.value='';
	row_person.style.display = "none";
	row_role.style.display = "none";
	row_org.style.display = "none";
	row_save.style.display="";
}

function handleType(v) 
{
if (v=="organization")
{
part_execute.style.display="none";
part_relevant.style.display="none";
part_logic.style.display="none";
part_org.style.display="";
row_save.style.display="none";
part_appoint.style.display="";
saveAppoint.style.display="none";

}
else if (v=="process-starter")
{
part_execute.style.display="none";
part_relevant.style.display="none";
part_logic.style.display="none";
part_org.style.display="none";
row_save.style.display="";
part_appoint.style.display="none";
saveAppoint.style.display="none";
}
else if (v=="act-executer")
{
part_execute.style.display="";
part_relevant.style.display="none";
part_logic.style.display="none";
part_org.style.display="none";
row_save.style.display="";
part_appoint.style.display="none";
saveAppoint.style.display="none";
}
else if (v=="relevantdata")
{
part_execute.style.display="none";
part_relevant.style.display="";
part_logic.style.display="none";
part_org.style.display="none";
row_save.style.display="";
part_appoint.style.display="none";
saveAppoint.style.display="none";
}
else if (v=="rulelogic")
{
part_execute.style.display="none";
part_relevant.style.display="none";
part_logic.style.display="";
part_org.style.display="none";
row_save.style.display="";
part_appoint.style.display="none";
saveAppoint.style.display="none";
}
}
handleType(window.ActyInfo.elements['WFProcessDefine/Activity/participantType'].value);
//-->
</script>