<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %> <!-- post로 전송이 되어지기 때문에 한글이 깨지지 않기 위한 인코딩 포맷을 셋팅해주도록 한다. -->   

<%
	String id = request.getParameter("memberId");

	if(id != "") { //id가 입력만 되어져 있으면 로그인 성공으로 처리하도록 한다.
		//서버와 클라이언트간의 상태정보를 공유하기 위한 세션을 활용하도록 한다. (로그인 한 사람의 정보를 세션에 보관)
		session.setAttribute("MEMBER", id); 
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리 화면</title>
</head><!-- 사용자가 입력한 아이디와 비밀번호를 꺼내와서 처리를 수행할 페이지 -->
<body>

	<h1>로그인 처리 화면</h1>

</body>
</html>