<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 로그인에 대한 처리를 통해 전체적인 화면을 보여주는 것이 아닌 비동기적으로 부분적인 화면을 보여줘야 함. => 따라서 html의 구조를 없애도록 함.
     DB와의 연동을 수행하기 위해서 jsp라는 파일을 사용하는 것임. --%>    

<%
	String id = request.getParameter("userId");
	String pw = request.getParameter("userPw");
	
%>

<%-- 전송되어져온 파라메타의 이름으로 .연산자를 통해 param객체에 값을 요청을 해주게 되면 
      param객체가 request객체로 가서 값을 요청하게 되는 구조이다. --%>
안녕하세요. ${ param.userId }님.
