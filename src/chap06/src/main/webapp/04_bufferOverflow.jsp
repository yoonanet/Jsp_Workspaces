<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page buffer="1kb" %> <%-- 출력버퍼의 크기를 지정: 버퍼에 1kb가 쌓이면 자동으로 브라우저에 전송 
                              -> 그 다음 출력할 내용이 버퍼에 쌓이게 됨. 이때, 에러 발생을 해볼 예정 --%>
<%@ page errorPage="myErrorPage/viewErrorMsg.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>버퍼 플러시 이후 예외 발생 결과</title>
</head>
<body>


	<%
		for(int i=0; i < 256; i++){
			out.println(i); //이때의 i값을 브라우저로 전송(브라우저로 전송할 때 정수값이 전달_정수값은 4바이트 할당 -> 256반복되면 1kb가 됨)
		}
	%>
	
	<%= 1 / 0 %> <%-- 강제로 예외를 발생 -> 지정한 예외 페이지를 브라우저상에 띄우게할 의도
	                  !!중간에 예외가 발생을 하게 되면 화면이 겹쳐져서 보여지는 상황이 발생하는 것을 결과창으로 확인할 수 있다!! --%>







<%--
[버퍼와 에러 페이지]
jsp페이지는 자바코드로 한줄 한줄 해석해가면서 출력버퍼에 보내고, 출력버퍼가 다 채워지면 브라우저 상에 출력하는 구조임
그렇게 비워진 출력버퍼에 데이터를 쌓아지게 된다. => 출력버퍼의 사이즈보다 웹사이트 사이즈가 크다고 가정해보자.
                                                    실행하는 과정에서 한 번 보내지면 중간 정도 채워질 것임
                                                    두번째로 실행되는 과정에서 에러가 발생이 된다면 그때는 내가 만든 에러 페이지를 브라우저에 보내게 될 것이다.
                                                    이미 1차로 보내진 상태에서 에러가 발생이 되면 보내진 페이지 아래에 에러 페이지를 출력해주면서 깨지는 현상이 발생하게 된다.
                                                    최악의 경우에서는 이러한 경우도 발생을 하게 될 수 있음. 어쩔 수 없는 상황인 것임

전송 중간 예외 발생 -> 웹페이지 깨짐 (이미 출력된 것을 다시 잡아서 넣을 수 없는 난감한 상황)
	                   즉, 이 실습을 통해 중간에 에러가 발생하면 화면이 깨지는 현상이 발생할 수 있다는 것을 염두해야 한다. 
	                      (궁극적으로는 예외가 발생되면 안됨. 모든 상황에서 잘 동작되도록 페이지 구상해야함)
	                      
프로젝트에서 예외페이지는 기능이 아님. 시간적 여유가 있을 때 대응페이지를 만들면 됨!
 --%>
 
</body>
</html>