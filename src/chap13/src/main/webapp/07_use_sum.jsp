<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sum 사용</title>
</head>
<body>
	
	<tf:sum begin="1" end="10">
		1~10까지의 합 : ${ sum } <%-- 실습) jsp(표현언어에서 생성한 변수)와 사용자 정의 태그 사이에서 변수를 공유하고자 하는 것임.
		                              변수의 선언과정과 연결고리가 jsp의 코드상에서는 확인이 안되기 때문에 가독성이 좀 떨어짐
		                              따라서 이 기능을 사용하고자 하는데 다른 사람과 함께 작업한다면 인폼의 주석을 꼭 달아주도록 하자.
		                              주석ex) 태그파일 공유 변수 --%>
	</tf:sum>
</body>
</html>