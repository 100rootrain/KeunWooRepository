<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> <!-- fn태그 사용하겠다고 정의함 -->

<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<style>
table {
	margin: auto; /* 화면가운데로 가로만 */
	border-collapse: collapse;
}

td {
	border: 1px solid gray; /* 두께 형식 색상 */
	width: 100px;
	text-align: :center;
}

#btn {
	margin-left: 5px;
}
</style>
<script>
	function search() {
		var txt = $("#txt").val();
		location.href = "/custList?txt=" + txt;
	}

	function enterkey() {
		console.log(window.event.keyCode)
		if (window.event.keyCode == 13) {
			search();
		}
	}
	function fnNew() {
		location.href = "/custNew";
	}
</script>
</head>
<body>
	고객목록
	<table>
		<tr>
			<td colspan=3><input type="button" value="신규" onclick="fnNew()"></td>
		</tr>

		<tr>
			<td>고객ID</td>
			<td>이름</td>
			<td>생년월일</td>
		</tr>

		<c:forEach var="cust" items="${list}">
			<tr>
				<td>${cust.CUST_NO}</td>
				<td><a href="/custDetail?custNo=${cust.CUST_NO}">${cust.NAME}</a></td>
				<td>${cust.BIRTH}</td>
			</tr>
		</c:forEach>
		<c:if test="${fn:length(list) == 0}">
			<tr>
				<td colspan=3>조회된 데이터가 없습니다.</td>
			</tr>
		</c:if>

		<tr>
			<td colspan=3><input type="text" id="txt" value="${txt}"
				onkeyup="enterkey()"> <input type="button"
				onclick="search()" value="조회" id="btn"></td>
		</tr>
	</table>
</body>
</html>
