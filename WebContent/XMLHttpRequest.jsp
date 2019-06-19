<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	function sendRequest(){
		var httpRequest;
		function createRequest() {
			// Explorer 7이상, 크롬, 파이어폭스, 사파리, 오페라
			if(window.XMLHttpRequest) {
				return new XMLHttpRequest();
			} else {	// Explorer 6이하 버전
				return new ActiveXObject("Microsoft.XMLHTTP");
			}
		}

		function receiveResponse() {
			if(httpRequest.readyState == XMLHttpRequest.DONE && httpRequest.status == 200) {
				document.getElementById("text").innerHTML = httpRequest.responseText;
			}
		}
		
		httpRequest = createRequest();	// XMLHttpRequest 객체를 생성
		httpRequest.onreadystatechange = receiveResponse;	// XMLHttpRequest 객체의 현재 상태를 파악
		httpRequest.open("GET", "ajaxTest.txt");	// GET방식의 비동기식 요청으로 Http요청을 생성한다.
		httpRequest.send();	// Http 요청을 보낸다.
		
	}
</script>
</head>
<body>
	<h1>XMLHttpRequest 객체 생성</h1>
	<button type="button" onclick="sendRequest()">Ajax 요청</button>
	<p id="text"></p>
	
</body>
</html>