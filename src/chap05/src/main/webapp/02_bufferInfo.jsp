<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%> <%-- !!자바반환코드를 보면 contentType를 응답의 정보로 보내주고 있음!! --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>버퍼정보</title>
</head>
<body>

	버퍼 크기 : <%= out.getBufferSize() %><br>
	남은 크기 : <%= out.getRemaining() %><br>
	auto flush : <%= out.isAutoFlush() %><br> <!-- 버퍼의 내용을 보내주고 난 이후라서 true값이 반환되어지고 있는 것이다. -->

<%-- out(출력에 대한 내용들을 제어해주는 객체)이라는 객체는 출력버퍼와 긴밀하게 연관이 되어져 있다.
	                 그 출력버퍼에 대한 관련 기능들을 제공을 해주고 있음!!
	                 getBufferSize()_버퍼크기, 
	                 clear(), clearBuffer()는 내용을 비우는 것이 동일하지만 
	                 차이는 clear버퍼는 지우려고 했는데 이미 보내진 상태라서 지울 내용이 없다면 IOException을 발생시킨다.
	                        clearBuffer는 예외를 발생시키지 않는다.
	                 flush()는 버퍼가 다 채워지지 않아도 브라우저로 전송
	                 isAutoFlush():버퍼가 다 차면 자동으로 true를 보내주는데 언제 플러시를 했는지 알고 싶을 때 사용하는 메서드이다.
	                               주기적으로 이 메서드를 사용해서 플러시가 됐는지 확인하는 용도이다.

***버퍼가 하나의 페이지를 다 읽어들였다고 할 때, 버퍼가 다 차지 않았더라도 보내주지 않으면 클라이언트는 백지화면을 보게될 것이다.
   한페이지를 전부 다 읽어갔다고 할 때, 그 읽어간 페이지는 브라우저쪽으로 전송을 해주게 되는 것이다.
   
   
[기본 객체 중에 pageContext]
=> 메소드에서 기본객체를 반환해주는 기능을 제공하고 있음 (get다음에 객체이름을 적어주면서 직관적으로 객체를 반환받아올 수 있음)
   getServletContext(): application객체를 반환해줌 (이름이 직관적이지 않기 때문에 유의하기)
   
   pageContext의 제공되는 기능들을 봤을 때 기본객체들은 다이렉트로 사용할 수 있는데 기본객체를 불러오는 메소드를 사용할 일이 있을지 의문이 생길 수 있음
   => jsp의 페이지 내에서는 pageContext를 사용할 일이 없음, 하지만 중요함.
   
   pageContext 객체가 기본 객체들을 반환해주는 기능을 제공해주고 있었다는 것을 기억해두고 있기!!
   
   자바코드로 변환을 하는 코드를 보면 pageContext를 통해서 기본객체들을 반환받아올 수 있도록 제공을 하고 있기 때문에 다이렉트로 기본객체를 사용할 수 있는 것이다.
                                      매개변수를 봤을 때는 request와 response를 입력으로 전달받게 때문에 메소드를 통해서 
                                      이 객체를 꺼내오게끔 자동으로 톰캣이 코드를 작성해주고 있는 것이다.
                                      
 [session은 쿠키와 연관하여 별도로 배울 예정.]  --%>
</body>
</html>