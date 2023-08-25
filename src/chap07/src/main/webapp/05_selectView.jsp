<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 이 페이지에서는 클라이언트가 어떤 카페에 접근하고 싶어하는지를 파싱(검색)해서
     검색된 결과로 해서 한페이지를 응답으로 보내주고 싶은 것이다. (사용자가 선택한 값에 따라서 어떤 페이지로 이동할지에 대한 기능이 구현되어 있는 페이지인 것이다.)
     실질적으로는 이 페이지는 응답페이지가 아닌 것이다. --%>

<%
	String code = request.getParameter("code");
	String forwardPage = ""; //문자열 데이터로 초기화

	if(code.equals("A")) {
		forwardPage = "/viewModule/Cafe_A_Page.jsp"; //이동해가야할 페이지에 대한 정보(위치와 파일에 대한 정보)를 변수에 저장한다.
	} else if(code.equals("B")) {
		forwardPage = "/viewModule/Cafe_B_Page.jsp";
	} else if(code.equals("C")) {
		forwardPage = "/viewModule/Cafe_C_Page.jsp";
	} else {
		forwardPage = null; //없는 요청으로 null을 담아주도록 한다.
	}
%>

<%-- 실질적으로는 변수에 담아둔 페이지로 이동을 하도록 기능을 넣어줘야 한다.
     => forward액션태그를 활용하도록 한다.
        이때 이동해가야할 페이지에 대한 정보가 담긴 변수를 표현식에 담아주도록 한다.
        
        그렇게 되면 forward의 역할은 페이지에 지정되어져 있는 경로로 이동을 하게 된다.
        결과적으로 사용자가 지정한 값에 따른 정보를 준 페이지로 이동이 된다는 것을 확인할 수 있다.
        
        상단에 요청정보를 보면 서버 내부에서 이동한 것이기 때문에 URL에 변화가 없음
        즉, 서버 내부에서 일어나는 일이기 때문에 클라이언트 입장에서는 요청을 했을 뿐이지 
        서버에서 웹페이지를 이동해갔다고 변화가 일어나는 것을 감지할 수 없음 --%>
<jsp:forward page="<%= forwardPage %>" />
