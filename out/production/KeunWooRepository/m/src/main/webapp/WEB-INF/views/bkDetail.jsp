<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<title>계좌 상세</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<style>
table {
	border-collapse: collapsed;
	margin: auto;
}

td {
	width: 100px;
	height: 30px;
	text-align: center;
	border: 1px solid gray;
}
</style>
<script>
	var userId = $("#userId").val();
	console.log("bkDetail->userId : " + userId);

	var CheckAccntPw = false;

	function fnList() { //취소(목록)
		location.href = "/bkList?userId=" + $("#userId").val();
	}

	function fnDelete() { //삭제 
		location.href = "/bkDelete?accntId=" + $("#accntId").val() + "&userId="
				+ $("#userId").val();
	}

	function fnCheckAccntPw() { // 계좌 비밀번호 확인. 
		var accntId = $("#accntId").val();
		var accntNo = $("#accntNo").val();
		var pass = $("#pass").val();


		$.ajax({
			url : "getAccntPwInfo2", //요청할 url, 주소:포트(http://localhost:8080)는 일반적으로 생략
			type : "GET", //요청 방식 - GET:조회, POST:입력
			cache : false, //캐쉬 - 임시로 데이터를 저장할지 여부, 거의 false
			data : {
				accntId : accntId,
				accntNo : accntNo,
				pass : pass

			},
			success : function(data) { //데이터 송,수신에 성공했을 경우의 동작

				if (data.PASS == "X") { /* 비밀번호가 틀렸을 경우  */
					alert("현재 비밀번호가 틀렸습니다. 다시입력해주세요.");
					CheckAccntPw = false;

				} else {

					var t = confirm("비밀번호를 변경하시겠습니까?");
					if (t == true) {
						location.href = "/ChangeAccntPw?accntId=" + accntId
								+ "&userId=" + $("#userId").val();

					}
					CheckAccntPw = true;

				}
			},
			error : function(request, status, error) { // 오류가 발생했을 경우의 동작
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		});
	}

	if (CheckAccntPw = true) {

		function fnSave() { //저장(수정하기)
			var accntId = $("#accntId").val();
			var bankCd = $("#bankCd").val();
			var accntNo = $("#accntNo").val();

			var pass = $("#pass").val();

			$.ajax({

				url : "bankInsertUpdate", //요청할 url, 주소:포트(http://localhost:8080)는 일반적으로 생략

				type : "POST", //요청 방식 - GET:조회, POST:입력

				cache : false, //캐쉬 - 임시로 데이터를 저장할지 여부, 거의 false

				data : {

					accntId : accntId,

					bankCd : bankCd,

					accntNo : accntNo,

					pass : pass

				// ★★★ 추천인 값이 있든 없든 넘김

				},

				success : function(data) { //데이터 송,수신에 성공했을 경우의 동작

					if (pass.length > 4 || $("#pass").val() == '') {
						alert("비밀번호는 최대 4자리까지 가능합니다. 공백은 불가능합니다.");
						return false;
					}

					alert("수정되었습니다.");

					location.href = "/bkList?userId=" + $("#userId").val()
							+ "&accntId=" + accntId;

				},

				error : function(request, status, error) { // 오류가 발생했을 경우의 동작

					alert("code:" + request.status + "\n" + "message:"

					+ request.responseText + "\n" + "error:" + error);

				}

			});

		}

	}
</script>
</head>
<body>
	<input type="hidden" id="userId" value="${userId}">
	<input type="hidden" value="${result.ACCNT_ID}" id="accntId">
	<table style="width: 600px;">
		<tr>
			<td style="width: 20%">계좌 ID</td>
			<td style="width: 30%">${result.ACCNT_ID}</td>
		</tr>
		<tr>
			<td style="width: 20%">은행</td>
			<td style="width: 30%"><select id="bankCd">
					<c:forEach var="bank" items="${bankList}">
						<option value="${bank.ID}"
							<c:if test="${bank.ID == result.BANK_CD}"> selected</c:if>>${bank.NAME}</option>
					</c:forEach>
			</select></td>
		</tr>
		<tr>
			<td style="width: 20%">계좌번호</td>
			<td style="width: 30%"><input type="text" id="accntNo"
				value="${result.ACCNT_NO}"></td>
		</tr>
		<tr>
			<td style="width: 20%">비밀번호</td>
			<td style="width: 30%"><input type="password" size=25 id="pass"
				placeholder="현재비밀번호를 입력해주세요.">&nbsp;&nbsp;<input
				type="button" value="비밀번호변경" onclick="fnCheckAccntPw()"></td>

		</tr>

		<tr>
			<td colspan="2"><input type="button" value="저장"
				onclick="fnSave()"> <input type="button" value="삭제"
				onclick="fnDelete()"> <input type="button" value="취소"
				onclick="fnList()"></td>
		</tr>
	</table>
</body>
</html>