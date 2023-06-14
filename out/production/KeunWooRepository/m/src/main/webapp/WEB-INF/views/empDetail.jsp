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
	function doDelete() {
		var t = confirm("삭제하시겠습니까?");
		if (t == true)
			location.href = "/delete?no=${map.no}"
	}
	function doModify() {
		location.href = "/goModify?no=${map.no}"
	}
</script>
</head>
<body>
	<table style="width: 600px;">
		<tr>
			<td style="width: 20%">사번</td>
			<td style="width: 30%">${empInfo.EMP_NO}</td>
		</tr>
		<tr>
			<td style="width: 20%">이름</td>
			<td style="width: 30%"><input type="text"
				value="${empInfo.NAME}"></td>
		</tr>
		<tr>
			<td style="width: 20%">부서</td>
			<td style="width: 30%"><select>
					<c:forEach var="dept" items="${deptList}">
						<option
							<c:if test="${empInfo.WORKPLACE_NO == dept.CODE}"> selected </c:if>
							value="${dept.CODE}">${dept.NAME}</option>
					</c:forEach>
			</select></td>
		</tr>
		<tr>
			<td style="width: 20%">성별</td>
			<td style="width: 30%">
				<input type="radio" name="gender" value="M" <c:if test="${empInfo.GENDER_CD == 'M'}"> checked </c:if>> 남
				<input type="radio" name="gender" value="F" <c:if test="${empInfo.GENDER_CD == 'F'}"> checked </c:if>> 여
			</td>
		<tr>
	</table>
</body>
</html>
