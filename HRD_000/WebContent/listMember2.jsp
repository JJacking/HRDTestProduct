<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="dto.MemberDto" %>
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
		<%
			List<MemberDto> list = (List)request.getAttribute("list");
			
			for(MemberDto m:list){
		%>
			<tr>
				<td><a href="UMS?custno=<%=m.getCustno()%>"><%=m.getCustno()%></a></td>
				<td><%=m.getCustname()%></td>
				<td><%=m.getPhone()%></td>
				<td><%=m.getAddress()%></td>
				
				<%
					String joindate = new java.text.SimpleDateFormat("yyyy-MM-dd").format(m.getJoindate());
				%>
				
				<td><%=joindate%></td>
				
				<%
					String gradeName = null;
					switch(m.getGrade()){
					case "A":
						gradeName = "VIP";
						break;
					
					case "B":
						gradeName = "일반";
						break;
					
					case "C":
						gradeName = "직원";
						break;
					}
				%>
				
				<td><%=gradeName%></td>
				<td><%=m.getCity() %></td>
			</tr>
		
		<%
			}
		
		%>
	</table>
</section>
<jsp:include page="./template/footer.jsp"/>
</body>
</html>