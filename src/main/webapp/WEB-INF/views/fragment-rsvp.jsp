<%@ include file="/WEB-INF/template/include.jsp" %>

<%!
int SPACING = 10;
int CONTENT_WIDTH = 1000;
String BROWN_COLOR = "#331a00";
String YELLOW_COLOR = "#cc9900";
%>

<%@ include file="/WEB-INF/template/login-info.jsp" %>

<c:if test="${ not empty group }">

<style>
#post-from-rsvp, #suggest-music {
	border-radius: <%= SPACING %>px;
	-moz-border-radius: <%= SPACING %>px;
	border: 2px <%= YELLOW_COLOR %> solid;
	background-color: white;	
	width: <%= CONTENT_WIDTH / 2 - 20 %>px;
	float: left;
	padding: 5px;
	filter:alpha(opacity=90);
	opacity:0.9;
}
#suggest-music {
	margin-left: 10px;
}
.guest-name {
	font-size: 1.4em;
}
.rsvp-table td, th {
	padding-left: 5px;
	padding-right: 5px;
}
.day-header {
	text-align: left;
	padding-top: 15px;
}
</style>

	<br/>
	<br/>
	
	<form id="submit-rsvp-form" method="post" action="submit-rsvp">
		<spring:message code="rsvp.instructions"/>
		<br/>
		<table class="rsvp-table">
			<tr>
				<th></th>
				<c:forEach var="invitee" items="${ group.invitees }" varStatus="status">
					<th class="guest-name">${ invitee.name }</th>
				</c:forEach>
			</tr>
			<c:if test="${ group.invitedTours }">
				<!--
				<tr>
					<th class="day-header" style="padding-top: 0px"><spring:message code="schedule.wednesday"/></th>
				</tr>
				<tr>
					<td><spring:message code="rsvp.wednesdayDinner"/></td>
					<c:forEach var="invitee" items="${ group.invitees }" varStatus="status">
						<td>
							<span class="rsvp-radios">
								<input type="radio" id="wed${ status.index }yes" name="attendingWednesday${ status.index }"
									value="true" <c:if test="${ invitee.attendingWednesday == true }">checked="true"</c:if> />
								<label for="wed${ status.index }yes"><spring:message code="rsvp.yes"/></label>
								<input type="radio" id="wed${ status.index }no" name="attendingWednesday${ status.index }"
									value="false" <c:if test="${ invitee.attendingWednesday == false }">checked="true"</c:if>/>
								<label for="wed${ status.index }no"><spring:message code="rsvp.no"/></label>
							</span>
						</td>
					</c:forEach>
				</tr>
 				-->
 
				<tr>
					<th class="day-header"><spring:message code="schedule.thursday"/></th>
				</tr>
				<tr>
					<td><spring:message code="rsvp.thursdayTour"/></td>
					<c:forEach var="invitee" items="${ group.invitees }" varStatus="status">
						<td>
							<span class="rsvp-radios">
								<input type="radio" id="thurs${ status.index }yes" name="attendingThursday${ status.index }"
									value="true" <c:if test="${ invitee.attendingThursday == true }">checked="true"</c:if> />
								<label for="thurs${ status.index }yes"><spring:message code="rsvp.yes"/></label>
								<input type="radio" id="thurs${ status.index }no" name="attendingThursday${ status.index }"
									value="false" <c:if test="${ invitee.attendingThursday == false }">checked="true"</c:if>/>
								<label for="thurs${ status.index }no"><spring:message code="rsvp.no"/></label>
							</span>
						</td>
					</c:forEach>
				</tr>
			</c:if>
			
			<c:if test="${ group.invitedTours || group.invitedRehearsal}">
				<tr>
					<th class="day-header"><spring:message code="schedule.friday"/></th>
				</tr>
				<c:if test="${ group.invitedTours }">
					<tr>
						<td><spring:message code="rsvp.fridayTour"/></td>
						<c:forEach var="invitee" items="${ group.invitees }" varStatus="status">
							<td>
								<span class="rsvp-radios">
									<input type="radio" id="fri${ status.index }yes" name="attendingFriday${ status.index }"
										value="true" <c:if test="${ invitee.attendingFriday == true }">checked="true"</c:if> />
									<label for="fri${ status.index }yes"><spring:message code="rsvp.yes"/></label>
									<input type="radio" id="fri${ status.index }no" name="attendingFriday${ status.index }"
										value="false" <c:if test="${ invitee.attendingFriday == false }">checked="true"</c:if>/>
									<label for="fri${ status.index }no"><spring:message code="rsvp.no"/></label>
								</span>
							</td>
						</c:forEach>
					</tr>
				</c:if>
				<c:if test="${ group.invitedRehearsal }">
					<tr>
						<td><spring:message code="rsvp.rehearsalDinner"/></td>
						<c:forEach var="invitee" items="${ group.invitees }" varStatus="status">
							<td>
								<span class="rsvp-radios">
									<input type="radio" id="rehearsal${ status.index }yes" name="attendingRehearsal${ status.index }"
										value="true" <c:if test="${ invitee.attendingRehearsal == true }">checked="true"</c:if> />
									<label for="rehearsal${ status.index }yes"><spring:message code="rsvp.yes"/></label>
									<input type="radio" id="rehearsal${ status.index }no" name="attendingRehearsal${ status.index }"
										value="false" <c:if test="${ invitee.attendingRehearsal == false }">checked="true"</c:if>/>
									<label for="rehearsal${ status.index }no"><spring:message code="rsvp.no"/></label>
								</span>
							</td>
						</c:forEach>
					</tr>
				</c:if>
			</c:if>
			
			<tr>
				<th class="day-header"><spring:message code="schedule.saturday"/></th>
			</tr>
			<tr>
				<td><spring:message code="rsvp.ceremony"/></td>
				<c:forEach var="invitee" items="${ group.invitees }" varStatus="status">
					<td>
						<span class="rsvp-radios">
							<input type="radio" id="ceremony${ status.index }yes" name="ceremony${ status.index }" value="true"
								<c:if test="${ invitee.attendingCeremony == true }">checked="true"</c:if>/>
							<label for="ceremony${ status.index }yes"><spring:message code="rsvp.yes"/></label>
							<input type="radio" id="ceremony${ status.index }no" name="ceremony${ status.index }" value="false"
								<c:if test="${ invitee.attendingCeremony == false }">checked="true"</c:if>/>
							<label for="ceremony${ status.index }no"><spring:message code="rsvp.no"/></label>
						</span>
					</td>
				</c:forEach>
			</tr>
			<tr>
				<td><spring:message code="rsvp.reception"/></td>
				<c:forEach var="invitee" items="${ group.invitees }" varStatus="status">
					<td>
						<span class="rsvp-radios">
							<input type="radio" id="fiesta${ status.index }yes" name="fiesta${ status.index }" value="true"
								<c:if test="${ invitee.attendingFiesta == true }">checked="true"</c:if>/>
							<label for="fiesta${ status.index }yes"><spring:message code="rsvp.yes"/></label>
							<input type="radio" id="fiesta${ status.index }no" name="fiesta${ status.index }" value="false"
								<c:if test="${ invitee.attendingFiesta == false }">checked="true"</c:if>/>
							<label for="fiesta${ status.index }no"><spring:message code="rsvp.no"/></label>
						</span>
					</td>
				</c:forEach>
			</tr>
			<tr>
				<td></td>
				<td colspan="3">
					<br/>
					<input id="submit-rsvp-button" type="submit" value='<spring:message code="rsvp.save"/>'/>
					<span id="got-your-reply" style="display: none"><spring:message code="rsvp.thanksForReplying"/></span>
				</td>
			</tr>
		</table>

	</form>
	
	<div id="post-from-rsvp">
		<c:choose>
			<c:when test="${ not empty postsByUser }">
				<spring:message code="rsvp.youWrote"/>
				<%--
				<c:forEach var="post" items="${ postsByUser }">
					<div class="guest-book-comment box" style="padding: 5px; margin-top: 5px; margin-left: 5px; float: left">
						${ post.text }
						<br/>
						<span class="comment-author">-${ post.author }</span>
					</div>
				</c:forEach>
				 --%>
			</c:when>
			<c:otherwise>
				<!-- <spring:message code="rsvp.writeInGuestBook"/> -->
				<%@ include file="/WEB-INF/template/guest-book-post.jsp" %>
			</c:otherwise>
		</c:choose>
	</div>
	
	<div id="suggest-music">
		<form method="post" action="suggest-music" id="suggest-music-form">
			<spring:message code="rsvp.suggestMusic"/><br/>
			<textarea name="text" rows="2" cols="40" style="font-size: 1em"></textarea>
			<input type="submit" value='<spring:message code="rsvp.suggestMusicButton"/>' id="suggest-music-button"/>
		</form>
		
		<c:forEach var="suggestion" items="${ suggestions }">
			<div class="guest-book-comment box" style="padding: 5px; margin-top: 5px; margin-left: 5px; float: left">
				${ suggestion.text }
				<br/>
				<span class="comment-author">-${ suggestion.author }</span>
			</div>
		</c:forEach>
	</div>
	
	<div style="clear: both"></div>
		
	<script>
		$(function() {
			$('#after-selected-page').append($('#post-from-rsvp')).append($('#suggest-music')).fadeIn();
			$('#not-me').click(function() {
				$.cookie('campodejazayeri_id', null);
				reloadFragment();
			});
			$('.rsvp-radios').buttonset();
			$('.day-checkboxes').buttonset();
			$('#submit-rsvp-button').button();
			$('#submit-rsvp-button')
				.click(function(event) {
					$.post('submit-rsvp', $('#submit-rsvp-form').serialize(), function(data) {
						$('#got-your-reply').show().delay(3000).fadeOut();
					});
					event.preventDefault();
				});
			$('#suggest-music-button')
				.button()
				.click(function(event) {
					$.post('suggest-music', $('#suggest-music-form').serialize(), function(data) {
						reloadFragment();
					});
					event.preventDefault();
				});
			$('.guest-book-comment').filter(':even').css('background-color', '<%= YELLOW_COLOR %>');
			$('#selected-page-title-text').html('<spring:message code="invite.rsvp"/>');
		});
	</script>

</c:if>