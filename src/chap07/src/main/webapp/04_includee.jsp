<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 웹페이지를 구성할 목적이 아니기 때문에 구성된 틀을 지워버리기.

내 파일 안에서 선언한 변수처럼 사용할 수 있음
서로 다른 파일에서는 변수를 공유할 수 없음 하지만 include디렉티브를 지정을 해주면
jsp를 자바파일로 변환해서 클래스로 컴파일을 할 때, 자바로 변환할 때 include코드를 만나면 지정된 파일을 찾음
그 파일을 찾아서 삽입을 해버림. 따라서 한페이지의 효과를 받게 되는 것이다.
하지만 이클립스는 include의 동작을 파악하지 못하기 때문에 에러를 내주고 있는 것이다.(액션태그의 호환성 문제 부분임!!) => 결과를 보면 실행은 제대로 되고 있음. --%>

<%-- includer.jsp에서 선언한 변수 : <%= number %>  --%> 

<p>

<%
	String dataFolder = "c:\\data"; //문자열을 변수에 저장
%>