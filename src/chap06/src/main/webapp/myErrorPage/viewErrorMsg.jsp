<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나만의 에러 페이지</title>
</head>
<body>

	<%-- 이 에러 페이지는 내가 자체 제작을 할 수도 있고, 디자이너(친해야만 가능)에게 요청을 할 수 있는 페이지 --%>
	요청 처리 과정에서 에러가 발생하였습니다.<br>
	빠른 시간 내에 문제를 해결하도록 하겠습니다.
	<p>
		에러 타입 : <%= exception.getClass().getName() %><br> <%-- 발생된 예외에 대한 자료형을 확인할 수 있음(메서드체이닝 방식을 통해 메소드 호출.) --%>
		에러 메세지 : <%= exception.getMessage() %> <%-- exception자료형이 제공해주는 예외에 대한 메시지 확인 --%>
	</p>



</body>
</html>