<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- 로그인을 하지않은 클라이언트와 로그인을 한 클라이언트의 체크 여부 판단
     
     로그인을 해서 성공을 했을 때, AUTH라는 키값으로 사용자의 아이디를 세션영역에 저장해주고 있었음
     이 사람이 로그인을 한 사람인지는 session객체를 통해 메모리에 접근하여 "AUTH"로 저장된 데이터를 파악하면 됨 --%>
<title>로그인 체크 여부 판단</title>
</head>
<body>

	<%
		String checkIn = (String)session.getAttribute("AUTH"); 
		//세션영역에 다양한 자료형을 저장할 수 있기 때문에 그 모든 자료형을 하나의 메소드로 처리할 수 있게끔 반환형을 상속에 기반한 다형성으로 Object로 제공
		//따라서 세션영역에 저장된 자료형에 따라 강제형변환을 하여 변수에 저장하도록 한다.
		
		if(checkIn != null) { //꺼내온 value값을 가지고, 데이터가 존재하면
			out.println("카페 홈 페이지 이동"); //클릭한 메뉴로 이동하도록 한다.
		} else { //값이 존재하지 않으면 null값이 되기 때문에 로그인페이지로 이동하면 됨
			     // => 같은 위치에 양식이 존재하기때문에 forward의 액션태그 또는 response.sendRedirect를 활용하도록 한다. 
			response.sendRedirect("sessionLoginForm.jsp");
		}
	%>

</body>
</html>