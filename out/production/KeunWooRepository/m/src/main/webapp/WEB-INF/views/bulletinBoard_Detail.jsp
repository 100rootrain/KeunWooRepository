<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<title>상세 화면</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
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
	function fnList() { /* 목록 */
		location.href = "/bulletinBoard_List";
	}

	function fnModify() { /* 비밀번호 입력화면 */
		var no = $("#no").val();
		location.href = "/bulletinBoard_Temp_Modify?no=" + no;
	}

	function fnDelete() { /* 파일 및 게시글 전체 삭제(파일만 삭제하는것은 수정화면) */
		var no = $("#no").val();
		location.href = "/bulletinBoard_Temp_Delete?no=" + no;
	}
</script>
</head>
<body>
	<input type="hidden" value="${post_Detail.NO}" id="no">
	<table style="width: 600px;">

		<tr>
			<td class="td_title" colspan="4">${post_Detail.TITLE}</td>
		</tr>
		<tr>
			<td style="width: 20%">작성자</td>
			<td style="width: 30%">${post_Detail.REG_USER}</td>

			<td style="width: 20%">작성일</td>
			<td style="width: 30%">${post_Detail.REG_DATE}</td>
		</tr>
		<tr>
			<td colspan="4" class="td_contents">
				<div class="div_contents">${post_Detail.CONTENTS}</div>
			</td>
		</tr>
		<c:forEach var="file" items="${download_Temp_file}">
			<tr>
				<td colspan="4"><a
					href="/bulletinBoardFileDownload?fileTempName=${file.FILE_TEMP_NM}">${file.FILE_ORG_NM}</a></td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="4"><input type="button" value="수정"
				onclick="fnModify()"> <input type="button" value="목록"
				onclick="fnList()"><input type="button" value="삭제"
				onclick="fnDelete()"></td>
		</tr>
	</table>
</body>
</html>