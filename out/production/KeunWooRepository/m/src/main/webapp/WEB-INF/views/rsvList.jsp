<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<html>
<head>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<title>Home</title>
<style>
table {
	border-collapse: collapse;
	margin: 30px auto;
}

td {
	border: 1px solid lightgray;
	width: 100px;
	height: 20px;
	text-align: center;

}

.page {
	cursor: pointer;
}

.page:hover {
	color: blue;
	font-weight: bold;
}
</style>
<script>
	function search() {
		var name = document.getElementById("name").value;
		var chk = document.getElementById("chk").checked;
		location.href = "/rsvList?name=" + name + "&chk=" + chk;
	}

	function search2() {
		if (window.event.keyCode == 13) {
			search();
		}
	}
</script>
</head>
<body>
	<table>
		<thead>
			<tr>
				<td>예약번호</td>
				<td>예약자명</td>
				<td>예약일</td>
				<td>연락처</td>
			<tr>
		</thead>
		<c:forEach var="row" items="${list}">
			<tr>
				<td>${row.RSV_NO}</td>
				<td><a href="/rsvDetail?rsvNo=${row.RSV_NO}">${row.NAME}</a></td>
				<td>${row.RSV_DT}</td>
				<td>${row.CONTACT}</td>
			<tr>
		</c:forEach>
		<tr>
			<td colspan="4"><input type="text" id="name" onkeyup="search2()">
				<input type="button" value="조회" onclick="search()"><br>
				<input type="checkbox" id="chk"
				<c:if test="${map.chk == 'true'}"> checked </c:if>>삭제건 포함</td>
		</tr>
	</table>
</body>
</html>
