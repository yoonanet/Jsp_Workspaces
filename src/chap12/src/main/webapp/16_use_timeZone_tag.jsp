<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl - timeZone 태그</title>
</head>
<body>
	
	<c:set var="now" value="<%= new java.util.Date() %>"/>
	
	<%-- both로 지정하면서 날짜와 시간정보 둘 다 출력하도록 지정, 날짜에 대한 스타일을 전체적으로 보여지도록 지정
	     timeStyle => 시간에 대한 스타일 지정!! --%>
	<fmt:formatDate value="${ now }" type="both" dateStyle="full" timeStyle="full"/><br> 
	
	<%-- 한국 시간 -> Los_Angeles 시간으로 계산 후 출력
	     value의 값은 나라의 지역별 키워드로 고정이 되어져 있음. 그 형식에 맞춰서 그대로 넣어줘야 인식이 돼서 동작이 됨.
	     
	     지역정보를 어떻게 확인해볼 수 있을까? java.util.TimeZone.getAvailableIDs()메소드를 활용하도록 한다. => 나라별 지역에 대한 키워드로 정의되어져 있는 정보를 보여줌
	                                           getAvailableIDs메소드는 static메소드임 --%>
	<fmt:timeZone value="America/Los_Angeles">
		<fmt:formatDate value="${ now }" type="both" dateStyle="full" timeStyle="full"/><br>
	</fmt:timeZone>
	
	<c:forEach var="id" items="<%= java.util.TimeZone.getAvailableIDs() %>"> 
		${ id }<br>
	</c:forEach>
	
</body>
</html>