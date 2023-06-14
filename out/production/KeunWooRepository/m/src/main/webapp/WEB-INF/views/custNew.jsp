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
	margin-left: 5px; /* 
	1. 값이 하나일 경우 상하좌우 
	2. 값이 두개일 경우 상하 좌우
	3. 값이 4개일 경우 상 하 좌 우  */
}
</style>
<script>
	function fnSave() {
		var name = $("#name").val();
		if (name == '') {
			alert('이름을 입력하세요.')
			$('#name').focus(); /* 고객명으로 커서가감 */
			return;
		}
		var birth = $("#birth").val();
		var address = $("#address").val();
		var contact = $("#contact").val();
		var custNo = $("#custNo").val();

		var t = confirm("저장하시겠습니까?");
		if (t == true) {
			location.href = "/custInsert?custNo="+custNo+"&name=" + name + "&birth=" + birth

			+ "&address=" + address + "&contact=" + contact;
		}
	}

	function fnlist() {
		location.href = "/custList"
	}
</script>
</head>
<body>
	<input type="hidden" value="${custDetail.CUST_NO}" id="custNo">
	<table>
		<tr>
			<td><label>고객명</label></td>
			<td><input type="text" id="name"></td>
		</tr>

		<tr>
			<td><label>생년월일</label></td>
			<td><input type="text" id="birth"></td>
		</tr>

		<tr>
			<td><label>연락처</label></td>
			<td><input type="text" id="contact"></td>
		</tr>

		<tr>
			<td><label>주소</label></td>
			<td><input type="text" id="address"></td>
		</tr>

		<tr>
			<td colspan=2><input type="button" value="저장" class="btn"
				onclick="fnSave()"> <input type="button" value="목록"
				class="btn" onclick="fnlist()"></td>
		</tr>
	</table>
</body>
</html>
