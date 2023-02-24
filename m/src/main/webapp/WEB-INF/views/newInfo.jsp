<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>



<html>



<head>



<meta charset="UTF-8">



<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>



<style>
table {
	border-collapse: collapse;
	margin: 70px auto;
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
	var idCheck = false;
	var refCheck = false;

	/* 함수안에 넣어놓으면 항상 false이기때문에 실행안함 */

	/* 멤버변수 */

	function fnSearch2() {
		if (window.event.keyCode == 13) {
			fnSearch();
		}
	}

	function refListPop() {
		window.open("/idList", "idList",
				'width=300, height=300, left=300, top=300, resizable = no');
		//화면, id, 너비 높이 왼쪽 위 // 팝업 3개 열고 닫고 부모호출 

	}

	function fnSave() {
		var userId = $("#userId").val();
		var userPw = $("#userPw").val();
		var userNm = $("#userNm").val();
		var gndrCd = $("#gndrCd").val();
		var rankCd = $("#rankCd").val();
		var deptCd = $("#deptCd").val();
		var birth = $("#birth").val();
		var reference = $("#reference").val();

		if (reference == '') { //추천인 공백도 들어갈수있으니깐.
			refCheck = true;
		}

		if (userId == '') {
			alert("아이디를 입력해주세요.");
			return false;
		}

		if (userPw == '') {
			alert("비밀번호를 입력해주세요.");
			return false;

		}

		if (userNm == '') {
			alert("이름을 입력해주세요.");
			return false;

		}

		console.log(idCheck);
		console.log(refCheck);

		if (idCheck && refCheck) {
			$.ajax({
				url : "insertUserInfo", //요청할 url, 주소:포트(http://localhost:8080)는 일반적으로 생략
				type : "POST", //요청 방식 - GET:조회, POST:입력
				cache : false, //캐쉬 - 임시로 데이터를 저장할지 여부, 거의 false
				data : {

					userId : userId,
					userPw : userPw,
					userNm : userNm,
					gndrCd : gndrCd,
					rankCd : rankCd,
					deptCd : deptCd,
					birth : birth,
					reference : reference
				// ★★★ 추천인 값이 있든 없든 넘김
				},

				success : function(data) { //데이터 송,수신에 성공했을 경우의 동작
					alert("가입이 완료되었습니다.");

					window.opener.a($("#userId").val()); //부모창의 함수 실행
					window.close(); // 화면닫기
				},

				error : function(request, status, error) { // 오류가 발생했을 경우의 동작
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				}

			});

		} else if (!idCheck) {
			alert("id중복 체크를 하세요.");

		} else if (!refCheck) {
			alert("추천인 중복체크를 하세요.");

		}

	}

	function a(id) { /* id=팝업에서 넘어온값 (idList.jsp) */
		$("#reference").val(id);
	}
	//함수랑 변수명 같으면 작동안할수도 있음 idCheck 

	function idCheck1() {
		var userId = $("#userId").val();

		$.ajax({
			url : "getAccountInfo", //요청할 url, 주소:포트(http://localhost:8080)는 일반적으로 생략
			type : "GET", //요청 방식 - GET:조회, POST:입력
			cache : false, //캐쉬 - 임시로 데이터를 저장할지 여부, 거의 false
			data : {
				userId : userId

			},

			success : function(data) { //데이터 송,수신에 성공했을 경우의 동작
				if (data != '') { // 아이디 존재하는지 체크
					alert("이미 존재하는 아이디 입니다.");
					idCheck = false;

				} else if ($("#userId").val() == '') { //아이디 공백체크
					alert("아이디를 입력해주세요.");
					idCheck = false;
				}

				else { // 성공
					alert("사용 할수있는 아이디 입니다.");
					idCheck = true;
				}

			},

			error : function(request, status, error) { // 오류가 발생했을 경우의 동작
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);

			}

		});

	}

	function refCheck1() {

		var reference = $("#reference").val();

		$.ajax({
			url : "getAccountInfo", //요청할 url, 주소:포트(http://localhost:8080)는 일반적으로 생략
			type : "GET", //요청 방식 - GET:조회, POST:입력
			cache : false, //캐쉬 - 임시로 데이터를 저장할지 여부, 거의 false
			data : {

				userId : reference

			// ★★★ ★★★ ★★★ 아이디 체크하는 url로 추천인 아이디를 전달 
			/* userId : 서버에서 받을 이름, reference : 보낼 값 */

			},

			success : function(data) { //데이터 송,수신에 성공했을 경우의 동작\

				if (data == '') { // ★★★ ★★★ ★★★추천인 아이디로 조회하여 반환된 data가 없으면 해당 추천인 아이디는 존재하지 않는 것이므로 진행 X(=아이디 체크와 반대로 작동)
					alert("추천인 아이디가 존재하지 않습니다.");
					refCheck = false;

				} else {
					alert("사용할 수잇는 추천인 아이디입니다.");
					refCheck = true;

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

	<%-- ${a} ${b} --%>
	<table>


		<tr>
			<td class="t1">아이디</td>
			<td class="t2"><input type="text" id="userId"><input
				type="button" value="중복체크" onclick="idCheck1()"></td>

		</tr>

		<tr>
			<td class="t1">비밀번호</td>
			<td class="t2"><input type="password" id="userPw"></td>
		</tr>

		<tr>
			<td class="t1">이름</td>
			<td class="t2"><input type="text" id="userNm"></td>
		</tr>

		<tr>
			<td class="t1">성별</td>
			<td class="t2"><select id="gndrCd">
					<c:forEach var="gndr" items="${gndrList}">
						<option value="${gndr.CODE}">${gndr.NAME}</option>
					</c:forEach>
			</select></td>
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
			<td class="t1">추천인</td>
			<td class="t2"><input type="text" id="reference" readonly>
				<!-- readonly , disabled 둘다 사용가능 후자가 더 직관적 --> <input type="button"
				value="조회" onclick="refListPop()"><input type="button"
				value="확인" onclick="refCheck1()"></td>
		</tr>

		<tr>
			<td colspan="2"><input type="button" value="회원가입"
				onclick="fnSave()"></td>

		</tr>

	</table>

</body>

</html>

