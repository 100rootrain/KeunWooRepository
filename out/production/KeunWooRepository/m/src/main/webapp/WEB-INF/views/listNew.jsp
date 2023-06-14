<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<table>
		<thead>
			<tr>
				<td>사번</td>
				<td>이름</td>
				<td>부서</td>
				<td>성별</td>
			<tr>
		</thead>
		<c:forEach var="emp" items="${list}">
			<tr>
				<td>${emp.EMP_NO}</td>
				<td><a href="/empDetail?empNo=${emp.EMP_NO}">${emp.NAME}</a></td>
				<td>${emp.WORKPLACE_NO}</td>
				<td>${emp.GENDER_CD}</td>
			<tr>
		</c:forEach>
</table>
</body>
</html>