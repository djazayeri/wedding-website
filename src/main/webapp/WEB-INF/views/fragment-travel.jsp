<%@ include file="/WEB-INF/template/include.jsp"%>
<%!
int SPACING = 10;
String BROWN_COLOR = "#331a00";
String YELLOW_COLOR = "#cc9900";
String ORANGE_COLOR = "#ff8533";
%>
<script>
$(function() {
	$('#travel-help').click(function(event) {
		$('.travel-help').toggle();
		event.preventDefault();
	});
	$('#hotel-details').click(function(event) {
		$('.hotel-details').toggle();
		event.preventDefault();
	});
	$('#visa-help').click(function(event) {
		$('.visa-help').toggle();
		event.preventDefault();
	});
	$('#selected-page-title-text').html('<spring:message code="invite.gettingToCali"/>');
});
</script>
<style>
	h3 {
		background-color: <%= YELLOW_COLOR %>;
		padding-left: 10px;
		border-radius: 5px;
		-moz-border-radius: 5px;
	}
	.hotel-box {
		float:left;
		margin: 20px;
		border-radius: 5px;
		-moz-border-radius: 5px;
		border: 1px gray solid;
	}
	.hotel-box > * {
		padding: 5px 10px 5px 10px;
	}
	.hotel-name {
		background-color: #e0e0e0;
		border-radius: 5px;
		-moz-border-radius: 5px;
		font-weight: bold;
	}
	.hotel-description {
		font-size: 0.8em;
	}
	.hotel-prices {
	}
</style>

<h3><spring:message code="travel.flights.heading"/></h3>
<spring:message code="travel.flights.text"/>
<spring:message code="travel.flights.shuttle"/>
<a href="#" class="travel-help" id="travel-help">
	<spring:message code="travel.flights.help"/>
</a>
<div class="travel-help" style="display: none">
	<spring:message code="travel.flights.links"/>
</div>

<h3><spring:message code="travel.hotel.heading"/></h3>
<spring:message code="travel.hotel.text"/>

<br/><br/>
<a href="#" class="hotel-details" id="hotel-details">
	<spring:message code="travel.hotel.seeMore"/>
</a>
<div class="hotel-details" style="display: none">
	<spring:message code="travel.hotel.more"/>

	<div style="clear: both"></div>
	
	<div class="hotel-box">
		<div class="hotel-name">Dann Carlton</div>
		<div class="hotel-description"><spring:message code="travel.hotel.dannCarlton"/></div>
		<div class="hotel-prices">
			<spring:message code="travel.hotel.weekdays"/>: 260.000 cop (~$139 US) <br/>
			<spring:message code="travel.hotel.weekends"/>: 190.000 cop (~$101 US)
		</div>
	</div>
	
	<div class="hotel-box">
		<div class="hotel-name">Dann Cali</div>
		<div class="hotel-description"><spring:message code="travel.hotel.dannCali"/></div>
		<div class="hotel-prices">
			<spring:message code="travel.hotel.weekdays"/>: 170.000 cop (~$91 US) <br/>
			<spring:message code="travel.hotel.weekends"/>: 150.000 cop (~$80 US)
		</div>
	</div>
	
	<div style="clear: both"></div>
	<spring:message code="travel.hotel.links"/>
</div>

<h3><spring:message code="travel.visa.heading"/></h3>
<spring:message code="travel.visa.text"/>
<a href="#" class="visa-help" id="visa-help">
	<br/><br/>
	<spring:message code="travel.visa.getHelp"/>
</a>
<div class="visa-help" style="display: none">
	<spring:message code="travel.visa.help"/>
</div>

<h3><spring:message code="travel.cali.heading"/></h3>
<spring:message code="travel.cali.text"/>

<h3><spring:message code="travel.beauty.heading"/></h3>
<spring:message code="travel.beauty.text"/>

<h3><spring:message code="travel.video.heading"/></h3>
<spring:message code="travel.video.text"/>
<br/><br/>
<iframe width="420" height="315" src="http://www.youtube.com/embed/2pHIpQDfocM" frameborder="0" allowfullscreen></iframe>
<iframe width="420" height="315" src="http://www.youtube.com/embed/iQ31bPPiN2c" frameborder="0" allowfullscreen></iframe>