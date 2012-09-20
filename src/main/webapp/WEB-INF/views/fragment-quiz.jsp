<%@ include file="/WEB-INF/template/include.jsp"%>

<script>
	var questions = [
		<c:forEach var="i" begin="1" end="5" varStatus="status">
			{
				question: '<spring:message code="quiz.${ i }.question" javaScriptEscape="true" />',
				answers: [
				    <spring:message code="quiz.${ i }.answers" />
				],
				correctAnswer: <spring:message code="quiz.${ i }.correctAnswer" />,
				correctMessage: '<spring:message code="quiz.${ i }.correctMessage" javaScriptEscape="true" />'
			}
			<c:if test="${ not status.last }">, </c:if>
		</c:forEach>
	];
	showQuizQuestion(0);
	$('#selected-page-title-text').html('<spring:message code="invite.aboutUs"/>');
</script>

<div id="current-quiz-question"></div>