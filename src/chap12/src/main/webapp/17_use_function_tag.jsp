<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> <%-- function은 접두어로 줄임말인 fn을 사용한다. --%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%-- jstl을 사용할 때 core는 필수적으로 다른 것들과 사용되어짐 --%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl - 함수 사용</title>
</head>
<body>
	
	<c:set var="str" value="function<a>fn:</a>를 사용합니다."/>
	<%-- 문자의 갯수를 반환해주는 함수로 length를 jstl에서 제공을 해주고 있다. => 함수를 호출할 때는 표현언어에 넣어주면 된다.
	     주의) jstl에서 제공을 해주는 함수는 접두어 fn:을 !!꼭!! 붙여주면서 호출해주도록 한다. --%>
	length(str) = ${ fn:length(str) }<br>
 	toUpperCase(str) = ${ fn:toUpperCase(str) }<br> <%-- 출력되어진 것을 확인해보면 태그는 브라우저 상에 태그로 인식되어지고 있고, 영문을 대문자로 변환되어지고 있다.
 	                                                     하지만, 태그의 영문도 대문자로 변환이 되면서 앵커태그로 동작되지 않고 있다는 것을 확인할 수 있다. --%>
 	
</body>
</html>