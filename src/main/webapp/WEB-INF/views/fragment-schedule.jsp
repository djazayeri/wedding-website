<%@ include file="/WEB-INF/template/include.jsp" %>

<%@ include file="/WEB-INF/template/login-info.jsp" %>

<style>
	.schedule-table {
		font-size: 1em;
		margin: 15px;
	}
	.schedule-table tr:first-child > th {
		padding-top: 0px;
	}
	.schedule-table th {
		text-align: left;
		padding-top: 25px;
	}
	.schedule-table td:first-child {
		text-align: right;
	}
	.schedule-table td {
		padding-left: 10px; 
		padding-right: 10px;
	}	
	.schedule-picture {
		float: left;
		padding-left: 25px;
	}
</style>

<c:if test="${ not empty group }">

	<table class="schedule-table">
		<c:if test="${ group.invitedTours }">
			<tr>
				<th colspan="2"><spring:message code="schedule.thursday"/></th>
			</tr>
			<tr>
				<td><i>10am-6pm</i></td>
				<td><spring:message code="schedule.thursdayActivities"/></td>
			</tr>
		</c:if>
		<c:if test="${ group.invitedTours || group.invitedRehearsal }">
			<tr>
				<th colspan="2"><spring:message code="schedule.friday"/></th>
			</tr>
			<c:if test="${ group.invitedTours }">
				<tr>
					<td><i>9am-1pm</i></td>
					<td><spring:message code="schedule.fridayTour"/></td>
				</tr>
			</c:if>
			<c:if test="${ group.invitedRehearsal }">
				<tr>
					<td><i>7pm</i></td>
					<td><spring:message code="schedule.fridayRehearsal"/></td>
				</tr>
			</c:if>
		</c:if>
	
		<tr>
			<th colspan="2"><spring:message code="schedule.saturday"/></th>
		</tr>
		<tr>
			<td><i>4pm</i></td>
			<td><spring:message code="schedule.saturdayCeremony"/></td>
		</tr>
		<tr valign="top">
			<td><i>6pm</i></td>
			<td><spring:message code="schedule.saturdayFiesta"/></td>
		</tr>
	</table>
	
	<img src="images/belalcazar.jpg" width="300" height="400" class="schedule-picture" style="margin-left: -10px"/>
	<img src="images/salsa-dancers.jpg" width="300" height="400" class="schedule-picture"/>
	<img src="images/schedule-la-merced.jpg" width="300" height="400" class="schedule-picture"/>
	
	<div style="clear: both">&nbsp;</div>

</c:if>

<script>
$('#selected-page-title-text').html('<spring:message code="invite.schedule"/>');
</script>