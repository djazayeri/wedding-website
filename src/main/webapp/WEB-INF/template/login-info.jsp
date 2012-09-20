<c:choose>
	<c:when test="${ not empty group }">
	
		<spring:message code="invite.login.welcome" arguments="${ group.groupName }" />
		<small><spring:message code="invite.login.notYou"/></small>
	
	</c:when>
	<c:otherwise>

		<span class="ui-widget">
			<spring:message code="invite.login.enterCode"/>
			<input type="text" id="guest-code"/>
			<input type="button" id="login-button" value='<spring:message code="general.submit"/>'/>
		</span>
		
		<script>
			$(function() {
				$('#login-button')
					.button()
					.click(function() {
						$.cookie('campodejazayeri_id', $('#guest-code').val());
						reloadFragment();
					});
			});
		</script>

	</c:otherwise>
</c:choose>

<script>
	$(function() {
		$('#guest-code').focus();
		$('#not-me').click(function(event) {
			$.cookie('campodejazayeri_id', null);
			reloadFragment();
			event.preventDefault();
		});
	});
</script>