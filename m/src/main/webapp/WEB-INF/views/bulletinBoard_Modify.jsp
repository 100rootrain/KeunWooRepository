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

p {
	color: red;
	margin: 0px 0px 10px 0px;
	cursor: pointer font-weight: bold;
}
</style>
<script>
	function fnList() { /* 목록 */
		location.href = "/bulletinBoard_List";
	}

	function upload() {
		var file = $("#file")[0];
		// 파일을 여러개 선택할 수 있으므로 files 라는 객체에 담긴다.
		console.log("file: ", file.files)

		/*	if (file.files.length === 0) { //파일 업로드가 안됐다면
				if (confirm("수정하시겠습니까?"))
					;
				{
					location.href = "/bulletinBoard_List"; //첨부파일X 업로드
				}

			} */

		const formData = new FormData();

		for (var i = 0; i < file.files.length; i++) {
			formData.append("file_" + i, file.files[i]);
		}

		$.ajax({
			type : "POST",
			url : "/bulletinBoardFileUpload",
			processData : false,
			contentType : false,
			data : formData,
			success : function(data) {
				console.log(data);
				//$("#resultUploadPath").text(message.uploadFilePath);

				alert("저장되었습니다.");
				location.href = "/bulletinBoard_List";

			},
			err : function(err) {
				console.log("err:", err)
			}
		})
	}
	

	function fnSave() {
		var no = $("#no").val();
		var title = $("#title").val();
		var contents = $("#contents").val();
		var regUser = $("#regUser").val();
		var password = $("#password").val();
		
		

		$.ajax({

			url : "bullentinBoardInsert", //요청할 url, 주소:포트(http://localhost:8080)는 일반적으로 생략

			type : "POST", //요청 방식 - GET:조회, POST:입력

			cache : false, //캐쉬 - 임시로 데이터를 저장할지 여부, 거의 false

			data : {

				no : no,

				title : title,

				contents : contents,
				
				regUser : regUser,
				
				password : password

			},

			success : function(data) { //데이터 송,수신에 성공했을 경우의 동작
				upload();

			},

			error : function(request, status, error) { // 오류가 발생했을 경우의 동작

				alert("code:" + request.status + "\n" + "message:"

				+ request.responseText + "\n" + "error:" + error);

			}

		});

	}

	function deleteFile(fileNm) {
		$.ajax({
			type : "POST",
			url : "/deleteFile",
			data : {

				fileNm : fileNm

			},
			success : function(data) {
				console.log(data);
				//$("#resultUploadPath").text(message.uploadFilePath);

				alert("파일이 삭제되었습니다..");
				$("#" + fileNm).next().remove();
				$("#" + fileNm).remove();

			},
			err : function(err) {
				console.log("err:", err)
			}
		})

	}
	
	
	function handleKeyPress(event) {
		  // Ctrl + S를 눌렀을 때 실행할 작업을 여기에 작성합니다.
		  if (event.ctrlKey && event.key === 's') {
		    // 작업 실행
		    event.preventDefault(); // 기본 저장 동작을 취소합니다.

		    // 여기에 실제 저장 작업을 추가합니다.
		    console.log('Ctrl + S가 눌렸습니다. 저장 작업을 수행합니다.');
		    fnSave();
		  }
		}

		// window 객체에 키 이벤트 리스너 추가
		window.addEventListener('keydown', handleKeyPress);
	
	

</script>
</head>
<body>
	<input type="hidden" value="${post_Modify.NO}" id="no">
	<input type="hidden" value="${post_Modify.PASSWORD}" id=password>
	<table style="width: 600px;">

		<tr>
			<td class="td_title" colspan="4"><input type="text"
				style="width: 100%;" value="${post_Modify.TITLE}" id="title"></td>
		</tr>
		<tr>
			<td style="width: 20%">작성자</td>
			<td style="width: 30%"><input type="text" style="width: 100%;"
				value="${post_Modify.REG_USER}" id="regUser"></td>

			<td style="width: 20%">작성일</td>
			<td style="width: 30%">${post_Modify.REG_DATE}</td>
		</tr>
		<tr>
			<td colspan="4">
				<div class="div_contents">
					<form id="uploadForm" enctype="multipart/form-data">
						<input type="file" id="file" multiple />
						<!-- multiple 속성을 추가하면 파일을 여러개 선택가능 -->
					</form>

					<div id="result"></div>
					<hr />
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="4" class="td_contents"><textarea id="contents"
					style="width: 100%; height: 100%">${post_Modify.CONTENTS}</textarea></td>
		</tr>
		<tr>
			<td style="text-align: left" colspan="4"><c:forEach var="file"
					items="${download_Temp_file}">
					<p>
						<span id="${file.FILE_TEMP_NM}"
							onclick="deleteFile('${file.FILE_TEMP_NM}')">x</span> <a
							href="/bulletinBoardFileDownload?fileTempName=${file.FILE_TEMP_NM}">${file.FILE_ORG_NM}</a>
					</p>
				</c:forEach></td>
		</tr>
		<tr>
			<td colspan="4"><input type="button" value="저장"
				onclick="fnSave()"> <input type="button" value="목록"
				onclick="fnList()"></td>
		</tr>
	</table>
</body>
</html>