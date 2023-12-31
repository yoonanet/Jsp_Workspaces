<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- 외부에 태그 라이브러리를 import할 수 있게끔 제공해주는 디렉티브였고,
                                                                      jstl을 사용할 목적으로 활용을 한 것이다. -->    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl - if tag</title>
</head>
<body>
	
	<%-- jquery에서 가장 많이 활용되어지는 기능으로 소개했었던 것이 forEach메서드임(배열, function(index, value))
	     => 이 함수는 forEach하나의 기능임에도 불구하고 배열의 데이터를 가져오면서 함수를 수행할 때 0과 꺼내온 데이터를 매개변수로 전달 
	        그렇게 함수에 정의되어져 있는 기능들을 수행을 하게 된다. 그렇게 수행이 끝나면 빠져나오는 것이 아닌 보관된 데이터만큼 반복됨
	        모든 데이터를 하나씩 꺼내오면서 사용자가 정의한 기능을 수행하도록 했음
	        즉, 함수의 이름은 하나지만 마치 이안에 for문으로 구성이 되어져서 처음부터 끝까지 모든 데이터를 꺼내오면서 
	        우리가 수행하고 싶은 기능을 이 함수안에 적용하도록 하는 활용성이 높은 메서드였음.
	    코어 태그 라이브러리에서도 forEach를 제공 -> 복수개의 데이터를 처리할 수 있다는 것을 예측할 수 있음
	    콜렉션이나 맵의 각 항목을 처리할 때 사용이 되어짐
	    반복문이 많이 활용되어지기 때문에 태그로 제공되어지는 것이다.(jsp에서 스크립트 요소를 간략하게 구성하기 위함)
	    
	    흐름제어의 태그 => if(test속성에 조건절을 넣어서 태그사이에 값을 실행할지의 여부를 따지게 된다.), 
	                       choose, forEach, forTokens
	
		 [제어와 관련된 기능으로 if태그를 먼저 살펴볼 예정] 
	     test라는 속성이 자동완성되고 있음(즉, 필수속성인 것) => 참, 거짓을 판단하는 형태로 조건절을 적어주도록 한다.
	     true일 때는 시작과 끝 사이에 있는 값을 브라우저 상에 출력해주고, false일 때는 태그의 시작과 끝 사이의 값이 출력되지 않는다.
	     
	     jstl에서는 표현언어를 다이렉트로 사용할 수 있었기 때문에 그 표현언어를 활용해서 조건절을 작성해주도록 한다.
	     param이라는 객체(클라이언트로부터 전송되어진 데이터를 가지고 있는 객체임)를 표현언어에서 사용. --%>
	     
	<c:if test="true">
		무조건 실행<br>
	</c:if>
	
	
	<c:if test="${ param.id == 'hong' }"> <%-- id의 파라미터가 hong이였는지 비교(참이면 안으로 들어오고, 거짓이면 스킵)
	                                           주소창에서 추가적으로 ?id=hong을 작성하여 정상적인 값의 출력이 이루어지는지 확인해볼 수 있음
	                                           두 개의 값을 파라미터로 전달하려면 값의 구분으로 '&'을 넣어주도록 한다. --%>
		횐영합니다, ${ param.id }님.<br>
	</c:if>
	
	
	<c:if test="${ 18 < param.age }"> <%-- 전달되어지는 파라미터중에 나이값을 18이랑 비교함. --%>
		당신의 나이는 18세 이상입니다.<br>
	</c:if>
	
	
	실행끝.

	







</body>
</html>