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
	function goList() {
		location.href = "/hlist";
	}
</script>
</head>
<body>
	<form action='/hinsert1'>
		<table style="width: 600px;">
			<tr>
				<td class="td_title" colspan="4"><input type="text"
					style="width: 100%;" name="name" maxlength=30></td>
			<tr>
			<tr>
				<td style="width: 20%">아이디</td>
				<td style="width: 30%"><input type="text" style="width: 100%;"
					name="id" maxlength=6></td>
				<td style="width: 20%">등록일</td>
				<td style="width: 30%">${map.entryDate}</td>
			<tr>
			<tr>
				<td style="width: 20%">주소</td>
				<td style="width: 30%"><input type="text" style="width: 100%;"
					name="address" maxlength=300></td>
				<td style="width: 20%">주민등록번호</td>
				<td style="width: 30%"><input type="text" style="width: 100%;"
					name="ssn1" maxlength="7"></td>
			<tr>
			<tr>
				<td style="width: 20%">이메일</td>
				<td style="width: 30%"><input type="text" style="width: 100%;"
					name="email"></td>
				<td style="width: 20%">연락처1</td>
				<td style="width: 30%"><input type="text" style="width: 100%;"
					name="contact1"></td>
			<tr>
			<tr>
				<td style="width: 20%">연락처2</td>
				<td style="width: 30%"><input type="text" style="width: 100%;"
					name="contact2" ></td>
				<td style="width: 20%">연락처3</td>
				<td style="width: 30%"><input type="text" style="width: 100%;"
					name="contact3" ></td>
			<tr>
			<tr>
				<td style="width: 20%">초등학교</td>
				<td style="width: 30%"><input type="text" style="width: 100%;"
					name="school1" ></td>
				<td style="width: 20%">중학교</td>
				<td style="width: 30%"><input type="text" style="width: 100%;"
					name="school2"></td>
			<tr>
			<tr>
				<td style="width: 20%">고등학교</td>
				<td style="width: 30%"><input type="text" style="width: 100%;"
					name="school3" ></td>

				<td style="width: 20%">학년</td>
				<td style="width: 30%"><input type="text" style="width: 100%;"
					name="grade" v></td>
			<tr>
			<tr>

				<td style="width: 20%">반</td>
				<td style="width: 30%"><input type="text" style="width: 100%;"
					name="class1"></td>

				<td style="width: 20%">번호</td>
				<td style="width: 30%"><input type="text" style="width: 100%;"
					name="no" ></td>
			<tr>
			<tr>

				<td style="width: 20%">탈퇴일</td>
				<td style="width: 30%"><input type="text" style="width: 100%;"
					name="resignDate" ></td>

				<td style="width: 20%">비고</td>
				<td style="width: 30%"><input type="text" style="width: 100%;"
					name="remark"></td>
			<tr>
			<tr>
				<td class="td_footer" colspan="4"><input type="submit"
					value="저장"> <input type="button" value="취소"
					onclick="goList()"></td>
			<tr>
		</table>
	</form>
</body>
</html>
