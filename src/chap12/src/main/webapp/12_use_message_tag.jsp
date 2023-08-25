<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 국제화는 포맷팅의 약자로 접두어 fmt를 관용적으로 사용함. 국제화관련된 정의는 jstl에 fmt에 정의가 되어져 있음.(기능에 대한 정의) 그렇기 때문에 위치만 알려주도록 한다. --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<fmt:setLocale value="ko"/> <%-- 나라별로 고유 할당되어져 있는 key값이 있음.(약속되어 고정됨) 우리나라 같은 경우 "ko"임(영문은 "en") -> value속성에 넣어주도록 한다.
                                 텍스트에 대한 처리를 utf-8(전세계의 언어가 깨지지 않게끔 동작됨)로 처리해달라는 설정을 셋팅해달라는 메소드가 setCharacterEncoding
                                 이 메소드와 같은 기능의 태그가 requestEncoding태그이다.
                                 현재 설정은 한글로 해놓았기 때문에 화면상에 출력할 텍스트는 message_ko.properties로 설정해주게 된다. --%>

<%-- fmt:bundle태그를 웹표준을 감싸주도록 한다.
      basename의 속성에는 메시지의 위치정보를 알려주면 된다. 
      => message라는 이름정보만 알려주면 됨 그렇게되면 .properties라는 파일을 자동으로 찾아가게 됨. 
      
      fmt:bundle는 시작태그와 끝나는 태그가 웹표준을 감싸고 있어야 함. --%>
<fmt:bundle basename="resource.message">

<fmt:message var="title" key="TITLE"/> <%-- fmt:message태그의 역할은 아까전에 파일로 만들어놓은 properties확장자 파일은 key와 value형태로 지정을 해놨었음
                                            이 코드는 key값을 읽어와서 변수에 value값을 저장하도록 하는 것이다. => 이 값을 타이틀에 표현언어를 통해 출력하도록 한다. --%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${ title }</title>
</head>
<body>
<%-- [국제화 태그]
웹페이지에 접속하면 우측 상단에 언어를 선택할 수 있게끔 제공을 해서 
현재 웹페이지에 보여지는 텍스트들을 언어에 맞춤 서비스 되어진다. => 각 나라마다 사용되는 언어에 따른 프로젝트로 구성을 한다면 번거로움.
또한, 나라별로 동일한 시간일지라도 시차로 인해 시간 개념이 다를 것임. 이러한 부분들도 나라별로 따로 기능 처리가 이루어진다면? 프로젝트를 따로 구성해야함.
이 부분들에서 융통성있게끔 처리해주는 기능의 태그들이 국제화인 것이다.
프로젝트별로 따로 구성하지 않고, 나라별로 언어와 시차의 부분들을 태그를 통해 설정된 값들을 보면서 자동으로 변환해주도록 한다. (설정값을 보면서 각 나라별의 언어로 출력을 해주게 되는 것이다.)
=> 하나의 프로젝트만 잘 구성한다면 태그를 이용하여 나라별로 데이터셋들을 관리할 수 있도록 한다. 
***교재에서는 안나와 있는 내용이다. 그래서 실습사항으로 살펴봐야함.

메시지 처리를 위한 셋팅 -> src/java에 resource폴더를 만듦. 
                           이 안에 File을 .properties확장자(꼭!!)로 만들기!! (key=value형식으로 파일 구성)
                           위에 파일을 만들때는 만들어지는 규칙을 꼭 따라야 한다.(파일 형식 유의하기) 
                           message_ko.properties: 한글로 출력할 메시지를 파일 안에 작성(한글로 작성을 하면 인코딩의 형식으로 자동 변경을 해준다.)_확장자가 properties이여야 가능한 것임, 
                           영문으로 출력할 메시지는 message.properties에 작성. 
                           
                           {0}는 메시지를 출력할 때 실시간적으로 데이터를 전달받아서 출력한다는 의미이다. => 여기서의 숫자값은 인덱스의 값으로 0은 1개이다. --%>


	<fmt:message key="GREETING"/><br> <%-- 키값을 읽어와달라는 것. 별도로 var값을 지정하지 않으면 key에 해당하는 value값이 다이렉트로 출력된다. --%>
	
	<%-- param 객체: 클라이언트로부터 전달되어진 파라메타값을 보관해주는 객체
	id로 전송되어지는 value값을 출력해준다.
	아래의 코드 의미는 value의 값이 비어있지 않는지 확인하는 것이다. --%>
	<c:if test="${ ! empty param.id }">
		<fmt:message key="VISITOR"> 
			<fmt:param value="${ param.id }"/> <%-- 파라메타를 통해 전송한 id값을 value에 넣어주도록 한다. 
												    => value에 실시간적으로 넣어준 값을 출력하기 위한 코드임 --%>
		</fmt:message> 
	</c:if>


</body>
</html>

</fmt:bundle>