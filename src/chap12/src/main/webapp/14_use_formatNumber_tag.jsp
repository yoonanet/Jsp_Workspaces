<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl - formatNumber tag</title>
</head>
<body>

	<c:set var="price" value="10000"/>
	<%-- fmt:formatNumber태그에서 value의 값을 var에 넣음, type속성은 숫자로 넣어줌. 
	     10000이라는 값만 넣어줬지만 출력사항을 보면 자동으로 숫자의 세자리마다 ","를 넣어서 출력해주고 있음
	     자동 통화량에 맞춰서 포맷에 따라 처리를 해주는 기능을 제공해주고 있는 것이다.
	
	     타입을 currency로 잡으면 나라별로 통화단위에 맞춰서 출력을 해줌.
	     pattern속성: 담겨진 값의 빈영역은 0으로 채우면서 패턴으로 지정한 크기만큼을 할당해서 value의 담겨진 값을 원하는 형태로 출력
	     ***숫자에 관련된 데이터를 fmt:formatNumber태그를 이용해서 type에 따라서 숫자, 통화량, 퍼센트의 단위로의 자동 출력 기능을 제공해주고 있는 것이다. --%>
	<fmt:formatNumber var="numberType" value="${ price }" type="number"/><br> 
	숫자 : ${ numberType }<br>
	통화 : <fmt:formatNumber value="${ price }" type="currency"/><br>
	퍼센트 : <fmt:formatNumber value="${ price }" type="percent"/><br>
	패턴 : <fmt:formatNumber value="${ price }" pattern="00000000.00"/><br>
	
</body>
</html>