<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- fn태그 사용하겠다고 정의함 -->

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
	function fnDelete() {
		var custNo = $("#custNo").val();
		var t = confirm("삭제하시겠습니까?");
		if (t == true)
			location.href = "/custDelete?custNo=" + custNo;
	}

	function fnlist() {
		location.href = "/custList"
	}
	function fnUpdate() {
		var custNo = $("#custNo").val();
		location.href = "/custModifyForm?custNo=" + custNo;
	}
</script>
</head>
<body>
	<input type="hidden" value="${custDetail.CUST_NO}" id="custNo">
	<table>
		<tr>
			<td><label>고객번호</label></td>
			<td>${custDetail.CUST_NO}</td>
		</tr>
		<tr>
			<td><label>고객명</label></td>
			<td>${custDetail.NAME}</td>
		</tr>

		<tr>
			<td><label>생년월일</label></td>
			<td>${custDetail.BIRTH}</td>
		</tr>

		<tr>
			<td><label>연락처</label></td>
			<td>${custDetail.CONTACT}</td>
		</tr>

		<tr>
			<td><label>주소</label></td>
			<td>${custDetail.ADDRESS}</td>
		</tr>

		<tr>
			<td colspan=2><input type="button" value="수정" class="btn"
				onclick="fnUpdate()"> <input type="button" value="삭제"
				class="btn" onclick="fnDelete()"> <input type="button"
				value="목록" class="btn" onclick="fnlist()"></td>
		</tr>
	</table>
</body>
</html>
