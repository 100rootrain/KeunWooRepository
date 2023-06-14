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
</style>
<script>
	function fnSearch2() {
		if (window.event.keyCode == 13) {
			fnSearch();
		}
	}

	function fnSave() {

		var userId = $("#userId").val();
		var userPw = $("#userPw").val();
		var userNm = $("#userNm").val();
		var gndrCd = $("#gndrCd").val();
		var rankCd = $("#rankCd").val();
		var deptCd = $("#deptCd").val();
		var birth = $("#birth").val();

		$.ajax({
			url : "getLoginInfo", //요청할 url, 주소:포트(http://localhost:8080)는 일반적으로 생략
			type : "GET", //요청 방식 - GET:조회, POST:입력
			cache : false, //캐쉬 - 임시로 데이터를 저장할지 여부, 거의 false
			data : {
				userId : userId
				

			},
			success : function(data) { //데이터 송,수신에 성공했을 경우의 동작
				if (data != '') {
					alert("이미 존재하는 아이디 입니다.");

				} else {

					$.ajax({
						url : "insertUserInfo", //요청할 url, 주소:포트(http://localhost:8080)는 일반적으로 생략
						type : "GET", //요청 방식 - GET:조회, POST:입력
						cache : false, //캐쉬 - 임시로 데이터를 저장할지 여부, 거의 false
						data : {
							userId : userId,
							userPw : userPw,
							userNm : userNm,
							gndrCd : gndrCd,
							rankCd : rankCd,
							deptCd : deptCd,
							birth : birth

						},
						success : function(data) { //데이터 송,수신에 성공했을 경우의 동작
							alert("가입되었습니다.");
							/* location.href = "/loginForm"; */

						},
						error : function(request, status, error) { // 오류가 발생했을 경우의 동작
							alert("code:" + request.status + "\n" + "message:"
									+ request.responseText + "\n" + "error:"
									+ error);
						}
					});

				}

			},
			error : function(request, status, error) { // 오류가 발생했을 경우의 동작
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		});

	}
</script>
</head>
<body>
	<table>
		<tr>
			<td class="t1">아이디</td>
			<td class="t2"><input type="text" id="userId"></td>
		</tr>
		<tr>
			<td class="t1">비밀번호</td>
			<td class="t2"><input type="text" id="userPw"></td>
		</tr>

		<tr>
			<td class="t1">이름</td>
			<td class="t2"><input type="text" id="userNm"></td>
		</tr>

		<tr>
			<td class="t1">성별</td>
			<td class="t2"><select id="gndrCd"><c:forEach
						var="gndr" items="${gndrList}">
						<option value="${gndr.CODE}">${gndr.NAME}</option>
					</c:forEach></select></td>
		</tr>

		<tr>
			<td class="t1">직급</td>
			<td class="t2"><select id="rankCd">
					<c:forEach var="rank" items="${rankList}">
						<option value="${rank.CODE}">${rank.NAME}</option>
					</c:forEach>
			</select></td>
		</tr>

		<tr>
			<td class="t1">부서</td>
			<td class="t2"><select id="deptCd">
					<c:forEach var="dept" items="${deptList}">
						<option value="${dept.CODE}">${dept.NAME}</option>
					</c:forEach>
			</select></td>
		</tr>


		<tr>
			<td class="t1">생년월일</td>
			<td class="t2"><input type="text" id="birth"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="회원가입"
				onclick="fnSave()"></td>
		</tr>
	</table>
</body>
</html>