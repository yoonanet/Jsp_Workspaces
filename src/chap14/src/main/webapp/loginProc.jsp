<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8"); //post방식일 때 한글이 깨지지 않고 꺼내올 수 있도록 인코딩 방식을 지정해주도록 함.
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 기존에는 submit을 눌렀을 때 이 페이지로 이동할 수 있도록 경로를 알려주는 것이 jsp의 방법이였음. --%>
</head>
<body>

	안녕하세요, <%= id %>님!!!<br>

</body>
</html>