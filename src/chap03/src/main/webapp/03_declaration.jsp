<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- Script 구성 요소 : declaration(함수를 정의해서 사용할 수 있다)
                        클래스라는 선언 없이 메소드를 정의할 수 있음 -> 클래스 안에 선언되어지지 않은 메소드를 함수라고 불러줌!!
                        스크립트릿 기호에서 !(느낌표)의 기호를 추가적으로 적어주면서 그 안에 함수를 정의해주도록 한다. --%>
<%!  
	public int multiply(int a, int b){
		int result = a * b;
		return result;
	}
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크립트 - 선언부</title> 
<!-- 자바에서 제공을 해주고 있는 메소드인데 클래스 안에 선언되어지지 않은 
	 메소드이기 때문에 함수라고 부를 수 있지만 용어가 애매하다. (메서드형태로 함수를 선언할 수 있는 방법으로 용어애매)
     따라서, 선언부라는 모호한 표현으로 제공을 해주고 있는 것이다!! -->
</head>
<body>
	
	233 * 25 = <%= multiply(233, 25) %> <!-- 톰캣(서버 중에)에게 계산을 해달라고 맡김 -> 계산된 내용을 지정한 자리에 출력하도록 한다. (곱셈 기능을 선언부로 정의)
	                                         결과: 전달받은 데이터를 그대로 브라우저가 출력해주는 것을 확인할 수 있다. -->
	                                         


</body>
</html>