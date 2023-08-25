<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 체크 여부 판단</title>
</head>
<body>
	<!-- 로그인을 한 것에 대한 판단은 클라이언트만 할 수 있지 서버가 판단할 수 없음
	     그래서 서버가 확인할 수 있도록 쿠키를 만든 것임. 09_loginProcess.jsp가 실행이 되면 응답으로 쿠키가 전송이 되어졌을 것이다.
	     
	     쿠키정보를 통해서 로그인의 체크여부를 판단하는 것이다. -->
	
	<%
		Cookie[] cookies = request.getCookies();
		boolean isCheck = false;
		
		if(cookies != null) {
			for(int i = 0; i < cookies.length; i++) {
				if(cookies[i].getName().equals("AUTH")){ //쿠키정보를 가져온 사람이므로 로그인한 사람으로 생각
					isCheck = true;
					break;
				}
			}
		}
		
		if(isCheck){
			out.println("카페 홈 페이지 이동"); //forward액션태그를 통해서 이동하도록 한다.
		}else{ //로그인한 사람이 아니라면 로그인창으로 이동하도록 함.
			response.sendRedirect("../logincheck/08_loginForm.jsp"); //sendRedirect(브라우저에 다시한번 더 요청)는 여기에서 사용을 하는 용도는 아님. 하지만 간단하게 처리하기 위해 이 코드를 넣은 것임
			                                                         //여기에서는 forward액션태그를 사용하는 것이 맞음.
			                                                         //sendRedirect는 현재의 페이지에서 찾기 때문에 path지정을 제대로 지정하도록 한다.
		}
	%>
	
</body>
</html>