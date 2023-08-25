<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%-- URL처리의 import태그: 이 페이지 안에서 페이지를 삽입하는 형태가 아니라 특정 웹페이지로의 이동과 관련된 동작으로 확인을 할 수 있다. 
                           접속하고자하는 웹페이지의 정보를 입력으로 넣어주면서 이동하도록 하는 속성이 된다.
                           주의) daum의 페이지를 다이렉트로 웹페이지를 요청하게 되면 해킹으로 서버가 오인을 해서 오류가 날 수 있음
                           
                           import태그는 경로를 통해서 특정 웹사이트를 접속해갈 수 있지만 내가 만든 특정페이지로의 이동도 가능하다. --%>                           
<c:choose>
	<c:when test="${ param.type == 'youtube' }"> <%-- 타입의 속성으로 데이터를 넘겼을 때 참이면 실행되도록 조건을 걸어놨기 때문에 실행이 되지 않을 것이다. 
	                                                  실행하여서 검색 뒤에 ?type=youtube로 지정을 해주면 접속을 해주게 된다.--%>
		<c:import url="https://www.youtube.com/results"> 
		<%-- 이페이지를 실행했을 때 검색한 화면을 확인할 수 있을 것이다. --%>
			<c:param name="search_query" value="보라매공원"/>
		</c:import>
	</c:when>
	<c:otherwise>
		<c:import url="07_use_import_tag_help.jsp"> <%-- c:import태그의 url에는 request의 절대경로의 개념으로 path의 위치를 지정할 수 없음
														 현재 실행되어지는 요청의 페이지에 같은 위치에 있는 파일의 위치를 상대경로로 이동해갈 수 있도록 셋팅을 해줘야 한다.
		                                                 이 c:import태그는 태그 안에 문법 요소만 구성할 수 있는데 이 태그는 절대경로라는 표현식의 request객체를 인식하지 못하기 때문이다.
		                                                 
		                                                 import는 태그에서 특정 페이지로 이동을 할 수 있도록 제공되어진다. --%>
			<c:param name="message" value="선택해주세요"/> <%-- 파라메타를 전달할 수 있는 태그 --%>
		</c:import>
	</c:otherwise> <%-- if문의 else에 해당되어지는 동작 --%>
</c:choose>








