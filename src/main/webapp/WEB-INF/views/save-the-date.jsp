<%
	int CONTENT_WIDTH = 1000;
	int CONTENT_HEIGHT = 570;
	int SPACING = 10;
	int SIDE_WIDTH = 315;
	int CENTER_WIDTH = CONTENT_WIDTH - 2 * (SIDE_WIDTH + SPACING);
	
	String BROWN_COLOR = "#331a00";
	String YELLOW_COLOR = "#cc9900";
	String ORANGE_COLOR = "#ff8533";
%>
<html>
	<head>
		<link href='http://fonts.googleapis.com/css?family=Montez|Amaranth' rel='stylesheet' type='text/css'/>
		<title>Save the Date for Darius and Monica's Wedding</title>
	</head>
	<body>

<style>
body {
	background-color: <%= BROWN_COLOR %>;
}

.our-font {
	font-family: 'Montez', cursive;
	text-align: center;
}

.yellow-color {
	color: <%= YELLOW_COLOR %>;
}

.orange-color {
	color: <%= YELLOW_COLOR %>;
}

.our-text-font {
	font-family: 'Amaranth', sans-serif;
}

.text-box {
	border-radius: <%= SPACING %>px;
	-moz-border-radius: <%= SPACING %>px;
	border: 2px <%= YELLOW_COLOR %> solid;
	padding-top: 10px;
	padding-bottom: 10px;
	font-size: 28pt;
}

.box {
	border-radius: <%= SPACING %>px;
	-moz-border-radius: <%= SPACING %>px;
	/* border: 2px <%= YELLOW_COLOR %> solid; */
}

.semi-opaque {
	background-color: <%= BROWN_COLOR %>;
	filter:alpha(opacity=90);
	opacity:0.9;
}

#heading {
	position: relative;
	font-size: 52pt;
	font-weight: bold;
	width: <%= CONTENT_WIDTH %>px;
	margin: auto;
	z-index: 1;
}

#content {
	width: <%= CONTENT_WIDTH %>px;
	height: <%= CONTENT_HEIGHT %>px;
	margin: auto;
	position: relative;
	top: <%= SPACING %>px;
}

#map {
	position: absolute;
	left: 60px;
	top: -250px;
	z-index: -1;
}

.side-column {
	width: <%= SIDE_WIDTH %>px;
	overflow: hidden;
}

#left-text {
	position: absolute;
	left: 0;
	top: 0;
	text-align: center;
	width: <%= SIDE_WIDTH %>px;
}

#right-text {
	position: absolute;
	right: 0;
	top: 0;
	text-align: center;
	width: <%= SIDE_WIDTH %>px;
}

#left-image {
	position: absolute;
	left: 0;
	bottom: 0;
}

#right-image {
	position: absolute;
	right: 0;
	bottom: 0;
}

</style>

<div id="heading" class="our-font yellow-color semi-opaque text-box">
	Darius and Monica are Getting Married!
</div>

<div id="content">

	<div id="left-text" class="our-font orange-color text-box side-column semi-opaque">
		Marque su Calendario!<br/>
		24 Marzo, 2012<br/>
		Cali, Colombia
	</div>
	
	<img id="map" src="images/map.png"/>

	<div id="right-text" class="our-font orange-color text-box side-column semi-opaque">
		Save the Date!<br/>
		March 24, 2012<br/>
		Cali, Colombia
	</div>
	
	<img id="left-image" class="box side-column" src="images/us.jpg"/>
	
	<img id="right-image" class="box side-column" src="images/iglesia-la-merced.jpg"/>

</div>

	</body>
</html>