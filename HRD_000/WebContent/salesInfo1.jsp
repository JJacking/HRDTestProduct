<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./css/css.css" rel="stylesheet">
</head>
<body>
<jsp:include page="./template/header.jsp"/>
<section>
	<h3>회원매출조회</h3>
	<table border="1">
		<tr>
			<th>회원번호</th>
			<th>회원성명</th>
			<th>고객등급</th>
			<th>매출</th>
		</tr>
		<c:forEach var="s" items="${list}">
			<tr>
				<td>${s.custno}</td>
				<td>${s.custname}</td>
				<td>
					<c:if test="${s.grade eq 'A'}">VIP</c:if>
					<c:if test="${s.grade eq 'B'}">일반</c:if>
					<c:if test="${s.grade eq 'C'}">직원</c:if>
				
				</td>
				
				<td>${s.sumsales}</td>
			</tr>
		</c:forEach>
	</table>
</section>
<jsp:include page="./template/footer.jsp"/>
</body>
</html>