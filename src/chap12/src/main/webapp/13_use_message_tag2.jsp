<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<fmt:setBundle basename="resource.message" var="message"/> <%-- fmt:bundle태그와 똑같이 위치정보를 알려주도록 한다. +) var로 변수 이름을 지정해주도록 한다.
                                                                자체적으로 셋팅을 해주면 된다. bundle은 시작태그와 끝태그를 웹표준을 감싸줘야 했음
                                                                
                                                                setBundle의 영향 범위가 들어오는 개념이 아니다보니까 
                                                                fmt:message를 사용할 때 TITLE의 값을 읽어와서 변수에 담아주는데
                                                                그 변수를 dundle이라는 속성을 이용해서 setBundle로 지정한 변수를 통해 연결하도록 한다.(연결고리를 생성하는 것임)                                                                 
                                                                출력하는 방법은 12와 동일하다.--%>
<fmt:message bundle="${ message }" var="title" key="TITLE"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${ title }</title>
</head>
<body>

	<fmt:message bundle="${ message }" key="GREETING"/><br> <%-- bundle속성만 추가해주면 됨. --%> 	
	
	<c:if test="${ ! empty param.id }">
		<fmt:message bundle="${ message }" key="VISITOR"> <%-- bundle속성만 추가해주면 됨. --%>  
			<fmt:param value="${ param.id }"/> 
		</fmt:message> 
	</c:if>

</body>
</html>