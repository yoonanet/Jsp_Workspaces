<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Thermometer" %>

<%
	Thermometer thermometer = new Thermometer();
	request.setAttribute("t", thermometer); //t라는 key값의 value로 객체를 가리키는 참조변수를 넣음.
%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온도 변환 예제</title>
<!-- 표현언어에서 클래스가 정의되어져 있을 때 그 클래스에 정의되어져 있는 메서드들을 표현언어에서도 호출이 가능하다.
	 표현언어 2.2(톰캣으로 보면 7.0부터 지원되는 기능)부터 지원하는 기능 -> 2.1버전에서는 불가능했었음!! 이러한 히스토리를 기억하도록 한다.
	 2.1에서는 상당히 복잡한 구조로 일반메소드 호출도 불가능했었음. static으로 선언된 메소드 호출만이 가능한 구조였지만 단순하게 호출이 가능한 것도 아니였음. 
	   => 상당히 복잡하고 번거로운 여러 단계를 거쳐야만 했었다!! 그러다보니 활용성이 떨어져서 2.2버전으로 업그레이드되어지면서 직접적인 메소드 호출이 가능하도록 기능이 추가되어진 것이다.
     실질적으로 EL활성화는 2.2버전부터이고, 톰캣 7버전을 설치할 때부터 문법사항들이 적용된 것이다.
     !!표현언어를 표현식 대신에 많이 사용되는 추세임!! => 현재 실무에서도 많이 만나볼 수 있음
     => 표현언어를 본격적으로 사용되기 시작한 버전은 3.0버전부터임. 
     
     현재 실무에서 가장 안정적인 버전은 자바 8버전, 톰캣은 8버전 8.5, 9버전으로 연동을 시켜서 프로젝트가 진행되어지는 것이 지금 현재의 추세이다. 
      (단독으로 적용을 하여 사용하는 것이 아니라 서로 호환이 되어져야 함)
     
     표현언어의 주 목적은 출력하겠다는 것이지만 2.2버전에서는 출력에 국한되지 않고 참조자료형의 메모리에 .을 통해 접근하여 메소드를 호출할 수 있다.
     request영역 안에 t라는 이름으로 thermometer인스턴스를 저장하고 있음. (request영역에 t의 key값으로 value로 객체의 참조변수값을 넣음)
     t.을 하게 되면 value를 반환해주게 된다(키값.을 통해 value에 접근) => value가 참조자료형의 메모리 주소 값임!!
     !!따라서 .을 통해 메모리에 접근하여 메소드를 호출해줄 수 있다!! (표현언어에서는 메모리영역을 순차적으로 돌면서 key에 해당하는 value값을 찾게 되는 것이다.)
     
     1. 참조자료형인 클래스를 먼저 선언하도록 함
     2. 참조자료형을 사용하기 위한 인스턴스 생성
     3. jsp영역에 인스턴스 주소값을 저장
     4. 키값을 통해 인스턴스 주소값에 접근하여 .을 통해 메소드를 호출! -->
</head>
<body>
	${ t.setCelsius("서울", 14) } <!-- 지역에 따른 온도를 참조자료형에 저장. -->
	서울 온도 : 섭씨 ${ t.getCelsius("서울") }도 / 화씨 ${ t.getFahrenheit("서울") }도
	
	<br>
	
	정보 버전 : ${ t.getInfo() } = ${ t.info } 
	<%-- 표현1.표현2에서 표현1이 객체면 그 뒤에 오는 표현2를 프로퍼티로 인지해서 getInfo가 존재하면 그 메서드를 호출해주게 됨. 
		  직접 메소드를 호출해도 되지만 자바빈규약의 프로퍼티 속성을 활용하면 더 효율적임 (표현언어에서는 이 방법을 활용하는 것이 일반적)
		  => get을 빼고 프로퍼티 이름을 넣어주도록 한다. (일반적으로 이 프로퍼티 이름으로만 호출함.)
	     (아무것도 전달하지 않는 자바빈 규약일 때만 이러한 호출이 가능한 것임.) --%>
	
</body>
</html>