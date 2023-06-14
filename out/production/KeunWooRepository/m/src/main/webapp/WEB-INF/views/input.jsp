<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<form action='/insert'>
		<table>
			<tr>
				<td><label>제목</label></td> <td><input type="text" name="title" maxlength=10></td>
			</tr>
			<tr>
				<td><label>내용</label></td>
				<td><textarea name="contents"></textarea>
				<td>
			</tr>
			<tr>
				<td colspan=2><input type="submit"></td>
			</tr>
		</table>
	</form>
</body>
</html>
