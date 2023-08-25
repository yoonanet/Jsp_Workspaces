<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>폼양식</title>
</head>
<body>
	
	<form action="02_readParameter.jsp">
		아이디 : <input type="text" name="id">
		<input type="submit" value="전송">  <%-- submit을 생성을 해줘야 입력양식태그에 사용자가 작성한 내용을 서버쪽으로 전달이 가능해짐
		                                         submit이 눌려졌을 때 다음 화면에 대한 정보를 form태그 안에 action에 셋팅해주도록 해야한다.(응답으로 이 페이지를 나한테 서비스 해줘라는 의미) --%>
	</form>
	
</body>
</html>