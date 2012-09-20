<%@ include file="/WEB-INF/template/include.jsp" %>

<%!
	String YELLOW_COLOR = "#cc9900";
%>

<%@ include file="/WEB-INF/template/login-info.jsp" %>

<div style="clear: both"></div>

<c:if test="${ not empty group }">
	<br/>
	<div class="box" style="float: left">
		<%@ include file="/WEB-INF/template/guest-book-post.jsp" %>
	</div>
	<div style="clear: both"></div>
	<br/>
</c:if>

<c:forEach var="comment" items="${ posts }" varStatus="status">
	<div class="guest-book-comment box" style="padding: 5px; margin-top: 5px; margin-left: 5px; float: left">
		${ comment.text }
		<br/>
		<span class="comment-author">-${ comment.author }</span>
	</div>
</c:forEach>

<div style="clear: both"></div>

<script>
	$(function() {
		$('.guest-book-comment').filter(':even').css('background-color', '<%= YELLOW_COLOR %>');
		$('#selected-page-title-text').html('<spring:message code="invite.guestBook"/>');
	})
</script>