<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl - forTokens 태그</title>
</head>
<body>	
<%-- 
     자바시간에 StringTokenizer(문자열을 우리가 지정한 구분자로 문자열을 쪼개주는 클래스)배웠었는데 
     이에 대한 기능을 태그의 형태로 정의를 해서 제공을 해주는 것이 jstl의 forTokens이다.
     
     items와 delims의 속성들이 자동완성이 되어진다. (추가적인 속성들은 forEach와 동일한 속성을 제공해준다.)
     
     forEach문에 var는 꺼내온 데이터들을 임시적으로 잠시 보관할 변수를 선언했었는데 forTokens도 동일하다.
     forTokens는 다루는 데이터가 문자열 데이터이다. 문자열의 구분단위로 꺼내오는 데이터를 token으로 불러주고 있다.
     - items: 데이터가 담겨져 있는 변수의 값을 담아주면됨(forTokens에서의 데이터는 문자열 데이터셋의 형태로 담길 수 있지만 숫자형 문자열 데이터도 담을 수 있음)
              자료형은 문자열이지만 그 안에 형식의 데이터 셋들은 어떤 형식이든 다 담길 수 있다.
     - delims: 데이터 구별 단위의 기호를 셋팅해주도록 한다.
     items에 담겨진 데이터들을 보고 delims의 구별단위로 하여금 데이터를 꺼내와주는 것이다.
     이렇듯 구별단위로써 잘라서 꺼내오는 데이터를 token이라고 불러주고 있음 (구별단위로 하여금 반복을 해주는 것임)
     
     ***하나의 변수를 선언하여 동일한 자료형의 데이터들을 연달아서 담아준다면 
     데이터를 받는 쪽에서는 forTokens를 통해 하나 하나씩 데이터를 잘라서 활용할 수 있을 것이다.
     (동일한 자료형의 아주많은 데이터들이 전송되어져 와야 한다면 하나의 변수 안에 데이터를 담아서 전송을 해준다면 
      받는 쪽에서는 forTokens를 통해서 하나 하나씩 데이터를 꺼내올 수 있을 것이다!! - 이해 안된다면 이부분 다시 읽어보기.)
     
     jstl은 스크립트의 요소를 줄이고 태그의 형식을 통해 정의하면서 가독성은 높아졌지만 코드의 양이 획기적으로 줄어들지는 않음 
     또한, 유지보수가 어려웠음. 그렇다 보니 모델1의 형식을 배제하게 되었음 
     따라서 mvc를 통한 모델2기반의 형식을 더 선호되었음 => 현재는 더더욱 필수적인 형태임. --%>
     
     <h3>콤마와 점을 구분자로 사용: </h3>
     
	<c:forTokens var="token" items="빨간색, 주황색, 노랑색, 초록색, 파랑색, 남색, 보라색" delims=",">
		${ token }<br>
	</c:forTokens>


</body>
</html>