<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<style>
#t {
	border-collapse: collapse; /*  표 테두리 합치기(collapse) */
	width: 100%;
	height: 100%;
	margin: auto;
}

td {
	border: 1px solid gray;
	padding: 3px;
	width: 120px;
	height: 120px;
	vertical-align: top; /* 태그 내부 수직방향 top middle bottom */
}

th {
	background-color: #dddddd;
	border: 1px solid gray;
	fonr-weight: bold;
	height: 30px
}

th:nth-child(1) { /* th,td의 자식중 첫번째 요소 */
	color: red;
	background-color: #f0d6d0;
}

th:nth-last-child(1) { /* th의 자식중 마지막 요소 */
	color: blue;
	background-color: #b6bed8;
}

#div_1 {
	margin: auto;
}

#div_2 {
	font-weight: bold;
	font-size: 50px;
	text-align: center;
}

#div_3 {
	float: right;
}

#div_4 {
	
}

.btn {
	
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>

<script>
	function b(b) { // 일정 등록 -> 달력 
		alert(b);
		$('#monthBox').val(b);
	}
	function c(c) { // 일정 등록 -> 달력 
		alert(c);
		$('#yearBox').val(c);
	}

	function a(v) { // 휴일 등록 -> 달력
		$('#monthBox').val(v);
	}

	$(document).ready(function() {

		var date = new Date();
		var selYear = date.getFullYear();
		var selMonth = date.getMonth() + 1;


		// 현재년도를 기준으로 호출
		getYears(selYear);
		getMonths(selMonth);

		// 현재 년도를 select 함.
		$('#yearBox').val(selYear);
		$('#monthBox').val(selMonth);

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

		fnSearch(); /* Calendar로 접속할떄 바로 띄우기위해서 */

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
						"<option value='" + i +"'>" + '0' + i + "</option>");

			} else {

				$('#monthBox').append(
						"<option value='"+ i +"'>" + i + "</option>");
			}

		}

	}
	function fnSearch() {
		var date = new Date();
		var today = date.getDate(); // 오늘 날짜 
		var month = date.getMonth() + 1; // 이번달 
		var year = date.getFullYear() // 올해 

		console.log("오늘 날짜(today)는 : " + today);
		console.log("이번 달(month)은 : " + month);
		console.log("올해(year)는 : " + year);

		var yearBox = $("#yearBox").val();
		var monthBox = $("#monthBox").val();

		var month_Title = document.getElementById("monthBox");
		var year_Title = document.getElementById("yearBox");

		var selected_Year = year_Title.options[year_Title.selectedIndex].value
		var selected_Month = month_Title.options[month_Title.selectedIndex].value

		console.log("selected_Year : " + selected_Year);
		console.log("selected_Month :" + selected_Month);
		
		$.ajax({
			url : "getAnniversary", //요청할 url, 주소:포트(http://localhost:8080)는 일반적으로 생략
			type : "GET", //요청 방식 - GET:조회, POST:입력
			cache : false, //캐쉬 - 임시로 데이터를 저장할지 여부, 거의 false
			data : {
		    	chgYear : $('#yearBox').val(),
		    	chgMonth : $('#monthBox').val()

			},
			success : function(data) { //데이터 송,수신에 성공했을 경우의 동작
				
				$
				.ajax({
					url : "getCal", //요청할 url, 주소:포트(http://localhost:8080)는 일반적으로 생략
					type : "GET", //요청 방식 - GET:조회, POST:입력
					cache : false, //캐쉬 - 임시로 데이터를 저장할지 여부, 거의 false
					data : {

						yearBox : yearBox,
						monthBox : monthBox

					},
					success : function(data) { //데이터 송,수신에 성공했을 경우의 동작

						console.log(yearBox + "년");
						console.log(monthBox + "월");
						console.log(data);
						var t = "";
						t += "<thead>"
						t += "<tr>"
						t += "<th>일</th>"
						t += "<th>월</th>"
						t += "<th>화</th>"
						t += "<th>수</th>"
						t += "<th>목</th>"
						t += "<th>금</th>"
						t += "<th>토</th>"
						t += "</tr>"
						t += "</thead>"
						for (var i = 0; i < data.length; i++) {
							/* 일요일 */

							var sun = data[i].SUN;

							if (selected_Month == month
									&& selected_Year == year) {
								if (data[i].SUN == today) {
									sun_color = "style='background-color: #ffebcd '" // today
								} else {
									sun_color = "style='background-color: #f0d6d0'" //일요일 
								}

							} else { //선택한 년/월이 해당되지않으면
								sun_color = "style='background-color: #f0d6d0'" //일요일 
							}

							var sun_hnm = data[i].SUN_HNM + "<input type='hidden' class='sunMrg' value='"+data[i].SUN_HNM+"'>"; /* 휴일명 */
							var sun_hnm_color = data[i].SUN_HCNT > 0 ? "<div style='color:red;font-weight:bold;'>" /* 휴일명 속성 */
									: "<div style='color:red;font-weight:normal'>";
							var sun_schdl_nm = data[i].SUN_SCHDL_NM; /* 일정명 */

							/* 	var sun_color = data[i].SUN == today? data[i].SUN_HCNT > 0?  "style='background-color: coral'" : "style='background-color: #f0d6d0'"
									: "style='background-color: #f0d6d0'";
							 */

							/* 월요일 */
							var mon = data[i].MON; // 월요일 
							var mon_hcnt = data[i].MON_HCNT; //월요일 휴일 

							if (selected_Month == month
									&& selected_Year == year) {

								if (mon == today && mon_hcnt != 0) {
									mon_color = "style='background-color: #ffebcd'" //today,휴일 

								} else if (mon == today && mon_hcnt == 0) { //today,평일
									mon_color = "style='background-color:#ffebcd;color:black'"
								} else if (mon != today && mon_hcnt == 0) { //평일 
									mon_color = "style='color:black'"
								} else if (mon != today && mon_hcnt != 0) { //휴일 
									mon_color = "style='background-color:#f0d6d0'"
								}

							} else {
								if (mon != today && mon_hcnt == 0) {
									mon_color = "style='color:black'" //평일 
								} else if (mon != today && mon_hcnt != 0) {
									mon_color = "style='background-color:#f0d6d0'" //휴일
								}

							}

							var mon_hnm = data[i].MON_HNM; /* 휴일명 */
							var mon_hnm_color = data[i].MON_HCNT > 0 ? "<div style='color:red;font-weight:bold;'>" /* 휴일명 속성 */
									: "<div style='color:black;font-weight:normal'>";
							var mon_schdl_nm = data[i].MON_SCHDL_NM; /* 일정명 */

							/* 화요일 */
							var tue = data[i].TUE; // 화요일 
							var tue_hcnt = data[i].TUE_HCNT; //화요일 휴일

							if (selected_Month == month
									&& selected_Year == year) {

								if (tue == today && tue_hcnt != 0) {
									tue_color = "style='background-color: #ffebcd'" //today,휴일 

								} else if (tue == today && tue_hcnt == 0) { //today,평일
									tue_color = "style='background-color:#ffebcd;color:black'"
								} else if (tue != today && tue_hcnt == 0) { //평일 
									tue_color = "style='color:black'"
								} else if (tue != today && tue_hcnt != 0) { //휴일 
									tue_color = "style='background-color:#f0d6d0'"
								}

							} else {
								if (tue != today && tue_hcnt == 0) {
									tue_color = "style='color:black'" //평일 
								} else if (tue != today && tue_hcnt != 0) {
									tue_color = "style='background-color:#f0d6d0'" //휴일
								}

							}

							var tue_hnm = data[i].TUE_HNM;
							var tue_hnm_color = data[i].TUE_HCNT > 0 ? "<div style='color:red;font-weight:bold;'>"
									: "<div style='color:black;font-weight:normal'>";
							var tue_schdl_nm = data[i].TUE_SCHDL_NM; /* 일정명 */

							/* 수요일 */
							var wed = data[i].WED;
							var wed_hcnt = data[i].WED_HCNT; //수요일 휴일

							if (selected_Month == month
									&& selected_Year == year) {

								if (wed == today && wed_hcnt != 0) {
									wed_color = "style='background-color: #ffebcd'" //today,휴일 

								} else if (wed == today && wed_hcnt == 0) { //today,평일
									wed_color = "style='background-color:#ffebcd;color:black'"
								} else if (wed != today && wed_hcnt == 0) { //평일 
									wed_color = "style='color:black'"
								} else if (wed != today && wed_hcnt != 0) { //휴일 
									wed_color = "style='background-color:#f0d6d0'"
								}

							} else {
								if (wed != today && wed_hcnt == 0) {
									wed_color = "style='color:black'" //평일 
								} else if (wed != today && wed_hcnt != 0) {
									wed_color = "style='background-color:#f0d6d0'" //휴일
								}

							}

							var wed_hnm = data[i].WED_HNM;
							var wed_hnm_color = data[i].WED_HCNT > 0 ? "<div style='color:red;font-weight:bold;'>"
									: "<div style='color:black;font-weight:normal'>";
							var wed_schdl_nm = data[i].WED_SCHDL_NM; /* 일정명 */

							/* 목요일 */
							var thu = data[i].THU;
							var thu_hcnt = data[i].THU_HCNT; //목요일 휴일

							if (selected_Month == month
									&& selected_Year == year) {

								if (thu == today && thu_hcnt != 0) {
									thu_color = "style='background-color: #ffebcd'" //today,휴일 

								} else if (thu == today && thu_hcnt == 0) { //today,평일
									thu_color = "style='background-color:#ffebcd;color:black'"
								} else if (thu != today && thu_hcnt == 0) { //평일 
									thu_color = "style='color:black'"
								} else if (thu != today && thu_hcnt != 0) { //휴일 
									thu_color = "style='background-color:#f0d6d0'"
								}

							} else {
								if (thu != today && thu_hcnt == 0) {
									thu_color = "style='color:black'" //평일 
								} else if (thu != today && thu_hcnt != 0) {
									thu_color = "style='background-color:#f0d6d0'" //휴일
								}

							}
							var thu_hnm = data[i].THU_HNM;
							var thu_hnm_color = data[i].THU_HCNT > 0 ? "<div style='color:red;font-weight:bold;'>"
									: "<div style='color:black;font-weight:normal'>";
							var thu_schdl_nm = data[i].THU_SCHDL_NM; /* 일정명 */

							/* 금요일 */
							var fri = data[i].FRI;
							var fri_hcnt = data[i].FRI_HCNT; //금요일 휴일

							if (selected_Month == month
									&& selected_Year == year) {

								if (fri == today && fri_hcnt != 0) {
									fri_color = "style='background-color: #ffebcd'" //today,휴일 

								} else if (fri == today && fri_hcnt == 0) { //today,평일
									fri_color = "style='background-color:#ffebcd;color:black'"
								} else if (fri != today && fri_hcnt == 0) { //평일 
									fri_color = "style='color:black'"
								} else if (fri != today && fri_hcnt != 0) { //휴일 
									fri_color = "style='background-color:#f0d6d0'"
								}

							} else {
								if (fri != today && fri_hcnt == 0) {
									fri_color = "style='color:black'" //평일 
								} else if (wed != today && fri_hcnt != 0) {
									fri_color = "style='background-color:#f0d6d0'" //휴일
								}

							}

							var fri_hnm = data[i].FRI_HNM;
							var fri_hnm_color = data[i].FRI_HCNT > 0 ? "<div style='color:red;font-weight:bold;'>"
									: "<div style='color:black;font-weight:normal'>";
							var fri_schdl_nm = data[i].FRI_SCHDL_NM; /* 일정명 */

							/* 토요일 */
							var sat = data[i].SAT;

							/* 토요일 today */
							if (selected_Month == month
									&& selected_Year == year) {
								if (data[i].SAT == today) {
									sat_color = "style='background-color: #ffebcd '" // today
								} else {
									sat_color = "style='background-color: #b6bed8'" //토요일 
								}

							} else {
								sat_color = "style='background-color: #b6bed8'" //토요일 
							}

							/* 토요일 휴일  */

							var sat_hnm = data[i].SAT_HNM;
							var sat_hnm_color = data[i].SAT_HCNT > 0 ? "<div style='color:red;font-weight:bold;'>" /* 휴일명 속성 */
									: "<div style='color:blue;font-weight:normal'>";
							var sat_schdl_nm = data[i].SAT_SCHDL_NM; /* 일정명 */

							t += "<tbody>"
							t += "<tr>";
							/* 일요일 */
							t += "<td "+sun_color+"><font size='5'>"
									+ sun_hnm_color + "<b>" + sun + "</b>"
									+ "</font><div contenteditable='true' class='editHnm'>" + sun_hnm + "</div></div><div>"
									+ sun_schdl_nm + "</div></td>"

							/* 월요일 */
							t += "<td "+mon_color+"><font size='5'>"
									+ mon_hnm_color + mon + "</font><br>"
									+ mon_hnm + "</div><br>" + mon_schdl_nm
									+ "</td>" /* <td style="color:red"> 이기때문에 td하고 공백 필수! */

							/* 화요일 */
							t += "<td "+tue_color+"><font size='5'>"
									+ tue_hnm_color + tue + "</font><br>"
									+ tue_hnm + "</div><br>" + tue_schdl_nm
									+ "</td>"

							/* 수요일 */
							t += "<td "+wed_color+"><font size='5'>"
									+ wed_hnm_color + wed + "</font><br>"
									+ wed_hnm + "</div><br>" + wed_schdl_nm
									+ "</td>"

							/* 목요일 */
							t += "<td "+thu_color+"><font size='5'>"
									+ thu_hnm_color + thu + "</font><br>"
									+ thu_hnm + "</div><br>" + thu_schdl_nm
									+ "</td>"

							/* 금요일 */
							t += "<td "+fri_color+"><font size='5'>"
									+ fri_hnm_color + fri + "</font><br>"
									+ fri_hnm + "</div><br>" + fri_schdl_nm
									+ "</td>"

							/* 토요일 */
							t += "<td "+sat_color+"><font size='5'>"
									+ sat_hnm_color + "<b>" + sat + "</b>"
									+ "</font><br>" + sat_hnm + "</div><br>"
									+ sat_schdl_nm + "</td>"
							t += "</tr>";
							t += "</tbody>"

						}
						//$("#t").html(''); /* 달력이 계속 추가되는것 방지 */
						$("#t").html(t);

						$("#div_2")
								.html(
										month_Title.options[month_Title.selectedIndex].value
												+ "月");

						console.log("month_Title : " + month_Title); // [object HTMLSelectElement] 로 뜸 
						console
								.log('선택된 옵션 text 값='
										+ month_Title.options[month_Title.selectedIndex].text); // 옵션 text 값
						console
								.log('선택된 옵션 value 값='
										+ month_Title.options[month_Title.selectedIndex].value); // 옵션 value 값

						/* options[target.selectedIndex].text  : 셀렉트 박스 옵션 사이에 있는 텍스트 값을 가져온다
						options[target.selectedIndex].value : 셀렉트 박스 value 의 값을 가져온다.*/

					},
					error : function(request, status, error) { // 오류가 발생했을 경우의 동작
						alert("code:" + request.status + "\n" + "message:"
								+ request.responseText + "\n" + "error:"
								+ error);
					}
				});

			},
			error : function(request, status, error) { // 오류가 발생했을 경우의 동작
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		});
		
		



	}

	function fnSchedulingForm() { /* 일정등록 팝업 */
		schForm = window.open("/addScheduleForm", "스케쥴등록",
				'width=400, height=400, left=400, top=200, resizable=no');
		/* IE를 제외한 다른 브라우저에서는 resizable=no 가 안먹힘 */
		schForm.resizeTo(500, 500);
		schForm.resizeBy(-100, -100);

		//화면, id, 너비 높이 왼쪽 위 // 팝업 3개 열고 닫고 부모호출 

	}

	function fnAddHolidayForm() { /* 휴일등록 팝업*/
		schForm = window.open("/addHolidayForm", "휴일등록",
				'width=400, height=400, left=400, top=200, resizable=no');
		/* IE를 제외한 다른 브라우저에서는 resizable=no 가 안먹힘 */
		schForm.resizeTo(500, 500);
		schForm.resizeBy(-100, -100);

		//화면, id, 너비 높이 왼쪽 위 // 팝업 3개 열고 닫고 부모호출 

	}
	

</script>
<title>달력</title>
</head>
<body>

	<div id="div_1">
		<select id="yearBox" onchange="fnSearch()"></select> <select
			id="monthBox" onchange="fnSearch()"></select>


		<div id="div_2"></div>
		<div id="div_3">
			<input type="button" value="일정등록하기" onclick="fnSchedulingForm()"
				class="btn"> <input type="button" value="휴일등록하기"
				onclick="fnAddHolidayForm()" class="btn">
		</div>

		<table id="t">
		</table>
	</div>

</body>





</html>