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
	margin: 300px auto;
}

td {
	border: 1px solid gray;
	text-align: center;
}

.t1 {
	width: 150px;
}

.t2 {
	width: 150px;
}

#btn {
	background-color: #008CBA;
	color: white;
	border: 2px solid #008CBA;
	width: 154px;
	height: 56px;
}

#btn:hover {
	background-color: #008CBA;
	color: red;
}
</style>
<script>
	console.log("myPage userId : " + userId);
	var pwCheck = false;

	function fnSearch() {
		if (window.event.keyCode == 13) {
			fnChange();
		}
	}

	function fnCheckPw() {
		var userId = $("#userId").val();
		var userPw = $("#userPw").val();

		if (userPw == '') { //현재 비밀번호가 공백일 경우
			alert("현재 비밀번호가 공백입니다.");
			pwCheck = false;

		} else { //현재 비밀번호가 공백이 아닐 경우.

			$.ajax({
				url : "getPwInfo", //요청할 url, 주소:포트(http://localhost:8080)는 일반적으로 생략
				type : "GET", //요청 방식 - GET:조회, POST:입력
				cache : false, //캐쉬 - 임시로 데이터를 저장할지 여부, 거의 false
				data : {
					userId : userId,
					userPw : userPw

				},
				success : function(data) { //데이터 송,수신에 성공했을 경우의 동작

					if (data == "X") { /* 비밀번호가 틀렸을경우  */
						alert("현재비밀번호가 틀렸습니다.");
						pwCheck = false;

					} /* else if (data == '') {
																	alert("비밀번호가 공백입니다.");
																	pwCheck = false;}  */

					else {
						alert("변경비밀번호!!!를 입력해주세요.");
						pwCheck = true;

					}

				},
				error : function(request, status, error) { // 오류가 발생했을 경우의 동작
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				}
			});

		}

	}

	function fnChange() {

		var userId = $("#userId").val();
		var userPw = $("#userPw").val();
		var userPwChange = $("#userPwChange").val();
		var userPwChangeChk = $("#userPwChangeChk").val();

		console.log("myPage userId : " + userId);

		var aaa = true;

		if (userPw == '') {
			alert("현재 비밀번호를 입력하세요.")
			aaa = false;
		}

		if (userPwChange == '') {
			alert("변경할 비밀번호를 입력하세요.")
			aaa = false;
		}

		if (userPwChangeChk == '') {
			alert("변경할 비밀번호 확인을 입력하세요.")
			aaa = false;
		}

		if (pwCheck) { //현재비밀번호 체크(fnCheckPw)가 완료됐을경우 

			$.ajax({
				url : "getPwInfo", //요청할 url, 주소:포트(http://localhost:8080)는 일반적으로 생략
				type : "GET", //요청 방식 - GET:조회, POST:입력
				cache : false, //캐쉬 - 임시로 데이터를 저장할지 여부, 거의 false
				data : {
					userId : userId,
					userPw : userPw

				},
				success : function(data) { //데이터 송,수신에 성공했을 경우의 동작

					if ($("#userPwChange").val() == $("#userPw").val()) { //변경할 비밀번호와 최초비밀번호가 일치할 경우
						alert("비밀번호가 같습니다.");
						aaa = false;
					} else { //최초 비밀번호와 변경비밀번호가 다를경우

						if ($("#userPwChange").val() != $("#userPwChangeChk")
								.val()) { //변경비밀번호와 비밀번호 확인이 다를경우 
							alert("비밀번호가 다릅니다.");
							aaa = false;

						}

					}

					if (aaa) {

						$.ajax({
							url : "updatePw", //요청할 url, 주소:포트(http://localhost:8080)는 일반적으로 생략
							type : "GET", //요청 방식 - GET:조회, POST:입력
							cache : false, //캐쉬 - 임시로 데이터를 저장할지 여부, 거의 false
							data : {
								userId : userId,
								userPwChange : userPwChange

							},
							success : function(data) { //데이터 송,수신에 성공했을 경우의 동작

								alert("비밀번호가 변경되었습니다.");
								location.href = "/bkList?userId=" + userId
										+ "&userPwChange=" + userPwChange;

								/* url에 nm과 id를 안넘겨주면 오류남. Controller의 @RequestParam에 있는 값들과 일치해야됨  */
								/* data.userId로 넘겨주면 마지막 로그인 시간이 안나옴 왜? */

								console.log(data);

							},
							error : function(request, status, error) { // 오류가 발생했을 경우의 동작
								alert("code:" + request.status + "\n"
										+ "message:" + request.responseText
										+ "\n" + "error:" + error);
							}
						});
					}

					/* url에 nm과 id를 안넘겨주면 오류남. Controller의 @RequestParam에 있는 값들과 일치해야됨  */
					/* data.userId로 넘겨주면 마지막 로그인 시간이 안나옴 왜? */

					console.log(data);

				},
				error : function(request, status, error) { // 오류가 발생했을 경우의 동작
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				}

			});

		} else if (!pwCheck) {
			alert("비밀번호가 다릅니다!!!");
		}

	}
</script>
</head>
<body>
	<input type="hidden" id="userId" value='${userId}'>
	<table>

		<tr>
			<td class="t1"><input type="password" id="userPw"
				placeholder="현재비밀번호" onkeyup="fnSearch()" style="width: 125px"><input
				type="button" value="확인" onclick="fnCheckPw()"></td>

		</tr>
		<tr>
			<td class="t1"><input type="password" id="userPwChange"
				placeholder="변경할 비밀번호" onkeyup="fnSearch()"></td>
		</tr>
		<tr>
			<td class="t1"><input type="password" id="userPwChangeChk"
				placeholder="변경할 비밀번호 확인" onkeyup="fnSearch()"></td>
		</tr>

		<tr>
			<td class="t1"><input type="button" value="비밀번호변경"
				onclick="fnChange()"></td>
		</tr>


	</table>
</body>
</html>