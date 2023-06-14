<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<style>
		table{
			margin: 20% auto;
			border:1px solid lightgray;
			padding: 10px;
		}
		td{
			text-align:center;
		}
		.td_label{
			width:100px;
			font-size:15px;
		}
		.td_input{
			width:150px;
		}
		#msg_div{
			height:12px;
			color:red;
			font-size:10px;
			padding:10px;
		}
	</style>
</head>
<body>
<form action='/login'>
		<table>
			<tr>
				<td class="td_label"><label>아이디</label></td> 
				<td class="td_input">
					<input type="text" name="id" value="${id}" maxlength=10>
				</td>
			</tr>
			<tr>
				<td class="td_label"><label>패스워드</label></td>
				<td class="td_input">
					<input type="text" name="pw" maxlength=10>
				<td>
			</tr>
			<tr>
				<td colspan=2>
					<c:if test="${error != null}">
    					<div id="msg_div">
    						${error}
    					</div>
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan=2>
					<input type="submit" value="로그인">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
