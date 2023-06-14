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
	border: 1px solid gray;
	width: 500px;
	height: 200px;
	margin: 300px;
	margin-left: auto;
	margin-right: auto;
}

td {
	border: 1px solid gray;
}

.lang {
	width: 100%;
	height: 100%;
}

#translate_Text {
	width: 100%;
	height: 100%;
}

#translated_Text {
	width: 100%;
	height: 100%;
}

#trn_Btn {
	float: right;
	height: 100%;
}
</style>

<script>
	
</script>
<title>translate</title>
</head>
<body>




	<table>
		<tr>
			<td><select class="lang" id="translate_Lang">
					<option value="" selected disabled hidden>언어감지</option> <!-- 기본값 -->
					<c:forEach var="language_List" items="${languageList}">
						<option value="${language_List.CODE_NM}"
							<c:if test="${language_List.CODE_ID == language_List.CODE_NM}"> selected</c:if>>${language_List.CODE_NM}</option>
					</c:forEach>
			</select></td>
			<td><select class="lang" id="translated_Lang">
					<c:forEach var="language_List" items="${languageList}">
						<option value="${language_List.CODE_NM}"
							<c:if test="${language_List.CODE_ID == language_List.CODE_NM}"> selected</c:if>>${language_List.CODE_NM}</option>
					</c:forEach>
			</select></td>
		</tr>
		<tr style="height: 200px">
			<td><textarea name="translate_Text" style="width: 400px"
					id="translate_Text" placeholder="번역할 내용을 입력하세요."></textarea></td>
			<td><textarea name="translated_Text" style="width: 400px"
					id="translated_Text"></textarea><br></td>
		</tr>
		<tr style="height: 20px">
			<td><input type="button" value="번역하기" id="trn_Btn"></td>
			<td></td>
		</tr>



	</table>

</body>

</html>