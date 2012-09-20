<%@ taglib prefix="c" uri="/WEB-INF/taglibs/c-rt.tld" %>
<%@ taglib prefix="fn" uri="/WEB-INF/taglibs/fn.tld" %>
<html>
	<head>
	</head>
	<body>

<a href="invite">Back to Invite</a>

<table>
	<tr valign="top">
		<th>Thursday Tour<br/>${ fn:length(attendingThursday) }</th>
		<th>Friday Tour<br/>${ fn:length(attendingFriday) }</th>
		<th>Rehearsal Dinner<br/>${ fn:length(attendingRehearsal) }</th>
		<th>Ceremony<br/>${ fn:length(attendingCeremony) }</th>
		<th>Fiesta<br/>${ fn:length(attendingFiesta) }</th>
	</tr>
	<tr valign="top">
		<td><c:forEach var="name" items="${ attendingThursday }">${ name }<br/></c:forEach></td>
		<td><c:forEach var="name" items="${ attendingFriday }">${ name }<br/></c:forEach></td>
		<td><c:forEach var="name" items="${ attendingRehearsal }">${ name }<br/></c:forEach></td>
		<td><c:forEach var="name" items="${ attendingCeremony }">${ name }<br/></c:forEach></td>
		<td><c:forEach var="name" items="${ attendingFiesta }">${ name }<br/></c:forEach></td>
	</tr>
</table>

<div style="clear: both"></div>

<div style="float: right; margin-left: 0.5em;">
	<div style="border: 1px black solid; background-color: #e0e0e0; padding: 0.5em;">
		<b><u>${ numAttendees } attending the fiesta</u></b><br/>
		<c:forEach var="a" items="${ attendees }">
			${ a }<br/>
		</c:forEach>
		
		<br/><br/>
		<b><u>${ numNotAttending } said No</u></b><br/>
		<c:forEach var="a" items="${ notAttending }">
			${ a }<br/>
		</c:forEach>
	</div>
	<br/>
	<br/>
	<div>
		<form method="post" action="bulk-invite" enctype="multipart/form-data">
			CSV invitees: <input type="file" name="invitees" size="40" />
			<br/>
			<input type="submit" value="Upload"/>
		</form>
	</div>
	<br/>
	<br/>
	<div>
		<form method="post" action="sendmail" enctype="multipart/form-data" accept-charset="UTF-8">
			Language:
			<input type="radio" name="emailLanguage" value="en"/>English
			<input type="radio" name="emailLanguage" value="es"/>Spanish
			<br/>
			Which:
			<input type="radio" name="whichPeople" value="all"/>All
			<input type="radio" name="whichPeople" value="yes"/>Yes
			<input type="radio" name="whichPeople" value="notYet"/>Not Yet Replied
			<br/>
			Codes:
			<input type="text" name="codes"/>
			<br/>
			Subject:
			<input type="text" name="subject" size="40"/>
			<br/>
			Body:<br/>
			<i>must include $name and $code</i>
			<br/>
			<textarea name="body"></textarea>
			<br/>
			<input type="submit" value="Prepare"/>
		</form>
	</div>
	
	<br/>
	<br/>
	<div>
		<form method="post" action="saidNo">
			Said no (codes): <input type="text" name="codes"/>
			<input type="submit" />
		</form>
	</div>
	<br/>
	<br/>
	<div>
		<form method="post" action="saidYes">
			Said yes (codes): <input type="text" name="codes"/>
			<input type="submit" />
		</form>
	</div>
</div>

<fieldset>
	<legend>Invitation Groups</legend>
	
	<form method="post" action="admin-add-group">
		<input type="hidden" name="_invitedTours" value=""/>
		<input type="hidden" name="_invitedRehearsal" value=""/>
	
		Group Name: <input type="text" name="groupName"/><br/>
		Language:
		<select name="groupLanguage">
			<option value="en">English</option>
			<option value="es">Spanish</option>
		</select>
		<br/>
		Email: <input type="text" name="email"/><br/>
		
		Invited Tours? <input type="checkbox" name="invitedTours"/><br/>
		Invited Rehearsal? <input type="checkbox" name="invitedRehearsal"/><br/>
		
		<input type="submit" value="Add"/>
	</form>
	
	<table>
		<tr>
			<th>Group</th>
			<th>Email</th>
			<th>Code</th>
			<th>First View</th>
			<th>Last View</th>
		</tr>
		<c:forEach var="group" items="${ groups }">
			<tr>
				<td><a href="?view=${ group.id }">${ group.groupName }</a></td>
				<td>${ group.email }</td>
				<td>${ group.id }</td>
				<td>${ group.firstView }</td>
				<td>${ group.lastView }</td>
			</tr>
		</c:forEach>
	</table>
	
</fieldset>	

<c:if test="${ not empty group }">
	<fieldset>
		<legend>Group: ${ group.groupName }</legend>
		Name: ${ group.groupName }<br/>
		Email: ${ group.email }<br/>
		Code: ${ group.id }<br/>
		Language: ${ group.language }<br/>
		Invited Tours: ${ group.invitedTours }<br/>
		Invited Rehearsal: ${ group.invitedRehearsal }<br/>
		First view: ${ group.firstView }<br/>
		Last view: ${ group.lastView }<br/>
		<br/>
		Guests:
		<table>
			<tr>
				<th>Name</th>
				<th>RSVP</th>
				<th>Wed</th>
				<th>Thu</th>
				<th>Fri</th>
				<th>Rehearsal</th>
				<th>Ceremony</th>
				<th>Fiesta</th>
			</tr>
			<form method="post" action="admin-add-invitee">
				<input type="hidden" name="group" value="${ group.id }"/>
			<tr>
				<td>Add: <input type="text" name="name"/></td>
				<td colspan="2">
					<input type="submit" value="Add"/>
				</td>
			</tr>
			</form>
			<c:forEach var="invitee" items="${ group.invitees }">
				<tr>
					<td>${ invitee.name }</td>
					<td>${ invitee.attending }</td>
					<td>${ invitee.attendingWednesday }</td>
					<td>${ invitee.attendingThursday }</td>
					<td>${ invitee.attendingFriday }</td>
					<td>${ invitee.attendingRehearsal }</td>
					<td>${ invitee.attendingCeremony }</td>
					<td>${ invitee.attendingFiesta }</td>
				</tr>
			</c:forEach>
		</table>
	</fieldset>
</c:if>

<div style="margin-top: 1em">
	<table cellspacing="0" cellpadding="2" border="1">
		<tr>
			<th>Code</th>
			<th>Group</th>
			<th>Invitee</th>
			<th>Wednesday</th>
			<th>Thursday</th>
			<th>Friday</th>
			<th>Ceremony</th>
			<th>Fiesta</th>
		</tr>
		<c:forEach var="group" items="${ groups }">
			<c:forEach var="invitee" items="${ group.invitees }">
				<tr>
					<td>${ group.id }
					<td>${ group.groupName }</td>
					<td>${ invitee.name }</td>
					<td>
						<c:choose>
							<c:when test="${ invitee.attendingWednesday == null }">
								?
							</c:when>
							<c:when test="${ invitee.attendingWednesday }">
								Yes
							</c:when>
							<c:otherwise>
								No
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${ invitee.attendingThursday == null }">
								?
							</c:when>
							<c:when test="${ invitee.attendingThursday }">
								Yes
							</c:when>
							<c:otherwise>
								No
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${ invitee.attendingFriday == null }">
								?
							</c:when>
							<c:when test="${ invitee.attendingFriday }">
								Yes
							</c:when>
							<c:otherwise>
								No
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${ invitee.attendingCeremony == null }">
								?
							</c:when>
							<c:when test="${ invitee.attendingCeremony }">
								Yes
							</c:when>
							<c:otherwise>
								No
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${ invitee.attendingFiesta == null }">
								?
							</c:when>
							<c:when test="${ invitee.attendingFiesta }">
								Yes
							</c:when>
							<c:otherwise>
								No
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
		</c:forEach>
	</table>
</div>

<table>
	<tr>
		<th>English groups coming</th>
		<th>Spanish groups coming</th>
	</tr>
	<tr valign="top">
		<td>
			<c:forEach var="g" items="${ englishComing }">
				${ g }<br/>
			</c:forEach>
		</td>
		<td>
			<c:forEach var="g" items="${ spanishComing }">
				${ g }<br/>
			</c:forEach>
		</td>
	</tr>
</table>
	
	</body>
</html>