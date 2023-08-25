<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String resourcePath = "/images/abcd.jpg"; //임의의 파일경로를 변수에 담아줌.
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application 기본 객체</title>
</head>
<body>
	<%-- application객체에서 제공해주는 메소드 중에 꼭 기억하고, 관찰해야 할 메소드 => getRealPath()메소드
	     getRealPath메소드의 입력으로 경로를 넣어주게 되면 결과 화면에서 jsp를 자바로 변환했을 때 자바파일이 생성된 위치 뒤에 지정한 패스를 넣어주면서 알려주고 있음
	     
	     getRealPath메소드는 절대 경로(default를 보면 서버(톰캣)이 관리하는 프로젝트의 절대 경로를 알려주고 있음)를 알려주는 기능이다.
	                         우리는 이클립스의 절대경로를 사용할 것이 아니라 우리가 사용할 디렉토리 위치 구조가 실질적으로 사용되는 프로젝트 위치가 된다.
	                         => 즉, 우리의 프로젝트위치를 default위치로 잡아야 한다. 
	                            그래야 나중에 파일 업로드를 할 때 클라이언트가 보내온 파일을 내 서버 컴퓨터의 정확한 위치에 저장할 수 있게끔 처리할 수 있음
	                         
	                         톰캣 설정에서 서버옵션에 첫번째(Serve modules without publishing)를 체크하게 되면 우리가 작업하고 있는 위치로 절대 경로가 인식을 하게 됨 --%>
	<%= application.getRealPath(resourcePath) %>
	
</body>
</html>