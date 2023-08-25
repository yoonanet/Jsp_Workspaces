<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
</head>
<body>
<%-- 클라이언트의 로그인한 여부를 서버가 확인하기 위해서 쿠키를 많이 활용된다.
     쿠키를 이용해서 어떻게 로그인을 체크할 수 있는지를 살펴볼 예정 --%>
	
	<%-- <form action="../loginprocess/09_loginProcess.jsp" method="post">  로그인에 대한 처리의 전송방식은 숨겨서 서버에 전송되게끔 처리하도록 한다.(꼭 생각해두기!) --%>
	<form action="<%= request.getContextPath() %>/loginprocess/09_loginProcess.jsp" method="post"> 
	                  <!-- webapp폴더부터 시작 -->
		아 이 디 : <input type="text" name="id" size="20"><br>
		비밀번호 : <input type="password" name="pw" size="20"><br>
		
		<input type="submit" value="로그인">	
	</form>
	<!-- 주의) 요청하는 파일과 요청되는 파일이 같은 위치에 있음 => 파일이름만으로 등록 가능(디폴트는 같은 위치에서 파일을 찾음) 
	           만약 서로 다른 위치에 있을 때는 현재 내 파일의 위치에서 요청파일의 위치의 path를 제대로 지정을 해줘야 한다.(상대경로임)
	           내 위치부터 잘 따져가야함 이러다보니 폴더가 양이 많아지다보면 경로를 맞추는게 오류를 많이 만들게 됨.
	           -> 절대경로(현재 내 프로젝트 이름부터 지정하여 들어가게끔 정의해주는 것임)를 지정하는 것을 이때는 선호하게 되었음.
	              절대경로로 지정을 하면 css와 자바스크립트에서도 경로가 꼬이지 않음
	              그렇다면 프로젝트이름을 어떻게 지정할 수 있을까? ***request.getContextPath()(_프로젝트의 이름을 반환하는 메서드임)으로 지정해주도록 한다.
	                                                               프로젝트의 이름을 바꾸더라도 최종 프로젝트 이름을 반환해올 것이다.
	              ***request객체의 메서드를 활용해서 절대 경로의 개념으로 경로를 지정해주는 것이다.
	              request.getContextPath()_절대경로는 스프링에서 막강한 힘을 발휘함, 스프링은 jsp에 비해서 파일의 경로의 지정이 복잡하기 때문  -->

</body>
</html>