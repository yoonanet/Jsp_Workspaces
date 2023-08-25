<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
</head>
<body>
	<%-- request.getContextPath(): 프로젝트의 이름정보 리턴 (webapp의 위치부터 시작하는 것으로 생각) --%>
	<form action="<%= request.getContextPath() %>/logincheck/sessionLogin.jsp" method="post">
		아 이 디 : <input type="text" name="id" size="20"><br>
		비밀번호 : <input type="password" name="pw" size="20"><br>
		
		<input type="submit" value="로그인">
	</form>

</body>
</html>