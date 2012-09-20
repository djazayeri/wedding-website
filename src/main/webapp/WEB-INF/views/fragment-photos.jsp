<%@ include file="/WEB-INF/template/include.jsp" %>
<%!
int CONTENT_WIDTH = 1000;
int CONTENT_HEIGHT = 570;
int PICTURE_WIDTH = 750;
int MAP_WIDTH = CONTENT_WIDTH - PICTURE_WIDTH - 20;
int SPACING = 10;

String BROWN_COLOR = "#331a00";
String YELLOW_COLOR = "#cc9900";
String ORANGE_COLOR = "#ff8533";
%>

<style>
#picture {
	position: absolute;
	top: 0;
	left: 0;
	width: <%= PICTURE_WIDTH %>px;
	height: <%= CONTENT_HEIGHT %>px;
	border-radius: <%= SPACING %>px;
	-moz-border-radius: <%= SPACING %>px;
	border: 2px <%= YELLOW_COLOR %> solid;
	overflow: hidden;
	cursor: pointer;
}

#next-picture-arrow {
	position: absolute;
	right: 8px;
	top: 230px;
}

#picture-map-holder {
	background-color: white;
	position: absolute;
	top: 0;
	right: 0; 
	overflow: hidden;
	width: <%= MAP_WIDTH %>px;
	height: <%= CONTENT_HEIGHT %>px;
	border-radius: <%= SPACING %>px;
	-moz-border-radius: <%= SPACING %>px;
	border: 2px <%= YELLOW_COLOR %> solid;
}

#picture-map {
	position: absolute;
}

#map-marker {
	position: absolute;
}

#map-caption {
	position: absolute;
	font-family: 'Amaranth', sans-serif;
	font-size: 1.4em;
	background-color: white;
	text-align: center;
	left: 10px;
	right: 10px;
	bottom: 10px;
 	border: 2px <%= YELLOW_COLOR %> solid;
	border-radius: 5px;
	-moz-border-radius: 5px;
}

#map-caption:hover {
	filter:alpha(opacity=25);
	opacity:0.25;
}
</style>

<div id="picture">
	<img id="next-picture-arrow" src="images/right-arrow.png" style="display: none"/>
	<div id="map-caption"></div>
</div>

<div id="picture-map-holder">
	<img id="picture-map" src="images/background-wedding-yellow.png"/>
	<div id="map-marker" style="display: none"><img src="images/black-star-outline.png"/></div>
</div>

<script>
	$('#picture').click(function() {
		nextPicture();
	}).mouseenter(function() {
		$('#next-picture-arrow').fadeIn('fast');
	}).mouseleave(function() {
		$('#next-picture-arrow').fadeOut('fast');
	});
	nextPicture();
	$('#selected-page-title-text').html('<spring:message code="invite.pictureGallery"/>');
</script>