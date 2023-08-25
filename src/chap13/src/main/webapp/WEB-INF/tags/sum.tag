<%@ tag language="java"  body-content="scriptless"
	pageEncoding="UTF-8"%>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ attribute name="begin" required="true" type="java.lang.Integer" %> <%-- String이 아닌 자료형들은 래퍼클래스로 지정하도록 하자. (boolean같은 경우 별도로 지정하지 않아도 됨.) --%>
<%@ attribute name="end" required="true" type="java.lang.Integer" %>
<%@ variable name-given="sum" variable-class="java.lang.Integer" scope="NESTED" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- R언어와 파이썬에는 기본자료형이라는 개념 자체가 없음 => 자료형 명시 없이 변수만 선언해주면 된다. (문법적으로 문제점이 발생했을 때 디버깅 과정이 어려움.)
	 (자바스크립트 생각 -> 자료형이 var하나 밖에 없었음 이 부분에서 자료형의 필요성을 느끼지 못해서 위 언어에서 없애버림)
	 
	 variable디렉티브: EL 변수로 사용될 변수에 대한 정보를 지정한다. (jsp에서 선언된 변수를 태그에서 선언한 것처럼 공유하여 사용을 하고자 하는 것이다.)
	                   name-given속성 => jsp에서 주어진 변수를 내가(태그 내에서) 받겠다는 의미
	                   variable-class속성 => 받는 변수의 자료형을 지정해주도록 한다. (디폴트가 String임)
	                   scope속성 => "NESTED가 default" 여기서의 scope는 메모리영역을 말하는 것이 아니다. 변수를 공유해서 사용하겠다는 의미로써 변수의 사용 영역의 범위를 지정하는 것이다.
	                   태그의 시작부터 태그가 벗어나더라도 이 변수를 계속 사용을 하겠다면 AT_BEGIN, 태그내에서만 변수를 사용을 하겠다면 NESTED(!!일반적으로 많이 사용됨!!), 
	                   끝나는 태그 이후부터 변수를 사용하겠다고 한다면 AT_END로 지정
	                   
	variable디렉티브에서 지정한 공유될 sum이라는 변수를 실질적으로 var속성에 선언한다. 주의) value에 바로 값을 넣으면 안됨. 표현언어로 감싸기
--%>

<c:set var="sum" value="${ 0 }" />
<c:forEach var="num" begin="${ begin }" end="${ end }">
	<c:set var="sum" value="${ sum + num }" />
</c:forEach>

<jsp:doBody /> <%-- 몸체로 전달받은 텍스트노드를 그대로 출력함 --%> 


