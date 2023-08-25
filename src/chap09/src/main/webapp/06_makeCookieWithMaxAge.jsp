<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Cookie cookie = new Cookie("10minute", "10time"); //10분 동안 쿠키를 유지할 용도의 쿠키(브라우저 종료여부에 상관없이)
	cookie.setMaxAge(60 * 10); //지정되는 시간은 초로 인식됨 => 60초:1분 * 10 = 10분의 의미
	//지정된 시간 뒤에 브라우저가 쿠키를 자동소멸 시켜주게 된다.
	response.addCookie(cookie);
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 유효 시간 설정</title>
</head>
<body>

<%-- 쿠키를 생성하면 클라이언트 쿠키 저장소에 저장됨
	 별도의 시간을 셋팅을 하지 않으면 브라우저를 완전히 닫아버리는 순간 쿠키 저장소에 저장된 디폴트 쿠키들을 다 소멸시킴
	     
	 브라우저가 종료되더라도 생성된 쿠키를 일정시간동안 보관하고자 한다면? setMaxAge메서드를 활용하도록 한다.
	 
	 10분뒤 결과창을 보면 지정된 쿠키가 사라진 것을 확인할 수 있다.
--%>
	<h3>유효시간이 10분인 10minute 쿠키 생성.</h3>

</body>
</html>