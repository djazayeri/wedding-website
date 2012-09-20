<%@ include file="/WEB-INF/template/include.jsp" %>

<div style="margin: 15px; text-align: center;">
	<img src="images/house.png"/>
</div>

<div style="margin: 15px">
	<spring:message code="gifts.message"/>
</div>

<script>
	$('#selected-page-title-text').html('<spring:message code="invite.gifts"/>');
</script>