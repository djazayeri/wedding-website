<%@ taglib prefix="c" uri="/WEB-INF/taglibs/c-rt.tld" %>
<html>
	<head>
	</head>
	<body>

<a href="admin">Back to Admin</a>

<div style="border: 1px black solid;">
	Subject: ${ subject }<br/>
	Body: <br/>
	<pre>${ body }</pre>
</div>

Left to send: ${ numLeft }
<br/>
<br/>
<form method="post">
	<input type="radio" name="sendNum" value="1"/>1
	&nbsp;&nbsp;
	<input type="radio" name="sendNum" value="5"/>5
	&nbsp;&nbsp;
	<input type="radio" name="sendNum" value="10"/>10
	&nbsp;&nbsp;
	<input type="radio" name="sendNum" value="20"/>20
	&nbsp;&nbsp;
	<input type="radio" name="sendNum" value="50"/>50
	&nbsp;&nbsp;
	<input type="radio" name="sendNum" value="100"/>100
	<br/>
	<input type="submit" value="Send"/>
</form>

	</body>