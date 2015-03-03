<%@include file="/internet/common.jsp"%>
<SCRIPT language="JavaScript" src="/pageComponent/resources/scripts/dataformcheck.js"></SCRIPT>
<link rel="stylesheet" href="/pageComponent/resources/theme/style.css" type="text/css">
<SCRIPT language="JavaScript" src="/pageComponent/resources/scripts/calendar.js"></SCRIPT>
<%--
  作者：Administrator
  部门：
  创建时间：Wed Aug 05 11:11:08 CST 2009

  描述：通过向导自动产生entity表单输入的jsp页面
--%>
<br>

<PG:DataForm>
<%--自动生成代码，请不要手动修改
<?xml version="1.0" encoding="GB2312" standalone="no"?>
<wizardContent version="1.0">
    <content>
        <formAction value="OMM.prDevUsingLogs.prOMM_DevUsingLogsInsert.do" type="String"/>
        <cols value="3" type="Integer"/>
        <title value="新增(OMM_DevUsingLogs)信息" type="String"/>
        <hasForm value="true" type="Boolean"/>
        <formName value="inputForm" type="String"/>
        <submitTarget value="_top" type="String"/>
    </content>
    <entity name="OMM_DevUsingLogs" id="entity">
        <field name="DeviceID" dataType="integer" displayName="DeviceID" length="10" isNullable="true">
            <dictNullLable value="其它"/>
            <readonly value="false"/>
            <htmlInputType value="text"/>
            <dictHasNull value="true"/>
        </field>
        <field name="UserID" dataType="number" displayName="UserID" length="18" isNullable="true">
            <dictNullLable value="其它"/>
            <readonly value="false"/>
            <htmlInputType value="text"/>
            <dictHasNull value="true"/>
        </field>
        <field name="RoomID" dataType="integer" displayName="RoomID" length="10" isNullable="true">
            <dictNullLable value="其它"/>
            <readonly value="false"/>
            <htmlInputType value="text"/>
            <dictHasNull value="true"/>
        </field>
        <field name="BeginTime" dataType="date" displayFormat="yyyyMMdd" displayName="BeginTime" isNullable="true">
            <dictNullLable value="其它"/>
            <readonly value="false"/>
            <htmlInputType value="text"/>
            <dictHasNull value="true"/>
        </field>
        <field name="EndTime" dataType="date" displayFormat="yyyyMMdd" displayName="EndTime" isNullable="true">
            <dictNullLable value="其它"/>
            <readonly value="false"/>
            <htmlInputType value="text"/>
            <dictHasNull value="true"/>
        </field>
        <field name="AlterationReason" displayName="AlterationReason" length="200" isNullable="true">
            <dictNullLable value="其它"/>
            <readonly value="false"/>
            <htmlInputType value="text"/>
            <dictHasNull value="true"/>
        </field>
    </entity>
</wizardContent>
 --%>
<form action="OMM.prDevUsingLogs.prOMM_DevUsingLogsInsert.do" target="_top" name="inputForm" method="post">	
<TABLE width="80%" border="0" align="center" cellPadding="0" cellSpacing="0" class="pg_add">
	<TR><TD class="pg_add_title" colspan="6">新增(OMM_DevUsingLogs)信息</TD></TR>

	<TR>
					
		<TD class="pg_add_head">
			DeviceID:
		</TD>
		<TD class="pg_add_content">
	
			<html:text property="OMM_DevUsingLogs/DeviceID"   attributesText='eos_isnull="true" eos_maxsize="10" eos_datatype="integer" eos_displayname="DeviceID"' onblur="checkInput(this)"/>
			
		</TD>
						
		<TD class="pg_add_head">
			UserID:
		</TD>
		<TD class="pg_add_content">
	
			<html:text property="OMM_DevUsingLogs/UserID"   attributesText='eos_isnull="true" eos_maxsize="18" eos_datatype="number" eos_displayname="UserID"' onblur="checkInput(this)"/>
			
		</TD>
						
		<TD class="pg_add_head">
			RoomID:
		</TD>
		<TD class="pg_add_content">
	
			<html:text property="OMM_DevUsingLogs/RoomID"   attributesText='eos_isnull="true" eos_maxsize="10" eos_datatype="integer" eos_displayname="RoomID"' onblur="checkInput(this)"/>
			
		</TD>
	
			</TR><TR>
						
		<TD class="pg_add_head">
			BeginTime:
		</TD>
		<TD class="pg_add_content">
	
			<input type="text" name="OMM_DevUsingLogs/BeginTime" size="13" eos_isnull="true" eos_maxsize="0" eos_datatype="date(yyyyMMdd)" eos_displayname="BeginTime"   
value="<bean:write property="OMM_DevUsingLogs/BeginTime" formatType="yyyyMMdd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/>"/>
		
			<input type="button" value="日历" onclick="var txt=document.getElementById(&quot;OMM_DevUsingLogs/BeginTime&quot;),format=&quot;yyyyMMdd&quot;; calendar(txt,format);">
				
		</TD>
						
		<TD class="pg_add_head">
			EndTime:
		</TD>
		<TD class="pg_add_content">
	
			<input type="text" name="OMM_DevUsingLogs/EndTime" size="13" eos_isnull="true" eos_maxsize="0" eos_datatype="date(yyyyMMdd)" eos_displayname="EndTime"   
value="<bean:write property="OMM_DevUsingLogs/EndTime" formatType="yyyyMMdd" formatClass="com.primeton.eos.webtag.bean.BeanWriteDateFormatImpl"/>"/>
		
			<input type="button" value="日历" onclick="var txt=document.getElementById(&quot;OMM_DevUsingLogs/EndTime&quot;),format=&quot;yyyyMMdd&quot;; calendar(txt,format);">
				
		</TD>
						
		<TD class="pg_add_head">
			AlterationReason:
		</TD>
		<TD class="pg_add_content">
	
			<html:text property="OMM_DevUsingLogs/AlterationReason"   attributesText='eos_isnull="true" eos_maxsize="200" eos_displayname="AlterationReason"' onblur="checkInput(this)"/>
			
		</TD>
		
	</TR>	
	
	<TR class="pg_add_bottom"> 
		<TD colspan="6" >
			<DIV align="center">
				【<a href="javascript:check(document.inputForm);">提交</a>】
				【<a href="javascript:resetData(document.inputForm);">重置</a>】
				【<a href="javascript:history.go(-1);">返回</a>】
			</DIV>
		</TD>
	</TR> 	
</TABLE>
</form>
</PG:DataForm>