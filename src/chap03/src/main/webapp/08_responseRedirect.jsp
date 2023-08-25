<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Response 객체</title>
</head>
<body>
<%-- response객체: 응답으로 보내줘야할 정보들을 담아서 보관하고 있으며 브라우저에게 전달할 내용들이 된다.
	                   즉, 클라이언트한테 보내줘야할 정보인 것이다. 
	                   
	 response객체에서는 한가지만 염두하도록 한다.
	 response.sendRedirect(String location)기능을 정확하게 알고 있으면 된다.
	 sendRedirect동작: 응답으로 보낼 웹페이지에 대한 정보를 넣어줌
	 요청을 했을 때는 08_responseRedirect.jsp를 요청을 했는데 브라우저를 보면 08_responsePage.jsp이 요청이 되고 있음
	 즉, sendRedirect의 기능은 실행이 되어지면 항상 클라이언트만이 서버에 요청하는 주체인 것인데
	 그 요청을 받은 페이지가 sendRedirect하면 이게 실행되면서 정보가 브라우저에 전송됨
	 브라우저는 이 정보를 받아서 이 페이지를 서버에 다시 요청을 하게끔 동작이 되어지는 것이다.
	 
	 유일하게 서버가 요청을 받았을 때 다시 새로운 요청을 하게끔 해주는 기능인 것이다!! (어느 기능에서 사용이 되는지는 나중에 살펴볼 예정.) --%>
	 	
	<% response.sendRedirect("08_responsePage.jsp"); %>
	
	

</body>
</html>