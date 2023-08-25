<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 목록</title>
</head>
<body>

	<h3>쿠키 목록</h3>
	<% 
		Cookie[] cookies = request.getCookies(); 
		
		if(cookies != null){
			for(int i=0; i < cookies.length; i++){
				out.println(cookies[i].getName() + " : " + URLDecoder.decode(cookies[i].getValue(), "UTF-8") + "<br>"); 
			} 
		}          
	//path2로 쿠키 요청을 한 것이기 때문에 cookie4가 잘 보여지고 있음.
	// (/)의 의미가 모든 패스를 의미하기 때문에 path2에서 실행이되도 잘 실행되는 것이다.
	%>        
	
</body>
</html>