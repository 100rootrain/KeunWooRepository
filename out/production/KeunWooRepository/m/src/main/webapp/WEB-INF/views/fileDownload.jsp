<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�ٿ�ε� ȭ��</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script>
	
</script>
</head>
<body>
	<p>�̹��� �ٿ�ε� �׽�Ʈ â</p>

	<table>
		<c:forEach var="file" items="${list}">
			<tr>
				<td><a href="/downloadFile?fileTempName=${file.FILE_TEMP_NM}">${file.FILE_ORG_NM}</a></td>
				
			<tr>
		</c:forEach>
	</table>






</body>
</html>