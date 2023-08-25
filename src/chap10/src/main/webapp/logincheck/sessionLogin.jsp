<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- 사용자가 보내온 아이디와 패스워드(로그인 관련 정보)를 꺼내서 처리를 할 용도의 페이지 --%>
<%
	request.setCharacterEncoding("UTF-8"); 
	//post방식은 몸체에 담아서 정보를 전송하기 때문에 별도로 인코딩이 되어지지 않음 
	//그렇기 때문에 이 정보를 받은 톰캣이 한글로 해석되도록 포맷정보를 알려주는 것임
%>

<%
	String id = request.getParameter("id"); //데이터를 꺼내오도록 함.
	String pw = request.getParameter("pw");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리</title>
</head>
<body>
	
	<% 
		if(id.equals(pw)){
			//다음 요청을 하게 될 때 로그인을 한 사람이라는 것을 서버가 확인할 수 있어야함. -> 이때 세션에 저장하도록 함
			session.setAttribute("AUTH", id); //세션객체를 이용해서 해당 영역에 접근하도록 함. 
			                                  //=> 로그인을 한 사람의 정보를 AUTH라는 키워드를 이용해서 아이디 정보로 value값을 담아주도록 함.
			out.println("로그인 성공"); //아이디와 패스워드가 일치하면 로그인 성공의 메시지를 출력하도록 함.
			
	%>		
			<%-- 로그인에 성공했을 때 사용자에 액션으로 로그아웃을 실시간적으로 수행할 수 있게끔 기본적인 UI의 구성이 이루어져야 한다. 
			                                           (로그아웃 -> 세션의 정보를 날려줘야함) --%>
			<form action="<%= request.getContextPath() %>/logincheck/sessionLogout.jsp"> 
				<input type="submit" value="로그아웃">
			</form>
	
	<%		
		}else{ 
	%>
	
		<script>
			alert("로그인 실패");
			history.go(-1);  //이전 페이지로 이동하도록 코드를 구성함. (웹사이트의 뒤로가기 버튼 효과)
			//브라우저 상에 이전페이지와 다음페이지를 관리하는 객체가 history객체였음
		</script>
		
	<%
		}
	%>
	
	
	
</body>
</html>