<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파라메터 출력</title>
</head>
<body>
	
	<%
		String id = request.getParameter("id"); //시작주소값을 담고있는 request객체의 해당메모리에 접근하여 getParameter메소드를 호출하도록 한다. => 사용자 입력 데이터를 반환
		String pw = request.getParameter("pw");
		
		System.out.println("id:" + id); //콘솔창에 아이디값 출력
		//원래는 값을 넣지 않으면 parameter의 결과창에 null값을 반환해줘야 함. 하지만 지금은 id하고 아무 문자열도 출력이 안되고 있음 (이미 대응이 된 것)
		System.out.println("pw:" + pw); //값을 넣지 않으면 parameter의 결과값이 null로 찍힘
	%>
	
	아이디 : <%= id.toUpperCase() %> <%-- Upper의 단어가 들어간 메소드들은 안에 담겨져있는 데이터에 영문이 있으면 그 영문의 데이터를 다 대문자로 변환함.
	                                      toUpperCase(): 현재 아이디의 담긴 값을 전부 대문자로 변환하여 브라우저쪽에 전송해줌 --%>
	                                      
	비밀번호 : <%= pw.toUpperCase() %> <%-- 가리키는 인스턴스가 없기 때문에 메소드가 없는 것임. 이때 발생시키는 예외가 null값인 것이다. (NullPointerException예외)
	                                        이러한 경우도 자바에 의해서 NullPointerException예외가 감지되어지면서 자바가 그 예외를 발생시켜주게 됨 -> 그렇게 톰캣이 예외 화면 페이지를 브라우저에 보내주게 된다.
	                                        동작 구문상(구문에 의해 발생되어지는 예외)에 문제 발생을 처리하고자 함 
	                                        => 즉, 자바 문법 구문에서 발생되는 예외에 대한 페이지 구상을 해주고자 한다. 
	                                          (***예외가 발생되어졌을 때 우리가 만든 페이지로 예외에 대한 사항을 처리한 것임)
	                                        500은 자바 문법에서의 어떤 예외가 발생이되어지든 이 번호로 알려주게 됨. 
	                                        (자바 문법적 예외 발생 시에 공통적인 에러번호를 사용함, 자바에서의 예외가 어떤 예외인지를 알 수 없음)
	                                        이때, web.xml파일에서(예외번호로 처리할 때랑 부모태그는 동일함) exception-type을 통해 등록을 하는데 패키지명과 예외에 대한 자료형을 적어줘야함.
	                                             등록한 예외가 발생이 되면 location에 지정한 페이지로 이동을 하게 된다. --%>
	
</body>
</html>