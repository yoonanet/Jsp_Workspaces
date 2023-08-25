<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>removeHTML 태그</title> 
</head>
<body>
	
	<c:set var="dateEL" value="<%= new java.util.Date() %>"/> <%-- 현재의 시간과 날짜정보를 dateEL변수에 담아줌 --%>
	
	<tf:removeHTML trim="true"> <%-- 이번 실습에서는 body영역이 존재하는 사용자 정의 태그를 정의해볼 예정. 
	                             +) 이 body영역을 태그에서 어떻게 전달받을지를 하나하나씩 체크
	                            지금 만들고 있는 tf:removeHTML 태그의 기능은 html관련된 태그가 텍스트 노드 안에 있으면 태그를 제거하게끔 한다. --%>
		<font size="10" width="10">현재 시간은 ${ dateEL }입니다.</font>
	</tf:removeHTML> 
	<br>
	
	
	<tf:removeHTML trim="true" length="15" trail="...">
		<u>현재 시간</u>은 <b>${ dateEL }</b>입니다.
	</tf:removeHTML>
	
	
</body>
</html>