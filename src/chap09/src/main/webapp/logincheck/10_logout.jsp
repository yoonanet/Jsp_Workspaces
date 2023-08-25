<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% //로그아웃 되는 순간 쿠키 삭제
	Cookie cookie = new Cookie("AUTH", "");
	cookie.setMaxAge(0);
	cookie.setPath("/"); //어떤 위치의 요청 패스이던 요청의 정보만 들어온다면 그 위치 이하에 있는 AUTH를 다 지워주도록 한다.
	//파일의 위치를 최상위로 지정해주는 것이다.
	response.addCookie(cookie);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>
	
	<h3>로그아웃하였습니다.</h3>
	
</body>
</html>