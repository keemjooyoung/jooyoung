<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax Example</title>
<script src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#requestBtn").on("click", function() {
			$("#text").load("ajaxTest.txt");
		});
	});
</script>
</head>
<body>
	<h1>Ajax(Asynchronous JavaScript And XML)</h1>
	<p id="text">이 단락에 다른 텍스트 불러오기</p>
	<h1></h1>
	<button id="requestBtn">Data Loading</button>
</body>
</html>