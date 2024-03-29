<#include "*/common/taglibs.ftl" parse=true encoding="UTF-8">

<h1><@spring.messageText "login.label.title", "Please Login" /></h1>
<form action="${contextPath}/login" method="POST">
<#if globalErrorMessage??>
<div class="error">
	${globalErrorMessage}
</div>
</#if>
<table>
	<tr>
		<td><@spring.messageText "login.label.loginName", "Login Name" /></td>
		<td>
			<@spring.bind "loginForm.loginName" />
			<input type="text" name="${spring.status.expression}" value="${spring.status.value?default("")}" />
			<@spring.showErrors ", ", "error"/>
		</td>
	</tr>
	<tr>
		<td><@spring.messageText "login.label.password", "Password" /></td>
		<td>
			<@spring.bind "loginForm.password" />
			<input type="password" name="${spring.status.expression}" />
			<@spring.showErrors ", ", "error"/>
		</td>
	</tr>
	<tr>
		<td></td>
		<td><input type="submit" value="<@spring.messageText "login.label.submit", "Login" />" /></td>
	</tr>
</table>
</form>