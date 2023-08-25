<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.Enumeration" %> <%-- 이 참조자료형의 이름으로 다이렉트 사용하기 위해 import함. --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- request객체에서 헤더 정보에 관련된 메서드들이 어떤 것을 제공되어지고, 어떤 내용이 결과적으로 출력되는지에 대한 확인 --%>
<title>헤더 목록 출력</title> 
</head>
<body>
	
	<% 
		Enumeration headerEnum = request.getHeaderNames(); //getHeaderNames(): 전체 헤더의 내용을 가지고 반환해주는 기능 (반환형은 자료형으로 반환됨)
		//request에 담겨진 헤더의 이름들을 headerEnum에 담아준 것이다.
		
		while(headerEnum.hasMoreElements()){ //hasMoreElements(): 읽혀져 온 데이터의 존재유무를 체크하는 메소드 (유무에 따라 반환형이 boolean값임)
			String headerName = (String)headerEnum.nextElement(); //nextElement(): true를 반환한 데이터를 읽어오는 메소드 (반환형이 Object이기 때문에 강제적으로 저장할 자료형으로 형변환)
			String headerValue = request.getHeader(headerName); //헤더값을 구함. %>
			<%= headerName %> : <%= headerValue %><br> <%-- 값을 출력해야하는데 중복해서 사용할 수 없기 때문에 끊어주도록 한다.
			                                                브라우저에 관련하여 헤더에 어떤 내용들을 제공을 해주고 있고, 어떤 값들이 저장되어져 있는지 확인하고자 하는 코드임 --%>
	<%		
		}
	%>
	
	
</body>
</html>