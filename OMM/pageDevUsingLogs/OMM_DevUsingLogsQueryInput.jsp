<%@include file="/internet/hciHead.jsp"%>
<SCRIPT language="JavaScript" src="/pageComponent/resources/scripts/dataformcheck.js"></SCRIPT>
<link rel="stylesheet" href="/pageComponent/resources/theme/style.css" type="text/css">
<SCRIPT language="JavaScript" src="/pageComponent/resources/scripts/calendar.js"></SCRIPT>
<%--
  作者：Administrator
  部门：
  创建时间：Wed Aug 05 11:11:08 CST 2009

  描述：通过向导自动产生entity表单输入的jsp页面
--%>

<PG:QueryForm> 
<%--自动生成代码，请不要手动修改
<?xml version="1.0" encoding="GB2312" standalone="no"?>
<wizardContent version="1.0">
    <content>
        <formAction value="OMM.prDevUsingLogs.prOMM_DevUsingLogsQuery.do" type="String"/>
        <cols value="3" type="Integer"/>
        <isCount value="true" type="Boolean"/>
        <pageLength value="10" type="Integer"/>
        <title value="查询条件" type="String"/>
        <hasForm value="true" type="Boolean"/>
        <isPage value="true" type="Boolean"/>
        <isDistinct value="false" type="Boolean"/>
        <submitTarget value="result" type="String"/>
        <formName value="queryForm1" type="String"/>
    </content>
    <entity name="OMM_DevUsingLogs" id="queryEntity">
        <field name="DevUsingLogID" dataType="integer" displayName="DevUsingLogID" length="10" isNullable="true">
            <readonly value="false"/>
            <htmlInputType value="text"/>
            <operator value="="/>
            <likeRule value="center"/>
            <dictHasNull value="false"/>
        </field>
        <field name="DeviceID" dataType="integer" displayName="DeviceID" length="10" isNullable="true">
            <readonly value="false"/>
            <htmlInputType value="text"/>
            <operator value="="/>
            <likeRule value="center"/>
            <dictHasNull value="false"/>
        </field>
        <field name="UserID" dataType="number" displayName="UserID" length="18" isNullable="true">
            <readonly value="false"/>
            <htmlInputType value="text"/>
            <operator value="="/>
            <likeRule value="center"/>
            <dictHasNull value="false"/>
        </field>
        <field name="RoomID" dataType="integer" displayName="RoomID" length="10" isNullable="true">
            <readonly value="false"/>
            <htmlInputType value="text"/>
            <operator value="="/>
            <likeRule value="center"/>
            <dictHasNull value="false"/>
        </field>
        <field name="BeginTime" dataType="date" displayFormat="yyyyMMdd" displayName="BeginTime" isNullable="true">
            <readonly value="false"/>
            <htmlInputType value="text"/>
            <operator value="&amp;gt;="/>
            <likeRule value="center"/>
            <dictHasNull value="false"/>
        </field>
        <field name="EndTime" dataType="date" displayFormat="yyyyMMdd" displayName="EndTime" isNullable="true">
            <readonly value="false"/>
            <htmlInputType value="text"/>
            <operator value="&amp;lt;="/>
            <likeRule value="center"/>
            <dictHasNull value="false"/>
        </field>
    </entity>
    <entity name="OMM_DevUsingLogs" id="orderEntity">
        <field name="DevUsingLogID" isNullable="true">
            <order value="ASC"/>
        </field>
    </entity>
</wizardContent>
 --%>

<form action="OMM.prDevUsingLogs.prOMM_DevUsingLogsQuery.do" target="result" name="queryForm1" method="post" onsubmit="return check(this);"> 
 
	<html:hidden property="PageCond/begin" value="0"/>
	<html:hidden property="PageCond/count" value=""/> 


	<input type="hidden" name="OMM_DevUsingLogs/_order/col1/field" value="DevUsingLogID"> 
   
<TABLE width="80%" border="0" align="center" cellPadding="0" cellSpacing="0" class="pg_add">
	 <TR><TD class="pg_add_title" colspan="6">查询条件</TD></TR>
	 <TR>    
					
		<TD class="pg_add_head">
			DevUsingLogID:
		</TD>
		<TD class="pg_add_content">
			
					<html:text property="OMM_DevUsingLogs/DevUsingLogID/criteria/value"   attributesText='eos_isnull="true" eos_maxsize="10" eos_datatype="integer" eos_displayname="DevUsingLogID"' onblur="checkInput(this)"/>
								
		</TD>
						
		<TD class="pg_add_head">
			DeviceID:
		</TD>
		<TD class="pg_add_content">
			
					<html:text property="OMM_DevUsingLogs/DeviceID/criteria/value"   attributesText='eos_isnull="true" eos_maxsize="10" eos_datatype="integer" eos_displayname="DeviceID"' onblur="checkInput(this)"/>
								
		</TD>
						
		<TD class="pg_add_head">
			UserID:
		</TD>
		<TD class="pg_add_content">
			
					<html:text property="OMM_DevUsingLogs/UserID/criteria/value"   attributesText='eos_isnull="true" eos_maxsize="18" eos_datatype="number" eos_displayname="UserID"' onblur="checkInput(this)"/>
								
		</TD>
	 </TR><TR> 					
		<TD class="pg_add_head">
			RoomID:
		</TD>
		<TD class="pg_add_content">
			
					<html:text property="OMM_DevUsingLogs/RoomID/criteria/value"   attributesText='eos_isnull="true" eos_maxsize="10" eos_datatype="integer" eos_displayname="RoomID"' onblur="checkInput(this)"/>
								
		</TD>
						
		<TD class="pg_add_head">
			BeginTime:
		</TD>
		<TD class="pg_add_content">
			
					<html:text property="OMM_DevUsingLogs/BeginTime/criteria/value" size="13"   attributesText='eos_isnull="true" eos_datatype="date(yyyyMMdd)" eos_displayname="BeginTime"' onblur="checkInput(this)"/> 
								
					<input type="button" value="日历" onclick="var txt=document.getElementById(&quot;OMM_DevUsingLogs/BeginTime/criteria/value&quot;),format=&quot;yyyyMMdd&quot;; calendar(txt,format);">
						<input type="hidden" name="OMM_DevUsingLogs/BeginTime/criteria/operator" value="&gt;=">	
		</TD>
						
		<TD class="pg_add_head">
			EndTime:
		</TD>
		<TD class="pg_add_content">
			
					<html:text property="OMM_DevUsingLogs/EndTime/criteria/value" size="13"   attributesText='eos_isnull="true" eos_datatype="date(yyyyMMdd)" eos_displayname="EndTime"' onblur="checkInput(this)"/> 
								
					<input type="button" value="日历" onclick="var txt=document.getElementById(&quot;OMM_DevUsingLogs/EndTime/criteria/value&quot;),format=&quot;yyyyMMdd&quot;; calendar(txt,format);">
						<input type="hidden" name="OMM_DevUsingLogs/EndTime/criteria/operator" value="&lt;=">	
		</TD>
		
	</TR>
	<TR class="pg_add_bottom"> 
		<TD colspan="6" >
			<DIV align="center">
				 
					每页显示<input type="text" name="PageCond/length" size="4" value="10"/>行数据
				
					【<a href="javascript:check(document.queryForm1);">查询</a>】
					【<a href="javascript:resetData(document.queryForm1);">重置</a>】
					【<a href="javascript:history.go(-1);">返回</a>】
			</DIV>
		</TD>
	</TR> 
</TABLE>
</form>
</PG:QueryForm><iframe name="result" frameborder="0" width="100%" height="420" scrolling="auto" marginheight="0" marginwidth="0"></iframe>
<script>
	document.queryForm1.submit();
</script>