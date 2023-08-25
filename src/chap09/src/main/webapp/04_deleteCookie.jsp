<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Cookie cookie = new Cookie("name", ""); 
	//삭제에 대한 별도의 기능을 제공하는 것이 아님.
	//삭제할 쿠키의 이름을 넣어주고, 값을 빈값으로 넣어주게되면 삭제의 효과를 대신하게됨	
	//실행을 하면 쿠키가 바로 삭제가 되어지는 결과를 기대함.
	//하지만 쿠키의 정보가 null값으로 하여 다시 전송되어질 것이다.
	
	//쿠키의 기능중에서 유효시간이 존재, 브라우저에 전송이 되었을 때 얼만큼 보관을 할 것인지를 지정하는 기능이다.
	cookie.setMaxAge(0); //setMaxAge:쿠키를 얼만큼 보관을 할 것인지를 시간으로 셋팅해주는 메소드이다. => 0초로 시간을 넣어줌
	//0초동안 보관(쿠키의 유지시간)하라는 의미이기 때문에 삭제의 의미로 동작이 되어질 것이다.
	
	response.addCookie(cookie);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 삭제</title>
</head>
<body>

</body>
</html>

