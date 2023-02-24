<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<title>customerDetail</title>
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
	function fnSave() {

		//저장
		var t = confirm("저장하시겠습니까?");
		if (t == true) {

			var name = $("#name").val();
			var birth = $("#birth").val();
			var address = $("#address").val();
			var contact = $("#contact").val();

			$.ajax({ //동기통신 : 화면 안바뀌고 데이터만 주고받고 하는 것
				url : "/customerNew", //요청할 url, 주소:포트(http://localhost:8080)는 일반적으로 생략
				type : "GET", //요청 방식 - GET:조회, POST:입력
				cache : false, //캐쉬 - 임시로 데이터를 저장할지 여부, 거의 false
				data : { /* 보낼이름(키) : 값 */
			
					name : name,
					birth : birth,
					address : address,
					contact : contact

				},
				success : function(a) { //데이터 송,수신에 성공했을 경우의 동작
					alert("저장되었습니다.");
					location.href = "/customerList"
					console.log(a.name);
					console.log(a.birth);
					console.log(a.address);
					console.log(a.contact);

				},

				error : function(request, status, error) { // 오류가 발생했을 경우의 동작
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				}
			});

		}

	}
	/* 화면이 안바뀌고 데이터를 주고받을수있음 */

	function fnCancel() {
		location.href = "/customerList"
	}
</script>
</head>
<body>
	<input type="hidden" value='${customerDetail.CUST_NO}' id="custNo">
	<table style="width: 600px;">

		<tr>
			<td style="width: 20%">직원명</td>
			<td style="width: 30%"><input type="text" id="name"></td>
		</tr>
		<tr>
			<td style="width: 20%">생년월일</td>
			<td style="width: 30%"><input type="text" id="birth"></td>
		</tr>
		<tr>
			<td style="width: 20%">주소</td>
			<td style="width: 30%"><input type="text" id="address"></td>
		</tr>
		<tr>
			<td style="width: 20%">연락처</td>
			<td style="width: 30%"><input type="text" id="contact"></td>
		</tr>

		<tr>
			<td class="td_footer" colspan="4"><input type="button"
				value="저장" onclick="fnSave()"><input type="button"
				value="취소" onclick="fnCancel()">
		<tr>
	</table>
</body>
</html>
