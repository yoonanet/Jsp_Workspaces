<%@ tag language="java" pageEncoding="UTF-8"%> 
<%-- 태그파일은 JSP Tag의 파일을 말하는 것임 => 파일 안에서 보면 디렉티브의 이름이 tag임.
태그 파일에서 사용할 수 있는 디렉티브는 5개이다.(tag_자동으로 정보 셋팅을 해주고 있음, taglib, include, attribute, variable)
tag: JSP페이지의 page디렉티브와 동일함. => body-content, dynamic-attributes만 체크
taglib, include: JSP페이지와 사용용도가 동일하다. / attribute, variable만 확인을 하도록 하자.
***태그파일도 표현언어를 사용할 수 있음(이에 대한 속성도 jsp에서의 사용의도와 동일함)

태그파일의 특징) jsp에서 사용하는 문법요소들을 거의 동일하게 사용할 수 있게끔 제공해준다. 그 중에서 스크립트요소!! -> 자바코드를 태그파일에서 그대로 작성할 수 있는 것임. 

Calendar에 정의된 static의 필드를 이용해서 입력으로 넣어주면 정보를 리턴해준다.
MONTH필드는 0부터 시작을 하므로 1을 꼭 더해줘야 한다. --%>
<%@ tag import="java.util.Calendar"%>

<%
	Calendar cal = Calendar.getInstance(); //Calendar는 new를 하지 않고도 메소드를 호출하여 기능을 제공해주는 특징을 가짐.
%>

<%= cal.get(Calendar.YEAR) %>년
<%= cal.get(Calendar.MONTH)+1 %>월
<%= cal.get(Calendar.DATE) %>일

