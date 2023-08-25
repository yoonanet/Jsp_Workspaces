<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl - choose tag</title>
</head>
<body>
	
	<!-- c:choose의 자식으로 따라다니는 태그가 c:when태그(여러 개를 작성할 수 있음),c:otherwise이다.
	     여러 개의 조건을 걸어서 그 조건 중에서 하나라도 만족을 하면 만족하는 것을 수행할 수 있게끔 제공하는 태그이다. (switch case문을 생각하도록 한다.)
		 
	     when을 이용해서 다중의 조건을 체크(else if문처럼 동작됨), 
	     otherwise(switch의 default처럼 실행되는 태그임)는 조건으로 지정했던 것들이 다 맞지 않을 때 실행이 된다.
	     
	     choose안에 when, otherwise가 한쌍으로 작성이 되어지는 다중의 조건을 체크해줄 수 있는 구문인 것이다.
	     차례로 조건을 확인하고 조건에 맞는 영역을 한 번만 출력해준다. -->
	     
	<ul>
		<c:choose> 
			<c:when test="${ param.id == 'hong' }">
				<li>당신의 아이디는 ${ param.id }입니다.</li>
			</c:when>
			<c:when test="${ param.age > 20 }">
				<li>당신의 나이는 ${ param.age }이군요.</li>
			</c:when>
			<c:otherwise>
				<li>당신은 hong도 아니고, 20세 미만이군요.</li>
			</c:otherwise>
			
		</c:choose>	
	</ul>



</body>
</html>