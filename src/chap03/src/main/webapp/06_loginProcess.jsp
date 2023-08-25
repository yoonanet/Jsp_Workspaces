<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%> <%-- [request의 추가적인 설명을 해주심]
                                request.getContentType(): 여기에서 contentType을 출력해주는 메소드
                                       .getProtocol(): http의 정보를 의미한다.
                                       .getContentLength(): 클라이언트가 전송한 요청정보의 길이를 반환해주는 메소드(활용도가 높지는 않음)
                                       
                                       .getParameterNames(): 지금 페이지에서 어떤 name을 전송해왔는지에 대한 정보를 알려주는 메소드 --%>
                                       
<!-- 요즘에는 한글 아이디도 지원을 해주고 있음.
	  대부분의 웹페이지들은 텍스트인코딩을 UTF-8로 지원을 해주면서 한글을 입력해줘도 깨지지 않고 있음
	  하지만 익스플로러 8이하 버전(하위버전)들은 ISO-8859-1 서유럽어를 기본 디폴트로 사용을 하고 있기 때문에 그럴 경우 한글은 전부 깨짐.
	  하위 버전에서도 한글이 깨지지않게끔 처리를 해주고 싶다면
	  setCharacterEncoding활용하여 인코딩방식을 변경해주면 된다. -> set의 이름이 들어가면 변경의 의미이다.
	  ***이렇게 데이터를 꺼내오기 전에 포맷을 셋팅을 해놓으면 한글을 꺼내오기 전에 UTF-8로 꺼내오게 된다. (하위버전간의 호환성)  -->
<% request.setCharacterEncoding("UTF-8"); %> 
<!-- Get방식은 url에 함께 담겨져가면 인코딩 방식 그대로 전송이 되어져 가면서 톰캣이 디코딩하여 꺼내오기 때문에 괜찮음. 
     즉, 네트워크에 약속된 방식으로 꺼내와서 상관 없음.
     하지만 post방식은 body영역에 숨겨서 가져오기 때문에 네트워크를 통해 인코딩, 디코딩되어지지 않기 때문에 꺼내올 때 셋팅을 달리해줘야 한다. 
     < %
	request.setCharacterEncoding(“utf-8");
	String name = request.getParameter("name");
	% >  
	
	
	값이 전송되어져 올 때 헤더와 바디로 이루어져서 전송이 됨.
	따라서 헤더에 관련된 메소드들이 있다. ppt25 (활용성이 높지는 않음) -->
    
<%-- 3가지의 스크립트 요소는 어느 위치에 생성하든 상관 없음. --%>

<%
	String id = request.getParameter("id"); //id라는 이름으로 전달받은 파라메타의 값을 요청 -> 값을 잠깐 보관하게끔 변수를 선언
	String pw = request.getParameter("pw");
	//가입자인지를 쿼리문을 이용하여 select를 통해 데이터베이스에서 id, pw 데이터를 먼저 검색 (jdbc로 요청하는 것) 
	//-> id가 존재한다면 패스워드에 일치여부를 보고 로그인에 대한 화면을 최종적으로 보여주면 됨.
	String msg = "";
	
	if(id.equals(pw)) { //아이디와 패스워드와의 내용이 일치한지를 봄
		msg = "로그인 성공^^";
	}else {
		msg = "로그인 실패ㅠ" + id + ", " + pw; //디버깅과정에서 검증하기 위한 코드임
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리 화면</title>
</head>
<body>
<!-- !!로그인에 대한 처리를 수행할 웹페이지!!-> 로그인 버튼을 눌렀을 때 다음으로 보여줄 페이지
     post방식도 데이터를 꺼내오는 방법은 동일하다. -->
     
     처리 결과 : <%= msg %>

</body>
</html>