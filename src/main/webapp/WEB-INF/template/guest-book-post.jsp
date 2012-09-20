<form method="post" action="post-to-guest-book" id="post-guest-book-form" accept-charset="UTF-8,ISO-8859-1">
	<spring:message code="guestbook.post"/><br/>
	<textarea name="text" rows="3" cols="40" style="font-size: 1em"></textarea>
	<input type="submit" value='<spring:message code="guestbook.postButton"/>' id="submit-post-button"/>
</form>

<script>
	$('#submit-post-button')
		.button()
		.click(function(event) {
			$.post('post-to-guest-book', $('#post-guest-book-form').serialize(), function(data) {
				reloadFragment();
			});
			event.preventDefault();
		});
</script>