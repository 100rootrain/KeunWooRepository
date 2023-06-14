<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<title>계좌목록</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<style>
table {
	border-collapse: collapsed;
	margin: 150px auto;
}

td {
	width: 200px;
	height: 30px;
	text-align: center;
	border: 1px solid gray;
}

.t1 {
	border-color: transparent;
}
</style>
<script>
var userId = $("#userId").val();
console.log("bkList -> userId : "+userId);
console.log("bkList -> userId : "+$("#userId").val());

	function fnSave() {
		var userId = $("#userId").val();
		location.href = "/bkNew?userId=" + userId;

	}

	function logout() {
		location.href = "/logout";
	}

	function myPage() {
		var userId = $("#userId").val();
		location.href = "/myPage?userId=" + userId;
		;
		/*  */
	}

	function fnSearch() {
		var userId = $("#userId").val();
		var txt = document.getElementById("txt").value;
		var type = document.getElementById("type").value;
		location.href = "/bkList?txt=" + txt + "&type=" + type + "&userId="
				+  $("#userId").val();
	}

	function fnRemit() {
		var userId = $("#userId").val();
		location.href = "/remit?userId=" + userId;

	}
	
	function fnBankStatements() {
		var userId = $("#userId").val();
		location.href = "/bankStatements?userId=" + userId;

	}

</script>
</head>
<body>
	<input type="hidden" id="userId" value="${userId}">
	<table>
		<thead>
			<tr class="t1">
				<td colspan="3" class="t1"><input type="button" value="마이페이지"
					id="logout" onclick="myPage()" style="float: left"></td>
				<td class="t1"><input type="button" value="로그아웃" id="logout"
					onclick="logout()" style="float: right"></td>
			</tr>
			<tr>
				<td>계좌 ID</td>
				<td>은행</td>
				<td>계좌번호</td>
				<td>등록일</td>
			<tr>
		</thead>
		<c:forEach var="account" items="${list}">
			<tr>
				<td>${account.ACCNT_ID}</td>
				<td>${account.BANK_NM}</td>
				<td><a
					href="/bkDetail?accntId=${account.ACCNT_ID}&userId=${userId}">${account.ACCNT_NO}</a></td>
				<td>${account.REG_DT}</td>
			<tr>
		</c:forEach>
		<tr>
			<td colspan="4"><select id="type">

					<option value="name">은행</option>
					<option value="accntNo">계좌번호</option>
			</select>&nbsp;&nbsp;<input type="text" id="txt"><br> <br> <input
				type="button" value="조회" onclick="fnSearch()">&nbsp;&nbsp;<input
				type="button" value="등록" onclick="fnSave()">&nbsp;&nbsp;<input
				type="button" value="송금" onclick="fnRemit()"><input
				type="button" value="입출금내역" onclick="fnBankStatements()"></td>
		</tr>




	</table>
</body>
</html>