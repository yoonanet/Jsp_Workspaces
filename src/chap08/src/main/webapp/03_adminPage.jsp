<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="member.Member" %>
      
<%-- request영역에 데이터를 저장을 해놓았기 때문에 이동한 페이지에도 데이터가 유효하다. --%>    
<%-- <%
	Member info = (Member)request.getAttribute("member"); //반환형이 Object로 모든 자료형에 있어서 호환성있게 동작되도록함
	
%> --%>

<jsp:useBean id="member" class="member.Member" scope="request" /> 
<%-- 새로 만들어주는 것이 아니라 이미 만들어놓은 영역을 다시 읽어오는 개념임
     보내고 나면 데이터가 없어지기 때문에 따로 만들어주지만 전달해온 것을 잠시 담은 것이기 때문에 그대로 데이터가 남아있을 것임
     따라서 이미 있는 영역을 읽어오게 되는 것이다. --%>
     
	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>

<%-- 	
	아이디: <%= info.getId() %><br>
	비밀번호: <%= info.getPassword() %><br>
	이름: <%= info.getName() %><br>
	주소: <%= info.getAddress() %><br>
	이메일: <%= info.getEmail() %><br> 
--%>
	 
	<%-- 자바빈에 담긴 데이터를 읽어올 수 있는 jsp:getProperty액션태그도 제공을 해준다.
	     getter메서드를 호출해주는 것임 get뒤에 오는 프로퍼티이름을 찾아서 호출해주는 것이다.
	     -> 프로퍼티로 전달된 값에 첫글자를 대문자로 변환해서 찾아줌
	     
	     자바빈은 가장 기본적인 코드이기 때문에 useBean을 통해서 가독성있는 코드를 작성할 수 있다. --%>
	아이디: <jsp:getProperty name="member" property="id" /><br>
	비밀번호: <jsp:getProperty name="member" property="password" /><br>
	이름: <jsp:getProperty name="member" property="name" /><br>
	주소: <jsp:getProperty name="member" property="address" /><br>
	이메일: <jsp:getProperty name="member" property="email" /><br>
	
</body>
</html>