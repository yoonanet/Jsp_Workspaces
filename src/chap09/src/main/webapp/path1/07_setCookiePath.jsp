<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.net.URLEncoder" %>
    
<%
	Cookie cookie1 = new Cookie("path1", URLEncoder.encode("경로:/chap09/path1", "UTF-8")); //URLEncoder.encode(문자열, 인코딩타입)
	//String이라는 텍스트일 경우에는 응답에 헤더에 담겨서 전송이 되어지기 때문에 인코딩 디코딩의 별도 과정이 수행이되지 않는 것
	//그래서 인코딩을 해서 보내야 인코딩된 데이터가 보내질때 톰캣이 문자열 데이터를 제대로 처리할 수 있게됨
	//쿠키에 value값에 이동을 할 경로의 정보를 넣어줬음
	
	cookie1.setPath("/chap09/path1"); //브라우저야 위 쿠키를 전송해주는데 전송해줄때 path가 /chap09/path1의 요청이 왔을 때만 쿠키를 전송해달라고 함
	//Path를 통해서 전송조건을 걸어주고 있는 것이다. => 입력으로 넣어준 경로의 요청일 때만 쿠키의 요청이 전송되게끔 제약조건을 걸어줌
	response.addCookie(cookie1); //요청을 하면 쿠키가 헤더에 담겨서 같이 전송되게됨
	
	Cookie cookie2 = new Cookie("path2", URLEncoder.encode("경로:", "UTF-8")); 
	response.addCookie(cookie2); //만든 위치가 path아래에서 만들었기 때문에 디폴트경로로 지정됨. 위에 지정한 코드와 같은 효과가 됨
	
	Cookie cookie3 = new Cookie("path3", URLEncoder.encode("경로:/", "UTF-8")); 
	cookie3.setPath("/");
	response.addCookie(cookie3); //프로젝트 이름뒤에 뭐가 오든 상관없이 등록해달라는 의미가 된다.
	//path를 별도로 지정하지 않았기 때문에 무조건 보내달라는 의미이다!!
	
	Cookie cookie4 = new Cookie("path4", URLEncoder.encode("경로:/chap09/path2", "UTF-8")); //path가 다르기 때문에 전송이 되지 않음
	cookie4.setPath("/chap09/path2");
	response.addCookie(cookie4);
	//4개의 쿠키를 생성해서 클라이언트쪽으로 전달하도록 한다.
	
	//아까전에는 도메인 셋팅에 따라서 쿠키를 전송하는 범위를 setdomain으로 확장할 수도 있었음
	//지금은 지정되는 경로에 따라서 제약을 걸어둔 것이다.
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 경로 지정</title>
</head>
<body>

	<h3>쿠키 생성.</h3>

</body>
</html>