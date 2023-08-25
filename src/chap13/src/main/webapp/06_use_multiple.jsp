<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>multiple 태그 사용</title>
</head>
<body>
	<%-- jsp에서 선언한 변수값을 태그를 호출할 때(태그파일의 몸체에) 어떻게 전달을 할 수 있을지에 대한 실습을 진행 예정 --%>
	<c:set var="num" value="${ 1 }"/>
	
	<tf:multiple count="10"> 
		${ num }<br>
		<c:set var="num" value="${ num + 1 }" />
	</tf:multiple>	

</body>
</html>