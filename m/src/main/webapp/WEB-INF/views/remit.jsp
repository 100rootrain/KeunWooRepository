<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<title>송금하기</title>
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
	window.onload = function() {

		fnSave()

	}

	var userId = $("#userId").val();

	function withdraw_Balance() { // 출금계좌를 선택할떄 잔액이 나온다. onchange

		var accntId = $("#withdraw").val(); // 출금계좌의 accntId값을 accntId로 정의

		$.ajax({
			url : "getBalanceInfo", //요청할 url, 주소:포트(http://localhost:8080)는 일반적으로 생략
			type : "GET", //요청 방식 - GET:조회, POST:입력
			cache : false, //캐쉬 - 임시로 데이터를 저장할지 여부, 거의 false
			data : {

				accntId : accntId

			},
			success : function(data) { //데이터 송,수신에 성공했을 경우의 동작
				console.log(data);
				$("#balance").val(data.BALANCE);

				//나머지 값도 세팅

			},
			error : function(request, status, error) { // 오류가 발생했을 경우의 동작
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		});

	}

	function fnSave() {
		var withdraw = $("#withdraw").val(); // 출금계좌
		var balance = $("#balance").val(); // 잔액
		var deposit = $("#deposit").val(); // 입금계좌
		var remittance = $("#remittance").val(); //송금액
		var remitPw = $("#remitPw").val(); // 비밀번호 

		console.log(balance);
		console.log(remittance);

		if ($("#withdraw").val() == $("#deposit").val()) { //출금계좌와 입금계좌가 같을경우 
			alert("출금계좌와 입금계좌는 달라야됩니다.");
			return false;

		}

		if ($("#balance").val() == '') { //onchange로 잔액이 비워져있으면 계좌가 선택된것이 아니기때문. (계좌 필수입력)
			alert("출금계좌를 선택해주세요.");
			return false;
		}

		if ($("#remittance").val() == '') {
			alert("송금액을 입력해주세요.");
			return false;
		}

		if ($("#remitPw").val() == '') {
			alert("비밀번호를 입력해주세요.");
			return false;
		}

		/* 		if (parseInt($("#balance").val()) < $("#remittance").val()) { //잔액 < 송금액
		 alert("잔액이 적습니다.");
		 return false;
		 } */

		$
				.ajax({
					url : "getAccntPwInfo2", //요청할 url, 주소:포트(http://localhost:8080)는 일반적으로 생략
					type : "GET", //요청 방식 - GET:조회, POST:입력
					cache : false, //캐쉬 - 임시로 데이터를 저장할지 여부, 거의 false
					data : {
						accntId : withdraw,
						pass : remitPw

					},
					success : function(data) { //데이터 송,수신에 성공했을 경우의 동작
						console.log(withdraw);
						console.log(remitPw);

						if (data.PASS == "X") { /* 비밀번호가 틀렸을 경우  */
							alert("비밀번호가 틀렸습니다. 다시입력해주세요.");
							return false;

						} else {

							var accntId = $("#withdraw").val(); // 출금계좌의 accntId값을 accntId로 정의
							var accntId2 = $("#deposit").val(); // 입금계좌 id 

							$
									.ajax({
										url : "getBalanceInfo", //요청할 url, 주소:포트(http://localhost:8080)는 일반적으로 생략
										type : "GET", //요청 방식 - GET:조회, POST:입력
										cache : false, //캐쉬 - 임시로 데이터를 저장할지 여부, 거의 false
										data : {

											accntId : accntId

										},
										success : function(data) { //데이터 송,수신에 성공했을 경우의 동작
											console.log(data);

											if (data.BALANCE < $("#remittance")
													.val()) {
												alert("잔액이 적습니다.");
												return false;

											} else {

												alert("성공");

												/* var withdrawMinus = parseInt(data.BALANCE) - parseInt($("#remittance").val()); // 출금계좌의 잔액 - 송금액  */
												console.log('출금계좌의 잔돈. : '
														+ data.BALANCE);
												console.log('출금계좌에서 뺍니다. : '
														+ remittance);

												$
														.ajax({
															url : "getWithdrawMinus", //요청할 url, 주소:포트(http://localhost:8080)는 일반적으로 생략
															type : "GET", //요청 방식 - GET:조회, POST:입력
															cache : false, //캐쉬 - 임시로 데이터를 저장할지 여부, 거의 false
															data : {

																accntId : accntId,
																accntId2 : accntId2,
																balance : remittance
															/* balance : 서버에서 받을 이름 , withdrawMinus : 보낼 값  */
															},
															success : function(
																	data) { //데이터 송,수신에 성공했을 경우의 동작
																console
																		.log(data);

																$
																		.ajax({
																			url : "accntHistoryInsert", //요청할 url, 주소:포트(http://localhost:8080)는 일반적으로 생략
																			type : "POST", //요청 방식 - GET:조회, POST:입력
																			cache : false, //캐쉬 - 임시로 데이터를 저장할지 여부, 거의 false
																			data : {

																				withdrawNo : accntId,
																				depositNo : accntId2,
																				remittance : remittance
																			/* withdrawNo : 서버에서 받을 이름 , withdrawNo : 보낼 값  */
																			},
																			success : function(
																					data) { //데이터 송,수신에 성공했을 경우의 동작
																				console
																						.log(data);

																				location.href = "/withdrawResult?accntId="
																						+ accntId
																						+ "&userId="
																						+ $(
																								"#userId")
																								.val();

																			},
																			error : function(
																					request,
																					status,
																					error) { // 오류가 발생했을 경우의 동작
																				alert("code:"
																						+ request.status
																						+ "\n"
																						+ "message:"
																						+ request.responseText
																						+ "\n"
																						+ "error:"
																						+ error);
																			}
																		});

															},
															error : function(
																	request,
																	status,
																	error) { // 오류가 발생했을 경우의 동작
																alert("code:"
																		+ request.status
																		+ "\n"
																		+ "message:"
																		+ request.responseText
																		+ "\n"
																		+ "error:"
																		+ error);
															}
														});

											}

										},
										error : function(request, status, error) { // 오류가 발생했을 경우의 동작
											alert("code:" + request.status
													+ "\n" + "message:"
													+ request.responseText
													+ "\n" + "error:" + error);
										}
									});

						}

					},
					error : function(request, status, error) { // 오류가 발생했을 경우의 동작
						alert("code:" + request.status + "\n" + "message:"
								+ request.responseText + "\n" + "error:"
								+ error);
					}
				});

	}
</script>
</head>
<body>
	<input type="hidden" id="userId" value="${userId}">

	<table style="width: 600px;">
		<tr>
			<td style="width: 20%">출금계좌 ID</td>
			<td style="width: 30%"><select id="withdraw"
				onchange="withdraw_Balance()">
					<c:forEach var="bankAccount" items="${bankAccountList}">
						<option value="${bankAccount.ID}"
							<c:if test="${bankAccount.ID == bankAccount.BANK_NM}"> selected</c:if>>${bankAccount.BANK_NM}${bankAccount.NO}</option>
					</c:forEach>
			</select></td>
		</tr>
		<tr>
			<td style="width: 20%">잔액</td>
			<td style="width: 30%"><input type="text" id="balance" disabled></td>
		</tr>
		<tr>
			<td style="width: 20%">입금계좌</td>
			<td style="width: 30%"><select id="deposit">
					<c:forEach var="bankAccount" items="${bankAccountList}">
						<option value="${bankAccount.ID}"
							<c:if test="${bankAccount.ID == bankAccount.BANK_NM}"> selected</c:if>>${bankAccount.BANK_NM}${bankAccount.NO}</option>
					</c:forEach>
			</select></td>
		</tr>

		<tr>
			<td style="width: 20%">송금액</td>
			<td style="width: 30%"><input type="text" id="remittance"
				onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"></td>
		</tr>

		<tr>
			<td style="width: 20%">비밀번호</td>
			<td style="width: 30%"><input type="password" id="remitPw"
				placeholder="비밀번호를 입력해주세요."></td>
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