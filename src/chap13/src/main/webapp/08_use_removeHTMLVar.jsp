<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>removeHTMLVar 태그 사용</title>
</head>
<body>

	<%-- 변수를 jsp와 태그 속성 값 사이에서 공유하고 싶은데 서로 다른 이름으로 선언하고자 할 때 어떻게 할지에 대한 실습 
	     유의) 태그에서 선언해준 변수를 태그의 영역 밖에서도 사용을 하고 있음.--%>
	<c:set var="dateEL" value="<%= new java.util.Date() %>" />
	
	<tf:removeHTMLVar trim="true" var="removed"> 
		<font size="10">현재<style>시간</style>은 ${ dateEL }입니다.</font>
	</tf:removeHTMLVar>
	
	처리 결과 : ${ removed }

</body>
</html>