<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<style>


td {
	border: 1px solid lightgray;
	width: 100px;
	height: 20px;
	text-align: center;
}
</style>
<script>
function doDelete(k){
	var t = confirm(k+"를 삭제하시겠습니까?");
	if(t == true) location.href="t_delete?k="+k;
}
</script>
</head>
<body>
<table>
		<thead>
			<tr>
				<td></td>
				<td>A</td>
				<td>B</td>
				<td>C</td>
			<tr>
		</thead>
		
		<c:forEach 
			var="row"
			items="${list}"
		>
			<tr>
				<td><input type="button" value="삭제" onclick="doDelete('${row.A}')"></td> <!-- map으로 전달받은 경우 컬럼명을 그대로 사용 -->
				<td>${row.A}</td> <!-- map으로 전달받은 경우 컬럼명을 그대로 사용 -->
				<td>${row.B}</td> <!-- map으로 전달받은 경우 컬럼명을 그대로 사용 -->
				<td>${row.C}</td> <!-- map으로 전달받은 경우 컬럼명을 그대로 사용 -->
			<tr>
		</c:forEach>
	</table>
</body>
</html>
