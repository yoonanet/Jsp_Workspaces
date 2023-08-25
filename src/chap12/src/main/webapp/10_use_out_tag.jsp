<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %> <%-- java.io의 패키지에서 제공해주는 모든 참조 자료형을 사용하도록 import를 넣어줌 => 컴파일이 되어지면 사이즈가 너무 커지는 단점 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%-- jstl에서 tl이 taglib의 줄임말이였음.
                                                                      prefix: 접두어를 c로 사용한다는 의미 / uri: 자바개발회사에서 core에 대한 표준을 정의해주고 있는 웹페이지 url주소 명시 --%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl - out 태그</title> 
</head>
<body>
<%-- 서버에서 클라이언트에게 응답을 보내고자 할 때 연결 통로를 구성해주고 있는 객체가 out기본객체였음 
     이에 대한 역할의 수행을 해주는 액션이 out태그로 제공을 해주고 있는 것이다. 
     
     문자열과 관련하여 파일단위로 처리할 수 있게끔 제공해주고 있었던 참조자료형으로 FileReader, FileWriter라는 자료형들을 제공해주고 있었음
     웹표준이 인식하는 단어는 텍스트임. 태그 형태 형식으로 브라우저가 전달을 받으면 해석해서 동작되어지도록 했었음
     
     getRealPath메소드에서 default상태에서는 이클립스가 관리하는 프로젝트의 path경로를 메소드가 반환해주고 있었음.
     이때 톰캣에서 서버옵션에서 첫번째를 지문에서 체크했고, 우리가 관리하는 src의 프로젝트를 절대경로로 반환할 수 있게 됨
     입력으로 추가해주면 그 절대경로에서 추가적으로 작성이 되어 반환되어졌었다. --%>
	
	<%
		FileReader reader = null;
		
		try {
			String path = request.getParameter("path"); //path가 아직 존재하지 않음. 1차적으로 프로그램 돌렸을 때 nullexception예외가 발생함.
			reader = new FileReader(application.getRealPath(path)); //파일을 대상으로 reader => application의 getRealPath메소드를 호출
			// 자바였으면 reader = new FileReader(application.getRealPath(path));이렇게 작성하면 에러가 났었음 => try, catch로 감싸라는 에러.
	        //  jstl은 스크립트요소와 같이 사용할 수 없기 때문에 끊어주면서 작성을 해주도록 한다. => out태그를 사용할 계획임
%>	
<pre> <%-- <pre>태그는 작성된 형식 그대로 브라우저 상에 출력해주는 태그임(태그를 태그로 인식) / <xmp>태그도 <pre>의 기능과 동일하다. 하지만 태그조차도 문자열로 인식하게끔 처리가 됐었다.
           실습은 다이렉트로 path를 넣어주도록 함!! => 주소 끝에 ?path=02_use_if_tag.jsp로 넣음. --%>
* 소스 코드 = <%= path %> 
* 소스 코드 = <%= application.getRealPath(path) %> <%-- 경로를 확인하면 C:\workspaces\jsp\src\chap12\src\main\webapp\02_use_if_tag.jsp로 출력됨 --%>

<c:out value="<%= reader %>" escapeXml="false" /> <%-- reader에 담긴 값을 out태그로 처리 => 지금 현재의 jsp파일의 텍스트 코드를 전부 보여주게 되는 것임.
                                     소스파일에 다운로드를 눌렀을 때 txt로 파일 안에 내용을 보여주고 있는 것이 out태그를 활용하고 있는 것이다.
                                     
                                     escapeXml의 디폴트는 true임. escape는 탈출하겠다는 의미를 담고 있음 
                                     true는 표시의 기호를 그대로 표시를 하게끔 소스코드가 전송이 되어지고, false일 때는 디폴트로 태그가 인식이 되어지게끔 동작을 시키는 속성인 것이다.
                                     => 전송의 텍스트형태를 변환할지 변환하지 않을지의 차이를 두는 것이다.
                                     false로 설정해놓고 브라우저 상에 출력되어지는 것을 보면 태그 형태는 보여지지 않고 있음  --%>
</pre>			
<%			
		}catch(IOException e){ //IO에 관련되어 발생할 수 있는 모든 예외들을 한번에 처리하도록 한다.
			out.println(e.getMessage());
		}finally{ //예외가 발생하던 발생하지 않던 무조건 한번은 실행함.
			if(reader != null) { //들어온 값이 없어서 예외가 발생하게 되더라도 finally가 실행됨
				try {
				reader.close(); //close도 실행하는 과정에서 예외가 발생할 수 있기 때문에 예외에 대한 처리를 해줘야 한다.
				}catch(IOException e){ //최상위 예외처리로 동일하게 예외를 처리하도록 한다.
					out.println("reader.close() 실패.");
				}
			}
		
		}
		
	%>

</body>
</html>