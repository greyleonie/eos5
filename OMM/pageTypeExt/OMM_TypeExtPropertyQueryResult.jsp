<%@include file="/internet/common.jsp"%>
<SCRIPT language="JavaScript" src="/pageComponent/resources/scripts/checkBox.js"></SCRIPT>
<SCRIPT language="JavaScript" src="/pageComponent/resources/scripts/pagination.js"></SCRIPT>
<SCRIPT language="JavaScript" src="/pageComponent/resources/scripts/dataformcheck.js"></SCRIPT>
<link rel="stylesheet" href="/pageComponent/resources/theme/style.css" type="text/css">
<PG:DataGrid>
<%--自动生成代码，请不要手动修改
<?xml version="1.0" encoding="GB2312" standalone="no"?>
<wizardContent version="1.0">
    <content>
        <iteratorXpath value="list[@type='OMM_TypeExtProperty']" type="String"/>
        <updateAction value="OMM.prTypeExt.prOMM_TypeExtPropertyUpdate.do" type="String"/>
        <oddClass value="pg_result_content" type="String"/>
        <title value="查询结果" type="String"/>
        <insertTarget value="_self" type="String"/>
        <isPage value="true" type="Boolean"/>
        <insertAction value="forward.do?nextPage=/OMM/pageTypeExt/OMM_TypeExtPropertyInsert.jsp" type="String"/>
        <highLightClass value="onmouseover" type="String"/>
        <updateTarget value="_self" type="String"/>
        <deleteAction value="OMM.prTypeExt.prOMM_TypeExtPropertyDelete.do" type="String"/>
        <deleteTarget value="_top" type="String"/>
        <selectFieldStyle value="checkbox" type="String"/>
        <evenClass value="pg_result_content_" type="String"/>
        <pageAction value="OMM.prTypeExt.prOMM_TypeExtPropertyQuery.do" type="String"/>
        <selectFieldName value="TypeExtPropertyID" type="String"/>
        <formName value="form1" type="String"/>
    </content>
    <entity name="OMM_TypeExtProperty" id="entity">
        <field name="TypeExtPropertyID" dataType="integer" displayName="TypeExtPropertyID" length="10" isKey="true">
            <showType value="show"/>
            <fieldType value="int"/>
        </field>
        <field name="TypeID" dataType="integer" displayName="TypeID" length="10" isNullable="true">
            <showType value="show"/>
            <fieldType value="int"/>
        </field>
        <field name="ExtPropertyName" displayName="ExtPropertyName" length="100" isNullable="true">
            <showType value="show"/>
            <fieldType value="String"/>
        </field>
        <field name="ExtPropertyMode" dataType="integer" displayName="ExtPropertyMode" length="10" isNullable="true">
            <showType value="show"/>
            <fieldType value="int"/>
        </field>
        <field name="ExtPropertyOptions" displayName="ExtPropertyOptions" length="100" isNullable="true">
            <showType value="show"/>
            <fieldType value="String"/>
        </field>
    </entity>
</wizardContent>
 --%>
<form action="OMM.prTypeExt.prOMM_TypeExtPropertyQuery.do" name="form1" method="POST">
 <pagecom:hiddenData property="PageCond"/> 
		<pagecom:hiddenData property="OMM_TypeExtProperty"/>

	<TABLE width="80%" border="0" align="center" cellPadding="0" cellSpacing="0" class="pg_result">
		<TR>
			<TD class="pg_result_title" colspan="6">查询结果
			</TD>
		</TR>

		<TR class="pg_result_head">
		  <TD align="left">&nbsp;<logic:notEqual property="list[@type='OMM_TypeExtProperty']/@rowNum" value="0">
				<html:checkbox name="chkAll" onclick="checkAll('checkall')"/>
			   </logic:notEqual>选择</TD><TD>TypeExtPropertyID</TD><TD>TypeID</TD><TD>ExtPropertyName</TD><TD>ExtPropertyMode</TD><TD>ExtPropertyOptions</TD>		    	
		</TR>		            
		<logic:iterate id="ResultSet" property="list[@type='OMM_TypeExtProperty']">       
		
		<TR class="<pagecom:trclass oddClass='pg_result_content' evenClass='pg_result_content_'/>" onmouseover='this.className="onmouseover"' onmouseout='this.className="<pagecom:trclass oddClass="pg_result_content" evenClass="pg_result_content_" mapping="oddClass|oddClass,evenClass|evenClass"/>"'>
		
			<TD>
			<logic:present id="ResultSet" property="OMM_TypeExtProperty/TypeExtPropertyID">
			&nbsp;<html:checkbox styleId="checkall" name="list[@name='update']/OMM_TypeExtProperty/TypeExtPropertyID" id="ResultSet" property="OMM_TypeExtProperty/TypeExtPropertyID"  indexed="true" />
			</logic:present>
			</TD>						
				
			<TD>
			<bean:write id="ResultSet" property="OMM_TypeExtProperty/TypeExtPropertyID"/>
			</TD>
			
			<TD>
			<bean:write id="ResultSet" property="OMM_TypeExtProperty/TypeID"/>
			</TD>
			
			<TD>
			<bean:write id="ResultSet" property="OMM_TypeExtProperty/ExtPropertyName"/>
			</TD>
			
			<TD>
			<bean:write id="ResultSet" property="OMM_TypeExtProperty/ExtPropertyMode"/>
			</TD>
			
			<TD>
			<bean:write id="ResultSet" property="OMM_TypeExtProperty/ExtPropertyOptions"/>
			</TD>
													
		</TR>
		</logic:iterate>

		<TR>
			<TD colspan="6">
			<table width="100%"><tr class="pg_result_bottom">
		
			<td align="left">
				<div>						
		 <input type="button" value="增加" onclick="javascript:prepareInsert(document.form1, 'forward.do?nextPage=/OMM/pageTypeExt/OMM_TypeExtPropertyInsert.jsp','_self')"> 

		<logic:notEqual property="list[@type='OMM_TypeExtProperty']/@rowNum" value="0">
		 <input type="button" value="修改" onclick="javascript:prepareUpdateRow(document.form1, 'OMM.prTypeExt.prOMM_TypeExtPropertyUpdate.do', 'checkall','_self')">  
		 <input type="button" value="删除" onclick="javascript:deleteRows(document.form1, 'OMM.prTypeExt.prOMM_TypeExtPropertyDelete.do', 'checkall','_top')">  
		</logic:notEqual>
</div>
			</td>
<logic:notEqual property="list[@type='OMM_TypeExtProperty']/@rowNum" value="0">
			<td align="right">
		<div>
	<SCRIPT LANGUAGE="JavaScript">
	<!--						
		var myPage = new page();
		myPage.init("form1", "OMM.prTypeExt.prOMM_TypeExtPropertyQuery.do", "PageCond/begin", "PageCond/length", "PageCond/count");
		var currCount = <bean:write property="list[@type='OMM_TypeExtProperty']/@rowNum"/>;
		var htmltext = "";
		if (!myPage.noCount){
			htmltext += myPage.current + "页/"+myPage.total+"页";
			htmltext += " 共"+myPage.count + "条";
		}
		if(myPage.current>1){
			htmltext += "<input type=\"button\" value=\"首页\" onclick=\"myPage.firstPage()\">";
			htmltext += "<input type=\"button\" value=\"上页\" onclick=\"myPage.previousPage()\">";
		}
		else
		{
			htmltext += "<input type=\"button\" value=\"首页\" disabled>";
			htmltext += "<input type=\"button\" value=\"上页\" disabled>";
		}
		if (!myPage.noCount){
			if (myPage.current<myPage.total ) {
				htmltext += "<input type=\"button\" value=\"下页\" onclick=\"myPage.nextPage()\">";
				htmltext += "<input type=\"button\" value=\"尾页\" onclick=\"myPage.lastPage()\"> ";
			}
			else
			{
				htmltext += "<input type=\"button\" value=\"下页\" disabled>";
				htmltext += "<input type=\"button\" value=\"尾页\" disabled> ";
			}
		}else{
			if (myPage.length<=currCount){
				htmltext += "<input type=\"button\" value=\"下页\" onclick=\"myPage.nextPage()\"> ";
			}
			else
			{
				htmltext += "<input type=\"button\" value=\"下页\" disabled> ";
			}
		}
		htmltext += "<input type='text' name='pageno' size=2 value='"+myPage.current+"' eos_datatype='number' eos_displayname='页码' onBlur='checkInput(this)'>";
		htmltext += "<input type='button' onclick=myPage.goPage('pageno'); value='go' name='gopage'> ";
		document.write( htmltext );
	//-->
	</SCRIPT>
</div>
			</td>
</logic:notEqual>
			</tr></table>
			</TD>
		</TR>
</TABLE>
</FORM>
</PG:DataGrid>