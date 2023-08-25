<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
</head>
<body>
	<!-- [로그인에 처리를 위한 폼양식을 만들어주도록 한다.]	
	     action속성에서 path지정: 웹표준과 스프링의 디렉토리 위치가 다름. 그렇기 때문에 웹표준형식으로 스프링의 디렉토리 위치를 지정하게 되면 제대로 이동이 안되는 상황 발생
	     그렇기 때문에 절대 경로를 통해 path를 지정하여 화면적으로 처리해주도록 해야 한다. -->
	<form action="<%= request.getContextPath() %>/loginProcess.jsp" method="post">
		아 이 디 : <input type="text" name="memberId" size="20" /><br>
		비밀번호 : <input type="password" name="memberPw" size="20" /><br>
		<input type="submit" value="로그인">
	</form>

</body>
</html>