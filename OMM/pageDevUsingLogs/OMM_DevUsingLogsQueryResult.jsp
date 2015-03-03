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
        <iteratorXpath value="list[@type='OMM_DevUsingLogs']" type="String"/>
        <updateAction value="OMM.prDevUsingLogs.prOMM_DevUsingLogsUpdate.do" type="String"/>
        <oddClass value="pg_result_content" type="String"/>
        <title value="查询结果" type="String"/>
        <insertTarget value="_self" type="String"/>
        <isPage value="true" type="Boolean"/>
        <insertAction value="forward.do?nextPage=/OMM/pageDevUsingLogs/OMM_DevUsingLogsInsert.jsp" type="String"/>
        <highLightClass value="onmouseover" type="String"/>
        <updateTarget value="_self" type="String"/>
        <deleteAction value="OMM.prDevUsingLogs.prOMM_DevUsingLogsDelete.do" type="String"/>
        <deleteTarget value="_top" type="String"/>
        <selectFieldStyle value="checkbox" type="String"/>
        <evenClass value="pg_result_content_" type="String"/>
        <pageAction value="OMM.prDevUsingLogs.prOMM_DevUsingLogsQuery.do" type="String"/>
        <selectFieldName value="DevUsingLogID" type="String"/>
        <formName value="form1" type="String"/>
    </content>
    <entity name="OMM_DevUsingLogs" id="entity">
        <field name="DevUsingLogID" dataType="integer" displayName="DevUsingLogID" length="10" isKey="true">
            <showType value="show"/>
            <fieldType value="int"/>
        </field>
        <field name="DeviceID" dataType="integer" displayName="DeviceID" length="10" isNullable="true">
            <showType value="show"/>
            <fieldType value="int"/>
        </field>
        <field name="UserID" dataType="number" displayName="UserID" length="18" isNullable="true">
            <showType value="show"/>
            <fieldType value="BigDecimal"/>
        </field>
        <field name="RoomID" dataType="integer" displayName="RoomID" length="10" isNullable="true">
            <showType value="show"/>
            <fieldType value="int"/>
        </field>
        <field name="BeginTime" dataType="date" displayFormat="yyyyMMdd" displayName="BeginTime" isNullable="true">
            <showType value="show"/>
            <fieldType value="Date"/>
        </field>
        <field name="EndTime" dataType="date" displayFormat="yyyyMMdd" displayName="EndTime" isNullable="true">
            <showType value="show"/>
            <fieldType value="Date"/>
        </field>
        <field name="AlterationReason" displayName="AlterationReason" length="200" isNullable="true">
            <showType value="show"/>
            <fieldType value="String"/>
        </field>
    </entity>
</wizardContent>
 --%>
<form action="OMM.prDevUsingLogs.prOMM_DevUsingLogsQuery.do" name="form1" method="POST">
 <pagecom:hiddenData property="PageCond"/> 
		<pagecom:hiddenData property="OMM_DevUsingLogs"/>

	<TABLE width="80%" border="0" align="center" cellPadding="0" cellSpacing="0" class="pg_result">
		<TR>
			<TD class="pg_result_title" colspan="8">查询结果
			</TD>
		</TR>

		<TR class="pg_result_head">
		  <TD align="left">&nbsp;<logic:notEqual property="list[@type='OMM_DevUsingLogs']/@rowNum" value="0">
				<html:checkbox name="chkAll" onclick="checkAll('checkall')"/>
			   </logic:notEqual>选择</TD><TD>DevUsingLogID</TD><TD>DeviceID</TD><TD>UserID</TD><TD>RoomID</TD><TD>BeginTime</TD><TD>EndTime</TD><TD>AlterationReason</TD>		    	
		</TR>		            
		<logic:iterate id="ResultSet" property="list[@type='OMM_DevUsingLogs']">       
		
		<TR class="<pagecom:trclass oddClass='pg_result_content' evenClass='pg_result_content_'/>" onmouseover='this.className="onmouseover"' onmouseout='this.className="<pagecom:trclass oddClass="pg_result_content" evenClass="pg_result_content_" mapping="oddClass|oddClass,evenClass|evenClass"/>"'>
		
			<TD>
			<logic:present id="ResultSet" property="OMM_DevUsingLogs/DevUsingLogID">
			&nbsp;<html:checkbox styleId="checkall" name="list[@name='update']/OMM_DevUsingLogs/DevUsingLogID" id="ResultSet" property="OMM_DevUsingLogs/DevUsingLogID"  indexed="true" />
			</logic:present>
			</TD>						
				
			<TD>
			<bean:write id="ResultSet" property="OMM_DevUsingLogs/DevUsingLogID"/>
			</TD>
			
			<TD>
			<bean:write id="ResultSet" property="OMM_DevUsingLogs/DeviceID"/>
			</TD>
			
			<TD>
			<bean:write id="ResultSet" property="OMM_DevUsingLogs/UserID"/>
			</TD>
			
			<TD>
			<bean:write id="ResultSet" property="OMM_DevUsingLogs/RoomID"/>
			</TD>
			
			<TD>
			<bean:write id="ResultSet" property="OMM_DevUsingLogs/BeginTime" formatType="yyyyMMdd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/>
			</TD>
			
			<TD>
			<bean:write id="ResultSet" property="OMM_DevUsingLogs/EndTime" formatType="yyyyMMdd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/>
			</TD>
			
			<TD>
			<bean:write id="ResultSet" property="OMM_DevUsingLogs/AlterationReason"/>
			</TD>
													
		</TR>
		</logic:iterate>

		<TR>
			<TD colspan="8">
			<table width="100%"><tr class="pg_result_bottom">
		
			<td align="left">
				<div>						
		 <input type="button" value="增加" onclick="javascript:prepareInsert(document.form1, 'forward.do?nextPage=/OMM/pageDevUsingLogs/OMM_DevUsingLogsInsert.jsp','_self')"> 

		<logic:notEqual property="list[@type='OMM_DevUsingLogs']/@rowNum" value="0">
		 <input type="button" value="修改" onclick="javascript:prepareUpdateRow(document.form1, 'OMM.prDevUsingLogs.prOMM_DevUsingLogsUpdate.do', 'checkall','_self')">  
		 <input type="button" value="删除" onclick="javascript:deleteRows(document.form1, 'OMM.prDevUsingLogs.prOMM_DevUsingLogsDelete.do', 'checkall','_top')">  
		</logic:notEqual>
</div>
			</td>
<logic:notEqual property="list[@type='OMM_DevUsingLogs']/@rowNum" value="0">
			<td align="right">
		<div>
	<SCRIPT LANGUAGE="JavaScript">
	<!--						
		var myPage = new page();
		myPage.init("form1", "OMM.prDevUsingLogs.prOMM_DevUsingLogsQuery.do", "PageCond/begin", "PageCond/length", "PageCond/count");
		var currCount = <bean:write property="list[@type='OMM_DevUsingLogs']/@rowNum"/>;
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