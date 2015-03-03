<%@include file="/internet/hciHead.jsp"%>
<SCRIPT language="JavaScript" src="/pageComponent/resources/scripts/dataformcheck.js"></SCRIPT>
<link rel="stylesheet" href="/pageComponent/resources/theme/style.css" type="text/css">
<SCRIPT language="JavaScript" src="/pageComponent/resources/scripts/calendar.js"></SCRIPT>
<%--
  作者：Administrator
  部门：
  创建时间：Sat Aug 01 18:09:10 CST 2009

  描述：通过向导自动产生entity表单输入的jsp页面
--%>

<PG:QueryForm> 
<%--自动生成代码，请不要手动修改
<?xml version="1.0" encoding="GB2312" standalone="no"?>
<wizardContent version="1.0">
    <content>
        <formAction value="OMM.prTypeExt.prOMM_TypeExtPropertyQuery.do" type="String"/>
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
    <entity name="OMM_TypeExtProperty" id="queryEntity">
        <field name="TypeExtPropertyID" dataType="integer" displayName="TypeExtPropertyID" length="10" isNullable="true">
            <readonly value="false"/>
            <htmlInputType value="text"/>
            <operator value="="/>
            <likeRule value="center"/>
            <dictHasNull value="false"/>
        </field>
        <field name="TypeID" dataType="integer" displayName="TypeID" length="10" isNullable="true">
            <readonly value="false"/>
            <htmlInputType value="text"/>
            <operator value="="/>
            <likeRule value="center"/>
            <dictHasNull value="false"/>
        </field>
        <field name="ExtPropertyName" displayName="ExtPropertyName" length="100" isNullable="true">
            <readonly value="false"/>
            <htmlInputType value="text"/>
            <operator value="like"/>
            <likeRule value="center"/>
            <dictHasNull value="false"/>
        </field>
        <field name="ExtPropertyMode" dataType="integer" displayName="ExtPropertyMode" length="10" isNullable="true">
            <readonly value="false"/>
            <htmlInputType value="text"/>
            <operator value="="/>
            <likeRule value="center"/>
            <dictHasNull value="false"/>
        </field>
        <field name="ExtPropertyOptions" displayName="ExtPropertyOptions" length="100" isNullable="true">
            <readonly value="false"/>
            <htmlInputType value="text"/>
            <operator value="="/>
            <likeRule value="center"/>
            <dictHasNull value="false"/>
        </field>
    </entity>
    <entity name="OMM_TypeExtProperty" id="orderEntity">
        <field name="TypeExtPropertyID" isNullable="true">
            <order value="ASC"/>
        </field>
    </entity>
</wizardContent>
 --%>

<form action="OMM.prTypeExt.prOMM_TypeExtPropertyQuery.do" target="result" name="queryForm1" method="post" onsubmit="return check(this);"> 
 
	<html:hidden property="PageCond/begin" value="0"/>
	<html:hidden property="PageCond/count" value=""/> 


	<input type="hidden" name="OMM_TypeExtProperty/_order/col1/field" value="TypeExtPropertyID"> 
   
<TABLE width="80%" border="0" align="center" cellPadding="0" cellSpacing="0" class="pg_add">
	 <TR><TD class="pg_add_title" colspan="6">查询条件</TD></TR>
	 <TR>    
					
		<TD class="pg_add_head">
			TypeExtPropertyID:
		</TD>
		<TD class="pg_add_content">
			
					<html:text property="OMM_TypeExtProperty/TypeExtPropertyID/criteria/value"   attributesText='eos_isnull="true" eos_maxsize="10" eos_datatype="integer" eos_displayname="TypeExtPropertyID"' onblur="checkInput(this)"/>
								
		</TD>
						
		<TD class="pg_add_head">
			TypeID:
		</TD>
		<TD class="pg_add_content">
			
					<html:text property="OMM_TypeExtProperty/TypeID/criteria/value"   attributesText='eos_isnull="true" eos_maxsize="10" eos_datatype="integer" eos_displayname="TypeID"' onblur="checkInput(this)"/>
								
		</TD>
						
		<TD class="pg_add_head">
			ExtPropertyName:
		</TD>
		<TD class="pg_add_content">
			
					<html:text property="OMM_TypeExtProperty/ExtPropertyName/criteria/value"   attributesText='eos_isnull="true" eos_maxsize="100" eos_displayname="ExtPropertyName"' onblur="checkInput(this)"/>
							<input type="hidden" name="OMM_TypeExtProperty/ExtPropertyName/criteria/operator" value="like">	<input type="hidden" name="OMM_TypeExtProperty/ExtPropertyName/criteria/likeRule" value="center">
		</TD>
	 </TR><TR> 					
		<TD class="pg_add_head">
			ExtPropertyMode:
		</TD>
		<TD class="pg_add_content">
			
					<html:text property="OMM_TypeExtProperty/ExtPropertyMode/criteria/value"   attributesText='eos_isnull="true" eos_maxsize="10" eos_datatype="integer" eos_displayname="ExtPropertyMode"' onblur="checkInput(this)"/>
								
		</TD>
						
		<TD class="pg_add_head">
			ExtPropertyOptions:
		</TD>
		<TD class="pg_add_content">
			
					<html:text property="OMM_TypeExtProperty/ExtPropertyOptions/criteria/value"   attributesText='eos_isnull="true" eos_maxsize="100" eos_displayname="ExtPropertyOptions"' onblur="checkInput(this)"/>
								
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