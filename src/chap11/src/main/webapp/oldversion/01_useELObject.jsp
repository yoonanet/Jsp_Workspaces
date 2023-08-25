<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page isELIgnored="true" --%> --%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL Object</title>

<script type="text/javascript">



</script>

</head>
<body>

	\${ 10 + 2 } = ${ 10 + 2 } <br> 
	\${ 10 - 2 } = ${ 10 - 2 } <br>
	\${ 10 * 2 } = ${ 10 * 2 } <br>
	\${ 10 / 2 } = ${ 10 / 2 } <br>
	\${ 10 div 2 } = ${ 10 div 2 } <br><br>
	
	\${ 10 % 3 } = ${ 10 % 3 } <br>
	\${ 10 mod 3 } = ${ 10 mod 3 } <br> 
	
	\${ "2" + 5 } = ${ "2" + 5 }<br>
	\${ "2" * 5 } = ${ "2" * 5 }<br>
	
	\${ 10 + null } = ${ 10 + null }<br>
	
	
	\${ "문자" += "열" += " 연결" } = ${ "문자" += "열" += " 연결" }<br><br><br>


	\${ 10 > 2 } = ${ 10 > 2 }<br>
	\${ 10 gt 2 } = ${ 10 gt 2 }<br><br> 
	
	\${ 10 < 2 } = ${ 10 < 2 }<br>
	\${ 10 lt 2 } = ${ 10 lt 2 }<br><br> 
	
	\${ 10 >= 2 } = ${ 10 >= 2 }<br>
	\${ 10 <= 2 } = ${ 10 <= 2 }<br>
	\${ 10 == 2 } = ${ 10 == 2 }<br>
	\${ 10 eq 2 } = ${ 10 eq 2 }<br><br>
	
	\${ 10 != 2 } = ${ 10 != 2 }<br> &lt;br&gt;
	
	\${ empty("") } = \${ empty("") }<br><br> 
	
	
	\${ (2 > 5) && (5 != 4) } = ${ (2 > 5) && (5 != 4) }<br> 
	\${ (2 > 5) and (5 != 4) } = ${ (2 > 5) and (5 != 4) }<br> 
	
	\${ (2 > 5) || (5 != 4) } = ${ (2 > 5) || (5 != 4) }<br> 
	\${ (2 > 5) or (5 != 4) } = ${ (2 > 5) or (5 != 4) }<br> 
	
	
	<%
		request.setAttribute("name", "홍길동"); 
		pageContext.setAttribute("name", "강감찬");
	%>
	
	<%= request.getAttribute("name") %><br> 
	\${ name } = ${ name }<br><br> 

	 
	 
	 
	요청 URI(표현식) : 
	<%= ((HttpServletRequest)pageContext.getRequest()).getRequestURI() %><br>

	
	요청 URI(EL) : ${ pageContext.request.requestURI }<br>
	
	
	
	
	
	request의 name(key)의 값(value) : ${ requestScope.name }<br>
		
	code 파라미터(스크립트) : <%= request.getParameter("code") %><br>
	code 파라미터(표현언어) : ${ param.code }<br>
	
	
	
	
</body>
</html>
