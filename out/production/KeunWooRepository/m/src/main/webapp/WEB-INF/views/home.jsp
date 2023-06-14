<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<html>
<head>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">


<title>Home</title>
<style>
table {
	margin: 300px auto;
}

td {
	border: 1px solid lightgray;
	width: 100px;
	height: 20px;
	text-align: center;
}

.page {
	cursor: pointer;
}

.page:hover {
	color: blue;
	font-weight: bold;
}
</style>
<script>
$( function() {
    $( "#start" ).datepicker({dateFormat: 'yy-mm-dd'});
    $( "#end" ).datepicker({dateFormat: 'yy-mm-dd'});
});
    
    
	window.onload = function(){
		$( document ).tooltip();
		$( ".btn" ).button();;
	}
	
	function search(page) {
		var start = document.getElementById("start").value;
		var end = document.getElementById("end").value; 
		

		if(start != "" & end != ""){
			if(end < start){
				alert("조회 종료일은 시작일 이후 날짜로 입력하세요.");
				 return;
			}
		}
		var val = document.getElementById("val").value;
		var regUser = document.getElementById("regUser").value;
		var rows = document.getElementById("rows").value;

		location.href = "/list?val=" + val+"&start="+start+"&end="+end
		+"&regUser="+regUser+"&page="+page+"&rows="+rows;
	}
	
	function save(){
		
		
	}
</script>
</head>
<body>
	<table>
		<thead>
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
			<tr>
		</thead>
		<c:forEach var="article" items="${list}">
			<tr>
				<td>${article.no}</td>
				<td><a href="/detail?no=${article.no}">${article.title}</a></td>
				<td>${article.regUser}</td>
				<td>${article.regDate}</td>
			<tr>
		</c:forEach>
		<tr>
			<td colspan="4"><c:forEach var="i" begin="1"
					end="${(cnt/rows)+1}" step="1" varStatus="status">
					<span class="page"
						<%-- c:if : test의 조건에 따라 해당 부분을 표시  --%>
						<c:if test="${page eq i}">
    						style="color:red; font-weight:bold"
						</c:if>
						onclick="search(${i}); return false;">${i}</span>
				</c:forEach> <select id="rows">

					<option <c:if test="${rows eq 3}">
							selected
						</c:if>
						value="3">3</option>
					<option <c:if test="${rows eq 5}">
							selected
						</c:if>
						value="5">5</option>
					<option <c:if test="${rows eq 10}">
							selected
						</c:if>
						value="10">10</option>
			</select></td>
		</tr>
		<tr>
			<td colspan="4">제목 : <input type="text" id="val" value="${val}"
				title="조회할 제목을 입력하세요."><br> 작성자 : <input type="text"
				id="regUser" value="${regUser}" title="조회할 작성자를 입력하세요(,로 구분)."><br>
				조회기간 : <input type="text" id="start" value="${start}"
				title="조회 시작일을 입력하세요." style="width: 100px"> ~ <input
				type="text" id="end" title="조회 종료일을 입력하세요." value="${end}"
				style="width: 100px"><br> <input type="button"
				value="조회" onclick="search(1)" class="btn"><input type="button"
				value="저장" onclick="save()" class="btn" ></td>
		<tr>
	</table>
</body>
</html>
