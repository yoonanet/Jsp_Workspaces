<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl - url 태그</title>
</head>
<body>
	
	<%-- url태그는 import태그와 기능이 유사함 => import의 url속성은 이동할 웹페이지의 정보를 넣어줬었음(바로 이동해가면서 웹페이지로 이동)
	     import에 태그의 속성 중에 url이 태그로 나온 것으로 생각
	     : var(url저장 변수 생성)과 value(이동할 웹페이지의 정보를 넣어주도록 한다.)속성이 있음.
	     
	     url태그는 이동의 정보를 변수에 담아주는 것임. => 보여지는 기능이 아님
	     표현언어로 변수에 저장한 url을 a태그의 href속성에 담아주면서 클릭을 눌렀을때 이동하도록 작업을 해둔 것이다.
	     
	     url태그에서 value값으로 지정을 해주게 되면 해당 정보를 그대로 출력해서 url정보에 대한 인폼을 알려주는 기능도 제공을 해주고 있음. --%>
	<c:url var="searchUrl" value="https://www.youtube.com/results">
		<c:param name="search_query" value="보라매공원"></c:param>
	</c:url>
	
	<ul> 
		<li><a href="${ searchUrl }">${ searchUrl }</a></li>
		<li><c:url value="./02_use_if_tag.jsp" /></li>
	</ul>

</body>
</html>