<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ attribute name="count" required="true" type="java.lang.Integer"%> <%-- 속성으로 전달받을 값이 정수이기 때문에 타입을 지정 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:forEach begin="${1}" end="${count}"> 
	<jsp:doBody /> <%-- doBody액션태그를 불러내면 몸체에 있는 텍스트노드들이 전달이되어 동작이 정상적으로 되어진다는 것을 결과로 확인할 수 있다.
	                    전달받은 몸체의 내용을 태그 안에서 반복적으로 출력하고 싶다면 별도의 속성없이 
	                    doBody액션태그만 지정을 해주게 되면 반복하면서 전달받은 몸체의 내용을 출력할 수 있는 것이다. --%>
</c:forEach>
