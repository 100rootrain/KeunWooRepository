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
				<td>���</td>
				<td>�̸�</td>
				<td>�μ�</td>
				<td>����</td>
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