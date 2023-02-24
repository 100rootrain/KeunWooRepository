<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<style>
table {
	border-collapse: collapse;
	margin: 30px auto;
}

td {
	border: 1px solid lightgray;
	text-align: center;
	font-family: sans-serif;
	height: 30px;
}

.td_title {
	font-weight: bold;
	font-size: 20px;
	height: 30px;
}

.td_contents {
	height: 400px;
	padding: 10px;
}

.div_contents {
	height: 100%;
	text-align: left;
}

.td_footer {
	height: 30px;
}
</style>
<script>
	function doDelete() {
		var t = confirm("삭제하시겠습니까?");
		if (t == true)
			location.href = "/hdelete?no=${map.id}"
	}

	function goList() {
		location.href = "/hlist";
	}

	function save() {
		var id = document.getElementById("id").value;
		var name = document.getElementById("name").value;
		var ssn1 = document.getElementById("ssn1").value;
		var email = document.getElementById("email").value;
		var contact1 = document.getElementById("contact1").value;
		var contact2 = document.getElementById("contact2").value;
		var contact3 = document.getElementById("contact3").value;
		var address = document.getElementById("address").value;
		var school1 = document.getElementById("school1").value;
		var school2 = document.getElementById("school2").value;
		var school3 = document.getElementById("school3").value;
		var grade = document.getElementById("grade").value;
		var class1 = document.getElementById("class1").value;
		var no = document.getElementById("no").value;
		var resignDate = document.getElementById("resignDate").value;
		var remark = document.getElementById("remark").value;

		location.href = "/hupdate?id=" + id + "&name=" + name + "&ssn1=" + ssn1
				+ "&email=" + email + "&contact1=" + contact1 + "&contact2="
				+ contact2 + "&contact3=" + contact3 + "&address=" + address
				+ "&school1=" + school1 + "&school2=" + school2 + "&school3="
				+ school3 + "&grade=" + grade + "&class1=" + class1 + "&no="
				+ no + "&resignDate=" + resignDate + "&remark=" + remark
	}
</script>
</head>
<body>
	<input type="hidden" value="${map.id}" id="id">
	<table style="width: 600px;">
		<tr>
			<td class="td_title" colspan="4"><input type="text"
				style="width: 100%;" value="${map.name}" id="name"></td>
		<tr>
		<tr>
			<td style="width: 20%">아이디</td>
			<td style="width: 30%">${map.id}</td>
			<td style="width: 20%">등록일</td>
			<td style="width: 30%">${map.entryDate}</td>
		<tr>
		<tr>
			<td style="width: 20%">주소</td>
			<td style="width: 30%"><input type="text" style="width: 100%;"
				id="address" value="${map.address}"></td>
			<td style="width: 20%">주민등록번호</td>
			<td style="width: 30%"><input type="text" style="width: 100%;"
				id="ssn1" value="${map.ssn1}"></td>
			<td style="width: 20%">성별</td>
			<td style="width: 30%">${map.gender}</td>
		<tr>
		<tr>
			<td style="width: 20%">이메일</td>
			<td style="width: 30%"><input type="text" style="width: 100%;"
				id="email" value="${map.email}"></td>
			<td style="width: 20%">연락처1</td>
			<td style="width: 30%"><input type="text" style="width: 100%;"
				id="contact1" value="${map.contact1}"></td>
		<tr>
		<tr>
			<td style="width: 20%">연락처2</td>
			<td style="width: 30%"><input type="text" style="width: 100%;"
				id="contact2" value="${map.contact2}"></td>
			<td style="width: 20%">연락처3</td>
			<td style="width: 30%"><input type="text" style="width: 100%;"
				id="contact3" value="${map.contact3}"></td>
		<tr>
		<tr>
			<td style="width: 20%">초등학교</td>
			<td style="width: 30%"><input type="text" style="width: 100%;"
				id="school1" value="${map.school1}"></td>
			<td style="width: 20%">중학교</td>
			<td style="width: 30%"><input type="text" style="width: 100%;"
				id="school2" value="${map.school2}"></td>
		<tr>
		<tr>
			<td style="width: 20%">고등학교</td>
			<td style="width: 30%"><input type="text" style="width: 100%;"
				id="school3" value="${map.school3}"></td>

			<td style="width: 20%">학년</td>
			<td style="width: 30%"><input type="text" style="width: 100%;"
				id="grade" value="${map.grade}"></td>
		<tr>
		<tr>

			<td style="width: 20%">반</td>
			<td style="width: 30%"><input type="text" style="width: 100%;"
				id="class1" value="${map.class1}"></td>

			<td style="width: 20%">번호</td>
			<td style="width: 30%"><input type="text" style="width: 100%;"
				id="no" value="${map.no}"></td>
		<tr>
		<tr>

			<td style="width: 20%">탈퇴일</td>
			<td style="width: 30%"><input type="text" style="width: 100%;"
				id="resignDate" value="${map.resignDate}"></td>

			<td style="width: 20%">비고</td>
			<td style="width: 30%"><input type="text" style="width: 100%;"
				id="remark" value="${map.remark}"></td>
		<tr>
		<tr>
			<td class="td_footer" colspan="4"><input type="button"
				value="저장" onclick="save()"> <input type="button" value="취소"
				onclick="goList()"></td>
		<tr>
	</table>
</body>
</html>
