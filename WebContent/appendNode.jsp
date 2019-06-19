<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.3.1.min.js"></script>
</head>
<body>
	<h1>appendNode() Method</h1>
	<h2 id="item">JavaScript</h2>
	<div id="list">
		<p>HTML</p>
		<p>CSS</p>
		<p id="item1">jQuery</p>
		<p>JSP</p>
	</div>
	<p id="text">새로운 단락을 앞에 추가</p>
	<button onclick="appendNode()">append Node</button>
	<button onclick="createNode()">create Node</button>
	<button onclick="removeNode()">remove Node</button>
	<button onclick="cloneNodes()">clone Node</button>
	
	<script>
		function appendNode() {
			var parent = document.getElementById("list");
			var newItem = document.getElementById("item");
			parent.appendChild(newItem);
		}
		
		function createNode() {
			var criterialNode = document.getElementById("text");
			var newNode = document.createElement("p");
			newNode.innerHTML = "새로운 단락";
			document.body.insertBefore(newNode, criterialNode);
		}
		
		function removeNode() {
		//	var parent = document.getElementById("list");
		//	var removeItem = documetn.getElementById("item1");
		//	parent.removeChild(removeItem);
			$("#item1").remove();
		}

		function cloneNodes() {
			var parent = document.getElementById("list");
			var originalItem = document.getElementById("item");
			parent.appendChild(originalItem.cloneNode(true));
		}
	</script>
</body>
</html>