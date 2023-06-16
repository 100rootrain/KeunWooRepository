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
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script>
	var date;
	var year;
	var month;
	var day;

	$(document).ready(
			function() {

				$("#yearMonthDate").datepicker(
						{
							dateFormat : 'yymmdd',
							onSelect : function(dateText, inst) {
								date = $(this).datepicker('getDate'),
								day = date.getDate(), 
								month = date.getMonth() + 1, 
								year = date.getFullYear();
								
								console.log(year + "년");
								console.log(month + "월");
								console.log(day + "일");

							}
						});
			});
	
	

	function fnSchAdd() {
		var yearMonthDate = $("#yearMonthDate").val();
		var holidayNm = $("#holidayNm").val();

		if(yearMonthDate.length<8){
			alert("옳바른 날짜를 입력해주세요. 날짜의 형식은 YYYYMMDD입니다. 현재 날짜의 길이수는"+yearMonthDate.toString().length+"입니다.");
			return false;
		}

		if(holidayNm == ''){
			alert("휴일명을 입력해주세요.");
			return false;
		}

		$.ajax({
			url : "insertHoliday", //요청할 url, 주소:포트(http://localhost:8080)는 일반적으로 생략
			type : "POST", //요청 방식 - GET:조회, POST:입력
			cache : false, //캐쉬 - 임시로 데이터를 저장할지 여부, 거의 false
			data : {
				yearMonthDate : yearMonthDate,
				holidayNm : holidayNm

			},
			success : function(data) { //데이터 송,수신에 성공했을 경우의 동작
				console.log(yearMonthDate); //yyyymmdd 로 나옴.
			
				console.log(year + "년");
				console.log(month + "월");
				console.log(day + "일");

				alert("저장되었습니다.");
				
				window.opener.a(month); //부모창의 함수 실행(휴일등록창의 월 -> 달력창의 월)
				
				$(opener.location).attr("href", "javascript:fnSearch();"); // 자식창에서 부모창의 함수 호출, 실행하기
				window.close(); 
			},
			error : function(request, status, error) { // 오류가 발생했을 경우의 동작
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		});
	}

	function emptyChk(){

		var yearMonthDate = $("#yearMonthDate").val();
		var holidayNm = $("#holidayNm").val();


	}
</script>
<title>휴일 등록</title>
</head>
<body>
	<input type="text" id="yearMonthDate" value="${yearMonthDate}" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
	<br>
	<br>
	<input type="text" id="holidayNm">
	<br>
	<input type="button" id="btnSchAdd" onclick="fnSchAdd()" value="휴일등록">


</body>

</html>