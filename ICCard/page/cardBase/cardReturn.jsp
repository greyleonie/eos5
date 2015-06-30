<%@include file="/internet/common.jsp"%>

<form method="post" action="ICCard.prCardBase.cardList.do">
		<logic:notPresent property="delState">
		<div  align="center" class="td1">
			<br>
			<bean:write property="messageStr"/>
			<br><br>
			
		<input name="Button" type="submit" class="button_02" value="È· ¶¨"> 
		</div>
		</logic:notPresent>
		<logic:present property="delState">
			<script>
				document.forms[0].submit();
			</script>
		</logic:present>
</form>