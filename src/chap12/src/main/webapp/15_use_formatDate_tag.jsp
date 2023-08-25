<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl - formatDate tag</title>
</head>
<body>

	<c:set var="now" value="<%= new java.util.Date() %>"/>
	<fmt:formatDate value="${ now }" type="date" dateStyle="full"/><br>
	<%-- 타입을 date로 지정하면 날짜에 관련된 정보, time은 시간에 대한 정보, both는 날짜와 시간에 대한 정보를 전체적으로 보여주도록 할 때 지정.
	dateStyle(출력의 형태를 지정)를 full로 지정하면 날짜정보를 전체적으로 보여줌, 
	short로 지정하면 간단하게 년월일의 정보로 출력해줌
	
	pattern속성은 시간과 날짜에 대한 정보를 어떤형식으로 출력할지를 지정할 수 있도록 한다. (출력되어지는 형태와 모양을 개발자가 지정하도록 함)
	z => 표준에 근거하는 어느나라의 시간인지를 표시, a => 오전인지 오후 표시, h => 시, mm => 분 --%>
	<fmt:formatDate value="${ now }" type="date" dateStyle="short"/><br>
	<fmt:formatDate value="${ now }" type="time" dateStyle="short"/><br> 
	<fmt:formatDate value="${ now }" type="both"/><br>
	<fmt:formatDate value="${ now }" pattern="z a h:mm"/><br>
</body>
</html>