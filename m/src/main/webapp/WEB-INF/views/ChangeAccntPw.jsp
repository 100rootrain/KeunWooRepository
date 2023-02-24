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
	var bbb = false; // 현재 비밀번호와 변경할 비밀번호 플래그
	

	var userId = $("#userId").val();

	function fnDetailList() { //취소 시 이전 Detail 화면
		location.href = "/bkDetail?userId=" + $("#userId").val() + "&accntId="
				+ $("#accntId").val();

	}

	function fnSave() {
		var accntId = $("#accntId").val();
		var accntNo = $("#accntNo").val();
		var pass = $("#pass").val();
		var accntPwChangeChk = $("#accntPwChangeChk").val();

		if (pass.length > 4) {
			alert("비밀번호는 4자리를 초과할 수 없습니다.");
			abbb = false;
		}

		if (accntPwChangeChk.length > 4) {
			alert("비밀번호는 4자리를 초과할 수 없습니다.");
			bbb = false;
		}
		

		console.log(accntId);

	

		
		if ($("#pass").val() == '') { // 변경 비밀번호가 공백인 경우
			alert("변경할 비밀번호를 입력하세요.");
			bbb = false;

		} else if ($("#pass").val() != '') { // 변경 비밀번호가 공백이 아닌경우 

			$.ajax({
				url : "getAccntPwInfo2", //요청할 url, 주소:포트(http://localhost:8080)는 일반적으로 생략
				type : "GET", //요청 방식 - GET:조회, POST:입력
				cache : false, //캐쉬 - 임시로 데이터를 저장할지 여부, 거의 false
				data : {
					accntId : accntId,
					pass : pass

				/* pass : 서버에서 받을 이름 , pass : 보낼 값  */

				},
				success : function(data) { //데이터 송,수신에 성공했을 경우의 동작

					if (data.PASS == "O") { // 현재비밀번호와 변경할 비밀번호가 같을경우 
						alert("변경할 비밀번호가 같습니다. 다시입력해주세요.");
						bbb = false;
						
						console.log(pass);

					} else { //현재비밀번호와 변경할 비밀번호가 다를 경우 

						//다음작업 (변경할 비밀번호와 변경할 비밀번호 확인 비교 )

						if ($("#accntPwChangeChk").val() == '') { //변경할 비밀번호 확인이 공백일경우 
							alert("변경할 비밀번호 확인을 입력!! 해주세요.");
							bbb = false;

						} else if ($("#pass").val() != $(
								"#accntPwChangeChk").val()) {
							//변경할 비밀번호와 변경비밀번호확인이 다르다면.
							alert("변경할 비밀번호와 변경할 비밀번호 확인 값이 다릅니다. 다시 입력해주세요.")
							bbb = false;

						}

						else if ($("#pass").val() == $(
								"#accntPwChangeChk").val()) {
							//변경할 비밀번호 확인이 공백이 아닌경우 - 변경할 비밀번호와 변경비밀번호확인이 같다면, 
							if (bbb = true) {
								$.ajax({
									url : "updateAccntPw", //요청할 url, 주소:포트(http://localhost:8080)는 일반적으로 생략
									type : "GET", //요청 방식 - GET:조회, POST:입력
									cache : false, //캐쉬 - 임시로 데이터를 저장할지 여부, 거의 false
									data : {
										accntId : accntId,
										accntPwChangeChk : accntPwChangeChk

									/* 서버에서 받을 이름 : 보낼 값 */

									},
									success : function(data) { //데이터 송,수신에 성공했을 경우의 동작

										location.href = "/bkDetail?userId="
												+ $("#userId").val()
												+ "&accntId=" + accntId;

										console.log("비밀번호 변경  : " + data);
									},
									error : function(request, status, error) { // 오류가 발생했을 경우의 동작
										alert("code:" + request.status + "\n"
												+ "message:"
												+ request.responseText + "\n"
												+ "error:" + error);
									}
								});

							}

						}

					}

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
	<input type="hidden" id="accntId" value="${result.ACCNT_ID}">
	<table style="width: 600px;">

		<tr>
			<td style="width: 20%">변경할 비밀번호</td>
			<td style="width: 30%"><input type="password" size=25
				id="pass" placeholder="변경할비밀번호를 입력해주세요."></td>

		</tr>

		<tr>
			<td style="width: 20%">변경할 비밀번호 확인</td>
			<td style="width: 30%"><input type="password" size=25
				id="accntPwChangeChk" placeholder="변경할비밀번호를 다시 한번 더 입력해주세요."></td>

		</tr>

		<tr>
			<td colspan="2"><input type="button" value="저장"
				onclick="fnSave()"> <input type="button" value="취소"
				onclick="fnDetailList()"></td>
		</tr>
	</table>
</body>
</html>