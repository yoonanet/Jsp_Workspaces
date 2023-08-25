<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Cache-Control" content="no-cache"/> 
<meta http-equiv="Expires" content="0"/> 
<meta http-equiv="Pragma" content="no-cache"/> 

<title>Insert title here</title>
</head>
<body>
<%
String id=(String)session.getAttribute("id"); //기존 아이디값을 가지고 있는지 체크하기 위함
System.out.println(id);
if(id==null){ //아이디가 없을 경우
	response.sendRedirect("/ShoppingMall/MemberLogin.me"); //브라우저를 통해서 쇼핑몰의 로그인화면을 재요청
}
else{ //로그인이 된 상태에서는.
%>
<a href="/ShoppingMall/MemberModifyAction_1.me">회원정보수정</a>
<%
}
%>
</body>
</html>
