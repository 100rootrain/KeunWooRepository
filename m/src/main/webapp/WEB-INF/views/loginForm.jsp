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
	function fnSearch() {
		if (window.event.keyCode == 13) {
			fnLogin();
		}
	}

	function fnLogin() {

		var userId = $("#userId").val();
		var userPw = $("#userPw").val();

		var aaa = true;

		if (userId == '') {
			alert("'아이디'를 입력해주세요.");
			aaa = false;
		}

		if (userPw == '') {
			alert("'비밀번호'를 입력해주세요.");
			aaa = false;
		}

		$.ajax({
			url : "getLoginInfo", //요청할 url, 주소:포트(http://localhost:8080)는 일반적으로 생략
			type : "GET", //요청 방식 - GET:조회, POST:입력
			cache : false, //캐쉬 - 임시로 데이터를 저장할지 여부, 거의 false
			data : {
				userId : userId,
				userPw : userPw

			},
			success : function(data) { //데이터 송,수신에 성공했을 경우의 동작
				if (data == '') {
					alert("존재하지 않는 아이디 입니다.");
					aaa = false;

				} else { /* 존재하는 아이디의 경우 - 비밀번호는 틀리든 맞든 상관없는경우 */
					if (data.PWYN == "X") { /* 비밀번호가 틀렸을경우  */
						alert("비밀번호가 틀렸습니다.");
						aaa = false;

					} else { /* 비밀번호가 맞을경우  */
						alert(data.USER_NM + " 님, 반갑습니다.");
						location.href = "/login?userNm=" + data.userNm
								+ "&userId=" + userId;
					}

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

	}

	function fnNew() {
		location.href = "/newInfo"
	}

	function a(v) {

		$("#userId").val(v);

	}

	function fnForm() {

		window.open("/newInfo?a=aa&b=bb", "a",
				'width=400, height=600, left=400, top=400, resizable = no');
		//화면, id, 너비 높이 왼쪽 위 // 팝업 3개 열고 닫고 부모호출 
	}
</script>
</head>
<body>
	<table>

		<tr>
			<td class="t1"><input type="text" id="userId" placeholder="아이디"
				onkeyup="fnSearch()"></td>
			<td rowspan="2" class="t2"><input type="button" id="btn"
				value="Login" onclick="fnLogin()"></td>
		</tr>
		<tr>
			<td class="t1"><input type="password" id="userPw"
				placeholder="비밀번호" onkeyup="fnSearch()"></td>
		</tr>
		<tr>
			<td class="t1" colspan="2"><input type="button" value="회원가입"
				onclick="fnForm()"></td>
		</tr>


	</table>
</body>
</html>