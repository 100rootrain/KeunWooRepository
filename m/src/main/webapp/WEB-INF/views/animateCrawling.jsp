<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
	<table>
		
			<c:forEach var="url" items="${url}" varStatus="status">
				<c:if test="${title[status.index]!=''}">
					<c:choose>
						<c:when test="${status.index%5 eq 0}">
						<tr>
							<td>
								<a href="${url}">
								<img src="${imgUrl[status.index]}" width="180" alt="${title[status.index]}" title="${title[status.index]}" class="middle">
								</a>
								<div>${price[status.index]}</div>
							</td>					
						
						</c:when>
						<c:when test="${status.index%5 ne 0 && status.index%5 ne 4}">
						
							<td>
								<a href="${url}">
								<img src="${imgUrl[status.index]}" width="180" alt="${title[status.index]}" title="${title[status.index]}" class="middle">
								</a>
								<div>${price[status.index]}</div>
							</td>
						</c:when>
						<c:when test="${status.index%5 eq 4 }">
							<td>
								<a href="${url}">
								<img src="${imgUrl[status.index]}" width="180" alt="${title[status.index]}" title="${title[status.index]}" class="middle">
								</a>
								<div>${price[status.index]}</div>
							</td>		
						</tr>
						</c:when>
					</c:choose>
				</c:if>
			</c:forEach>	
				

	</table>




</html>