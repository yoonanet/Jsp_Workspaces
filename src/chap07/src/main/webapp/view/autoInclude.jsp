<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- <%@ include file="../common/currentTime.jsp" %> --%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자동 include 실행</title>
</head>
<body>

	현재 시간은 <%= currentTime %>입니다.<br><br> <!-- currentTime.jsp에 작성된 변수를 넣음 -->
	
</body>
</html>
<%-- <%@ include file="../common/footer.jsp" %> --%>

<%-- 
톰캣이 참조하는 설정파일 web.xml => 알려줄 정보가 있을 때 이 파일 안에 작성
jsp-config태그가 있음(jsp 구성이라는 의미)
=> jsp-property-group의 자식태그가 존재 (자식태그들을 그룹핑하여 정의)
   이안에 url-pattern(클라이언트의 요청이 지정한 정보로 포함이 되어져 있다면_톰캣에게 요청정보를 지켜보라고한 것임), 
          include-prelude(요청을 수행하기 직전에 포함을 시키라는 의미), 
          include-coda(수행이 끝나고 난 직후에 포함을 시키라는 의미)의 자식이 존재함


[코드 조각 자동 포함 설정]
코드 내에 페이지를 포함시켜달라는 요청을 톰캣의 설정을 통해 부여해줄 수 있는 것이다.
 --%>