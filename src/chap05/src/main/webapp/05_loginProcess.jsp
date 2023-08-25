<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- 톰캣 10버전에서는 인코딩이 UTF-8로 디폴트가 변경됨. 그래서 한글이 깨지지 않지만 9버전이하에 톰캣은 서유럽어(한글 다 깨짐)가 기존 디폴트였음 
     따라서 데이터를 꺼내오기 전에 어떤 포맷으로 데이터를 꺼내와달라는 셋팅을 해주도록 한다. (setCharacterEncoding에 입력으로 넣어줄 때는 대소문자를 구별하지 않음)
     ***톰캣 9버전에는 아래와 같은 셋팅을 안하면 한글이 다 깨짐!!!
     
     클라이언트로부터 요청받은 정보를 톰캣이 request객체 안에 잘 보관  --%>
<% request.setCharacterEncoding("UTF-8"); %> 

<%		
	//request.setAttribute("id", request.getParameter("id")); //value의 값을 한번만 사용할 수 있는 이 코드는 흔적만 남기도록 한다. (코드가 훨씬 간단)
	//request.setAttribute("pw", request.getParameter("pw"));
	
	String id = request.getParameter("id"); //map의 형식으로써 키값을 통해 사용자가 입력한 value값을 요청하도록 한다.
	String pw = request.getParameter("pw");
	String msg = "";
	
	//사용자로부터 전송되어져 온 값들을 jsp의 request영역 메모리에 보관을 하려면? request객체를 통해서 메모리 영역에 접근할 수 있음	
	//request.setAttribute("id", id); //jsp메모리 영역은 map의 형태(key, value)로 데이터가 관리되어진다.
	//request.setAttribute("pw", pw); //value를 변수값으로 전달하도록 한다. 
	//위 코드는 효용성이 떨어지는 코드이지만 개념을 이해하는데에 초점을 맞추기.
	//request객체에 값을 메모리영역에 담아준 처리.
	
	//session메모리 영역도 동일 이름의 객체를 통해서 접근할 수 있음
	//또한, 메모리의 영역에 접근할 수 있는 메소드의 이름은 모든 객체들이 동일하다.
	//session.setAttribute("id", id);
	//session.setAttribute("pw", pw);
	
	//application영역에 데이터를 저장!!
	application.setAttribute("id", id);
	application.setAttribute("pw", pw);
	
	if(id.equals(pw)) {
		msg = "로그인 성공^^";
	}else{
		msg = "로그인 실패ㅠ";
	}
%>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리 화면</title>
</head>
<body>
	
<%-- [jsp 주석 처리]		
	처리 결과 : <%= msg + ", 아이디: "+id+", 비밀번호: "+pw %> 
--%> <!-- html의 주석으로 처리하게 된다면 톰캣이 이해하는 언어로써 인식이 되지 않음. -> 따라서 톰캣이 이해하는 언어만 주석으로 처리되지 않음 -->

	처리 결과 : 
<%-- 	<%= msg + ", 아이디: "+request.getAttribute("id")+", 비밀번호: "+request.getAttribute("pw") %> --%>
	<!-- getAttribute메서드에 입력으로 key값을 전달해주면 value값을 반환해주게 된다.
	     => request객체에 의해서 set하여 request에 저장을 해둔 메모리영역에서 데이터를 꺼내오기 위한 요청의 메소드인 것이다. -->
	     
<%-- 	<%= msg + ", 아이디: "+session.getAttribute("id")+", 비밀번호: "+session.getAttribute("pw") %> --%>

	<%= msg + ", 아이디: "+application.getAttribute("id")+", 비밀번호: "+application.getAttribute("pw") %>
	
<!-- 지역변수를 선언하여 사용을 한다 해도 문제가 되지 않는데 왜 영역을 지정해놓는지에 대한 의문이 들 수 있음
     jsp만 두고 봤을 때는 메모리에 대한 접근의 필요성을 느끼지 못한다.
     
     웹표준에서 화려한 화면을 구성하고, 동적인 효과를 부여하기 위해서는 어마어마한 코드를 작성하게 된다. +) 자바코드의 양도 많음
     html과 자바코드를 같이 작성하다보면 코드가 길어져서 코드 분석이 어려워짐.
     그래서 요즘은 웹코드와 자바코드를 분리하여 작성하도록 함. (자바코드는 서블릿으로 작업하고, 화면은 웹코드로 작성)
     => 이 부분에서 영역이라는 개념이 상당히 중요하다.
     
 -->		
</body>
</html>