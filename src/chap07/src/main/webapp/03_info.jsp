<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Info</title>
</head>
<body>
	
	<%-- width="100%" => 전체폭으로 크기를 잡음 --%>
	<table border="1" width="100%" cellpadding="0" cellspacing="0">
		<tr>
			<th>제품번호</th><td>XXXX</td>
		</tr>
		<tr>
			<th>가격</th><td>10,000원</td>
		</tr>	
	</table>
	
	<%-- jsp:include액션태그는 특정 페이지에 아주 쉽고 빠르게 이동해갈 수 있도록 제공해주는 기능이였음
	     지금 현재 나의 페이지에서 가지고 있는 데이터를 같이 전달을 해주고 싶다고 할 때(이동한 페이지에서 데이터를 활용할 목적) 자식태그로 jsp:param의 액션태그를 활용하면 된다.
	     include액션태그를 활용하여 이동해가면서 같이 데이터를 전달해주고 싶다고 할 때 사용할 수 있는 자식태그인 것이다.
	     
	     request객체를 활용해서 name속성의 값을 전달하여 그 데이터에 대한 처리를 할 수 있음 --%>
	<jsp:include page="03_infoSub.jsp">
		<jsp:param name="type" value="B"/> <%-- 같은 name이름일 때 값으로 구별을 해주고자 할 때 활용하는 것이 value라는 속성이였음
		                                        if문을 통해 value값을 구별하여 값을 출력하도록 함. --%>
	</jsp:include>
	
	<h3>수행 끝.</h3>
	
</body>
</html>