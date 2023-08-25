<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- include의 어떤 용도로 사용을 하라는 원래의 액션태그의 기능을 실습을 통해서 확인할 예정 --%> 
<%
	String type = request.getParameter("type"); //type이라는 파라미터 이름의 값을 리턴해달라는 의미
	
	if(type != null){
		out.println("타입 : " + type + "<br>");
		
		if(type.equals("A")){
			out.println("특징: 강한 내구성..." + "<br>");
		}else if(type.equals("B")){
			out.println("특징: 강한 불연성..." + "<br>");
		}
	}
	
%>   
