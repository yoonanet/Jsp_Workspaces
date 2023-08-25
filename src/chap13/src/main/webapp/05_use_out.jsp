<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>out 태그 사용</title>
</head>
<body>
	
	<%-- <jsp:body> 액션 태그 사용 => 명시적으로 몸체의 데이터를 태그 파일로 전달할 수 있음
	     body-content="tagdependent"(표현식이나 표현언어가 모두 인식되지 않고 문자열데이터화 처리됨.)로 
	     태그 파일을 셋팅하면 전달되어지는 문자열 자체로 String의 자료형으로 처리가 되어지게끔 구성을 할 수 있다.
	     즉, 전송되어지는 문자열 자체에 대해서 중간에 표현언어가 포함이 되어져있다고 하더라도 
	     표현언어에 문법구문자체를 처리하는 것이 아니라 아예 텍스트 형태로 인식해서 문자열데이터로 처리가 되어지도록 한 것이다.
	     +) 표현식자체도 텍스트형태로 처리가 되어져서 태그 파일의 변수에 저장이 되어진다는 것을 알 수 있음.
	     
	     태그안에 담겨져 있는 ${ dateEL }이 표현 언어로 동작되지 않고 문자열로 전달되고 있는 것을 결과 화면으로 확인할 수 있다.
	      --%>
	<tf:out>
		<jsp:body><u>현재 시간</u>은 <b>${ dateEL }</b>입니다.</jsp:body>
	</tf:out>
	<br>
	
	<c:set var="dateEL" value="<%= new java.util.Date() %>"/>
	
	<tf:out> 
		<%= new java.util.Date() %><u>현재 시간</u>은 <b>${ dateEL }</b>입니다.
	</tf:out>

</body>
</html>