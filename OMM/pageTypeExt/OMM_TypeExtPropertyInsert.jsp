<%@include file="/internet/common.jsp"%>
<SCRIPT language="JavaScript" src="/pageComponent/resources/scripts/dataformcheck.js"></SCRIPT>
<link rel="stylesheet" href="/pageComponent/resources/theme/style.css" type="text/css">
<SCRIPT language="JavaScript" src="/pageComponent/resources/scripts/calendar.js"></SCRIPT>
<%--
  作者：Administrator
  部门：
  创建时间：Sat Aug 01 18:09:10 CST 2009

  描述：通过向导自动产生entity表单输入的jsp页面
--%>
<br>

<PG:DataForm>
<%--自动生成代码，请不要手动修改
<?xml version="1.0" encoding="GB2312" standalone="no"?>
<wizardContent version="1.0">
    <content>
        <formAction value="OMM.prTypeExt.prOMM_TypeExtPropertyInsert.do" type="String"/>
        <cols value="3" type="Integer"/>
        <title value="新增(OMM_TypeExtProperty)信息" type="String"/>
        <hasForm value="true" type="Boolean"/>
        <formName value="inputForm" type="String"/>
        <submitTarget value="_top" type="String"/>
    </content>
    <entity name="OMM_TypeExtProperty" id="entity">
        <field name="TypeID" dataType="integer" displayName="TypeID" length="10" isNullable="true">
            <dictNullLable value="其它"/>
            <readonly value="false"/>
            <htmlInputType value="text"/>
            <dictHasNull value="true"/>
        </field>
        <field name="ExtPropertyName" displayName="ExtPropertyName" length="100" isNullable="true">
            <dictNullLable value="其它"/>
            <readonly value="false"/>
            <htmlInputType value="text"/>
            <dictHasNull value="true"/>
        </field>
        <field name="ExtPropertyMode" dataType="integer" displayName="ExtPropertyMode" length="10" isNullable="true">
            <dictNullLable value="其它"/>
            <readonly value="false"/>
            <htmlInputType value="text"/>
            <dictHasNull value="true"/>
        </field>
        <field name="ExtPropertyOptions" displayName="ExtPropertyOptions" length="100" isNullable="true">
            <dictNullLable value="其它"/>
            <readonly value="false"/>
            <htmlInputType value="text"/>
            <dictHasNull value="true"/>
        </field>
    </entity>
</wizardContent>
 --%>
<form action="OMM.prTypeExt.prOMM_TypeExtPropertyInsert.do" target="_top" name="inputForm" method="post">	
<TABLE width="80%" border="0" align="center" cellPadding="0" cellSpacing="0" class="pg_add">
	<TR><TD class="pg_add_title" colspan="6">新增(OMM_TypeExtProperty)信息</TD></TR>

	<TR>
					
		<TD class="pg_add_head">
			TypeID:
		</TD>
		<TD class="pg_add_content">
	
			<html:text property="OMM_TypeExtProperty/TypeID"   attributesText='eos_isnull="true" eos_maxsize="10" eos_datatype="integer" eos_displayname="TypeID"' onblur="checkInput(this)"/>
			
		</TD>
						
		<TD class="pg_add_head">
			ExtPropertyName:
		</TD>
		<TD class="pg_add_content">
	
			<html:text property="OMM_TypeExtProperty/ExtPropertyName"   attributesText='eos_isnull="true" eos_maxsize="100" eos_displayname="ExtPropertyName"' onblur="checkInput(this)"/>
			
		</TD>
						
		<TD class="pg_add_head">
			ExtPropertyMode:
		</TD>
		<TD class="pg_add_content">
	
			<html:text property="OMM_TypeExtProperty/ExtPropertyMode"   attributesText='eos_isnull="true" eos_maxsize="10" eos_datatype="integer" eos_displayname="ExtPropertyMode"' onblur="checkInput(this)"/>
			
		</TD>
	
			</TR><TR>
						
		<TD class="pg_add_head">
			ExtPropertyOptions:
		</TD>
		<TD class="pg_add_content">
	
			<html:text property="OMM_TypeExtProperty/ExtPropertyOptions"   attributesText='eos_isnull="true" eos_maxsize="100" eos_displayname="ExtPropertyOptions"' onblur="checkInput(this)"/>
			
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