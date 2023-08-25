<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="member" class="member.Member" scope="request" /> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 페이지</title>
</head>
<body>
	
	아이디: <jsp:getProperty name="member" property="id" /><br>
	비밀번호: <jsp:getProperty name="member" property="password" /><br>
	이름: <jsp:getProperty name="member" property="name" /><br>
	주소: <jsp:getProperty name="member" property="address" /><br>
	이메일: <jsp:getProperty name="member" property="email" /><br>
	
</body>
</html>