<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<style>
table {
	border-collapse: collapse;
	margin: 30px auto;
}

td {
	border: 1px solid lightgray;
	text-align: center;
	font-family: sans-serif;
	height: 30px;
}

.td_title {
	font-weight: bold;
	font-size: 20px;
	height: 30px;
}

.td_contents {
	height: 400px;
	padding: 10px;
}

.div_contents {
	height: 100%;
	text-align: left;
}

.td_footer {
	height: 30px;
}
</style>
<script>
function doDelete(){
	var t = confirm("삭제하시겠습니까?");
	if(t == true) location.href="/hdelete?id=${map.id}"
}
function doModify(){
	location.href="/hModify?id=${map.id}"
}

function doList(){
	location.href="/hlist"
}
</script>
</head>
<body>
	<table style="width: 600px;">
		<tr>
			<td class="td_title" colspan="4">${map.name}</td>
		<tr>
		<tr>
			<td style="width: 20%">아이디</td>
			<td style="width: 30%">${map.id}</td>
			<td style="width: 20%">등록일</td>
			<td style="width: 30%">${map.entryDate}</td>
		<tr>
		<tr>
			<td colspan="4" class="td_contents">
				<div class="div_contents">${map.remark}</div>
			</td>
		<tr>
		<tr>
			<td class="td_footer" colspan="4">
				<input type="button" value="목록" onclick="doList()"> 
				<input type="button" value="수정" onclick="doModify()">
				<input type="button" value="삭제" onclick="doDelete()"></td>
		<tr>
	</table>
</body>
</html>
