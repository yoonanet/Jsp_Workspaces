<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main page</title>
</head>
<body>
<%-- 지금까지 만든 파일들을 한페이지로 구성할 계획임. --%>
	<h3>main.jsp에서 생성한 내용.</h3>
	
	
	<jsp:include page="./module/header.jsp"></jsp:include>
	<%-- include액션태그에 속성에는 page가 있음 -> page속성에 삽입시킬 페이지(레이아웃)의 경로를 넣어주도록 한다. 
	     jsp:include로 지정한 자리에 다른 웹페이지를 포함시켜주게끔 동작을 시켜주는 태그이다. 
	     (동작: 해당위치로 이동해가서 실행하고 실행이 끝나면 복귀하고 그 이하코드를 실행하는 것임)
	                   즉, 삽입의 효과가 발생되어지는 태그인 것이다. --%>

	<h5>include 액션 태그 이후의 내용.</h5>





</body>
</html>