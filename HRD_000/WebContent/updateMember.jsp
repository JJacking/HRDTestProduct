<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.MemberDto" %>
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
	<h3>홈쇼핑 회원 정보 수정</h3>
	<form action="UMS" name="frm" method="POST">
	<table border="1">
		<tr>
			<td>회원 번호</td>
			<td><input type="text" name="custno" id="custno" value="${member.custno}" readonly></td>
		</tr>
		<tr>
			<td>회원 성명</td>
			<td><input type="text" name="custname" id="custname" value="${member.custname}"></td>
		</tr>
		<tr>
			<td>회원 전화</td>
			<td><input type="text" name="phone" id="phone" value="${member.phone}"></td>
		</tr>
		<tr>
			<td>회원 주소</td>
			<td><input type="text" name="address" id="address" value="${member.address}"></td>
		</tr>
		<tr>
			<td>가입 일자1- jstl</td>
			<td><input type="text" name="joindate" id="joindate" 
			value='<fmt:formatDate value="${member.joindate}" pattern="yyyy-MM-dd"/>'></td>
		</tr>
		<tr>
			<td>가입 일자2</td>
			<%
				dto.MemberDto member = (dto.MemberDto)request.getAttribute("member");
				String joindate = new java.text.SimpleDateFormat("yyyy-MM-dd")
											.format(member.getJoindate());
			%>
			<td><input type="text" name="joindate1" id="joindate1" 
			value="<%=joindate%>"></td>
		</tr>
		<tr>
			<td>고객등급[A:VIP,B:일반,C:직원]</td>
			<td><input type="text" name="grade" id="grade" value="${member.grade}"></td>
		</tr>
		<tr>
			<td>도시코드</td>
			<td><input type="text" name="city" id="city" value="${member.city}"></td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="submit">수정</button>
				<button type="button" onclick="location.href='LMS'">조회</button>
			</td>
		</tr>
	</table>
	</form>


</section>
<jsp:include page="./template/footer.jsp"/>
</body>
</html>