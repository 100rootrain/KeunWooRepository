<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- fn태그 사용하겠다고 정의함 -->

<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<style>
table {
	margin: auto; /* 화면가운데로 가로만 */
	border-collapse: collapse;
}

td {
	border: 1px solid gray; /* 두께 형식 색상 */
	width: 100px;
	text-align: :center;
}

#btn {
	margin-left: 5px; /* 
	1. 값이 하나일 경우 상하좌우 
	2. 값이 두개일 경우 상하 좌우
	3. 값이 4개일 경우 상 하 좌 우  */
}
</style>
<script>
	function fncancel() {
		var custNo = $("#custNo").val();
		location.href = "/custDetail?custNo=" + custNo;
	}
	function fnlist() {
		location.href = "/custList"
	}

	function save() {
		var custNo = $("#custNo").val();
		var name = $("#name").val();
		var birth = $("#birth").val();
		var address = $("#address").val();
		var contact = $("#contact").val();

		if (birth.length != 8) {
			alert("생년월일은 8자리로 입력하세요.");
			return;
		}

		if (isValidDate(birth) == false) {
			return;
		}
		
		if (isNaN(contact)){
			alert("연락처는 숫자로 입력하세요.");
			return;
		}
		
		if (contact.length !=11){
			alert("연락처는 11자리로 입력하세요.");
			return;
		}

		location.href = "/custUpdate?custNo=" + custNo + "&name=" + name
				+ "&birth=" + birth + "&address=" + address + "&contact="
				+ contact;
	}
		function isValidDate(dateStr) {
		     var year = Number(dateStr.substr(0,4)); 
		     var month = Number(dateStr.substr(4,2));
		     var day = Number(dateStr.substr(6,2));
		     var today = new Date(); // 날자 변수 선언
		     var yearNow = today.getFullYear();
		     var adultYear = yearNow-20;

		     if (month < 1 || month > 12) { 
		          alert("달은 1월부터 12월까지 입력 가능합니다.");
		          return;
		          /* false를 리턴 */
		     }

		    if (day < 1 || day > 31) {
		          alert("일은 1일부터 31일까지 입력가능합니다.");
		          return;
		     }

		     if ((month==4 || month==6 || month==9 || month==11) && day==31) {
		          alert(month+"월은 31일이 존재하지 않습니다.");
		          return;
		     }
		     
		     if (month == 2) {
		          var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
		          if (day>29 || (day==29 && !isleap)) {
		               alert(year + "년 2월은  " + day + "일이 없습니다.");
		               return;
		          }
		     }
		     return true;
	}
</script>
</head>
<body>
	<input type="hidden" value="${custDetail.CUST_NO}" id="custNo">
	<table>
		<tr>
			<td><label>고객번호</label></td>
			<td>${custDetail.CUST_NO}</td>
			<!-- 키값은 수정되면 안되니깐 수정돼선 안됨, 보여주기만 해야됨 -->
		</tr>

		<tr>
			<td><label>고객명</label></td>
			<td><input type="text" id="name" value="${custDetail.NAME}"></td>
		</tr>

		<tr>
			<td><label>생년월일</label></td>
			<td><input type="text" id="birth" value="${custDetail.BIRTH}"></td>
		</tr>

		<tr>
			<td><label>연락처</label></td>
			<td><input type="text" id="contact"
				value="${custDetail.CONTACT}"></td>
		</tr>

		<tr>
			<td><label>주소</label></td>
			<td><input type="text" id="address"
				value="${custDetail.ADDRESS}"></td>
		</tr>

		<tr>
			<td colspan=2><input type="button" value="저장" class="btn"
				onclick="save()"><input type="button" value="취소" class="btn"
				onclick="fncancel()"> <input type="button" value="목록"
				class="btn" onclick="fnlist()"></td>
		</tr>
	</table>
</body>
</html>
