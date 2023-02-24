<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
</head>
<body>
<!-- form의 submit 버튼 클릭시  form에 설정된  action 경로로  form 안의 입력값 전달(=name) -->
	<form action="/t2"> <!-- action : 데이터를 전송할 경로 -->
		a : <input type="text" name="a"> <br> 
		b : <input type="text" name="b"> <br>
		c : <input type="text" name="c"> <br>
		<input type="submit">
	</form>
</body>
</html>
