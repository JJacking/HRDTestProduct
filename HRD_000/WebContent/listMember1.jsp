<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<h3>회원목록조회/수정</h3>
	<table border="1">
	<tr>
		<th>회원번호</th>
		<th>회원이름</th>
		<th>전화번호</th>
		<th>주소</th>
		<th>가입일자</th>
		<th>고객등급</th>
		<th>거주지역</th>	
	</tr>
	<c:forEach var="m" items="${list}">
		<tr>
			<td><a href="">${m.custno}</a></td>
			<td>${m.custname}</td>
			<td>${m.phone}</td>
			<td>${m.address}</td>
			<td>
				<fmt:formatDate value="${m.joindate}" pattern="yyyy-MM-dd"/>
			</td>
			<td>
				<c:choose>
					<c:when test="${m.grade=='A'}">VIP</c:when>
					<c:when test="${m.grade=='B'}">일반</c:when>
					<c:when test="${m.grade=='C'}">직원</c:when>
				</c:choose>
			</td>
			<td>${m.city}</td>
		</tr>
	</c:forEach>
	</table>



</section>
<jsp:include page="./template/footer.jsp"/>
</body>
</html>