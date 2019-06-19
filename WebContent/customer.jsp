<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax Example</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="js/jquery-3.3.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script>
	var httpReq = null;

	function getInstance() {
		var httpReq = null;

		try {
			httpReq = new XMLHttpRequest();
		} catch (Ex) {
			try {
				httpReq = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (Ex2) {
				httpReq = null;
			}
		}
		return httpReq;
	}

	function insertCustomer() {
		httpReq = getInstance();

		var id = document.getElementById("id").value;
		var passwd = document.getElementById("passwd").value;
		var name = document.getElementById("name").value;
		var tel = document.getElementById("tel").value;
		var address = document.getElementById("address").value;

		var url = "customerInsert.jsp?id=" + id + "&passwd=" + passwd;
		url += "&name=" + name + "&tel=" + tel + "&address=" + address;
		alert(url);

		httpReq.onreadystatechange = handleInsertCustomer;
		httpReq.open("GET", url, true);
		httpReq.send();
	}

	function handleInsertCustomer() {
		if (httpReq.readyState == 4) {
			document.inForm.id.value = "";
			document.inForm.passwd.value = "";
			document.inForm.name.value = "";
			document.inForm.reg_date.value = "";
			document.inForm.tel.value = "";
			document.inForm.address.value = "";
			alert("입력이 완료되었습니다.");
		}
	}
</script>
</head>
<body>
	<h2>사용자 정보</h2>
	<form name="inForm" method="post">
		<table class="table table-bordered table-striped">
			<tr>
				<td width="100" align="center">아이디</td>
				<td width="100" align="center">비밀번호</td>
				<td width="100" align="center">이름</td>
				<td width="100" align="center">가입일자</td>
				<td width="100" align="center">전화번호</td>
				<td width="100" align="center">주소</td>
			</tr>
			<tr>
				<td><input type="text" name="id" id="id"></td>
				<td><input type="text" name="passwd" id="passwd"></td>
				<td><input type="text" name="name" id="name"></td>
				<td><input type="text" name="reg_date" id="reg_date"></td>
				<td><input type="text" name="tel" id="tel"></td>
				<td><input type="text" name="address" id="address"></td>
				<td colspan="6" align="center">
					<input class="btn btn-info btn-sm" type="button" value="등록" onclick="insertCustomer();">
				</td>
			</tr>
		</table>
	</form>

	<hr>
	<p>
		<input type="text" size="10" name="sName" id="sName">
		<input type="button" value="이름으로검색" onClick="showCustomerName();">
	</p>
	<div id="txtHintN">여기에 데이터를 가져올겁니다.</div>

	<hr>
	<h2>고객 명단</h2>
	<p>
		<input type="button" value="고객명단" onclick="showCustomerList()">
	</p>
	<div id="textHint">여기에 고객명단을 가져올겁니다.</div>

	<script>
		function showCustomerName() {
			var xhttp;
			str = document.getElementById("sName").value;

			if (str == "") {
				document.getElementById("txtHintN").innerHTML = "";
				return;
			}
			xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					document.getElementById("txtHintN").innerHTML = this.responseText;
				}
			};
			xhttp.open("GET", "customerGetTableName.jsp?q=" + str, true);
			xhttp.send();
		}

		function showCustomerList() {
			var xhttp;
			xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					document.getElementById("txtHint").innerHTML = this.responseText;
				}
			};
			xhttp.open("GET", "customerGetTableData.jsp", true);
			xhttp.send();
		}
	</script>
</body>
</html>
