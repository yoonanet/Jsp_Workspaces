<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- page 디렉티브(@가 기호임) 속성에서 errorPage, isErrorPage(false가 default임)를 살펴볼 예정 
     => 이름에 is가 붙으면 존재유무를 판단함. 주로 boolean의 값을 가지는 경우가 대부분임.
     
     errorPage: 현재 내 페이지에서 실행하는 과정에 예외가 발생이 되면 출력해주고 싶은 페이지에 대한 정보를 관리(보관)하는 속성이다.
                !!별도로 제작한 에러 페이지의 정보를 입력으로 넣어주도록 한다.!! => 에러발생 시 지정한 웹페이지로 이동하게 된다. location과 동일한 기능 제공
                주의) 이때의 에러페이지는 페이지 디렉티브의 에러페이지로 등록된 것임(속성에 등록된 페이지)!! web.xml에 등록한 것이 아니다!!
                이 페이지를 에러페이지로 동작되기 위해서는 그 페이지 내에 isErrorPage속성이 true로 설정이 되어져야 한다.
                                 
    기본객체에서 exception이라는 객체는 모든 페이지에서 사용할 수 있는 것이 아님. 
    exception객체만, page 디렉티브에서 isErrorPage의 속성 값이 true로 되어 있는 웹페이지에서만 사용할 수 있다!! 
    
    jsp에서 사용할 수 있는 기본 객체를 8 +1로 생각하도록 한다.
    
    실질적으로는 예외에 대해서 web.xml에 있는 파일도 영향을 받게 되는데 이때 실행의 우선순위가 중요하다.
    (동시에 여러 개의 영향을 받는다면 1. 가장 가까이에 지정(등록)한 것이 최우선 순위임
                                      2. web.xml에서 exception-type과 error-type을 지정할 수 있는데 
                                         이때, 500의 번호로 예외를 중복처리(동시에 겹쳐지는 예외)를 하게 된다면 우선순위로는 exception-type(예외구문처리)이 높음
                                      3. => error-type(예외번호처리)
                                      4. 아무것도 지정을 안하면 톰캣이 출력해주는 예외 페이지로 동작)
    실행에 우선순위로는 가까이에 있는(지정한) 예외파일이 실행이 된다. => 즉, 내가 지정한 에러페이지가 실행되는 것이다.
    
    내가 만든 에러페이지가 513바이트보다 작으면 톰캣에서 만든 페이지를 출력해줌.
    따라서 내가 만든 에러 페이지를 출력하고 싶다면 513바이트보다 크게 해주면 된다. --%>    

<%@ page errorPage="myErrorPage/viewErrorMsg.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파라메터 출력</title>
</head>
<body>

	<%
		String id = request.getParameter("id"); //클라이언트가 전송해온 아이디의 파라메타를 꺼내와서 저장 => 이 페이지 자체를 실행하면 현재는 null값임
	%>
	
	아이디 : <%= id.toUpperCase() %> <%-- 꺼내 데이터를 전부 대문자로 변환하여 출력 --%>

<%-- 다이렉트로 이 페이지를 호출하면 id의 값이 없고, null값이 저장되면서 
     대문자로 변환하는 과정에서 nullpointerException예외가 발생된다.
     
     nullpointerException이 발생되면 우리가 지정한 페이지가 계속 보여질 것임!!
     즉, 이전에 만든 예외페이지는 또 다른 개발자가 구현한 기능에서도 공통적으로 사용될 예외 페이지이다.
         (프로젝트 내에서 공통적으로 사용될 목적으로 만든 예외페이지임.)
     
     내가 구현한 페이지에서 예외가 발생되어졌을 때 내가 만든 웹페이지를 특별 제작해서 나만의 예외페이지를 만들어서 출력하고자 한다면 어떻게 작업을 해야할까?
     위 질문에서의 의미: 에러페이지를 나혼자만 쓰겠다. -> 내가만든 기능에서 예외가 발생이되면 내가만든 에러페이지를 출력하고 싶다는 의미 
     
     nullpointerException예외가 발생됐을 때 범용적인 페이지 화면이 아닌 나만의 에러페이지 화면을 띄워주고자 한다.
     --%>
</body>
</html>