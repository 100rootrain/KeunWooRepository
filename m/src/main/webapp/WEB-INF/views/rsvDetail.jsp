<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<title>Home</title>
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
	function fnSave(a) {

		/* 완료 -> 완료 X 
		완료-> 취소 X  
		취소-> 완료 X 
		최소-> 취소 X  
		6시간전에 취소 X*/
		

		if (a == 1) {
			//저장
			var t = confirm("저장하시겠습니까?");
			if (t == true) {

				var rsvNo = $("#rsvNo").val();
				var name = $("#name").val();
				var rsvDt = $("#rsvDt").val();
				var rsvTm = $("#rsvTm").val();
				var rsvHr = $("#rsvHr").val();
				var contact = $("#contact").val();
				var remark = $("#remark").val();
				var headCnt = $("#headCnt").val();

				/* 화면이 안바뀌고 데이터를 주고받을수있음 */

				$.ajax({
					url : "/updateInfo", //요청할 url, 주소:포트(http://localhost:8080)는 일반적으로 생략
					type : "GET", //요청 방식 - GET:조회, POST:입력
					cache : false, //캐쉬 - 임시로 데이터를 저장할지 여부, 거의 false
					data : { /* 보낼이름(키) : 값 */
						rsvNo : rsvNo,
						name : name,
						rsvDt : rsvDt,
						rsvTm : rsvTm,
						rsvHr : rsvHr,
						contact : contact,
						remark : remark,
						headCnt : headCnt
					},
					success : function(a) { //데이터 송,수신에 성공했을 경우의 동작
						alert("저장되었습니다.");
						location.href = "/rsvList"
					},

					error : function(request, status, error) { // 오류가 발생했을 경우의 동작
						alert("code:" + request.status + "\n" + "message:"
								+ request.responseText + "\n" + "error:"
								+ error);
					}
				});

			}
		} else if (a == 2) {
			//취소

			var rsvNo = $("#rsvNo").val();

			$.ajax({
				url : "/selectRsvStat", //요청할 url, 주소:포트(http://localhost:8080)는 일반적으로 생략
				type : "GET", //요청 방식 - GET:조회, POST:입력
				cache : false, //캐쉬 - 임시로 데이터를 저장할지 여부, 거의 false
				data : { /* 보낼이름(키) : 값 */
					rsvNo : rsvNo

				},
				success : function(a) {
					if (a.STAT == 2) { /*a  맵이라서 맵.key 어레이리스트라면 포문으로 돌려봐야됨 */
						alert("이미 취소된 건입니다.");
						return;
					}
					if (a.STAT == 3) {
						alert("이미 완료된 건입니다.");
						return;
					}
					if (a.TM < 6) {
						alert("예약시간 6시간 이전에만 취소할 수 있습니다.");
						return;
					}
					
					
						var t = confirm("환불 수수료는 "+a.FEE+"% 입니다. 취소하시겠습니까?");
						if (t == true) {
							location.href = "rsvUpdate?rsvNo=" + $("#rsvNo").val()
									+ "&stat=2&fee="+a.FEE;
						}
				},

				error : function(request, status, error) { // 오류가 발생했을 경우의 동작
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				}
			});
			
			
			

		} else {
			//완료
			var rsvNo = $("#rsvNo").val();

			$.ajax({
				url : "/selectRsvStat", //요청할 url, 주소:포트(http://localhost:8080)는 일반적으로 생략
				type : "GET", //요청 방식 - GET:조회, POST:입력
				cache : false, //캐쉬 - 임시로 데이터를 저장할지 여부, 거의 false
				data : { /* 보낼이름(키) : 값 */
					rsvNo : rsvNo

				},
				success : function(a) {/*a  맵이라서 맵.key 어레이리스트라면 포문으로 돌려봐야됨 */
					if (a.STAT == 2) {
						alert("이미 취소된 건입니다.");
						return;
					}
					if (a.STAT == 3) {
						alert("이미 완료된 건입니다.");
						return;
					}
					location.href = "rsvUpdate?rsvNo=" + $("#rsvNo").val()
							+ "&stat=3";
				},

				error : function(request, status, error) { // 오류가 발생했을 경우의 동작
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				}
			});

		}

	}

	function fnList() {
		location.href = "/rsvList"
	}
</script>
</head>
<body>
	<input type="hidden" value='${map.RSV_NO}' id="rsvNo">
	<table style="width: 600px;">

		<tr>
			<td style="width: 20%">예약자명</td>
			<td style="width: 30%"><input type="text" value='${map.NAME}'
				id="name"></td>
		</tr>
		<tr>
			<td style="width: 20%">예약일</td>
			<td style="width: 30%"><input type="text" value='${map.RSV_DT}'
				id="rsvDt"></td>
		</tr>
		<tr>
			<td style="width: 20%">예약시</td>
			<td style="width: 30%"><input type="text" value='${map.RSV_TM}'
				id="rsvTm"></td>
		</tr>
		<tr>
			<td style="width: 20%">예약시간</td>
			<td style="width: 30%"><input type="text" value='${map.RSV_HR}'
				id="rsvHr"></td>
		</tr>
		<tr>
			<td style="width: 20%">연락처</td>
			<td style="width: 30%"><input type="text" value='${map.CONTACT}'
				id="contact"></td>
		</tr>
		<tr>
			<td style="width: 20%">예약인원</td>
			<td style="width: 30%"><input type="text"
				value='${map.HEAD_CNT}' id="headCnt"></td>
		</tr>
		<tr>
			<td style="width: 20%">요청사항</td>
			<td style="width: 30%"><input type="text" value='${map.REMARK}'
				id="remark"></td>
		</tr>
		<tr>
			<td style="width: 20%">처리상태</td>
			<td style="width: 30%">${map.STAT}</td>
		</tr>
		<tr>
			<td class="td_footer" colspan="4"><input type="button"
				value="저장" onclick="fnSave(1)"> <input type="button"
				value="취소" onclick="fnSave(2)"> <input type="button"
				value="완료" onclick="fnSave(3)"> <input type="button"
				value="목록" onclick="fnList()"></td>
		<tr>
	</table>
</body>
</html>
