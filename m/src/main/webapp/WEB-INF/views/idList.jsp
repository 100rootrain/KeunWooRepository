<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<style>
table {
	border-collapse: collapse;
	margin: 10px auto;
}

td {
	border: 1px solid gray;
	text-align: center;
}

.t1 {
	width: 150px;
}

.t2 {
	width: 150px;
}

#btn {
	background-color: #008CBA;
	color: white;
	border: 2px solid #008CBA;
	width: 154px;
	height: 56px;
}

.a:hover { /* 헤더에 커서가 적용되면 안되니깐 */
	cursor : pointer;
	color: red;
}


</style>
<script>
function setId(id){ /* id  = '${user.USER_ID}' */
		window.opener.a(id); /* 부모창의 함수를 실행하면서 값을 넘김 */
		window.close();
}
</script>
</head>
<body>
	<table>

		<tr>
			<td class="t1">아이디</td>
			<td class="t1">이름</td>
		</tr>
		<c:forEach var="user" items="${idList}">
			<tr>
				<td class="a" onclick="setId('${user.USER_ID}')">${user.USER_ID}</td>
				<td class="a" onclick="setId('${user.USER_ID}')">${user.USER_NM}</td>
				<!-- 쌍따옴표안하면 변수로인식 -->
			</tr>
		</c:forEach>

	</table>
</body>
</html>