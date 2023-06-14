<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>

<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>

<style>
table {
	border-collapse: collapse;
	margin: auto;
	text-align:center;
}

</style>

<script>
	var userId = $("#userId").val();

	function fnResult() {

		location.href = "/bkList?userId=" + $("#userId").val();
	}
</script>
<title>송금후 결과 화면입니다.</title>
</head>
<body>
	<input type="hidden" id="userId" value="${userId}">
	<%-- <input type="hidden" id="accntId" value="${accntId}"> --%>

	<table>
		<tr>
			<td>송금이 완료되었습니다.</td>
		</tr>
		<tr>
			<td><font size = "35">${result.BANK_NM}은행${result.ACCNT_NO} 출금후 잔액:<font color="red">${result.BALANCE}원</font></font></td>
		</tr>

		<tr>
			<td><input type="button" value="목록" onclick="fnResult()"></td>
		</tr>
	</table>
</body>

</html>