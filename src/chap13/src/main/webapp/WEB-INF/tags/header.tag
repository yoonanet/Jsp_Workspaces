<%@ tag language="java" body-content="empty"
	pageEncoding="UTF-8"%>
<%@ tag trimDirectiveWhitespaces="true" %> 

<%-- 이 태그 파일에서 톰캣의 코드들이 여백으로 보여지는데, 그 여백을 최소화하도록 지정하는 속성이다. 

속성으로 정보를 전달받아서 그 전달받은 정보를 통해 태그를 수행하고자 함.
지금 실습에서는 title로 전달받은 텍스트를 level속성을 통해 h1~h6까지의 태그 효과를 지정하고자 함. 

태그파일의 디렉티브 중에 attribute: 사용자 정의 태그의 속성을 정의할 수 있다.
name => 추가할 속성 이름, 값을 무조건 전달을 받아야 하는 필수적인 속성이라고 한다면 required을 true로 지정(default는 false임) 
=> 필수 속성으로 지정한 것은 태그를 생성하면서 자동으로 생성된다!!

기본적으로 속성을 정의할 때 이 자료형은 String으로 처리를 해야함. 
그러나 level은 정수값을 전달받아야 한다. => 기본자료형을 지원하지 않기 때문에 래퍼클래스의 자료형을 통해 type을 지정해주도록 한다.

시작태그와 끝나는태그를 구분하지 않고 단일태그로 사용하고자할 때, tag디렉티브의 body-content속성을 empty로 지정을 해주면 된다.
body-content:몸체의 종류를 지정할 수 있음(body는 시작태그와 끝나는태그의 몸체를 의미.) --%>
<%@ attribute name="title" required="true" %>
<%@ attribute name="level" type="java.lang.Integer"%>

<%
	String headStartTag = null;
	String headEndTag = null;
	
	if(level == null) { //만약 필수속성이 아니라면 null일때도 꼭 고려를 해줘야 한다.
		headStartTag = "<h1>";
		headEndTag = "</h1>";
	}else if(level == 1){
		headStartTag = "<h1>";
		headEndTag = "</h1";
	}else if(level == 2){
		headStartTag = "<h2>";
		headEndTag = "</h2>";
	}else if(level == 3){
		headStartTag = "<h3>";
		headEndTag = "</h3>";
	}else{
		headStartTag = "<h1>";
		headEndTag = "</h1>";
	}
%>

<%-- 전달 받은 데이터를 통해서 지정한 제목태그가 지정되도록 한다. --%>
<%= headStartTag %>${ title }<%= headEndTag %>





