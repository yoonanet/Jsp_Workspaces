<%@ tag language="java" body-content="empty"
	pageEncoding="UTF-8"%>
<%@ tag trimDirectiveWhitespaces="true" %>
<%-- tag 디렉티브에서 dynamic-attributes을 제공: map형태로 지정해주도록 한다.
     dynamic-attributes은 map자료형으로 속성이름을 key로, 값을 value로 하여금 가변적으로 데이터를 전달을 할 수 있도록 하고,
     전달받은 모든 속성들을 담기 위한 이름을 지정해주도록 한다. --%>
<%@ tag dynamic-attributes="optionMap" %>

<%@ attribute name="name" required="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<select name="${ name }"> 
	<c:forEach var="option" items="${ optionMap }"> <%-- jstl로 선언한 변수같은 경우 꼭 표현언어를 통해 불러주도록 한다!! --%>
		<option value="${ option.key }">${ option.value }</option>
	</c:forEach>
</select>

