<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>    
    
<%-- post로 지정하면 호출되는 페이지에서 꺼내오는 방법(setCharacterEncoding)을 꼭 지정하도록 하자 --%>
<%
	request.setCharacterEncoding("UTF-8");
%>    

<% //모델1기반의 구조는 실무에서 볼 일이 없음. 그렇기 때문에 다음에 배울 모델2기반의 구조를 이해하는 것에 포커스 두자.
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리</title>
</head>
<body>
	
	<%	//[***실습에서 가장 중요한 페이지***]
		if(id.equals(pw)){
		//로그인에 성공했을 때, 메시지를 보낸 다음부터 클라이언트가 앞으로 요청을 해오면 서버입장에서는 로그인을 한 사람이라는 것을 판단할 수 있어야 함
		//즉, 쿠키에 정보를 담아서 공유를 해주도록 한다.
			Cookie cookie = new Cookie("AUTH", URLEncoder.encode(id, "UTF-8")); //id의 값을 쿠키로 처리
			//실질적으로 쿠키를 이용하는 사이트들은 id정보를 암호화처리하여 클라이언트에게 보내게 된다. 
			//설사 그 정보를 내 컴퓨터에 저장이 되어졌다고 하더라도 누가 꺼내갔을 때 정보를 알 수 없도록 암호화를 하는 것임
			
			//로그인에 대한 정보를 어떤 패스에 대한 요청이 오든 정보가 공유가 되도록 함.
			cookie.setPath("/");
			response.addCookie(cookie); //지금 생성한 쿠키정보를 응답이 오면 헤더에 담아서 같이 전송
			//out.println("로그인 성공<br><br>");
	%>	
		
		<form action="<%= request.getContextPath() %>/logincheck/10_logout.jsp">
			<a href="<%= request.getContextPath() %>/loginprocess/11_loginCheck.jsp"><%= id + "님이 가입한 카페로 이동." %></a><br>
			<input type="submit" value="로그아웃">
		</form>	
		
	<%		
		}else { //아이디와 비밀번호가 맞지 않으면 로그인화면을 응답으로 다시 보내주면서 다시 입력하도록 유도한다. 
		        //뒤로가기 해주면 됨, 브라우저를 관리하는 것은? 자바스크립트의 window객체임
		        //window의 객체를 상속받아서 body영역을 관리하는 것이 document객체였음
		        //브라우저의 뒤로가기의 동작을 관리하는 객체는 history객체임 -> 자바스크립트에서는 이름만 명시하고 따로 살펴보지 않았음
	%>
	
		<script type="text/javascript">
			alert("로그인 실패");
			history.go(-1); //-로 숫자를 지정해주게 되면 이전페이지로 이동을 하게 된다.
		</script>				

	<%
		}
	%>

</body>
</html>