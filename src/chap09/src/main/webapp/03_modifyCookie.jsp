<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.net.URLEncoder" %>

<%
	//생성된 쿠키의 값을 변경하고자할 때도 있을 수 있음 (클라이언트의 상태를 체크하기 용도라면 값이 변경될 수 있는 것)
	//쿠키에 대해서 어떻게 수정이 가능하게끔 작업? 쿠키에 대한 기능을 별도로 제공하지 않고 있음
	Cookie cookie = new Cookie("name", URLEncoder.encode("세종대왕")); //동일한 쿠키 이름으로 value 값만 변경하여 재요청을 해주면 된다.
	//기존에 name이라는 key가 존재하고, 값만 달리하여 생성한다면 마지막 값으로 동일하게 쿠키를 생성해주게 된다.
	//브라우저쪽에서는 같은이름으로 쿠키가 전송되어져 오면 기존쿠키는 삭제를 하고, 현재 보내온 쿠키로 저장을 하게 된다. (업데이트의 형식)
	
	response.addCookie(cookie); 	
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 수정</title>
</head>
<body>


</body>
</html>