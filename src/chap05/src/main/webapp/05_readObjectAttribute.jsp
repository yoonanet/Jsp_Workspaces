<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영역 데이터 읽어오기</title>
</head>
<body>

	<%
		//request 메모리 영역 데이터 가져오기
		//String id = (String)request.getAttribute("id"); /* getAttribute는 다양한 자료형으로 값이 담길 수 있기 때문에 object로 반환되는 것임 => 따라서 강제형변환을 해주도록 한다. */
		//String pw = (String)request.getAttribute("pw");
		
		//session 메모리 영역 데이터 가져오기
		//String id = (String)session.getAttribute("id");
		//String pw = (String)session.getAttribute("pw");
		
		//application 메모리 영역 데이터 가져오기
		String id = (String)application.getAttribute("id");
		String pw = (String)application.getAttribute("pw");
	%>
	
	데이터 읽어오기 : <%= "아이디: " + id + ", 비밀번호: "+ pw %> 
	<%-- request는 데이터를 보내는 순간 메모리 영역을 소멸시키기 때문에 결과로 null이 출력되는 것임.
	     session은 브라우저를 닫는 순간 메모리가 소멸됨. => 따라서 브라우저가 켜져 있을 때는 입력된 값 그대로 전달이 되고, 브라우저를 끄면 null로 전달된다.
	     application은 서버를 끄기 전까지 메모리가 유지됨. => 그렇기 때문에 브라우저를 키든 끄든 값이 그대로 유지된다. 
	                                                       => 톰캣을 restart를 하면 서버가 꺼졌다가 키는 것이기 때문에 실행하면 null의 값이 전달된다.
	     
	     서버는 사용자가 로그인했다는 정보를 계속 알고 있어야 한다. 
	     (http프로토콜의 방식으로는 응답이 되어졌을 때 연결을 끊어버리기 때문에 사용자의 요청하는 사항을 서버가 구분을 하지 못함. 
	     하지만 서버와 클라이언트는 서로 공유를 할 수 있어야 함. 그래야 사용자의 요청사항을 제대로 처리할 수 있음)
	     => 따라서 쿠키와 session의 방법을 활용할 수 있다. --%>
	     	
</body>
</html>