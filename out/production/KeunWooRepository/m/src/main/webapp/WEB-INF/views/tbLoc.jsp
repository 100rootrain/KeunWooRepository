<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<title>tbLoc</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<style>
td {
	border: 1px solid lightgray;
	width: 100px;
	height: 20px;
	text-align: center;
}
</style>
<script>

/* window.onload = function (){
	
	change_Station()
	자바스크립트 방식 (화면이 열릴때 쓰는것)
} */

$(document).ready(function(){change_Station()})
//제이쿼리방식
	function change_Station() {
		var locNm = $("#locNm").val();
		console.log(locNm);

		var sttnNm = $("#sttnNm").val();
		console.log(sttnNm);
		
		
		

		$.ajax({
			url : "getStationList", //요청할 url, 주소:포트(http://localhost:8080)는 일반적으로 생략
			type : "GET", //요청 방식 - GET:조회, POST:입력
			cache : false, //캐쉬 - 임시로 데이터를 저장할지 여부, 거의 false
			data : {

				locNm : locNm

			},
			success : function(data) { //데이터 송,수신에 성공했을 경우의 동작
				console.log(data);
				$("#sttnNm").val(data.STTN_NM);
				
				var t = ""
				
				
				for (var i=0; i<data.length; i++){
					t += "<option value='"+data[i].STTN_NM+"'>" + data[i].STTN_NM +"</option>"
					
				}
				$("#sttnNm").html(t);


				//나머지 값도 세팅

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
	<select id="locNm" onchange="change_Station()">

		<c:forEach var="locationName" items="${locationList}">
			<option value="${locationName.LOC_NM}">${locationName.LOC_NM}</option>

		</c:forEach>

	</select>


	<select id="sttnNm">

	</select>


</body>
</html>
