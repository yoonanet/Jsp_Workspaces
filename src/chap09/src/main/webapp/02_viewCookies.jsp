<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 목록</title>
</head>
<body>

	<h3>쿠키 목록</h3>
	<% //클라이언트의 모든 요청사항이 request객체에 저장됨
		Cookie[] cookies = request.getCookies(); //getCookies: 클라이언트의 쿠키를 꺼내오는 메소드로 반환형이 쿠키배열형임
		//브라우저에서 보내온 쿠키정보를 꺼내오는 것이다.
		
		if(cookies != null){
			for(int i=0; i < cookies.length; i++){
				//인코딩을 하여 값을 가져왔기 때문에 꺼내올 때는 디코딩을 시켜주도록 한다.(원래의 값으로 변환)
				//URLDecoder.decode(가져올 값, UTF-8로 반환해달라는 포맷(디코딩할 타입)을 알려주도록 한다.)
				out.println(cookies[i].getName() + " : " + URLDecoder.decode(cookies[i].getValue(), "UTF-8") + "<br>"); //쿠키정보를 출력
			} //결과를 보면 아까 전에 보낸 쿠키가 함께 전송되어져 오고 있음 +) JSESSIONID도 쿠키로 같이 출력
		}     //전송하면서 보내온 서버의 쿠키(한 번이라도 서버가 보냈던 서버의 쿠키)를 브라우저는 자동으로 무조건 같이 전송을 해주게 된다. 
		      //그렇게 동작이 되게끔 브라우저가 쿠키의 기능을 처리해주고 있음
		      //로그인을 할 때도 서버쪽으로 정보를 보내올 때 쿠키정보를 함께 보내주면서 서버가 구분할 수 있도록 정보를 브라우저에 담아서 처리하도록 하는 것이다.
	
	 
	%>        

</body>
</html>