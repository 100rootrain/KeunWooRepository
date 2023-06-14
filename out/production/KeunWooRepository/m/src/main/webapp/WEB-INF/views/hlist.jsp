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
table{
	margin : auto;
    width : 60%;
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

.td_footer {
	height: 30px;
}
</style>
<script>
	function insert() {
		var t = confirm("등록화면(2)으로 이동 하시겠습니까?")
		if (t == true)
			location.href = "/hinsert"
	}
</script>
</head>
<body>
	<table>
		<thead>
			<tr>
				<td>아이디</td>
				<td>이름</td>
				<td>반</td>
				<td>번호</td>
			<tr>
		</thead>
		<c:forEach var="article" items="${hlist}">
			<tr>
				<td>${article.id}</td>
				<td><a href="/hdetail?id=${article.id}">${article.name}</a></td>
				<td>${article.class1}</td>
				<td>${article.no}</td>
			<tr>
		</c:forEach>
		<tr>
			<td class="td_footer" colspan="4"><input type="button"
				value="등록" onclick="insert()"></td>
		<tr>
	</table>
</body>
</html>
