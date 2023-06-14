<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
	
<script type="text/javascript">
	google.charts.load("current", {
		packages : [ "corechart" ]
	}); // 차트 라이브러리 불러오기
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		$.ajax({
			url : "getChartData", //요청할 url, 주소:포트(http://localhost:8080)는 일반적으로 생략
			type : "GET", //요청 방식 - GET:조회, POST:입력
			cache : false, //캐쉬 - 임시로 데이터를 저장할지 여부, 거의 false
			data : {
				gender : $('#gender').val()

			},
			success : function(data) { //데이터 송,수신에 성공했을 경우의 동작

				var arr = [];
				arr.push([ '연령대', '고객수', {
					role : 'style'
				} ]);
				for (var i = 0; i < data.length; i++) {
					arr.push([
							data[i].AGE,
							data[i].CNT,
							'stroke-color:'
									+ "#"
									+ Math.round(Math.random() * 0xffffff)
											.toString(16)
									+ '; fill-color: '
									+ "#"
									+ Math.round(Math.random() * 0xffffff)
											.toString(16)

					])
				}
				var data = google.visualization.arrayToDataTable(arr);
				var options = {
					title : '연령별 고객 수',
					pieHole : 0.4,
				};

				var chart = new google.visualization.BarChart(document
						.getElementById('donutchart'));
				chart.draw(data, options);
			},
			error : function(request, status, error) { // 오류가 발생했을 경우의 동작
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		});
	}

	function draw() { /* onchange */
		
		drawChart()

	}
</script>
</head>
<body>
	<select id="gender" onchange="draw()">
		<option value="">전체</option>
		<option value="M">남성</option>
		<option value="F">여성</option>

	</select>
	<div id="donutchart" style="width: 1000px; height: 500px;"></div>
</body>
</html>