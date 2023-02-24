<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<style>
body {
	width: 50%;
	height: 50%;
	margin: 50px auto;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>

<script>
	$(document).ready(function() {

		var date = new Date();
		var selYear = date.getFullYear();
		var selMonth = date.getMonth() + 1;
		var selDate = date.getDate();
		var selHour = date.getHours();
		var selMinute = date.getMinutes();

		// 현재년도를 기준으로 호출
		getYears(selYear);
		getMonths(selMonth);
		getDates(selDate);

		getHours(selHour);
		getMinutes(selMinute);

		// 현재 년도를 select 함.
		$('#yearBox').val(selYear);
		$('#monthBox').val(selMonth);
		$('#dateBox').val(selDate);

		$('#selStartHour').val(selHour);
		$('#selStartMinute').val(selMinute);

		// 바뀐 년도를 기준으로 다시 option을 세팅함
		$('#yearBox').change(function() {
			var chgYear = $(this).val();
			getYears(chgYear);
			$('#yearBox').val(chgYear);
		});

		$('#monthBox').change(function() {
			var chgMonth = $(this).val();
			getMonths(chgMonth);
			$('#monthBox').val(chgMonth);
		});

		$('#dateBox').change(function() {
			var chgDate = $(this).val();
			getDates(chgDate);
			$('#dateBox').val(chgDate);
		});

		$('#selStartHour').change(function() {
			var chgHour = $(this).val();
			getHours(chgHour);
			$('#selStartHour').val(chgHour);
		});

		$('#selStartMinute').change(function() {
			var chgMinute = $(this).val();
			getMinutes(chgMinute);
			$('#selStartMinute').val(chgMinute);
		});

	});

	function getYears(getY) {

		// 기존 optopn을 삭제함
		$("#yearBox option").remove();

		// 올해 기준으로 -2년부터 +5년을 보여줌.
		var stY = Number(getY) - 2;
		var enY = Number(getY) + 5;
		for (var y = stY; y <= enY; y++) {
			$('#yearBox').append("<option value='"+ y +"'>" + y + "</option>");
		}
	}

	function getMonths(getM) {

		// 기존 optopn을 삭제함
		$("#monthBox option").remove();

		for (var i = 1; i <= 12; i++) {
			if (i < 10) {
				$('#monthBox').append(
						"<option value='"+ i +"'>" + '0' + i
								+ "</option>");

			} else {

				$('#monthBox').append(
						"<option value='"+ i +"'>" + i + "</option>");
			}

		}

	}

	function getDates(getD) {

		// 기존 optopn을 삭제함
		$("#dateBox option").remove();

		for (var i = 1; i < 32; i++) {
			if (i < 10) {
				$('#dateBox').append(
						"<option value='"+ '0' + i +"'>" + '0' + i
								+ "</option>");

			} else {

				$('#dateBox').append(
						"<option value='"+ i +"'>" + i + "</option>");
			}

		}

	}

	function getHours(getH) {

		// 기존 optopn을 삭제함
		$("#selStartHour option").remove();

		for (var i = 0; i < 24; i++) {
			if (i < 10) {
				$('#selStartHour').append(
						"<option value='"+ '0' + i +"'>" + '0' + i
								+ "</option>");

			} else {

				$('#selStartHour').append(
						"<option value='"+ i +"'>" + i + "</option>");
			}

		}

	}

	function getMinutes(getMn) {

		// 기존 optopn을 삭제함
		$("#selStartMinute option").remove();

		for (var i = 0; i < 60; i++) {
			if (i < 10) {
				$('#selStartMinute').append(
						"<option value='"+ '0' + i +"'>" + '0' + i
								+ "</option>");

			} else {

				$('#selStartMinute').append(
						"<option value='"+ i +"'>" + i + "</option>");
			}

		}

	}

	function fnSchAdd() {
		var yearBox = $("#yearBox").val();
		var monthBox = $("#monthBox").val();
		var dateBox = $("#dateBox").val();

		var selStartHour = $("#selStartHour").val();
		var selStartMinute = $("#selStartMinute").val();

		var schdlNm = $("#schdlNm").val();

		$.ajax({
			url : "insertSch", //요청할 url, 주소:포트(http://localhost:8080)는 일반적으로 생략
			type : "POST", //요청 방식 - GET:조회, POST:입력
			cache : false, //캐쉬 - 임시로 데이터를 저장할지 여부, 거의 false
			data : {
				yearBox : yearBox,
				monthBox : monthBox,
				dateBox : dateBox,
				selStartHour : selStartHour,
				selStartMinute : selStartMinute,
				schdlNm : schdlNm

			},
			success : function(data) { //데이터 송,수신에 성공했을 경우의 동작
				console.log(yearBox);
				console.log(monthBox);
				console.log(dateBox);
				console.log(selStartHour);
				console.log(selStartMinute);
				
				alert("저장되었습니다.");
				window.opener.c(yearBox); //부모창의 함수 실행
				window.opener.b(monthBox); //부모창의 함수 실행 
				$(opener.location).attr("href", "javascript:fnSearch();");  // 자식창에서 부모창의 함수 호출, 실행하기
				 window.close(); 
			},
			error : function(request, status, error) { // 오류가 발생했을 경우의 동작
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		});
	}
</script>
<title>스케줄 등록</title>
</head>
<body>
	<select id="yearBox"></select>
	<select id="monthBox"></select>
	<select id="dateBox"></select>

	<select id="selStartHour"></select>
	<select id="selStartMinute"></select>
	<br>
	<br>
	<input type="text" id="schdlNm">
	<br>
	<input type="button" id="btnSchAdd" onclick="fnSchAdd()" value="일정등록">


</body>

</html>