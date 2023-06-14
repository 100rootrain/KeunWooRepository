<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>

<html>
<head>

<title>bulletinBoard_List</title>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">


<style>
#select_Data {
	border-collapse: collapsed;
	margin: 100px auto;
	margin-bottom: 0px;
	/* 테이블 아랫여백 0px */
	border-spacing: 0;
	width: 100%;
}

th {
	border-bottom: 1px solid gray;
}

#select_Data td {
	width: 200px;
	height: 30px;
	text-align: center;
	border-bottom: 1px solid gray;
}

.t1 {
	border-color: transparent;
}

.page {
	cursor: pointer;
	float: middle;
}

.page:hover {
	color: blue;
	font-weight: bold;
}

#select_Data tr:hover {
	background-color: #c8c8c8;
}

div {
	text-align: center;
}

.btn {
	
}

.div_Btn {
	float: right;
}

#listCount {
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
}

#rows_Num {
	float: right;
	margin: 100px 0px 0px 0px;
}

.select_Type {
	text-align: center;
	margin: 0 auto;
}

.select_Type2 {
	display: inline-block;
}

#txt {
	width: 221px;
}
</style>
<script>
	$(function() {
		$("#start").datepicker({
			dateFormat : 'yy-mm-dd'
		});
		$("#end").datepicker({
			dateFormat : 'yy-mm-dd'
		});
	});

	$(document).ready(function() {

		$(document).tooltip();
		$(".btn").button();

		getList(); //게시물 목록조회

	}); //화면실행시 시행 

	/* 게시글 목록 조회 */
	function getList(page) {

		var no = $("#no").val();
		var title = $("#title").val();

		var rows = $("#rows").val();
		var type = $("#type").val();
		var txt = $("#txt").val();
		var start = $("#start").val();
		var end = $("#end").val();

		$.ajax({

			url : "getBulletinBoardList", //요청할 url, 주소:포트(http://localhost:8080)는 일반적으로 생략

			type : "GET", //요청 방식 - GET:조회, POST:입력

			cache : false, //캐쉬 - 임시로 데이터를 저장할지 여부, 거의 false

			data : {

				no : no,
				title : title,
				type : type,
				start : start,
				page : page,
				rows : rows,
				txt : txt,
				end : end

			},

			success : function(data) { //데이터 송,수신에 성공했을 경우의 동작
				console.log(data);

				var list = data.bulletinBoardList;
				/* map안에 list */

				t = "";
				t += "<colgroup>";
				t += "<col style='width: 10%;' />";
				t += "<col style='width: 40%;' />";
				t += "<col style='width: 20%;' />";
				t += "<col style='width: 20%;' />";
				t += "<col style='width: 10%;' />";
				t += "</colgroup>";

				t += "<thead>";
				t += "<tr>";
				t += "<th>번호</th>";
				t += "<th>제목</th>";
				t += "<th>이름</th>";
				t += "<th>날짜</th>";
				t += "<th>조회수</th>";
				t += "</tr>";
				t += "</thead>";
				for (i = 0; i < list.length; i++) {
					t += "<tr>";
					t += "<td>" + list[i].NO + "</td>";
					t += "<td><a href='/bulletinBoard_Detail?no=" + list[i].NO
							+ "'>" + list[i].TITLE + "</a></td>";
					t += "<td>" + list[i].REG_USER + "</td>";
					t += "<td>" + list[i].REG_DATE + "</td>";
					t += "<td>" + list[i].VIEW_COUNT + "<td>"
					t += "</tr>"

				}

				$("#select_Data").html(t);
				var cnt = data.cnt;
				var rows = data.rows;
				var page = data.page;

				t = "";
				for (i = 1; i < (cnt / rows) + 1; i++) {
					t += "<span class='page'";

					if (page == i) {
						t += " style='color:red; font-weight:bold'";
					}
					t += " onclick='getList(" + i + "); return false;'>" + i
							+ "</span>";

				}

				$("#listCount").html(t);

			},

			error : function(request, status, error) { // 오류가 발생했을 경우의 동작

				alert("code:" + request.status + "\n" + "message:"

				+ request.responseText + "\n" + "error:" + error);

			}

		});
	}

	/* 게시물등록 */

	function fnNew() {

		location.href = "/bulletinBoard_New";

	}

	/* 페이징 화면에서 그리기 */
	/*	
	 function fnSearch(page) {
	
	 var start = $("#start").val(); // 시작일 
	 var end = $("#end").val();// 종료일 

	 if (start != "" & end != "") { // 시작일과 종료일이 공백이 아니라면 
	 if (end < start) { // 시작일이 종료일보다 크다면 
	 alert("조회 종료일은 시작일 이후 날짜로 입력하세요.");
	 return false;

	 }
	 }
	 var txt = $("#txt").val(); //txt 값 
	 var type = $("#type").val();
	 var rows = $("#rows").val();
	
	
	 location.href = "/bulletinBoard_List?txt=" + txt + "&start="
	 + start + "&end=" + end + "&type=" + type + "&page="
	 + page + "&rows=" + rows;
	
	 }
	 */

	function changeType(v) {
		if (v == "type_Name") {
			$("#txt").attr("placeholder", "제목을 입력하세요")
		} else {
			$("#txt").attr("placeholder", "이름을 입력하세요")
		}
		//attr 속성

	}

	function fnSearch() {
		if (window.event.keyCode == 13) {
			getList();
		}
	}
</script>
</head>
<body>

	<!--  페이징  -->
	<div id="rows_Num">

		<select id="rows" onchange="getList(1)">
			<option <c:if test="${rows eq 3}">
						selected
						</c:if>
				value="3">3</option>
			<option <c:if test="${rows eq 5}">
						selected
						</c:if>
				value="5">5</option>
			<option <c:if test="${rows eq 10}">
						selected
						</c:if>
				value="10">10</option>
		</select>
	</div>
	<br>

	<!-- 게시글 목록 -->
	<table id="select_Data">
	</table>
	<br>





	<!-- 조회, 쓰기버튼-->
	<div class="div_Btn">
		<div>
			<input type="button" value="쓰기" onclick="fnNew()" class="btn">&nbsp;&nbsp;<input
				type="button" value="조회" onclick="getList(1)" class="btn">
		</div>
	</div>

	<br>


	<!-- 페이징 -->
	<div id="listCount"></div>
	<br>






	<!-- 제목,조회기간 -->
	<div class="select_Type">
		<div class="select_Type2">
			<table id="select_Type_Date">
				<tr>
					<td><select id="type" onchange="changeType(this.value)">
							<!-- 조회를 위한 셀렉트박스 -->
							<option value="type_Name">제목</option>
							<option value="type_User">이름</option>
					</select></td>
					<td colspan="2" id="change_Title">: <input type="text"
						id="txt" placeholder="제목을 입력하세요." onkeyup="fnSearch()"></td>
				</tr>

				<tr>
					<td>조회기간 :</td>
					<td><input type="text" id="start" title="조회 시작일을 입력하세요."
						style="width: 100px"  onkeyup="fnSearch()"> ~</td>
					<td><input type="text" id="end" title="조회 종료일을 입력하세요."
						style="width: 100px"  onkeyup="fnSearch()"></td>
				</tr>

			</table>

		</div>
	</div>







</body>
</html>