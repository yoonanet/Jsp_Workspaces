<%@ tag language="java" body-content="tagdependent" 
	pageEncoding="UTF-8"%>
<%@ tag trimDirectiveWhitespaces="true" %>

<jsp:doBody var="bodyText" scope="page"/> <%-- 전달받은 몸체의 내용을 bodyText의 이름으로 page영역에 저장 --%>

<%
	String bodyText = (String)jspContext.getAttribute("bodyText"); //현재 전달받은 문자열 데이터가 담겨지게 된다.
%>

<%= bodyText %>