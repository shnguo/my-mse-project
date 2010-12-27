<#include "*/common/taglibs.ftl" parse=true encoding="UTF-8">
<script language="javascript" type="text/javascript" src="${contextPath}/script/orders/quota-form.js"></script>
<script language="javascript" type="text/javascript">
	var delBtnValue = "<@spring.messageText "orders.quota.form.label.del", "Del" />";
</script>
<h1><@spring.messageText "orders.quota.form.label.title", "Quota Order Form" /></h1>
<form id="orderForm" action="${contextPath}/orders/quota/form" method="POST">
<#if globalErrorMessage??>
<div class="error">
	${globalErrorMessage}
</div>
</#if>
<table>
	<tr>
		<td><@spring.messageText "orders.quota.form.label.memo", "Memo" /></td>
		<td>
			<textarea name="memo">${(orderForm.memo)!""}</textarea>
		</td>
	</tr>
	<tr>
		<td></td>
		<td>
			<input id="submitBtn" type="submit" value="<@spring.messageText "orders.quota.form.label.submit", "Submit" />" />
			<input id="returnBtn" type="button" value="<@spring.messageText "orders.quota.form.label.return", "Return" />" />
		</td>
	</tr>
</table>

<table id="itemsTable">
	<tr>
		<td><@spring.messageText "orders.quota.form.label.book.id", "Book Id" /></td>
		<td><@spring.messageText "orders.quota.form.label.num", "Qutoa num" /></td>
		<td><input id="addBtn" type="button" value="<@spring.messageText "orders.quota.form.label.add", "Add" />" /></td>
	</tr>
	<#if orderForm?? && orderForm.items??>
		<#list orderForm.items as item>
			<tr>
				<td><input type="text" id="bookId${item_index}" name="items[${item_index}].book.id" value="${(item.book.id)!""}" /></td>
				<td><input type="text" id="num${item_index}" name="items[${item_index}].num" value="${(item.num)!""}" /></td>
				<td><input type="button" id="delBtn" value="<@spring.messageText "orders.quota.form.label.del", "Del" />" /></td>
			</tr>
		</#list>
	</#if>
</table>
</form>