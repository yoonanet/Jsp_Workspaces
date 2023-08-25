<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!-- @ page_디렉티브 페이지: 현재 jsp파일에 대한 인폼을 위와 같이 표현을 해주고 있는 것이다. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현재시간</title>
</head>
<body>
	
	현재 시간 : <%= new java.util.Date() %> <!-- 옆에 기호를 이용해서 자바코드를 작성할 수 있음 -> 객체를 생성함
	                                             : 실행 시 국제 표준시로 현재 시간을 출력해주고 있음 -->

	
	
</body>
</html>