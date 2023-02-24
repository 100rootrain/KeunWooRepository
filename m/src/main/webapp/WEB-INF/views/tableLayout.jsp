<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css" rel="stylesheet"> <!-- 테이블 레이아웃 -->

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script> <!-- 테이블 레이아웃 -->

<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>

<style>
.table {
	border-spacing: 0;
	border-collapse: collapse;
}

.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th,
	.table>thead>tr>td, .table>thead>tr>th {
	padding: 8px;
	line-height: 1.42857143;
	vertical-align: top;
	border-top: 1px solid #ddd;
}

th {
	text-align: center;
}

.table-bordered>tbody>tr>td, .table-bordered>tbody>tr>th,
	.table-bordered>tfoot>tr>td, .table-bordered>tfoot>tr>th,
	.table-bordered>thead>tr>td, .table-bordered>thead>tr>th {
	border: 1px solid #ddd;
}
</style>

<script>
	
</script>
<title>tableLayout 테스트용</title>
</head>
<body>

	<table class='table table-bordered table-hover'>
		<tr>
			<th>#</th>
			<th>이름</th>
		</tr>
		<tr>
			<td>1</td>
			<td>한놈</td>
		</tr>
		<tr>
			<td>2</td>
			<td>두시기</td>
		</tr>
		<tr>
			<td>3</td>
			<td>석삼</td>
		</tr>
		<tr>
			<td>4</td>
			<td>너구리</td>
		</tr>
	</table>


</body>

</html>