<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- 생성되어져 있는 세션의 정보를 로그아웃의 요청이 왔을 때는, 세션의 정보들을 삭제해줘야할 것이다.
     브라우저의 X버튼이 누르지 않더라도 세션을 삭제해서 그 다음에 요청이 오면 최초 요청처럼 처리가 되어져야 하는 것이다. --%>
 <% 
 	session.invalidate(); //session은 별도로 삭제기능을 제공을 해주고 있음 => invalidate()메소드: 세션에 할당되어져 있는 영역을 삭제해준다.
 %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 종료</title>
</head>
<body>
	
	<h3>세션을 종료하였습니다.</h3>

</body>
</html>

