<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="dto.SalesDto" %>
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
		<%
			List<SalesDto> list = (List)request.getAttribute("list");
			
			for(SalesDto s:list){
		%>
		<tr>
			<td><%=s.getCustno()%></td>
			<td><%=s.getCustname() %></td>
		<%
				String gradeName = null;
				String grade = s.getGrade();
			if(grade.equals("A")){
				gradeName = "VIP";
			}else if(grade.equals("B")){
				gradeName = "일반";
				
			}else if(grade.equals("C")){
				gradeName = "직원";
			}
			%>
			<td><%=gradeName%></td>
			<td><%=s.getSumsales()%></td>
		</tr>
		<%
		}
		%>
		
	</table>
</section>
<jsp:include page="./template/footer.jsp"/>
</body>
</html>