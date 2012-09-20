<%@ include file="/WEB-INF/template/include.jsp"%>

<%!
int CONTENT_WIDTH = 1000;
int CONTENT_HEIGHT = 570;
int SPACING = 10;
int BUTTON_WIDTH = 180;
int BUTTON_HEIGHT = 160;
int BETWEEN_BUTTONS_X = (CONTENT_WIDTH - 4 * BUTTON_WIDTH) / 4;
int BETWEEN_BUTTONS_Y = (CONTENT_HEIGHT - 2 * BUTTON_HEIGHT) / 3;
int FIRST_BUTTON_X = BETWEEN_BUTTONS_X / 2;
int FIRST_BUTTON_Y = BETWEEN_BUTTONS_Y;

int PICTURE_WIDTH = 750;
int MAP_WIDTH = CONTENT_WIDTH - PICTURE_WIDTH - 20;

String BROWN_COLOR = "#331a00";
String YELLOW_COLOR = "#cc9900";
String ORANGE_COLOR = "#ff8533";

String buttonCss(int x, int y) {
	int left = FIRST_BUTTON_X + x * (BUTTON_WIDTH + BETWEEN_BUTTONS_X);
	int top = FIRST_BUTTON_Y + y * (BUTTON_HEIGHT + BETWEEN_BUTTONS_Y);
	return "left: " + left + "px; \n top: " + top + "px;";
}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
	<head>
		<link href='http://fonts.googleapis.com/css?family=Montez|Amaranth' rel='stylesheet' type='text/css'/>
		<title><spring:message code="invite.title" /></title>
		<!--
		<script src="scripts/jquery-1.5.min.js"></script>
		<script src="scripts/jquery-ui-1.8.9.custom.min.js"></script>
		<script src="http://code.jquery.com/jquery-1.6.4.js"></script>
		 -->
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
		<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/jquery-ui.min.js"></script>
		<script src="scripts/jquery.address-1.4.min.js"></script>
		<script src="scripts/jquery.cookie.js"></script>
		<script src="scripts/jquery.jplayer.min.js"></script>
		<script src="scripts/jquery.metadata.js"></script>
		<script src="scripts/jquery.mb.miniPlayer.js"></script>
		<link href="styles/ui-custom/jquery-ui-1.8.16.custom.css" rel="stylesheet" type="text/css"></link>
		<link href="styles/miniplayer.css" rel="stylesheet" type="text/css"></link>
	</head>
	<body>

<style>
.ui-widget {
	font-size: 100%;
}

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
	border: 2px <%= YELLOW_COLOR %> solid;
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
	cursor: pointer;
}

#content {
	width: <%= CONTENT_WIDTH %>px;
	height: <%= CONTENT_HEIGHT %>px;
	margin: auto;
	position: relative;
	top: <%= SPACING %>px;
}

#selected-page {
	position: absolute;
	width: 100%;
	height: 100%;
}

#after-selected-page {
	position: relative;
	margin-top: 10px;
	font-size: 12pt;
	font-family: 'Amaranth', sans-serif;
}

#selected-page-empty {
	position: absolute;
	width: 100%;
	height: 100%;
}

.last-guest-book-post {
	font-family: 'Amaranth', sans-serif;
	font-size: 12pt;
	text-align: left;
	padding: 6px;
}

#selected-page-content {
	border-radius: <%= SPACING %>px;
	-moz-border-radius: <%= SPACING %>px;
	border: 2px <%= YELLOW_COLOR %> solid;
	padding: 5px 10px;
	margin: 0px;
	background-color: white;
	filter:alpha(opacity=90);
	opacity:0.9;
	font-size: 14pt;
	font-family: 'Amaranth', sans-serif;
}

#selected-page-title {
	border-radius: <%= SPACING / 2 %>px;
	-moz-border-radius: <%= SPACING / 2 %>px;
	border: 2px <%= YELLOW_COLOR %> solid;
	filter:alpha(opacity=90);
	opacity:0.9;
	padding: 5px 10px;
	margin: 0px;
	background-color: <%= YELLOW_COLOR %>;
	color: <%= BROWN_COLOR %>;
	font-family: 'Montez', cursive;
	text-align: center;
	font-size: 24pt;
	font-weight: bold;
	margin-bottom: <%= SPACING %>px;
}

#close-selected-page {
	position: absolute;
	left: 0;
	top: 0;
	cursor: pointer;
}

#buttons {
	position: absolute;
	width: 100%;
	height: 100%;
	background-image: url(images/background-wedding-dark-yellow.png);
	border-radius: <%= SPACING %>px;
	-moz-border-radius: <%= SPACING %>px;
	border: 2px <%= YELLOW_COLOR %> solid;
}

.button {
	position: absolute;
	border-radius: <%= SPACING %>px;
	-moz-border-radius: <%= SPACING %>px;
	border: 2px <%= YELLOW_COLOR %> solid;
	width: <%= BUTTON_WIDTH %>px;
	height: <%= BUTTON_HEIGHT %>px;
	text-align: center;
	line-height: <%= BUTTON_HEIGHT - 8 %>px;
	filter:alpha(opacity=90);
	opacity:0.9;
	background-color: white;
	font-size: 24pt;
	font-family: 'Montez', cursive;
	cursor: pointer;
}

#about-us-button {
	<%= buttonCss(0, 0) %>
}

#about-us-button:hover {
	background: url(images/small-us.jpg)
}


#getting-to-cali-button {
	<%= buttonCss(1, 0) %>
}

#getting-to-cali-button:hover {
	background: url(images/small-la-merced.jpg)
}

#rsvp-button {
	<%= buttonCss(2, 0) %>
}

#rsvp-button:hover {
	background: url(images/small-rsvp.jpg)
}

#picture-gallery-button {
	<%= buttonCss(0, 1) %>
}

#picture-gallery-button:hover {
	background: url(images/small-photos.jpg)
}

#schedule-button {
	<%= buttonCss(1, 1) %>
}

#schedule-button:hover {
	background: url(images/small-schedule.jpg)
}

#gift-button {
	<%= buttonCss(2, 1) %>
}

#gift-button:hover {
	background: url(images/small-gift.jpg)
}

#guest-book-button {
	left: <%= Math.round(3.5 * BETWEEN_BUTTONS_X + 3 * BUTTON_WIDTH) %>px;
	top: <%= BETWEEN_BUTTONS_Y %>px;
	height: <%= 2 * BUTTON_HEIGHT + BETWEEN_BUTTONS_Y %>px;
	line-height: inherit;
	overflow: hidden;
}

#guest-book-button:hover {
	background-color: <%= YELLOW_COLOR %>;
}

#got-your-reply {
	border-radius: <%= SPACING %>px;
	-moz-border-radius: <%= SPACING %>px;
	border: 2px <%= YELLOW_COLOR %> solid;
	color: <%= YELLOW_COLOR %>;
	font-family: 'Montez', cursive;
	font-size: 1.2em;
	padding: 4px;
}

.mbMiniPlayer {
	position: fixed;
	right: 0;
	bottom: 0;
}

#change-language {
	position: fixed;
	left: 0;
	bottom: 0;
	font-family: 'Amaranth', sans-serif;
	border-radius: <%= SPACING %>px;
	-moz-border-radius: <%= SPACING %>px;
	border: 2px <%= YELLOW_COLOR %> solid;
	color: <%= YELLOW_COLOR %>;
	font-family: 'Amaranth', sans-serif;
	padding: 4px;
	background-color: <%= BROWN_COLOR %>;	
}

#change-language > a {
	color: <%= YELLOW_COLOR %>;
}

.comment-author {
	padding-left: 30px;
	font-size: 0.8em;
}

.quiz-question {
	font-size: 1.4em;
}

.quiz-answer {
	cursor: pointer;
	font-size: 1.2em;
}

.quiz-answer:hover {
	background-color: <%= YELLOW_COLOR %>;
}

.wrong-quiz-answer {
	margin-left: 1em;
	background-color: <%= YELLOW_COLOR %>;
}

.disabled-quiz-answer {
	cursor: auto;
	background-color: white !important;
}

.right-quiz-answer {
	margin: 4px;
	padding: 6px;
	border-radius: <%= SPACING %>px;
	-moz-border-radius: <%= SPACING %>px;
	border: 2px <%= YELLOW_COLOR %> solid;
}

.next-quiz-question {
	float: right;
}

</style>

<div id="heading" class="our-font yellow-color semi-opaque text-box">
	<spring:message code="invite.title"/>
</div>

<div id="content">

	<div id="buttons">
		<div class="button" id="about-us-button" title='<spring:message code="invite.aboutUs"/>' href="quiz">
			<spring:message code="invite.aboutUs"/>
		</div>
		<div class="button" id="getting-to-cali-button" title='<spring:message code="invite.gettingToCali"/>' href="travel">
			<spring:message code="invite.gettingToCali"/>
		</div>
		<div class="button" id="rsvp-button" title='<spring:message code="invite.rsvp"/>' href="rsvp">
			<spring:message code="invite.rsvp"/>
			<%--
			<c:if test="${ not empty group && group.numReplied > 0}">
			<!--
				<br/>
				<small>
					<c:if test="${ fn:length(group.attending) > 0 }">
						Yes:
						<c:forEach var="invitee" items="${ group.attending }" varStatus="status">
							${ invitee.name }<c:if test="${ not status.last }">,</c:if>
						</c:forEach>
						<br/>
					</c:if>
					<c:if test="${ fn:length(group.notAttending) > 0 }">
						No:
						<c:forEach var="invitee" items="${ group.notAttending }" varStatus="status">
							${ invitee.name }<c:if test="${ not status.last }">,</c:if>
						</c:forEach>
					</c:if>
				</small>
			 -->
			 	<small>
			 		<c:forEach var="invitee" items="${ group.invitees }">
			 			<br/>${ invitee.name }: <c:choose><c:when test="${ invitee.attending }">Yes</c:when><c:otherwise>No</c:otherwise></c:choose>
			 		</c:forEach>
			 	</small>
			</c:if>
			--%>
		</div>
		<div class="button" id="picture-gallery-button" title='<spring:message code="invite.pictureGallery"/>' href="photos" noDecoration="true">
			<spring:message code="invite.pictureGallery"/>
		</div>
		<div class="button" id="schedule-button" title='<spring:message code="invite.schedule"/>' href="schedule">
			<spring:message code="invite.schedule"/>
		</div>
		<div class="button" id="gift-button" title='<spring:message code="invite.gifts"/>' href="gifts">
			<spring:message code="invite.gifts"/>
		</div>
		<div class="button" id="guest-book-button" title='<spring:message code="invite.guestBook"/>' href="guestbook">
			<spring:message code="invite.guestBook"/>
			<p class="last-guest-book-post">
				${ lastPost.text }
				<br/>
				<span class="comment-author">-${ lastPost.author }</span>
			</p>
		</div>
	</div>
	
	<div id="selected-page" style="display: none">
		<div id="selected-page-title">
			<div id="selected-page-title-text"></div>
			<div id="close-selected-page"><img src="images/arrow-left.png"/></div>
		</div>
		<div id="selected-page-content"></div>
		<div id="after-selected-page" style="display: none"></div>
	</div>
		
	<div id="selected-page-empty" style="display: none"></div>
	
</div>

<div id="change-language">
	<a href="?language=en">English</a> | <a href="?language=es">Español</a>
</div>
<a class="audio {skin:'orange', mp3:'music/cali_pachanguero_converted.mp3'}" href="music/cali_pachanguero_converted.mp3">Cali Pachanguero</a>

<script>
function preload(arrayOfImages) {
    $(arrayOfImages).each(function() {
        $('<img/>')[0].src = this;
    });
}

function sendButtonsLeft(toShow) {
	$('#buttons').animate({
		'left': '-<%= 2 * CONTENT_WIDTH %>px'
	}, 1000);
	$(toShow).fadeIn(1000);
}

function bringButtonsBack() {
	$.address.value('/');
	doBringButtonsBack();
}

function doBringButtonsBack() {
	$('#selected-page-empty')
		.fadeOut(1000, function() {
			$('#selected-page-empty')
				.html('');
		});
	$('#selected-page')
		.fadeOut(1000, function() {
			$('#selected-page-content')
				.html('');
			$('#selected-page-title-text')
				.html('');
			$('#after-selected-page')
			.html('');
		});
	$('#buttons')
		.animate({
			'left': '0px'
		});
}

var currentFragment;
function loadFragment(pageName, noDecoration) {
	if (noDecoration)
		$.address.value(pageName + '-nodecor');
	else
		$.address.value(pageName);
	doLoadFragment(pageName, noDecoration);
}

function doLoadFragment(pageName, noDecoration) {
	currentFragment = pageName;
	if (noDecoration) {
		$('#selected-page-empty')
			.load('fragment/' + pageName, { forcePost: true });
		sendButtonsLeft('#selected-page-empty');
	} else {
		$('#selected-page-content')
			.load('fragment/' + pageName, { forcePost: true });
		sendButtonsLeft('#selected-page');
	}
}

function reloadFragment() {
	$('#after-selected-page').html('').hide();
	doLoadFragment(currentFragment);
}

var currentQuestion;
var currentQuestionNumber;
function showQuizQuestion(num) {
	destroyCurrentQuizQuestion();
	var question = questions[num];
	if (question) {
		currentQuestionNumber = num;
		showQuestion(question);
	} else {
		// TODO show done with quiz message
		currentQuestion = null;
		currentQuestionNumber = -1;
		bringButtonsBack();
	}
}

function showQuestion(question) {
	currentQuestion = question;
	var html = '<p class="quiz-question">' + question.question + '</p>';
	html += '<ol>';
	for (var i = 0; i < question.answers.length; ++i) {
		html += '<li><span class="quiz-answer" title="' + (i + 1) + '">' + question.answers[i] + '</span></li>';
	}
	html += '</ol>';
	$('#current-quiz-question').html(html);
	$('.quiz-answer').click(function() {
		choseAnswer($(this));
	});
}

function choseAnswer(selected) {
	var answer = selected.attr('title')
	if (currentQuestion != null && currentQuestion.correctAnswer == answer) {
		var html = '<br/><div class="right-quiz-answer">';
		html += currentQuestion.correctMessage;
		html += '<button class="next-quiz-question"><spring:message code="invite.goOn"/></button>';
		html += '<div style="clear:both"></div></div>';
		selected.append(html);
		$('.next-quiz-question').button().click(function() {
			showQuizQuestion(currentQuestionNumber + 1);
		});
		$('.quiz-answer').unbind('click');
	} else {
		var msg = currentQuestion.incorrectMessage;
		if (msg == null)
			msg = '<spring:message code="invite.tryAgain"/>';
		selected
			.append('<span class="wrong-quiz-answer">' + msg + '</span>')
			.unbind('click')
			.addClass('disabled-quiz-answer');
	}
}

function destroyCurrentQuizQuestion() {
	// TODO destroy
	$('#current-quiz-question').html('');
	currentQuestion = null;
}

var pictureList = new Array();
var currentPicture = -1;
pictureList.push({ url: 'diana-goodbye.jpg', caption: '<spring:message code="picture.diana-goodbye.caption" javaScriptEscape="true"/>', mapX: 290, mapY: 237 });
pictureList.push({ url: 'umfulozi.jpg', caption: '<spring:message code="picture.umfulozi.caption" javaScriptEscape="true"/>', mapX: 566, mapY: 462 });
pictureList.push({ url: 'boston.jpg', caption: '<spring:message code="picture.boston.caption" javaScriptEscape="true"/>', mapX: 290, mapY: 237 });
pictureList.push({ url: 'mexico.jpg', caption: '<spring:message code="picture.mexico.caption" javaScriptEscape="true"/>', mapX: 246, mapY: 309 });
pictureList.push({ url: 'golden-gate.jpg', caption: '<spring:message code="picture.golden-gate.caption" javaScriptEscape="true"/>', mapX: 148, mapY: 256 });
pictureList.push({ url: 'monica-goodbye.jpg', caption: '<spring:message code="picture.monica-goodbye.caption" javaScriptEscape="true"/>', mapX: 290, mapY: 237 });
pictureList.push({ url: 'seattle-boat.jpg', caption: '<spring:message code="picture.seattle-boat.caption" javaScriptEscape="true"/>', mapX: 137, mapY: 200 });
pictureList.push({ url: 'sancocho.jpg', caption: '<spring:message code="picture.sancocho.caption" javaScriptEscape="true"/>', mapX: 286, mapY: 362 });
pictureList.push({ url: 'ba-coffee.jpg', caption: '<spring:message code="picture.ba-coffee.caption" javaScriptEscape="true"/>', mapX: 325, mapY: 472 });
pictureList.push({ url: 'cartagena.jpg', caption: '<spring:message code="picture.cartagena.caption" javaScriptEscape="true"/>', mapX: 286, mapY: 362 });
pictureList.push({ url: 'colorful-friends.jpg', caption: '<spring:message code="picture.colorful-friends.caption" javaScriptEscape="true"/>', mapX: 286, mapY: 362 });
pictureList.push({ url: 'darius-birthday.jpg', caption: '<spring:message code="picture.darius-birthday.caption" javaScriptEscape="true"/>', mapX: 290, mapY: 237 });
pictureList.push({ url: 'ba-tango.jpg', caption: '<spring:message code="picture.ba-tango.caption" javaScriptEscape="true"/>', mapX: 325, mapY: 472 });
pictureList.push({ url: 'iguazu.jpg', caption: '<spring:message code="picture.iguazu.caption" javaScriptEscape="true"/>', mapX: 334, mapY: 449 });
pictureList.push({ url: 'basketball.jpg', caption: '<spring:message code="picture.basketball.caption" javaScriptEscape="true"/>', mapX: 152, mapY: 259 });
pictureList.push({ url: 'jazayeri-holidays.jpg', caption: '<spring:message code="picture.jazayeri-holidays.caption" javaScriptEscape="true"/>', mapX: 152, mapY: 259 });
pictureList.push({ url: 'jamundi-primos.jpg', caption: '<spring:message code="picture.jamundi-primos.caption" javaScriptEscape="true"/>', mapX: 286, mapY: 362 });
pictureList.push({ url: 'dinner.jpg', caption: '<spring:message code="picture.dinner.caption" javaScriptEscape="true"/>', mapX: 137, mapY: 200 });
pictureList.push({ url: 'hawaii-rock.jpg', caption: '<spring:message code="picture.hawaii-rock.caption" javaScriptEscape="true"/>', mapX: 52, mapY: 310 });
pictureList.push({ url: 'bogota.jpg', caption: '<spring:message code="picture.bogota.caption" javaScriptEscape="true"/>', mapX: 286, mapY: 362 });
pictureList.push({ url: 'luau-parent.jpg', caption: '<spring:message code="picture.luau-parent.caption" javaScriptEscape="true"/>', mapX: 52, mapY: 310 });
pictureList.push({ url: 'consuelo.jpg', caption: '<spring:message code="picture.consuelo.caption" javaScriptEscape="true"/>', mapX: 282, mapY: 246 });
pictureList.push({ url: 'baltimore-family.jpg', caption: '<spring:message code="picture.baltimore-family.caption" javaScriptEscape="true"/>', mapX: 277, mapY: 255 });
pictureList.push({ url: 'mission.jpg', caption: '<spring:message code="picture.mission.caption" javaScriptEscape="true"/>', mapX: 152, mapY: 259 });
pictureList.push({ url: 'seattle-friends.jpg', caption: '<spring:message code="picture.seattle-friends.caption" javaScriptEscape="true"/>', mapX: 137, mapY: 200 });
pictureList.push({ url: 'swiss-lights.jpg', caption: '<spring:message code="picture.swiss-lights.caption" javaScriptEscape="true"/>', mapX: 513, mapY: 223 });
pictureList.push({ url: 'tulips.jpg', caption: '<spring:message code="picture.tulips.caption" javaScriptEscape="true"/>', mapX: 149, mapY: 223 });
pictureList.push({ url: 'rainier.jpg', caption: '<spring:message code="picture.rainier.caption" javaScriptEscape="true"/>', mapX: 155, mapY: 229 });

function showPicture(opts) {
	var mapLeft = opts.mapX - <%= MAP_WIDTH / 2 %>;
	var x = <%= MAP_WIDTH / 2 %>;
	var y = opts.mapY;
	if (mapLeft < 0) {
		x += mapLeft;
		mapLeft = 0;
	}
	$('#picture')
		.animate({ opacity: 0, filter: 'alpha(opacity=0)' }, function() {
			$(this).css('background-image', 'url(images/' + opts.url + ')')
		})	
		.animate({ opacity: 1, filter: 'alpha(opacity=100)'  });
	$('#picture-map').animate({
		left: '-' + mapLeft + 'px'
	}, 500, 'swing');
	$('#map-caption').hide();
	$('#map-marker').show().animate({
		left: x + 'px', top: y + 'px'
	}, 500, 'swing', function() {
		$('#map-caption').html(opts.caption).fadeIn();
	});
}

function nextPicture() {
	++currentPicture;
	if (currentPicture >= pictureList.length) {
		currentPicture = -1;
		bringButtonsBack();
		return;
	}
	showPicture(pictureList[currentPicture]);
	if (currentPicture + 1 < pictureList.length) {
		preload([ 'images/' + pictureList[currentPicture + 1].url ])
	}
}

function previousPicture() {
	--currentPicture;
	if (currentPicture < 0)
		currentPicture = pictureList.length - 1;
	showPicture(pictureList[currentPicture]);
}

function endsWith(str, suffix) {
    return str.indexOf(suffix, str.length - suffix.length) !== -1;
}

$(function() {
	$('.button').click(function() {
		var decor = $(this).attr('noDecoration');
		var title = $(this).attr('title');
		$('#selected-page-title').show();
		$('#selected-page-title-text').html(title);
		var fragment = $(this).attr('href');
		loadFragment(fragment, decor);
	});
	$('#heading, #close-selected-page').click(function() {
		$('#selected-page iframe').hide(0);
		bringButtonsBack();
	});
	$('.audio').mb_miniPlayer({
		width:240,
		autoPlay: true,
        inLine: false,
        showRew: false,
        swfPath: '/scripts'
	});
	
	$.address.externalChange(function(event) {
		if (event.value == '/')
			bringButtonsBack();
		else if (endsWith(event.value, '-nodecor'))
			doLoadFragment(event.value.substring(0, event.value.length - 8), true);
		else
			doLoadFragment(event.value, false);
	});
	
	preload([ 'images/small-us.jpg', 'images/small-la-merced.jpg', 'images/small-rsvp.jpg',
	          'images/small-photos.jpg', 'images/small-schedule.jpg', 'images/small-gift.jpg' ]);
});
</script>
		
	</body>
</html>