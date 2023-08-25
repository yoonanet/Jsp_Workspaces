<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제목 출력</title>
</head>
<body>
	
	<tf:header title="텍스트 제목" level="2" />
	<tf:header title="${ 'EL 제목' }" level="3"/>
	
	<%-- <tf:header title="<%= "표현식 제목" %>"/> 이렇게 작성을 하면 바깥쪽에 있는 큰따옴표와 교차되어 오류가 남
	                                               표현식에서는 이러한 문제점이 발생되는 것. 바깥쪽과 안에 따옴표를 구별되도록 지정해주면 된다. --%>
	<tf:header title='<%= "표현식 제목" %>'/>
	
	<%-- <tf:header level="1"/> 필수속성을 작성하지 않으면 바로 error를 내줌. --%>
	
</body>
</html>