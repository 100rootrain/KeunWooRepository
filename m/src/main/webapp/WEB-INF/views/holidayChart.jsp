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
			url : "getHolidayChartData", //요청할 url, 주소:포트(http://localhost:8080)는 일반적으로 생략
			type : "GET", //요청 방식 - GET:조회, POST:입력
			cache : false, //캐쉬 - 임시로 데이터를 저장할지 여부, 거의 false
			success : function(data) { //데이터 송,수신에 성공했을 경우의 동작
				var arr = [];
				arr.push([ 'month', 'holidayCnt', {
					role : "style"
				} ]);
				for (var i = 0; i < data.length; i++) {
					arr.push([
							data[i].MONTH,
							data[i].HOLIDAY_CNT,
							'stroke-color:'
									+ "#"
									+ Math.round(Math.random() * 0xffffff)
											.toString(16)
									+ '; fill-color: '
									+ "#"
									+ Math.round(Math.random() * 0xffffff)
											.toString(16) ])
				}

				var data = google.visualization.arrayToDataTable(arr);
				var options = {
					title : '휴일 갯수',
					legend : {
						position : 'top',
						maxLines : 3
					},
				};
				
				 var view = new google.visualization.DataView(data);
			      view.setColumns([0, 1,
			                       { calc: "stringify",
			                         sourceColumn: 1,
			                         type: "string",
			                         role: "annotation" },
			                       2]);
			
				var chart = new google.visualization.ColumnChart(document
						.getElementById('columnChart'));
				chart.draw(view, options);
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
	<div id="columnChart" style="width: 1000px; height: 500px;"></div>
</body>
</html>