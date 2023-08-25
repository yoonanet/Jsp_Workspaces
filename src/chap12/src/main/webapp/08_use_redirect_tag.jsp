<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl - redirect 태그</title>
</head>
<body>
<%-- jsp의 response기본 객체의 sendredirect메소드를 살펴봤었음 => 이 기능에 대용이 redirect태그인 것이다.
     sendredirect에 내가 재요청할 페이지의 정보를 알려주도록 했었음 => redirect태그에서는 url(재요청할 페이지에 대한 정보)을 통해 알려주도록 한다.
     입력으로 넣어준 페이지를 서버에 재요청을 하게 되는 것이다. 
     다른 프로젝트로 접근할 수 있는 방법도 있지만 한 프로젝트내에서 모든 것이 동작되어지게끔 처리를 해주는 것을 권장한다.
     
     context: 프로젝트를 지정!!(다른 프로젝트로 이동할 때 활용하도록 하는 속성) --%>
	<%-- <c:redirect url="04_use_forEach_tag.jsp" /> --%>
	
	<c:redirect url="/01_useELObject.jsp" context="/chap11" /> <%-- 요청을 할 때는 앞에 /부터 path를 지정하여 url을 찾아갈 수 있게끔 처리를 해줘야한다. 
	                                                                그렇게 해야 포트번호 뒤부터 /부터 시작하여 요청을 해주게 됨.
	                                                                context가 들어가면서 새로운 프로젝트부터 시작이 되어지기 때문에 url에서도 /를 빼면 안됨
	                                                                 
	                                                                이렇게 지정하면서 페이지를 서버에 재요청하는 코드를 작성하게 되면 소스관리도 어려울뿐만 아니라
	                                                                히스토리를 모르는 사람들이 이 파일을 가져갔을 때 오동작이 일어날 수 있는 문제점이 발생되기 때문에 권고되지 않는다. --%>
</body>
</html>
<%-- 다른 프로젝트에서 톰캣 9.0버전을 사용하려고 한다면 빌드패쓰에서 모듈 4.0으로 변경, 톰캣 9.0으로 지정 --%>