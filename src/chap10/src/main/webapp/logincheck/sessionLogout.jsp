<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% //백엔드에서는 로그아웃에 수행되는 기능에 중점을 맞춰야한다.
	session.invalidate(); //로그아웃 상태가 될 때 세션영역에 담긴 데이터들을 소멸시키도록 함. 
	                      // -> 세션영역의 데이터를 날리고 난 이후의 UI는 컨셉과 기획에 의해서 정해짐
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>
	
	<h3>로그아웃 되었습니다.</h3>
	
</body>
</html>