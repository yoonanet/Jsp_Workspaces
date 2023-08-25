<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl - catch 태그</title>
</head>
<body>
	
	<%-- c:catch는 예외처리에 관련된 태그이다. (try, catch문을 처리할 수 있게끔 태그로 제공해주는 기능인 것이다.)
	
	파라미터의 값으로 name을 꺼내오려고 함. -> name이라는 파라미터가 없으면 null의 값이 반환됨
	여기서 if문을 통해 name의 파라미터 값이 test랑 동일한지 보게 되면 nullpointerexception의 예외가 발생되어야 함.
	
	try, catch로 감싸진 것처럼 동작이 되게끔 처리하는 태그가 catch태그인 것이다.
	var에는 예외가 발생되는 정보를 var에다가 담아주게 된다. 따라서 변수명을 적어주도록 한다.	
	***jstl에서 선언한 변수는 표현언어를 활용해서 언제든 불러낼 수 있다. --%>
	<c:catch var="e">
		name 파라미터 값 = <%= request.getParameter("name") %><br> 
		
		<%
			if(request.getParameter("name").equals("test")){ //name의 값이 test랑 같은지 확인하는 것임.
				out.println(request.getParameter("name")); //test라는 문구를 확인해보기 위한 코드임.
			}
		%>
	</c:catch>
	<p></p>
	<c:if test="${ e != null }"> 
		익셉션이 발생했습니다.<br>
		${ e }
	</c:if>

</body>
</html>