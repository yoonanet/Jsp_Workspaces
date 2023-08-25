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
	%>        

</body>
</html>