<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<style>
	#tbl{
		border:2px solid gray;
	}
	td {
	width: 100px;
	height: 30px;
	border: 1px solid lightgray;
	text-align:center;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
function fnSearch() {
	$.ajax({
		url : "list2",	//요청할 url, 주소:포트(http://localhost:8080)는 일반적으로 생략
		type : "GET",	//요청 방식 - GET:조회, POST:입력
		cache : false,	//캐쉬 - 임시로 데이터를 저장할지 여부, 거의 false
		dataType : "json",		//데이터의 형식, 거의 json
		success : function(a) {	//데이터 송,수신에 성공했을 경우의 동작
			var t  = "<tr>";
			t += 	"<td>아이디</td>"
			t += 	"<td>닉네임</td>"
			t += 	"<td>이름</td>"
			t += "</tr>";
		for (var i = 0; i < a.length; i++) {
			t += "<tr>"
			t += 	"<td>" + a[i].ID + "</td>"
			t += 	"<td>" + a[i].NICK + "</td>"
			t += 	"<td>" + a[i].NAME + "</td>"
			t += "</tr>"
		}
		$("#tbl").html(t); // innerHTML
		$("#tbl").css("color","red"); //style
		$('tr:odd').css('background', '#F9F9F9');
		$('tr:even').css('background', '#D8D8D8');
		$('tr:eq(0)').css('background', '#000000').css('color', 'White');
		$('input[type=button]').val("2");
		$('input[type=text]').css("color","blue");
		$("#cnt").val(list.length+"명"); // value
		$("#cnt").attr("class","new"); // value
		},
		error : function(request, status, error) {	// 오류가 발생했을 경우의 동작
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}
</script>
</head>
<body>
	<input type="button" onclick="fnSearch()"><br>
	<input type="text" readonly id="cnt"><br>
	<input type="text"  id="cnt2"><br>
	<input type="text"  id="cnt3"><br>
	<input type="text"  id="cnt4"><br>
	<table id="tbl"></table>
</body>
</html>
