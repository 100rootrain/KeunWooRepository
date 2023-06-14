<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<html>
<head>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<title>customerList.jsp</title>
<style>
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
	function search(){
		var name = document.getElementById("name").value;
		location.href = "/customerList?name=" + name;
	}
	
	function search2(){
		if(window.event.keyCode == 13) {
			search();
		}
	}
	
	function fnSave(){
		location.href="/customerInsert"
	}
</script>
</head>
<body>
	<table>
		<thead>
			<tr>
				<td>직원번호</td>
				<td>이름</td>
				<td>생일</td>
				<td>주소</td>
				<td>연락처</td>
			<tr>
		</thead>
		<c:forEach var="row" items="${list}">
			<tr>
				<td>${row.CUST_NO}</td>
				<td><a href="/customerDetail?custNo=${row.CUST_NO}">${row.NAME}</a></td>
				<td>${row.BIRTH}</td>
				<td>${row.ADDRESS}</td>
				<td>${row.CONTACT}</td>
			<tr>
		</c:forEach>
		<tr>
		<td colspan="5"><input type="text" id="name" onkeyup="search2()">
		<input type="button" value="조회" onclick="search()"><br>
		<input type="button" value="등록" onclick="fnSave()">
		</tr>
	</table>
</body>
</html>
