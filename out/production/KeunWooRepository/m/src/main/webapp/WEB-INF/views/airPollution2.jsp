<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<style>
#tbl {
	border: 2px solid gray;
}

#a1 {
	width: 100%;
	text-align: center;
}

#a2 {
	width: 100%;
	text-align: center;
}

#airGrade {
	width: 70%;
	text-align: center;
	border-top: 1px solid #444444;
	border-collapse: collapse;
	margin: auto;
}

tr, td {
	border-bottom: 1px solid #444444;
	border-left: 1px solid #444444;
	border-right: 1px solid #444444;
	padding: 10px;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function() {
		change_Station()
		
	})

	//제이쿼리방식
	function change_Station() {
		var locNm = $("#locNm").val();
		console.log(locNm);

		var stationName = $("#stationName").val();
		console.log(stationName);

		$.ajax({
			url : "getStationList", //요청할 url, 주소:포트(http://localhost:8080)는 일반적으로 생략
			type : "GET", //요청 방식 - GET:조회, POST:입력
			cache : false, //캐쉬 - 임시로 데이터를 저장할지 여부, 거의 false
			data : {

				locNm : locNm

			},
			success : function(data) { //데이터 송,수신에 성공했을 경우의 동작
				console.log(data);
				$("#stationName").val(data.STTN_NM);

				var t = ""

				for (var i = 0; i < data.length; i++) {
					t += "<option value='"+data[i].STTN_NM+"'>"
							+ data[i].STTN_NM + "</option>"

				}
				$("#stationName").html(t);
				fnSearch(); //화면실행시 바로 미세먼지 지수 나오게.

			},
			error : function(request, status, error) { // 오류가 발생했을 경우의 동작
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		});

	}

	function fnSearch() {
		var locNm = $("#locNm").val();
		console.log(locNm);

		var stationName = $("#stationName").val();
		console.log(stationName);

		$
				.ajax({
					url : "getAirPollutionInfo", //요청할 url, 주소:포트(http://localhost:8080)는 일반적으로 생략
					type : "GET", //요청 방식 - GET:조회, POST:입력
					cache : false, //캐쉬 - 임시로 데이터를 저장할지 여부, 거의 false
					dataType : "json", //데이터의 형식, 거의 json
					data : {
						stationName : $("#stationName").val()
					},

					success : function(data) { //데이터 송,수신에 성공했을 경우의 동작
						console.log(data);

						if (data.response.body.totalCount == 0) {
							$("#pm10").val("");
							$("#pm25").val("");
							alert("존재하지 않는 측정소입니다.");
						} else {
							//Value
							$(".pm10").val(
									data.response.body.items[0].pm10Value);
							$(".pm25").val(
									data.response.body.items[0].pm25Value);

							$(".pm10").html(
									data.response.body.items[0].pm10Value
											+ "㎍/㎥(1h)");
							$(".pm25").html(
									data.response.body.items[0].pm25Value
											+ "㎍/㎥(1h)");
							$("#no2").html(
									data.response.body.items[0].no2Value
											+ "ppm")
							$("#co")
									.html(
											data.response.body.items[0].coValue
													+ "ppm");
							$("#o3")
									.html(
											data.response.body.items[0].o3Value
													+ "ppm");
							$("#so2").html(
									data.response.body.items[0].so2Value
											+ "ppm");

							//Grade

							var pm25Grade = data.response.body.items[0].pm25Grade;
							console.log(pm25Grade);

							if (pm25Grade == 1) {
								$("#pm25Grade")
										.html(
												"<img src="+'"https://www.airkorea.or.kr/web/images/main_2018/point_1.png"'+">")
							} else if (pm25Grade == 2) {
								$("#pm25Grade")
										.html(
												"<img src="+'"https://www.airkorea.or.kr/web/images/main_2018/point_2.png"'+">")
							} else if (pm25Grade == 3) {
								$("#pm25Grade")
										.html(
												"<img src="+'"https://www.airkorea.or.kr/web/images/main_2018/point_3.png"'+">")
							} else if (pm25Grade == 4) {
								$("#pm25Grade")
										.html(
												"<img src="+'"https://www.airkorea.or.kr/web/images/main_2018/point_4.png"'+">")
							} else if (pm25Grade == null) {
								$("#pm25Grade")
										.html(
												"<img src="+'"https://www.airkorea.or.kr/web/images/main_2018/point_5.png"'+">")
							}

							var pm10Grade = data.response.body.items[0].pm10Grade;
							console.log(pm10Grade);

							if (pm10Grade == 1) {
								$("#pm10Grade")
										.html(
												"<img src="+'"https://www.airkorea.or.kr/web/images/main_2018/point_1.png"'+">")
							} else if (pm10Grade == 2) {
								$("#pm10Grade")
										.html(
												"<img src="+'"https://www.airkorea.or.kr/web/images/main_2018/point_2.png"'+">")
							} else if (pm10Grade == 3) {
								$("#pm10Grade")
										.html(
												"<img src="+'"https://www.airkorea.or.kr/web/images/main_2018/point_3.png"'+">")
							} else if (pm10Grade == 4) {
								$("#pm10Grade")
										.html(
												"<img src="+'"https://www.airkorea.or.kr/web/images/main_2018/point_4.png"'+">")
							} else if (pm10Grade == null) {
								$("#pm10Grade")
										.html(
												"<img src="+'"https://www.airkorea.or.kr/web/images/main_2018/point_5.png"'+">")
							}

							var no2Grade = data.response.body.items[0].no2Grade;
							console.log(no2Grade);

							if (no2Grade == 1) {
								$("#no2Grade")
										.html(
												"<img src="+'"https://www.airkorea.or.kr/web/images/main_2018/point_1.png"'+">")
							} else if (no2Grade == 2) {
								$("#no2Grade")
										.html(
												"<img src="+'"https://www.airkorea.or.kr/web/images/main_2018/point_2.png"'+">")
							} else if (no2Grade == 3) {
								$("#no2Grade")
										.html(
												"<img src="+'"https://www.airkorea.or.kr/web/images/main_2018/point_3.png"'+">")
							} else if (no2Grade == 4) {
								$("#no2Grade")
										.html(
												"<img src="+'"https://www.airkorea.or.kr/web/images/main_2018/point_4.png"'+">")
							} else if (no2Grade == null) {
								$("#no2Grade")
										.html(
												"<img src="+'"https://www.airkorea.or.kr/web/images/main_2018/point_5.png"'+">")
							}

							var coGrade = data.response.body.items[0].coGrade;
							console.log(coGrade);

							if (coGrade == 1) {
								$("#coGrade")
										.html(
												"<img src="+'"https://www.airkorea.or.kr/web/images/main_2018/point_1.png"'+">")
							} else if (coGrade == 2) {
								$("#coGrade")
										.html(
												"<img src="+'"https://www.airkorea.or.kr/web/images/main_2018/point_2.png"'+">")
							} else if (coGrade == 3) {
								$("#coGrade")
										.html(
												"<img src="+'"https://www.airkorea.or.kr/web/images/main_2018/point_3.png"'+">")
							} else if (coGrade == 4) {
								$("#coGrade")
										.html(
												"<img src="+'"https://www.airkorea.or.kr/web/images/main_2018/point_4.png"'+">")
							} else if (coGrade == null) {
								$("#coGrade")
										.html(
												"<img src="+'"https://www.airkorea.or.kr/web/images/main_2018/point_5.png"'+">")
							}

							var o3Grade = data.response.body.items[0].o3Grade;
							console.log(o3Grade);

							if (o3Grade == 1) {
								$("#o3Grade")
										.html(
												"<img src="+'"https://www.airkorea.or.kr/web/images/main_2018/point_1.png"'+">")
							} else if (o3Grade == 2) {
								$("#o3Grade")
										.html(
												"<img src="+'"https://www.airkorea.or.kr/web/images/main_2018/point_2.png"'+">")
							} else if (o3Grade == 3) {
								$("#o3Grade")
										.html(
												"<img src="+'"https://www.airkorea.or.kr/web/images/main_2018/point_3.png"'+">")
							} else if (o3Grade == 4) {
								$("#o3Grade")
										.html(
												"<img src="+'"https://www.airkorea.or.kr/web/images/main_2018/point_4.png"'+">")
							} else if (o3Grade == null) {
								$("#o3Grade")
										.html(
												"<img src="+'"https://www.airkorea.or.kr/web/images/main_2018/point_5.png"'+">")
							}

							var so2Grade = data.response.body.items[0].so2Grade;
							console.log(so2Grade);

							if (so2Grade == 1) {
								$("#so2Grade")
										.html(
												"<img src="+'"https://www.airkorea.or.kr/web/images/main_2018/point_1.png"'+">")
							} else if (so2Grade == 2) {
								$("#so2Grade")
										.html(
												"<img src="+'"https://www.airkorea.or.kr/web/images/main_2018/point_2.png"'+">")
							} else if (so2Grade == 3) {
								$("#so2Grade")
										.html(
												"<img src="+'"https://www.airkorea.or.kr/web/images/main_2018/point_3.png"'+">")
							} else if (so2Grade == 4) {
								$("#so2Grade")
										.html(
												"<img src="+'"https://www.airkorea.or.kr/web/images/main_2018/point_4.png"'+">")
							} else if (so2Grade == null) {
								$("#so2Grade")
										.html(
												"<img src="+'"https://www.airkorea.or.kr/web/images/main_2018/point_5.png"'+">")
							}

						}
					},
					error : function(request, status, error) { // 오류가 발생했을 경우의 동작
						alert("code:" + request.status + "\n" + "message:"
								+ request.responseText + "\n" + "error:"
								+ error);
					}
				});

	}
</script>
</head>
<body>
	<div id="a1">
		<select id="locNm" onchange="change_Station()">

			<c:forEach var="locationName" items="${locationList}">
				<option value="${locationName.LOC_NM}">${locationName.LOC_NM}</option>

			</c:forEach>

		</select> <select id="stationName" onchange="fnSearch()">
		</select>
	</div>
	<div id="a2">
		<br> 미세먼지 : <input type="text" class="pm10"> 초미세먼지 : <input
			type="text" class="pm25">
	</div>
	<br>
	<div id="a3">
		<table id="airGrade">
			<tr class="a">
				<td>항목</td>
				<td>등급</td>
				<td>측정값</td>
				<td>항목</td>
				<td>등급</td>
				<td>측정값</td>
			</tr>
			<tr class='b'>
				<td>초미세먼지(PM2.5)</td>
				<td class='gradeCircle' id="pm25Grade"></td>
				<td class="pm25">㎍/㎥(1h)</td>
				<td>미세먼지(PM10)</td>
				<td class='gradeCircle' id="pm10Grade"></td>
				<td class="pm10">㎍/㎥(1h)</td>
			</tr>

			<tr class='b'>
				<td>이산화질소</td>
				<td class='gradeCircle' id="no2Grade"></td>
				<td id="no2"></td>
				<td>일산화탄소</td>
				<td class='gradeCircle' id="coGrade"></td>
				<td id="co"></td>
			</tr>

			<tr class='b'>
				<td>오존</td>
				<td class='gradeCircle' id="o3Grade"></td>
				<td id="o3">ppm</td>
				<td>이황산가스</td>
				<td class='gradeCircle' id="so2Grade"></td>
				<td id="so2">ppm</td>
			</tr>



		</table>
	</div>





</body>
</html>