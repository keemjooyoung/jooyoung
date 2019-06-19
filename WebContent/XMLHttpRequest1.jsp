<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Ajax Request</title>
	<script>
		function sendRequest() {
			var httpRequest = new XMLHttpRequest();
			httpRequest.onreadystatechange = function() {
				if (httpRequest.readyState == XMLHttpRequest.DONE && httpRequest.status == 200 ) {
					document.getElementById("text").innerHTML = httpRequest.responseText;
				}
			};
			// GET 방식으로 요청을 보내면서 데이터를 동시에 전달함.
			httpRequest.open("GET", "ajaxTest.txt", true);
			httpRequest.send();
		}
	</script>
</head>

<body>

	<h1>GET 방식의 요청</h1>
	<button type="button" onclick="sendRequest()">GET 방식으로 요청 보내기!</button>
	<p id="text"></p>
	
</body>

</html>