<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<title>등록 화면</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
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

.no_memberwrap {
	width: 400px;
	margin: 125px auto 125px
}

.no_member_cont .btn_box {
	border-top: 0;
	padding: 15px 0 0
}

.no_member_cont {
	width: 394px;
	height: 165px;
	padding-top: 48px;
	border: 3px solid #29367c;
	background: #fff
}

.no_member_cont .inner {
	width: 176px;
	margin: 0 auto
}

.no_member_cont .inner .txt {
	display: block;
	font-size: 15px;
	color: #29367c;
	text-align: center
}

.pw_inquiry {
	width: 164px;
	height: 37px;
	padding: 0 5px;
	margin-top: 14px;
	background: #f3f3f3;
	border: 1px solid #cecdce
}

.pw_inquiry:focus {
	background: #fff
}

.no_member_cont, .btn_blue.small {
	margin-left: 2px
}

.no_member_cont, .btn_gray.small {
	margin-left: -8px;
}

.no_memberwrap, .btn_box {
	position: relative
}

.no_memberwrap, .no_member_cont {
	margin: 300px auto;
}

.btn_gray {
	background: #666;
	border-color: #444;
	text-shadow: 0px -1px #474747;
	color: #fff;
}

.btn_blue {
	background: #3b4890;
	border-color: #29367c;
	text-shadow: 0px -1px #1d2761;
	color: #fff;
}

.btn_gray.small, .btn_blue.small {
	width: 85px;
	height: 31px;
	line-height: 29px;
	border-width: 1px;
	border-style: solid;
	border-radius: 2px;
	font-size: 12px;
	font-weight: bold;
}

.btn_gray, .brn_blue {
	width: 85px;
	padding-right: 2px;
}

button {
	font-family: -apple-system, BlinkMacSystemFont, "Apple SD Gothic Neo",
		"Malgun Gothic", "맑은 고딕", arial, Dotum, 돋움, sans-serif;
	cursor: pointer;
}
</style>
<script>
	function fnList() { /* 저장취소시 */
		location.href = "/bulletinBoard_List";
	}

	function fnDelete() {
		var no = $("#no").val();

		var password = $("#password").val();

		if (password == '') {
			alert("비밀번호를 입력해주세요.");
			return false;
		}

		$.ajax({

			url : "bulletinBoardDelete", //요청할 url, 주소:포트(http://localhost:8080)는 일반적으로 생략

			type : "GET", //요청 방식 - GET:조회, POST:입력

			cache : false, //캐쉬 - 임시로 데이터를 저장할지 여부, 거의 false

			data : {

				no : no,

				password : password

			},

			success : function(data) { //데이터 송,수신에 성공했을 경우의 동작

				if (data.PASSWORD == "X") { /* 비밀번호가 틀렸을 경우  */
					alert("비밀번호가 틀렸습니다. 다시입력해주세요.");

				} else {

					var t = confirm("게시물을 삭제하시겠습니까?");
					if (t == true) {
						location.href = "/bulletinBoardDelete?no="
								+ $("#no").val();
						//location.href = "/bulletinBoardFileDelete?no=" + no; 필요없는듯
						//깨달은점 : url안에 같은 함수 실행?

					}

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
	<input type="hidden" value="${post_Delete.NO}" id="no">
	<div class="no_memberwrap">
		<div class="no_member_cont">
			<div class="inner">
				<b class="txt">비밀번호를 입력하세요.</b> <input class="pw_inquiry"
					id="password" name="${PASSWORD}" type="password" title="비밀번호 입력">
				<div class="btn_box">
					<button type="button" onclick="javascript:history.back();"
						class="btn_gray small">취소</button>
					<button type="button" onclick="fnDelete()" class="btn_blue small">확인</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>