<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>select 태그 사용</title>
</head>
<body>

	<tf:select name="mode" rgb="RGB모드" wb="흑백모드"/>
	
	<tf:select name="genre" rock="락" ballad="발라드" metal="메탈"/> 
	<%-- 동적전달도 가능하게끔 태그의 기능을 제공해주고 있다. => 속성(key)과 값(value)을 가변적인 데이터로 전달할 수 있도록 기능 제공.
	select를 호출할 때마다 가변적인 속성의 값들을 전달하고 싶은 것이다. -> 어떤 속성에 어느 값이 넣어줄지 모름.
	select태그를 생각하면 타이틀에 따른 서브 메뉴 항목들이 바뀌는데 이에 대한 처리를 하려고 하는 것임. --%>

</body>
</html>