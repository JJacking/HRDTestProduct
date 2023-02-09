<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./css/css.css" rel="stylesheet">
<script type="text/javascript" src="./js/member.js"></script>
</head>
<body>
<jsp:include page="./template/header.jsp"/>
<section>
	
	<h3>홈쇼핑 회원 등록</h3>
	<form action="RMS" name="frm" method="POST">
	<table border="1">
		<tr>
			<td>회원 번호(자동 발생)</td>
			<td><input type="text" name="custno" id="custno" value="${nextNo}" readonly></td>
		</tr>
		<tr>
			<td>회원 성명</td>
			<td><input type="text" name="custname" id="custname"></td>
		</tr>
		<tr>
			<td>회원 전화</td>
			<td><input type="text" name="phone" id="phone"></td>
		</tr>
		<tr>
			<td>회원 주소</td>
			<td><input type="text" name="address" id="address"></td>
		</tr>
		<tr>
			<td>가입 일자</td>
			<td><input type="text" name="joindate" id="joindate"></td>
		</tr>
		<tr>
			<td>고객등급[A:VIP,B:일반,C:직원]</td>
			<td><input type="text" name="grade" id="grade"></td>
		</tr>
		<tr>
			<td>도시코드</td>
			<td><input type="text" name="city" id="city"></td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="submit" onclick="return chkValue() ">등록</button>
				<button type="button" onclick="location.href='LMS'">조회</button>
			</td>
		</tr>
	</table>
	</form>
</section>
<jsp:include page="./template/footer.jsp"/>

</body>
</html>