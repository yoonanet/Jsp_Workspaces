<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%-- 태그라이브러리에 의미가 외부에 태그형태로 제공되어지는 라이브러리를 import하는 개념으로 사용할 수 있게 제공해주는 것이였음 --%>

<%
	HashMap<String, Object> mapData = new HashMap<>();

	mapData.put("name", "홍길동"); //map형태의 컬렉션 프레임워크에 데이터 저장
	mapData.put("today", new java.util.Date()); //국제표준시 협회의 형태로 데이터를 저장하도록 함.(Date의 참조자료형을 값으로 저장함)
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl - forEach 태그</title>
</head>
<body>
<%-- 이름에 for가 붙어 있는 것은 반복적인 기능이 포함되어져 있는 개념인 것이다.
	 자바 프로그램 안에서 자바에 자주 사용되어지는 문법적인 구문들이 태그 형태로 제공되어지는 기능들을 이용해서 실질적인 자바코드를 최소화해보자는 것이
	 jstl, 표현언어, 액션 태그들이 추가적으로 제공되어지는 이유이다. (jsp페이지의 모델1기반의 기능이다.)

	  ***jstl에서 선언하고 있는 변수는 표현언어에서 바로 접근하게끔 제공을 해주고 있었음 (jstl과 표현언어를 유기적인 동작이 가능하도록 한 것)
	  map에 데이터를 items에 담아주면 forEach는 items로부터 데이터를 하나씩 읽어와서 var에 선언한 변수의 이름에다가 값을 담아준다. 자바의 eachfor문(5.0버전에서 추가)과 동일함 
      => c:forEach는 items에 담겨져 있는 변수를 통해서 map컬렉션 프레임 워크에 접근을 하여 var의 변수를 통해 하나씩 끝까지 읽어간다.
         즉, map의 값을 하나씩 꺼내와서 여기서 선언한 변수 i에 담아서 동작되도록 함
      for( Object i : map ){}과 같은 동작을 수행되도록 하는 것이다.
      ***forEach는 items에 담긴 모든 데이터를 하나하나씩 다 꺼내와서 모든 데이터가 다 읽혀져올 때까지 반복해주게 되는 것임
      
      데이터가 map일 경우 key와 value를 통해 데이터를 관리하기 때문에
      forEach태그에서는 .key로 키값을 읽어올 수 있고, .value를 통해 데이터값을 읽어올 수 있게끔 태그가 기능을 제공해준다.
      
      컬렉션프레임워크를 통한 두 개 이상의 데이터는 set태그를 통해 저장이 가능하다. 
      지금 실습에서는 map의 데이터를 저장했지만 set, list도 가능하다. map은 key와 value형태이기 때문에 key를 통해 접근했지만
      set과 list는 다이렉트로 데이터를 저장하고 있기 때문에 읽어온 데이터가 변수에 바로 저장된다는 차이점만 있다!! --%>
      
      <h3>Map</h3>
      <c:set var="map" value="<%= mapData %>"/> <%-- 별도의 scope를 지정하지 않았기 때문에 page영역에 저장되어 보관된다. --%>
      <c:forEach var="i" items="${ map }" >
      	${ i.key } = ${ i.value }<br>
      </c:forEach>
      
      <h3>1부터 100까지의 홀수의 합</h3> <%-- 스크립틀릿 요소를 배제하고 누적의 형태로 태그 변수에 데이터를 저장하고자 함. --%>
      <c:set var="sum" value="0" /> <%-- sum이라는 이름의 변수를 선언하여 0으로 초기화 => 확장하여 생각을 해보았을 때 scope를 별도로 지정하지 않으면 
                                                                                          pageContext객체를 통해 setAttribute로 키와 벨류값을 넣어주는 것이라는 코드인 것이다. --%>
                 <%-- 단순하게 반복하는 용도로 forEach를 사용한다고하면 카운트 변수를 생성해주면서 얼마부터 얼마까지의 반복을 처리할 것인지를 지정해주도록 한다. 
                      => 1(begin속성: 반복의 시작값)~100(end속성: 얼마까지 반복할지)까지 지정했음, step은 증가단위 --%>
      <c:forEach var="i" begin="1" end="100" step="2" >
      	<c:set var="sum" value="${ sum + i }" /> <%-- sum이라는 변수에 값을 저장하려는 것이다. => 원래 있는 sum변수의 값에다가 누적을 하는 형태 --%>
      </c:forEach>
      
      결과 : ${ sum } <br>
      
      <h3>구구단 : 7단</h3> 
      <ul>
      	<c:forEach var="i" begin="1" end="9" step="1"> <%-- step의 default는 1이다. --%>
      		<li>7 * ${ i } = ${ 7 * i }</li> <%-- 표현언어를 통해서 다이렉트로 구현을 하도록 했음 --%>
      	</c:forEach>
      </ul>     	
      
      <h3>배열</h3>
      <c:set var="intArray" value="<%= new int[]{10, 20, 30, 40, 50} %>"/> 
      <%--표현식을 이용하여 다이렉트로 배열을 선언하고 바로 초기화를 해주면서 데이터를 담아주도록 한다.
          배열일 경우 데이터를 하나 하나 읽어와서 처리를 해주고 싶다고 할 때 forEach태그를 활용하도록 한다.
          var속성을 통해 변수(데이터를 임시적으로 보관할 변수)를 선언하고 items를 이용해서 데이터를 담아주도록 한다.
  
         varStatus속성을 이용해서 현재 forEach문의 동작의 상태 정보를 읽어올 수 있다.  
         forEach문이 반복을 하고 있을텐데 현재 반복하고 있는 정보를 varStatus속성에 지정해준 이름에 그 정보를 forEach문이 담아주게 되는 것이다.
         .index는 array의 데이터를 하나 하나씩 읽어올텐데 그때, 읽어오는 index값을 표시해줌. (0부터 카운팅이 됨)
         .count는 현재 몇 번째 순서로 반복이 되는지의 값을 반환해준다. (반복의 횟수 카운트를 알려줌 - 1부터 카운팅이 됨)
         i는 배열에 담긴 데이터가 순차적으로 출력되어진다.
      
         배열에서 begin, end, step을 지정해주게 되면 지금 담겨져 있는 값에서 원하는 값만큼 인덱스값을 통해 카운팅하여 데이터를 가져오는게 가능하다는 것을 확인해볼 수 있다.
         즉, 인덱스 값을 통해서 일정 구간의 원하는 값을 가져올 수 있다는 것을 아래와 같은 코드로 확인해볼 수 있다. --%>

      <c:forEach var="i" items="${ intArray }" varStatus="status" begin="2" end="4" step="1">
      	${ status.index } : ${ status.count } : ${ i }<br>
      </c:forEach>
      
      
</body>
</html>