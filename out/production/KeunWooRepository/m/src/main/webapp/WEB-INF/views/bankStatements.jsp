<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>



<html>
<head>
<title>입출금내역</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>

<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css">
 -->



<style>
table {
	border-collapse: collapsed;
	margin: 0px;
	table-layout:fixed;
}

td {
	width: 200px;
	height: 30px;
	text-align: center;
	border: 1px solid gray;
}

.t1 {
	border-color: transparent;
}
</style>
<script>
	var userId = $("#userId").val();

	$(function() {

		$("#start").datepicker({
			dateFormat : 'yy-mm-dd'
		});
		$("#end").datepicker({
			dateFormat : 'yy-mm-dd'
		});
	});

	function fnList() { //돌아가기
		location.href = "bkList?userId=" + $("#userId").val();

	}

	function fnSearch() {

		var start = $("#start").val();
		var end = $("#end").val();
		var accntId = $("#accntId").val();
		var depositSum = $("#depositSum").val();
		var withdrawSum = $("#withdrawSum").val();

		console.log(start);
		console.log(end);

		if (start != "" & end != "") {
			if (end < start) {
				alert("조회 종료일은 시작일 이후 날짜로 입력하세요.");
				return false;
			}
		}else if (start == "" & end ==""){
			alert("기간을 입력하세요.")
			return false;
		}

		$.ajax({
			url : "getBankstatements", //요청할 url, 주소:포트(http://localhost:8080)는 일반적으로 생략
			type : "GET", //요청 방식 - GET:조회, POST:입력
			cache : false, //캐쉬 - 임시로 데이터를 저장할지 여부, 거의 false
			data : {

				selectAccntId : accntId,
				start : start,
				end : end

			},
			success : function(data) { //데이터 송,수신에 성공했을 경우의 동작
				console.log(data);
			console.log(data.HISTORY_DT);
				/* $("#bnkStatements").val(data);  */// 안써도되는듯?
				var t = ""

				for (var i = 0; i < data.length; i++) {
					t += "<tr>"
					t += "<td colspan='3'>" + data[i].HISTORY_DT + "</td>"
					t += "<td>" + data[i].BANK_NM + data[i].ACCNT_NO + "</td>"
					t += "<td>" + data[i].WITHDRAW_DEPOSIT + "</td>"
					t += "<td>" + data[i].REMITTANCE + "</td>"
					t += "</tr>"
				}

				$("#bnkStatements").html(t);

				$.ajax({
					url : "getWithdrawDepositSum", //요청할 url, 주소:포트(http://localhost:8080)는 일반적으로 생략
					type : "GET", //요청 방식 - GET:조회, POST:입력
					cache : false, //캐쉬 - 임시로 데이터를 저장할지 여부, 거의 false
					data : {

						selectAccntId : accntId,
						start : start,
						end : end

					},
					success : function(data) { //데이터 송,수신에 성공했을 경우의 동작
						console.log(data);
						$("#depositSum").val(data.DEPOSITSUM);
						$("#withdrawSum").val(data.WITHDRAWSUM);

						console.log("출금합계 : " + data.DEPOSITSUM);
						console.log("입금합계 : " + data.WITHDRAWSUM);

						var k = ""

						k += "<tr>"
						k += "<td>출금액</td>"
						k += "<td colspan='2'>" + data.DEPOSITSUM + "</td>"
						k += "<td>입금액</td>"
						k += "<td colspan='2'>" + data.WITHDRAWSUM + "</td>"
						k += "</tr>"
						
							$("#bnkSum").html(k);
						
					

					},
					error : function(request, status, error) { // 오류가 발생했을 경우의 동작
						alert("code:" + request.status + "\n" + "message:"
								+ request.responseText + "\n" + "error:"
								+ error);
					}
				});

			},
			error : function(request, status, error) { // 오류가 발생했을 경우의 동작
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		});

	}
</script>
</head>
<body>
	<input type="hidden" id="userId" value="${userId}">


	<table>

		<tr>
			<td colspan="6" class="t1"><input type="button" value="계좌목록"
				onclick="fnList()" style="float: right"></td>
		</tr>

		<tr class="t1">
			<td>날짜 :</td>
			<td colspan="2"><input type="text" id="start" value="${start}"
				title="조회 시작일" style="width: 100px"> ~ <input type="text"
				id="end" title="조회 종료일" value="${end}" style="width: 100px"></td>

			<td>계좌 :</td>
			<td colspan="2"><select id="accntId">
					<c:forEach var="bankAccount" items="${bankAccountList}">
						<option value="${bankAccount.ID}"
							<c:if test="${bankAccount.ID == bankAccount.BANK_NM}"> selected</c:if>>${bankAccount.BANK_NM}${bankAccount.NO}</option>
					</c:forEach>
			</select><input type="button" value="조회" onclick="fnSearch()"></td>
		</tr>

		<tr>
			<td colspan="6">입출금내역</td>
			
		</tr>
	</table>
	<table id="bnkStatements"></table>
	<table id="bnkSum"></table>



</body>
</html>