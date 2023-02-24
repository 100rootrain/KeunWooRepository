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
	if(t == true) location.href="/delete?no=${map.no}"
}

function goList(){
	location.href="/list";
}

function save(){
	var no = document.getElementById("no").value;
	var title = document.getElementById("title").value;
	var regUser = document.getElementById("regUser").value;
	var contents = document.getElementById("contents").value;

	location.href = "/update?no="+no+"&title="+title+"&regUser="+regUser+"&contents="+contents
}
</script>
</head>
<body>
	<input type="hidden" value="${map.no}" id="no">
	<table style="width: 600px;">
		<tr>
			<td class="td_title" colspan="4">
				<input type="text" style="width:100%;" value="${map.title}" id="title">
			</td>
		<tr>
		<tr>
			<td style="width: 20%">작성자</td>
			<td style="width: 30%"><input type="text" style="width:100%;" id="regUser" value="${map.regUser}"></td>
			<td style="width: 20%">작성일</td>
			<td style="width: 30%">${map.regDate}</td>
		<tr>
		<tr>
			<td colspan="4" class="td_contents">
				<div class="div_contents">
					<textarea id="contents" style="width:100%; height:100%">${map.contents}</textarea></div>
			</td>
		<tr>
		<tr>
			<td class="td_footer" colspan="4">
				<input type="button" value="저장" onclick="save()"> 
				<input type="button" value="취소" onclick="goList()"></td>
		<tr>
	</table>
</body>
</html>
